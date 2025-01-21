const mysql = require("mysql");

require("dotenv").config();
/*
// Create a single connection to the database
const connection = mysql.createConnection({
    host: process.env.DBHOST,
    user:  process.env.dbuser,
    password: process.env.dbpassword,
    database: process.env.database
});

connection.connect((err) => {
    if(err) throw err;
    console.log('Connected...')
});
*/
// Create a pool of connections
const pool = mysql.createPool({
    host: process.env.DBHOST,
    user:  process.env.dbuser,
    password: process.env.dbpassword,
    database: process.env.database
});

module.exports = pool;
//module.exports = connection;