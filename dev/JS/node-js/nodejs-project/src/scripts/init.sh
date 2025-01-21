npm init -y

mkdir src
touch .env
touch .gitignore
touch README.md

cd src
mkdir config middleware model scripts

touch config/mysqldatabase.js
touch model/user.js
touch app.js
touch index.js

npm i express dotenv
npm i mysql
