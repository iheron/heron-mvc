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