class @index
  @get = (req, res, next) ->
    res.send 'get home/index'

class @user
  @get = (req, res, next) ->
    res.send 'get home/user'
  @post = (req, res, next) ->
    res.send 'post home/user'
