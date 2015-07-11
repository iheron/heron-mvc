require! {
  path
}
/**
* @params: settings {
*   routeDir                  # route dir path
*   controllerDir             # controller dir path
*   configureDir              # configure dir path
* }
*/
module.exports =
  route: require './route'
  configure: require './configure'
  module: require './module'
  load-module: require './module/load'
  route-module: require './module/route'
  _modules: require './module/_modules'