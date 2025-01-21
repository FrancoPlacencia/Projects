const express = require('express');
const path = require('path');
const morgan = require('morgan');
const userRoutes = require('../routes/userRouter')
/*
const mysql = require('mysql');
const myConnection = require('express-myconnection');
*/
const app = express();

// settings
app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');


// api
//const userAPI = require('./api/user')


// middleware
app.use(morgan('dev'));
/*
app.use(myConnection(mysql, {
    host: 'localhost',
    user: 'root',
    password: 'R3b3ca',
    port: 3306,
    database: 'nodejstest'

}, 'single'));

*/


// static files
app.use(express.static(path.join(__dirname, 'public')));

module.exports = app;