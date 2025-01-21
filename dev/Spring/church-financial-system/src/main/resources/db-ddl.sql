SET FOREIGN_KEY_CHECKS=0; -- to disable them
SET FOREIGN_KEY_CHECKS=1; -- to re-enable them

CREATE DATABASE chfs_dev;

USE chfs_dev;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id     		INTEGER NOT NULL AUTO_INCREMENT,
    email       		VARCHAR(255) NOT NULL,
    password    		VARCHAR(255) NOT NULL,
    role				VARCHAR(255) NOT NULL,
    
    first_name  		VARCHAR(255) NOT NULL,
    last_name   		VARCHAR(255) NOT NULL,
    
    address     		VARCHAR(255) NOT NULL,
    phone       		VARCHAR(255) NOT NULL,
    
    title       		VARCHAR(255) DEFAULT NULL,
    bio         		VARCHAR(255) DEFAULT NULL,
    
    is_active   		BOOLEAN DEFAULT FALSE,
   	created_on  		DATETIME DEFAULT CURDATE(),
   	
    is_locked   		BOOLEAN DEFAULT TRUE,
    failed_logins		INTEGER NOT NULL DEFAULT 0,
    last_failed_login	DATETIME,
    
    forgot_token		VARCHAR(255),
    forgot_created_on	DATETIME,
    forgot_expire_on	DATETIME,
    
    using_mfa   BOOLEAN DEFAULT FALSE,
    image_url   VARCHAR(255) DEFAULT '',
    

    CONSTRAINT PK_user_id PRIMARY KEY (user_id),
    CONSTRAINT UQ_user_email UNIQUE (email)
);

DROP TABLE IF EXISTS roles;

CREATE TABLE roles (
    role_id     INTEGER NOT NULL AUTO_INCREMENT,
    name  		VARCHAR(255) NOT NULL,
    permission	VARCHAR(255) NOT NULL,
    CONSTRAINT PK_role_id PRIMARY KEY (role_id),
    CONSTRAINT UQ_user_email UNIQUE (name)
);

DROP TABLE IF EXISTS user_roles;

CREATE TABLE user_roles (
    user_role_id     INTEGER NOT NULL AUTO_INCREMENT,
    user_id     	INTEGER NOT NULL,
    role_id     	INTEGER NOT NULL,

	CONSTRAINT PK_user_role_id PRIMARY KEY (user_role_id),
    
    CONSTRAINT FK_user_roles_user_id FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_user_roles_role_id FOREIGN KEY (role_id) REFERENCES roles (role_id) ON DELETE CASCADE ON UPDATE CASCADE,
    
    CONSTRAINT UQ_user_roles_user_id UNIQUE (user_id)
    
);
DROP TABLE IF EXISTS permissions;

CREATE TABLE permissions (
    permission_id    INTEGER NOT NULL AUTO_INCREMENT,
    user_id     	INTEGER NOT NULL,
    church_id     	INTEGER NOT NULL,
    
	CONSTRAINT PK_user_role_id PRIMARY KEY (permission_id,user_id,church_id),
    
    CONSTRAINT FK_permission_user_id FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_permission_church_id FOREIGN KEY (church_id) REFERENCES churches (church_id) ON DELETE CASCADE ON UPDATE CASCADE
   
);

-- =================================================
-- Financial Structure
-- =================================================
-- DROP ALL
DROP TABLE IF EXISTS church_categories;
DROP TABLE IF EXISTS churches;
DROP TABLE IF EXISTS categories;

-- Normal
DROP TABLE IF EXISTS churches;

CREATE TABLE churches (
    church_id		INTEGER NOT NULL AUTO_INCREMENT,
    name        	VARCHAR(255) NOT NULL,
    denomination	VARCHAR(255) NOT NULL,
    address			VARCHAR(255) NOT NULL,
	registration	VARCHAR(255) NOT NULL,
	
    created_on  	DATETIME NOT NULL,
    created_by  	INTEGER NOT NULL,
    
    updated_on  	DATETIME,
    updated_by  	INTEGER,

    CONSTRAINT PK_church_id PRIMARY KEY (church_id),

    CONSTRAINT UQ_church_name UNIQUE (name)
);

DROP TABLE IF EXISTS categories;

CREATE TABLE categories (
    category_id INTEGER NOT NULL AUTO_INCREMENT,
    name        VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    
    created_on  DATETIME NOT NULL,
    created_by  INTEGER  NOT NULL,
    
	updated_on  DATETIME,
    updated_by  INTEGER,
    
    fund_id		INTEGER NOT NULL,
    
    CONSTRAINT PK_category_id PRIMARY KEY (category_id),
    
    CONSTRAINT UQ_categories_name UNIQUE (name),
    
	CONSTRAINT FK_category_fund_id   FOREIGN KEY (fund_id) REFERENCES funds(fund_id) ON UPDATE CASCADE  
    
);
    -- CONSTRAINT FK_category_church_id FOREIGN KEY (church_id) REFERENCES churches(church_id) ON DELETE CASCADE,
    -- CONSTRAINT FK_category_fund_id   FOREIGN KEY (fund_id)   REFERENCES funds(fund_id)


DROP TABLE IF EXISTS church_categories;

CREATE TABLE church_categories (
	church_categories_id	INTEGER NOT NULL AUTO_INCREMENT,
	church_id				INTEGER NOT NULL,
	category_id				INTEGER NOT NULL,
	
	CONSTRAINT PK_church_categories PRIMARY KEY (church_categories_id,church_id, category_id),
		
	CONSTRAINT FK_church_categories_church_id 	FOREIGN KEY (church_id)   REFERENCES churches(church_id) ON DELETE CASCADE,
	CONSTRAINT FK_church_categories_category_id	FOREIGN KEY (category_id) REFERENCES categories(category_id) 
);

DROP TABLE IF EXISTS funds;

CREATE TABLE funds (
    fund_id INTEGER NOT NULL AUTO_INCREMENT,
    name        VARCHAR(255) NOT NULL,
    description VARCHAR(1000),
    created_on  DATETIME NOT NULL,
    created_by  INTEGER NOT NULL,
    
	updated_on  DATETIME,
    updated_by  INTEGER,
    CONSTRAINT PK_fund_id PRIMARY KEY (fund_id),

    CONSTRAINT UQ_fund_name UNIQUE (name)
);

-- =================================================
-- Other Structure
-- =================================================
DROP TABLE IF EXISTS churches_categories;

CREATE TABLE churches_categories (
    category_id INTEGER NOT NULL,
    church_id 	INTEGER NOT NULL,

    CONSTRAINT UQ_churches_categories UNIQUE (category_id,church_id),
    
    CONSTRAINT FK_churches_categories_category_id FOREIGN KEY (category_id) REFERENCES categories(category_id),
    CONSTRAINT FK_churches_categories_church_id   FOREIGN KEY (church_id)   REFERENCES churches(church_id)
    
);


DROP TABLE IF EXISTS module;

CREATE TABLE module (
    module_id     		INTEGER NOT NULL AUTO_INCREMENT,
    name       			VARCHAR(255) NOT NULL,
    description    		VARCHAR(255) NOT NULL,
    icon				VARCHAR(100) NOT NULL,
    
    is_active   		BOOLEAN DEFAULT FALSE,
   	created_on  		DATETIME DEFAULT CURDATE(),
   	
    CONSTRAINT PK_module_id PRIMARY KEY (module_id),
    CONSTRAINT UQ_module_name UNIQUE (name)
);

