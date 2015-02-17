const BD_FILE = "./devices_bd";
var fs = require('fs');
var BD_DEVICES = [];
var save = function(devices, success, error){
	fs.writeFile(BD_FILE, JSON.stringify(devices), function(err) {
    	if(err) {
        	error(err);
    	}else{
    		success();
    	}
	});
};
var fetch = function(success, error){
	fs.readFile(BD_FILE, 'utf8', function(err,data) {
    	if(err) {
    		if(err.errno == 34){
    			success();
    		}else{
        		error(err);
        	}
    	} else {
    		success(JSON.parse(data));
    	}
	});
}
exports.server =
{
  "serverId": 1,
  "serveName": "PushServerZeroUm"
};

exports.saveDevice = function(device){

	fetch(function(devices){
		var canInsert = true;
		if(typeof(devices) == 'object'){
			for(var index in devices){
				var dev = devices[index];
				if(dev.token == device.token){
					canInsert = false;
				}
			}
			devices[devices.length] = device;
		}else{
			devices = [device];
		}

		if(canInsert){
			save(devices, function(){

			}, function(err){
				console.log('saveDevice', err);
			});
		}
		
	}, function(err){
		console.log('saveDevice', err);
	});

};

exports.fetchDevices = function(success){

	fetch(function(devices){
		success(devices);
	}, function(err){
		console.log('fetchDevices', err);
	});

};