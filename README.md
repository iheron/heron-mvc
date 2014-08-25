heron-mvc
============

### #route(options, fn)
    @params: options.controllerDir  controller文件路径 默认是 /lib/controllers, 根是项目启动路径.
    @params: fn(obj)                回调函数, 对每个controller文件执行的操作
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
    mvc.route(null, function (router) {
        console.log(router);
        app[router.method]("/"+router.controller+"/"+router.action, router.func);
    });