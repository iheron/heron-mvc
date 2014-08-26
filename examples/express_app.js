var path = require('path');
var express = require('express');
var mvc = require('heron-mvc');
var app = express();
var fs = require('fs');


var configures = mvc.configure.load(path.join(__dirname, 'configure'));
configures[app.get('env')] = mvc.configure.load(path.join(__dirname, 'configure', app.get('env')));
console.log(configures);

mvc.route.load({
    routeDir: path.join(__dirname, 'express/routes'),
    controllerDir: path.join(__dirname, 'express/controllers')
}, function (data) {
    app.use("/" + data.route, data.router);
}, function (data) {
    app[data.method]("/" + data.controller + "/" + data.action, data.func);
});

app.set('port', process.env.PORT || 3000);
var server = app.listen(app.get('port'), function () {
    console.log('Express server listening on port ' + server.address().port);
});