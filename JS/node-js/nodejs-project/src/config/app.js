// External imports
const morgan = require('morgan');
const express = require("express");
const cors = require("cors");


// Local imports
const pool = require("./mysqldatabase");
const {port} = require( './config');
const router = require("../routes/index")

const app = express();
// Set up a new express.json middleware
app.use(express.json());
app.use(express.urlencoded({extended: true}));

// Set up a morgan to tracks
app.use(morgan('dev'));

app.use(router);
app.use(cors());

// ERROR HANDLERS
app.use(function (req, res, next) {
    const error = new Error('Not Found');
    error.status = 404;
    next(error);
});

// Development error handler
// Will print stacktrace
if (app.get('env') === 'development') {
    app.use(function (error, req, res, next) {
        res.status(error.status || 500);
        res.send({
            message: error.message,
            error: error
        });
    });
}

// Production error handler
// No stacktraces leaked to user
app.use(function (error, req, res, next) {
    res.status(error.status || 500);
    res.send({
        message: error.message,
        error: error
    });
});

app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`)
})

module.exports = app;