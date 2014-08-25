require! {
  '../': mvc
}
mvc.route(null, null)
routeRegex ?= /.*controller(?=\.).*/i
console.warn routeRegex.test "aa_controller.js"