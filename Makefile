setup:
	@pod install
	@cd server;npm install
run-server:
	@cd server;node	server.js