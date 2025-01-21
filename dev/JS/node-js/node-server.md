# Node Server
To start using node as a server you need the `http` module and the server information.

```js
const http = require('http');

const hostname = '127.0.0.1';
const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello World');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
```

You can start the server by calling node.

```bash
node server.js
#to start it in debug mode add --inspect 
node --inspect  server.js
```