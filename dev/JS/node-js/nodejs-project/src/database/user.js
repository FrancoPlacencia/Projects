const userSQL = {
    "INSERT": {
        sql: "INSERT INTO user (name,email) VALUES (?,?)"
    },
    "FIND_ALL": {
        sql: "SELECT * FROM user"
    },
    "FIND_BY_EMAIL": {
        sql: "SELECT * FROM user"
    },
    "UPDATE_BY_ID": {
        sql: "UPDATE user SET email = ? WHERE id = ?"
    },
    "DELETE_BY_ID": {
        sql: "delete from user WHERE id = ?"
    }

}
/*
function createSQLPool(data, callback) {
    let sql = mysql.format(userSQL.INSERT, [data.name, data.email])
    execute(sql);
}

function readSQLPool(callback){
    return new Promise((resolve, reject) => {
        try {
            pool.getConnection((error,connection) => {
                if(error) {
                    reject(error);
                    //throw error;
                } else {}
                    try {
                        connection.query(sql, function(err, result){
                            if(err) throw err;
                            resolve(result);
                        });
                    } catch {

                    } finally {
                        connection.release();
                    }
                    
                }
                
                
            });

            PostSchema.find({}, (error, data) => {
                if (error) {
                    errors["002"].reason = error.message || "";
                    reject(errors["002"]);
                } else {
                    resolve(data);
                }
            })
        } catch (error) {
            errors["003"].reason = error.message;
            reject(errors["003"]);
        } finally {
            
        }

    })



    execute(userSQL.FIND_ALL);
}

function updateSQLPool(data, callback) {
    let sql = mysql.format(userSQL.UPDATE_BY_ID, [data.email, data.id])
    execute(sql);
}

function deleteSQLPool(data, callback) {
    let sql = mysql.format(userSQL.DELETE_BY_ID, [data.id])
    execute(sql);
}

function execute(sql) {

    return new Promise((resolve, reject) => {
        pool.getConnection(function(err,connection) {
            if(err) {
                reject(err)
            } else {

            }
            connection.query(sql, function(err, result){
                if(err) throw err;
                resolve(result);
            });
            connection.release();
        });
    });
    
}
*/
module.exports = userSQL;

