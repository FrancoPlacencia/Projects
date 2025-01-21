const app = require('./config/app');
const {port} = require( './config/config')

app.listen(port);
console.log(`Server runing on port ${port}...`);


