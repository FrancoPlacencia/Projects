# ChfsProject

This project was generated with **Angular CLI ver17.3.0.**

## Commands used for dependencies

```sh
# fontawesome 6
ng add @fortawesome/angular-fontawesome

# PinkBlue Grey | Global | Include animations
ng add @angular/material

# ng bootstrap (conflict with material)
ng add @ng-bootstrap/ng-bootstrap
```

## Commands used for create structure

```sh
# new angular project
# stylesheet format SCSS
# SSR (Server-Side Rendering) No
ng new chfs-project

ng generate component not-found

# auth structure
# -------------------------------------------
ng generate component login
ng generate interface login-user model
ng generate class login-user --type=model

ng generate component register
ng generate interface register-user model

ng generate component password
ng generate interface password model

ng generate component password-strength
ng generate service password-validator

ng generate service auth
ng generate service jwt


ng generate component alert-message

```

## Commands for initialization

```sh
# dev server
ng serve

# code scaffolfing
ng generate directive|pipe|service|class|guard|interface|enum|module

# build
ng build

# test
ng test

# e2e test
ng e2e
```
