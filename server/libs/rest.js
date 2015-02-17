var modules = require('./modules');
var app = modules.app;
var data = require('./data');
var apn = require('./apn');

modules.app.get("/api/1.0/server", function(req, res) { res.json(data.server); });
modules.app.get("/api/1.0/devices", function(req, res){
	data.fetchDevices(function(devices){
		res.json( devices );
	});
});
modules.app.post("/api/1.0/devices", function(req, res){
	var device = req.body;
	console.log(req.body);
	data.saveDevice(device);
	res.json({});
});
modules.app.post("/api/1.0/push/send/:token", function(req, res){
	var token = req.params.token;
	var push = req.body;
	apn.sendPush(token, push.alert)
	res.json({});
})