### Module dependencies ###
express = require 'express'
http = require 'http'
path = require 'path'
api = require './api'
app = module.exports = express()


### Configuration ###
assetsPath = path.join(__dirname, '..', '_public')

# All environments
app.use express.logger('dev')
app.use express.bodyParser()
app.use express.methodOverride()
app.use express.static(assetsPath)
app.use app.router

# development only
if app.get('env') is 'development'
  app.use express.errorHandler()


### Routes ###
# JSON API
app.get '/api/name', api.name

# Serve index by default
app.get '*', (req, res) -> res.sendfile "#{assetsPath}/index.html"


### Start Server ###
module.exports.startServer = (port, path, callback) ->
  app.set 'port', port
  http.createServer(app).listen port, ->
    console.log "Express server listening on port #{port}"