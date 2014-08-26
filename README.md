heron-mvc
============

### #route.load(options, loadRoute, loadController)
    必须是controller结尾的文件,忽略大小写和'_'字符.
    @params: options.controllerDir  controller文件路径 默认是 /lib/controllers, 根是项目启动路径.
    @params: loadRoute(obj)         会优先加载route里的路由, 也会加载controller
             obj {
                route:              route名称
                router:             require返回的router
             }
    @params: loadController(obj)    回调函数, 对每个controller文件执行的操作
             obj {
                controller:         controller名称
                action:             action名称
                method:             枚举 支持 all, get, post, put, delete
                func:               也就是 function(req,res,next){}
             }

    你的controller文件必须返回 这种格式
    action1 = {
        get: function (req, res, next) {
            res.send('get test/action1');
        },
        post: function (req, res, next) {
            res.send('post test/action1');
        }
    }

    app.js里这样调用
    examples:
    var mvc = require('heron-mvc');
    mvc.route({
        routeDir: path.join(__dirname, 'express/routes'),
        controllerDir: path.join(__dirname, 'express/controllers')
    }, function (data) {
        app.use("/"+data.route, data.router);
    },function (data) {
        app[data.method]("/"+data.controller+"/"+data.action, data.func);
    });

    如果你有controller文件叫 home_controller, action 叫 index, 有get函数. 那么,可以GET: /home/index

### #configure.load(dir)
    配置文件的目录, 配置文件以.json结尾.
    examples:
    var path = require('path');
    var express = require('express');
    var mvc = require('heron-mvc');
    var app = express();

    var configures = mvc.configure.load(path.join(__dirname, 'configure'));
    configures[app.get('env')] = mvc.configure.load(path.join(__dirname, 'configure', app.get('env')));
    console.log(configures);