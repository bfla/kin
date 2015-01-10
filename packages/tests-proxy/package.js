Package.describe({
	name: "velocity:test-proxy",
	summary: "Dynamically created package to expose test files to mirrors",
	version: "0.0.4",
	debugOnly: true
});

Package.on_use(function (api) {
	api.use("coffeescript", ["client", "server"]);
	api.add_files("tests/mocha/client/sampleClientTest.js",["client"]);
	api.add_files("tests/mocha/lib/collections/messages_spec.coffee",["server","client"]);
	api.add_files("tests/mocha/lib/collections/verses_spec.coffee",["server","client"]);
	api.add_files("tests/mocha/lib/permissions_spec.coffee",["server","client"]);
	api.add_files("tests/mocha/lib/routes_spec.coffee",["server","client"]);
	api.add_files("tests/mocha/routes_spec.coffee",["server","client"]);
	api.add_files("tests/mocha/server/publications_spec.coffee",["server"]);
	api.add_files("tests/mocha/server/sampleServerTest.js",["server"]);
});