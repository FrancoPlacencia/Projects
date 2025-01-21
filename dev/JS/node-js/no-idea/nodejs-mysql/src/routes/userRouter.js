const express = require('express');
const router = express.Router();

const UserController = require('../controller/userController');


// Create
router.post('/user/add', UserController.createUser);

// Read
router.get('/user', UserController.readUser);
/*
// Update
router.get("/update/:id", UserController.updateUser);
//router.post("/update/:id", updateUser);

// Delete
router.get("delete/:id", UserController.deleteUser)
*/
module.exports = router;