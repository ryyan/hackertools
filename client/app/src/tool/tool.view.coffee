toolApp.view = (ctrl) ->
	ctrl.tools().map( (tool) ->
		return m("a", {href: tool.url}, tool.name)
	)