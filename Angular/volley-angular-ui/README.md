# Volley-UI

## Installation

```sh
# NPM Version
npm version
  #  npm: '10.9.0'
  # node: 22.11.0
  # update to last version
  npm install -g npm

# Angular Installation
npm install -g @angular/cli

ng version
  # > Angular CLI: 19.0.2
  # > Node: 22.11.0
  # > Package Manager: npm 10.9.1
  # > OS: win32 x64
```

## Start the angular project

```sh
ng serve --port 5000
```

## Commands used for create the project

```sh
# Generating the project
ng new volley-ui
  # Sass (SCSS)
  # SSR and SSG/Prerendering - NO

ng add @angular/material
  # Theme - Azure/Blue
  # Global styles  - yes
  # Animations - Include and enable

npm i @angular/material-moment-adapter
npm i angular-moment

# Short commands
ng generate => ng g
ng generate component => ng g c
ng generate service => ng g s
```

## Commands used for create structure

All commands are executed in `volley-ui/src/app`.

```sh
cd ./src/app
pwd # ../volley-ui/src/app

# Admin tools
mkdir admin
cd admin
mkdir components
mkdir model
mkdir services

# Common
mkdir common
cd common
mkdir model

# Util
mkdir util
```

## Admin Module

### Admin Components

```sh
pwd # ../volley-ui/src/app/admin/components
ng generate component tournament --skip-tests
ng generate component team --skip-tests
ng generate component game --skip-tests
ng generate component player --skip-tests
```

### Admin Models

```sh
pwd # ../volley-ui/src/app/admin/model
ng generate interface tournament --type=model
ng generate interface team --type=model
ng generate interface weekOption --type=model

ng generate interface player --type=model
```

### Admin Services

```sh
pwd # ../volley-ui/src/app/admin/services
ng generate service tournament --skip-tests
ng generate service team --skip-tests
ng generate service week --skip-tests
ng generate service player --skip-tests
```

## Common Module

### Common Components

```sh
ng generate component dialog-message --skip-tests
ng generate component logo --skip-tests
ng generate component not-found --skip-tests
ng generate component unauthorized --skip-tests
```

## Common Models

```sh
pwd # ../volley-ui/src/app/common/model
ng generate enum dialog-message-types
ng generate enum team-category
ng generate interface dialog-message --type=model
ng generate interface select-option
ng generate interface sidenav-element

pwd # ../volley-ui/src/app
ng generate component home --skip-tests
```

## Util Module

```sh
pwd # ../volley-ui/src/app
touch form-util.ts
touch message-util.ts
touch response-util.ts
```
