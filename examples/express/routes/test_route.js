var express = require("express");
var controller = require("../controllers/test_controller");

var router = express.Router();

router.route("/user/:id")
.get(controller.action1.get_add);

router.route("/action1")
.get(controller.action1.post);

module.exports = router;

