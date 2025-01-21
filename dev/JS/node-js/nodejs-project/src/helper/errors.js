const userErrors = {
    "MISSING_DATA": {
        code : 400,
        message : "All input is required"
    },
    "ALREADY_EXISTS" : {
        code : 409,
        message : "User already exists. Please Login."
    }
    

}


module.exports = userErrors;