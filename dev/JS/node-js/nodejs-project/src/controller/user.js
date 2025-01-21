const userService = require("../services/user");
const bcrypt = require("bcryptjs")
const  userErrors = require("../helper/errors.js")

class UserController {

    register = async(req, res) => {
        console.log(req.body);
        const { first_name, last_name, email, password } = req.body;
        
        // Validate user input
        if (!(email && password && first_name && last_name)) {
            return res.status(userErrors["MISSING_DATA"].code)
                .send(userErrors["MISSING_DATA"].message);
        } 
        const userAlreadyExists = await userService.findByEmail(email)
            .then((data) => {
                console.log(data);
                return data;
            }).catch((error) => {
                console.log("error searching the user");
                undefined;
            });
    
        if(userAlreadyExists) {
            console.log("User already exists " + userAlreadyExists);
            return res.status(userErrors["MISSING_DATA"].code).send(userErrors["MISSING_DATA"].message);
        } else {
            // Encrypt user password
            const encryptedPassword = await bcrypt.hash(password, 10);

            // Insert user on db

        }
        
    }

    create() {

    }

    findAll(req, res) {
        userService.findAll()
            .then((data) => {
                res.json(data);
            }).catch((error) => {
                res.json(error);
            });
    }

    findById() {

    }

    findByEmail(email) {
        
    }

    updateById() {

    }

    removeById() {

    }


}

module.exports = new UserController();