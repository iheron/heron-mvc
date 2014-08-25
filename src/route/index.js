// Generated by LiveScript 1.2.0
(function(){
  var fs, path, _;
  fs = require('fs');
  path = require('path');
  _ = require('lodash');
  /**
  * @params: options {
  *   routeDir         # route dir path
  *   routeRegex       # route regex
  *   controllerDir    # controller dir path
  *   controllerRegex  # controller regex
  * }
  */
  module.exports = function(options, loadRoute, loadController){
    var root, getRouteFileSync, getControllerFileSync, routes, i$, len$, routeArr, route, controllers, controllerArr, lresult$, controller, action, methods, lresult1$, action$, ref$, k, v, results$ = [];
    root = process.cwd();
    options == null && (options = {});
    if (!options.routeDir) {
      options.routeDir = path.join(root, 'lib/routes');
      console.warn("warn: please set options.routeDir or load default -> routeDir: " + options.routeDir);
    }
    if (!options.controllerDir) {
      options.controllerDir = path.join(root, 'lib/controllers');
      console.warn("warn: please set options.controllerDir or load default -> controllerDir: " + options.controllerDir);
    }
    getRouteFileSync = function(dir){
      var files, route_files, routes;
      files = fs.readdirSync(dir);
      route_files = _.filter(files, function(item){
        return /.*route(?=\.).*/i.test(item);
      });
      routes = _.union(_.map(route_files, function(route){
        return route.replace(/\..*/i, '');
      }));
      return routes = _.map(routes, function(item){
        var route_match, route;
        route_match = item.match(/.*(?=route)/i);
        route = route_match[0];
        route = route.replace(/_$/i, "");
        return [route, item];
      });
    };
    getControllerFileSync = function(dir){
      var files, route_files, routes;
      files = fs.readdirSync(dir);
      route_files = _.filter(files, function(item){
        return /.*controller(?=\.).*/i.test(item);
      });
      routes = _.union(_.map(route_files, function(route){
        return route.replace(/\..*/i, '');
      }));
      return routes = _.map(routes, function(item){
        var controller_match, controller;
        controller_match = item.match(/.*(?=controller)/i);
        controller = controller_match[0];
        controller = controller.replace(/_$/i, "");
        return [controller, item];
      });
    };
    routes = getRouteFileSync(options.routeDir);
    if (!routes) {
      throw new Error("can not read route directory: " + options.routeDir);
    }
    for (i$ = 0, len$ = routes.length; i$ < len$; ++i$) {
      routeArr = routes[i$];
      route = require(path.join(options.routeDir, routeArr[1]));
      if ('function' === typeof loadRoute) {
        loadRoute({
          route: routeArr[0],
          router: route
        });
      }
    }
    controllers = getControllerFileSync(options.controllerDir);
    if (!controllers) {
      throw new Error("can not read controller directory: " + options.controllerDir);
    }
    for (i$ = 0, len$ = controllers.length; i$ < len$; ++i$) {
      controllerArr = controllers[i$];
      lresult$ = [];
      controller = require(path.join(options.controllerDir, controllerArr[1]));
      for (action in controller) {
        methods = controller[action];
        lresult1$ = [];
        action$ = (ref$ = {}, ref$[action + ""] = {}, ref$);
        for (k in methods) {
          v = methods[k];
          switch (k) {
          case 'all':
          case 'get':
          case 'post':
          case 'put':
          case 'delete':
            action$[action + ""][k + ""] = v;
            if ('function' === typeof loadController) {
              lresult1$.push(loadController({
                controller: controllerArr[0],
                action: action,
                method: k,
                func: v
              }));
            }
          }
        }
        lresult$.push(lresult1$);
      }
      results$.push(lresult$);
    }
    return results$;
  };
}).call(this);