//import { Helper } from '../helper';
const  userService = require('../services/userService');

class UserController {

    createUser(request, response) {
        userService.createUser();
        /*
            .then((data) => {
                Helper.responseJsonHandler(null, data, response)
            }).catch((error) => {
                Helper.responseJsonHandler(error, null, response)
            })
            */
    }

    readUser(request, response) {
        postService.create(request.body)
        /*
            .then((data) => {
                Helper.responseJsonHandler(null, data, response)
            }).catch((error) => {
                Helper.responseJsonHandler(error, null, response)
            })
*/
    }
/*
    updateUser(request, response) {
        postService.update(request.params, request.body)
            .then((data) => {
                Helper.responseJsonHandler(null, data, response)
            }).catch((error) => {
                Helper.responseJsonHandler(error, null, response)
            })
    }

    deleteUser(request, response) {
        postService.update(request.params, request.body)
            .then((data) => {
                Helper.responseJsonHandler(null, data, response)
            }).catch((error) => {
                Helper.responseJsonHandler(error, null, response)
            })
    }
*/
}

module.exports = new UserController();