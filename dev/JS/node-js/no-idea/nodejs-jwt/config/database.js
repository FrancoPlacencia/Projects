const mysql = require("mysql");
/*
const {
    createSQL, 
    readSQL, 
    updateSQL, 
    deleteSQL
} = require("./dbfunctions");

const {
    createSQLPool, 
    readSQLPool,
    updateSQLPool, 
    deleteSQLPool
} = require("./dbfunctions-pool");
*/
const pool = mysql.createPool({
    host: process.env.DBHOST,
    user:  process.env.dbuser,
    password: process.env.dbpassword,
    database: process.env.database
});
