require! {
  fs
  path
  'lodash': _
}
/**
* @params: options {
*   routeDir         # route dir path
*   routeRegex       # route regex
*   controllerDir    # controller dir path
*   controllerRegex  # controller regex
* }
*/
module.exports = (options, fn) ->
  root = process.cwd()
  options ?= {}
  if !options.route-dir
    options.route-dir = path.join root, 'lib/routes'
    console.warn "warn: please set options.routeDir or load default -> routeDir: #{options.route-dir}"
  #  options.route-regex ?= /.*route(?=\.).*/i
  if !options.controller-dir
    options.controller-dir = path.join root, 'lib/controllers'
    console.warn "warn: please set options.controllerDir or load default -> controllerDir: #{options.controller-dir}"
  #  options.controll-regex ?= /.*controller(?=\.).*/i

  getRouteFileSync = (dir) ->
    files = fs.readdirSync dir
    route_files = _.filter files, (item) -> /.*route(?=\.).*/i.test item
    routes = _.union _.map route_files, (route) -> route.replace /\..*/i, ''
    routes = _.map routes, (item) ->
      route_match = item.match /.*(?=route)/i
      route = route_match.[0]
      route = route.replace /_$/i, ""
      [ route , item ]

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
  results = {}
  for controller-arr in controllers
    controller = require path.join options.controllerDir, "./#{controller-arr.[1]}"
    for action, methods of controller
      action$ = "#action": {}
      for k, v of methods
        switch k
        | 'all' 'get' 'post' 'put' 'delete' =>
          action$.["#action"] <<< "#k": v
          if 'function' == typeof fn
            fn do
              controller: controller-arr.[0]
              action: action
              method: k
              func: v
      results <<< action$
  results

