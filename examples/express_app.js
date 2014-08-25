var express = require('express');
var mvc = require('heron-mvc');
var app = express();

mvc.route({
    routeDir: path.join(__dirname, 'express/routes'),
    controllerDir: path.join(__dirname, 'express/controllers')
}, function (data) {
    app.use("/"+data.route, data.router);
},function (data) {
    app[data.method]("/"+data.controller+"/"+data.action, data.func);
});


app.set('port', process.env.PORT || 3000);
var server = app.listen(app.get('port'), function() {
    console.log('Express server listening on port ' + server.address().port);
});