const mysql = require("mysql");


// {"fieldCount":0,"affectedRows":1,"insertId":5,"serverStatus":2,"warningCount":0,"message":"","protocol41":true,"changedRows":0}
function createSQL(connection, data, callback) {
    let sqlStatement = "INSERT INTO user (name,email) VALUES (?,?)";
    let sql = mysql.format(sqlStatement, [data.name, data.email])
    execute(connection, callback, sql);
}
// json result
function readSQL(connection, callback){
    let sql = "SELECT * FROM user";
    execute(connection, callback, sql);
}
// {"fieldCount":0,"affectedRows":1,"insertId":0,"serverStatus":2,"warningCount":0,"message":"(Rows matched: 1  Changed: 0  Warnings: 0","protocol41":true,"changedRows":0}
function updateSQL(connection, data, callback) {
    let sqlStatement = "UPDATE user SET email = ? WHERE id = ?";
    let sql = mysql.format(sqlStatement, [data.email, data.id])
    execute(connection, callback, sql);
}
// {"fieldCount":0,"affectedRows":0,"insertId":0,"serverStatus":2,"warningCount":0,"message":"","protocol41":true,"changedRows":0}
function deleteSQL(connection, data, callback) {
    let sqlStatement = "delete from user WHERE id = ?";
    let sql = mysql.format(sqlStatement, [data.id])
    execute(connection, callback, sql);
}

function execute(connection, callback, sql) {
    connection.query(sql, function(err, result){
        if(err) throw err;
        callback(result);
    });
    connection.end();
}


module.exports = {createSQL, readSQL, updateSQL, deleteSQL};

/*
Resulst options

get the id of inserted row
    results.insertId

get the number of affected rows (insert/delete/update)
    results.affectedRows

get the number of affected rows (update)
    results.changedRows
*/