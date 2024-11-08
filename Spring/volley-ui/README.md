# Volley-UI

## Installation
```sh
# NPM Version
npm version
  #  npm: '10.9.0'
  # update to last version
  npm install -g npm

# Angular Installation
npm install -g @angular/cli

ng version
  # > Angular CLI: 18.2.11
  # > Node: 22.11.0
  # > Package Manager: npm 10.9.0
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
```

## Commands used for create structure

```sh
# Short commands
# ng generate = ng g
# ng generate component = ng g c

# Common Components
pwd
  # ../volley-ui/src/app
mkdir common
cd ./src/app/common
ng generate component not-found --skip-tests
ng generate component unauthorized --skip-tests
ng generate component logo --skip-tests
ng generate component dialog-message --skip-tests

# Util Functions
pwd
  # ../volley-ui/src/app
mkdir util
touch FormUtil.ts

# ../volley-ui/src/app/common
mkdir model
cd model
ng generate enum dialog-message-types
ng generate interface dialog-message --type=model
ng generate interface select-option

pwd
  # ../volley-ui/src/app
ng generate component home --skip-tests

# model
ng generate interface Tournament model


# Admin tools
cd ./src/app
pwd
  # ../volley-ui/src/app
mkdir admin
cd admin
pwd
  # ../volley-ui/src/app/admin

# services
mkdir services

cd services
ng generate service tournament --skip-tests

mkdir components
cd components
pwd
  # ../volley-ui/src/app/admin/components
ng generate component tournament --skip-tests
ng generate component team --skip-tests

# util
touch form-util.ts
touch message-util.ts

```
