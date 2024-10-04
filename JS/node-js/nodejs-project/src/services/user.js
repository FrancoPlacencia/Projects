const userSQL = require("../database/user")

const pool = require("../config/mysqldatabase");

class UserService {

    register() {
        return new Promise((resolve, reject) => {});
    }

    create() {
        return new Promise((resolve, reject) => {
            pool.getConnection((error,connection) => {
                if(error) {
                    console.log("Error making the connection");
                    reject(error);
                }
                connection.query(userSQL.FIND_ALL, (error, result) => {
                    if(error) {
                        console.log("Error making the connection");
                        reject(error);
                    }
                    resolve(result);
                });
                connection.release();
            });
        })
    }

    findAll() {
        return new Promise((resolve, reject) => {
            pool.getConnection((error,connection) => {
                if(error) {
                    console.log("Error making the connection");
                    reject(error);
                }
                connection.query(userSQL.FIND_ALL, (error, result) => {
                    if(error) {
                        console.log("Error making the connection");
                        reject(error);
                    }
                    resolve(result);
                });
                connection.release();
            });
        })
    }

    findById() {

    }
    
    findByEmail(email) {
        console.log("calling new promise")
        return new Promise((resolve, reject) => {
            let sql = mysql.format(userSQL.FIND_BY_EMAIL, [email])
            pool.getConnection((error, connection)=>{
                if(error) {
                    console.log("Error making the connection");
                    reject(error);
                }
                connection.query(sql, (error, result) => {
                    if(error) {
                        console.log("Error finding by email the connection");
                        reject(error);
                    }
                    console.log("result " + result);
                    resolve(result);
                });
                connection.release();
            });
        });
    }

    updateById() {

    }

    removeById() {

    }

}

module.exports = new UserService();