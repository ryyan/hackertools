# Hacker Tools

## Prereqs
* Install node
* Install go

## Getting Started
```bash
bash server/getimports.sh
go run server/server.go > server/log &
cd client
npm install
npm start
```

```html
http://localhost:8888/
http://localhost:8888/api/tools
http://localhost:8888/api/status
```
