const mysql = require("mysql");

function createSQLPool(pool, data, callback) {
    let sqlStatement = "INSERT INTO user (name,email) VALUES (?,?)";
    let sql = mysql.format(sqlStatement, [data.name, data.email])
    execute(pool, callback, sql);
}

function readSQLPool(pool, callback){
    let sql = "SELECT * FROM user";
    execute(pool, callback, sql);
}

function updateSQLPool(pool, data, callback) {
    let sqlStatement = "UPDATE user SET email = ? WHERE id = ?";
    let sql = mysql.format(sqlStatement, [data.email, data.id])
    execute(pool, callback, sql);
}

function deleteSQLPool(pool, data, callback) {
    let sqlStatement = "delete from user WHERE id = ?";
    let sql = mysql.format(sqlStatement, [data.id])
    execute(pool, callback, sql);
}

function execute(pool, callback, sql) {
    pool.getConnection(function(err,connection) {
        if(err) throw err;
        connection.query(sql, function(err, result){
            if(err) throw err;
            callback(result);
        });
        connection.release();
    });
}


module.exports = {createSQLPool, readSQLPool, updateSQLPool, deleteSQLPool};

