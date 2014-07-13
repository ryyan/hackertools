package main

import (
	"github.com/ant0ine/go-json-rest/rest"
	"net/http"
)

type Tool struct {
	Name    string
	Url     string
	Summary string
	Tags    []string
}

func main() {
	handler := rest.ResourceHandler{
		EnableRelaxedContentType: true,
		EnableStatusService:      true,
	}

	handler.SetRoutes(
		&rest.Route{"GET", "/tools", GetTools},
		&rest.Route{"GET", "/tools/:id", GetTool},
		&rest.Route{"GET", "/status", func(w rest.ResponseWriter, r *rest.Request) { w.WriteJson(handler.GetStatus()) }},
	)

	// Serve static files
	http.Handle("/public/", http.StripPrefix("/", http.FileServer(http.Dir("../client/public/"))))

	// Serve API
	http.Handle("/api/", http.StripPrefix("/api", &handler))

	// Start server
	http.ListenAndServe(":8888", nil)
}

// GetTool returns a specific tool
func GetTool(w rest.ResponseWriter, r *rest.Request) {
	w.WriteJson(GenerateTestTool())
}

// GetTools returns all the tools
func GetTools(w rest.ResponseWriter, r *rest.Request) {
	var result []Tool
	for i := 0; i < 5; i++ {
		result = append(result, GenerateTestTool())
	}
	w.WriteJson(result)
}

// GenerateTestTool creates a simple tool used for testing
func GenerateTestTool() Tool {
	return Tool{
		Name:    "Tool",
		Url:     "https://website.com/",
		Summary: "Lorem ipsum",
		Tags:    []string{"one", "two"},
	}
}
