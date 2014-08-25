require! {
  '../': mvc
  './lib/controllers/home_controller': home-controller
  './lib/controllers/test_controller': test-controller
}

mvc.route null, (data) ->
  console.log data