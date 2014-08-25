(function () {
    this.action1 = {
        get: function (req, res, next) {
            res.send('get test/action1');
        },
        post: function (req, res, next) {
            res.send('post test/action1');
        },
        get_add: function (req, res, next) {
          res.send('get test/action1/:id');
        }
    }
}).call(this);