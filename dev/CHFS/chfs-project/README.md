# ChfsProject

This project was generated with **Angular CLI ver17.3.0.**

## Commands used for dependencies

```sh
# fontawesome 6
ng add @fortawesome/angular-fontawesome

# Global | Include animations
# deeppurple-amber.css	Light	deep-purple, amber, red
# indigo-pink.css	Light	indigo, pink, red
# pink-bluegrey.css	Dark	pink, blue-grey, red
# purple-green.css	Dark	purple, green, red
ng add @angular/material

# ng bootstrap
ng add @ng-bootstrap/ng-bootstrap
```

## Commands used for create structure

```sh
# new angular project
# stylesheet format SCSS
# SSR (Server-Side Rendering) No
ng new chfs-project

ng generate component not-found
ng generate component unauthorized
# auth structure
# -------------------------------------------

# Login
ng generate component auth-home --skip-tests
ng generate component login
ng generate interface RequestLogin --type=dto

ng generate component logout --skip-tests

ng generate interface AuthResponse --type=dto

ng generate interface SelectOption --type=form

# Register
ng generate component register
ng generate interface RequestRegister --type=dto

# Forgot Password
ng generate component forgot-password
ng generate interface RequestForgotPassword --type=dto

# Reset Password
ng generate component reset-password
ng generate interface RequestResetPassword --type=dto

# Common
ng generate component logo
ng generate component password
ng generate component password-strength
ng generate class password-validator --type=model

# model
ng generate interface User model

ng generate service auth
ng generate service jwt

# Security
ng generate guard auth
ng generate class auth --type=interceptor

# Dialog Message
ng generate component dialog-message
ng generate class dialog-message --type=model
ng generate enum dialog-message-types

ng generate component home
ng generate pipe pretty-json


# admin module structure
ng generate component admin

ng generate component module-list
ng generate component module
  ## User
  ng generate service user --skip-tests
  ng generate interface User model
  ng generate interface table-user dto

  ng generate component user --skip-tests --style none
  ng generate component user-list --skip-tests --style none

  ## Church
  ng generate service church --skip-tests
  ng generate interface Church model
  ng generate interface table-church dto

  ng generate component church --skip-tests --style none


  ## Category
  ng generate service category --skip-tests
  ng generate interface Category model

  ng generate component category --skip-tests --style none

  # Fund
  ng generate service fund --skip-tests
  ng generate interface Fund model

  ng generate component fund --skip-tests --style none




# -------------------------------------------
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
