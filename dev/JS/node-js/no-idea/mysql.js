// MySQL Node JS

// npm i mysql -g
const mysql = require('mysql');

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'R3b3ca'
});

connection.connect(function(err){
    if(err){
        console.error('Error making DB Connection: '+ err.stack);
        return;
    }

    console.log('Connected as ' + connection.threadId);
});

connection.query('SELECT 1 + 1 AS solution',function(error,results, fiels){
    if(error) throw error;
    console.log();
});

connection.end();