// npm i express
const express = require("express");
const app = express();

// npm i mysql
const mysql = require("mysql");
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

// npm i dotenv
require("dotenv").config();
/*
const connection = mysql.createConnection({
    host: process.env.DBHOST,
    user:  process.env.dbuser,
    password: process.env.dbpassword,
    database: process.env.database
});

connection.connect((err) => {
    if(err) throw err;
    console.log('Connected...')
})
*/

const pool = mysql.createPool({
    host: process.env.DBHOST,
    user:  process.env.dbuser,
    password: process.env.dbpassword,
    database: process.env.database
});



app.use(express.json()); 

app.get("/", (req,res) => {
    res.send("Hello World");
});

// Single connections
// ---------------------------------------------------------------------

app.get("/create", (req,res) => {
    let data = {
        name: 'Placencia',
        email: 'placencia@mail.com'
    }
    createSQL(connection, data, result => {
        res.json(result);
    })
}); 

app.get("/read", (req,res) => {
    readSQL(connection, result => {
        res.json(result);
    })
}); 

app.get("/update", (req,res) => {
    let data = {
        id: 1,
        email: 'new@mail.com'
    }
    updateSQL(connection, data,result => {
        res.json(result);
    })
});

app.get("/delete", (req,res) => {
    let data = { id: 2};
    deleteSQL(connection, data, result => {
        res.json(result);
    })
}); 

// Pool connections
// ---------------------------------------------------------------------

app.get("/create-pool", (req,res) => {
    let data = {
        name: 'Placencia',
        email: 'placencia@mail.com'
    }
    createSQLPool(pool, data, result => {
        res.json(result);
    })
}); 

app.get("/read-pool", (req,res) => {
    readSQLPool(pool, result => {
        res.json(result);
    })
}); 

app.get("/update-pool", (req,res) => {
    let data = {
        id: 2,
        email: 'new@mail.com'
    }
    updateSQLPool(pool, data,result => {
        res.json(result);
    })
});
// {"fieldCount":0,"affectedRows":1,"insertId":0,"serverStatus":2,"warningCount":0,"message":"","protocol41":true,"changedRows":0}
app.get("/delete-pool", (req,res) => {
    let data = { id: 2};
    deleteSQLPool(pool, data, result => {
        res.json(result);
    })
}); 

// nodemon app
app.listen(3000,() => {
    console.log("Servidor en puerto 3000...")
});