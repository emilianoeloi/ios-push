var http = require('http'),
    fs = require('fs'),
    express = require('express'),
    bodyParser = require('body-parser');

var app = express();
app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(bodyParser.json());

var	server = http.createServer(app);
var _ = require('underscore');

module.exports = {
  express: express,
  app: app,
  server: server,
  _: _
}
