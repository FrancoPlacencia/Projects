# Angular

## Instalation and Initiation

```bash
# Install Angular CLI
npm install -global @angular/cli

# Review the version and confirm installation
ng version

# Create a new project
ng new [project-name]
ng new --help

# Move inside the new project
cd [project-name]

# Install the package and its dependencies
npm install

# Installing bootstrap
npm install bootstrap jquery @popperjs/core bootstrap-icons @fortawesome/fontawesome-free
> npm install @ng-bootstrap/ng-bootstrap@next

## Local Development Server http://localhost:4200/
ng serve

## JSON Server http://localhost:3000/
npm install -g json-server
json-server --watch db.json
```


## Components

There are 3 elements in a component in Angular:
* Typescript Component Class
* UI Component Class
* Styles CSS

To generate a component

```bash
ng generate component [component-name]
```