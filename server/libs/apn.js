var apn = require('apn');
var options = { "production": false , "batchFeedback": false, "passphrase": "S4brinas"};
var apnConnection = new apn.Connection(options);

exports.sendPush = function(token, alert){
	var device = new apn.Device(token);
	var note = new apn.Notification();
	note.alert = alert;
	apnConnection.pushNotification(note, device);
}
