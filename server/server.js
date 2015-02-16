var modules = require('./libs/modules');

//Listen
const PORT = process.env.PORT || 5000;
const ADDRESS = '0.0.0.0';
modules.server.listen(PORT, ADDRESS, function () {
  console.log('Server running at http://%s:%d/', ADDRESS, PORT);
});

var rest = require('./libs/rest');

//Daemon: handle SIGTERM
process.on('SIGTERM', function () {
  if (server === undefined) return;
  server.close(function () {
    // Disconnect from cluster master
    process.disconnect && process.disconnect();
  });
});
