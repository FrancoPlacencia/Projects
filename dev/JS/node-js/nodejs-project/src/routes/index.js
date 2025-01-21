const express = require("express");
const router = express.Router();

const controllers = require("../controller/index")

router.get("/api/users", controllers.userController.findAll);

router.post("/api/user/register", controllers.userController.register);

module.exports = router;