require! {
  fs
  path
  'lodash': _
}
/**
* @params: options {
*   routeDir                  # route dir path
* - routeRegex                # route regex todo
*   controllerDir             # controller dir path
* - controllerRegex           # controller regex todo
* }
* @params: loadRoute {        #
*   route:                    # route名称
*   router:                   # require返回的router
* }
* @params: loadController {   #
*   controller:               # controller名称
*   action:                   # action名称
*   method:                   # 枚举 支持 all, get, post, put, delete
*   func:                     # 也就是 function(req,res,next){}
* }
*/
module.exports = (options, load-route, load-controller) ->
  root = process.cwd()
  options ?= {}
  if !options.route-dir
    options.route-dir = path.join root, 'lib/routes'
    console.warn "warn: please set options.routeDir or load default -> routeDir: #{options.route-dir}"

  if !options.controller-dir
    options.controller-dir = path.join root, 'lib/controllers'
    console.warn "warn: please set options.controllerDir or load default -> controllerDir: #{options.controller-dir}"

  # load route
  if 'function' == typeof load-route
    getRouteFileSync = (dir) ->
      files = fs.readdirSync dir
      route_files = _.filter files, (item) -> /.*route(?=\.).*/i.test item
      routes = _.union _.map route_files, (route) -> route.replace /\..*/i, ''
      routes = _.map routes, (item) ->
        route_match = item.match /.*(?=route)/i
        route = route_match.[0]
        route = route.replace /_$/i, ""
        [ route , item ]
    routes = getRouteFileSync options.route-dir
    if !routes
      throw new Error("can not read route directory: #{options.route-dir}")
    for route-arr in routes
      route = require path.join options.route-dir, route-arr.[1]
      load-route do
        route: route-arr.[0]
        router: route

  # load controllers
  if 'function' == typeof load-controller
    getControllerFileSync = (dir) ->
      files = fs.readdirSync dir
      route_files = _.filter files, (item) -> /.*controller(?=\.).*/i.test item
      routes = _.union _.map route_files, (route) -> route.replace /\..*/i, ''
      routes = _.map routes, (item) ->
        controller_match = item.match /.*(?=controller)/i
        controller = controller_match.[0]
        controller = controller.replace /_$/i, ""
        [ controller , item ]
    controllers = getControllerFileSync options.controller-dir
    if !controllers
      throw new Error("can not read controller directory: #{options.controller-dir}")
    for controller-arr in controllers
      controller = require path.join options.controller-dir, controller-arr.[1]
      for action, methods of controller
        action$ = "#action": {}
        for k, v of methods
          switch k
          | 'all' 'get' 'post' 'put' 'delete' =>
            action$.["#action"] <<< "#k": v
            load-controller do
              controller: controller-arr.[0]
              action: action
              method: k
              func: v