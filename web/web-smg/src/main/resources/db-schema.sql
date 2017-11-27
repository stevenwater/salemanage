USE saleshare;


--  Drop Tables, Stored Procedures and Views 

DROP TABLE IF EXISTS sys_rol_fun;
DROP TABLE IF EXISTS sys_functions;
DROP TABLE IF EXISTS sys_user_role;
DROP TABLE IF EXISTS sys_users;
DROP TABLE IF EXISTS sys_role;
DROP TABLE IF EXISTS sys_orgs;

--  Create Tables 
CREATE TABLE sys_rol_fun
(
	id INTEGER NOT NULL,
	role_code VARCHAR(50),
	fun_code VARCHAR(50),
	PRIMARY KEY (id),
	UNIQUE UQ_t_rol_fun_id(id)
) ;


CREATE TABLE sys_functions
(
	fun_code VARCHAR(50) NOT NULL,
	fun_name VARCHAR(100) NOT NULL,
	fun_uri VARCHAR(250) NOT NULL,
	fun_desc VARCHAR(250),
	is_menu INTEGER DEFAULT 0 COMMENT '0:No 1:YES',
	parent_fun VARCHAR(50) COMMENT 'it is only for menu function',
	display_order INTEGER DEFAULT 999999,
	PRIMARY KEY (fun_code),
	UNIQUE UQ_t_functions_fun_code(fun_code)
) ;


CREATE TABLE sys_user_role
(
	id INTEGER NOT NULL,
	role_code VARCHAR(50) NOT NULL,
	user_name VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
) ;


CREATE TABLE sys_users
(
	user_name VARCHAR(50) NOT NULL COMMENT 'user login name',
	password VARCHAR(100) NOT NULL COMMENT 'password should be digested by MD5',
	org_code VARCHAR(50),
	PRIMARY KEY (user_name),
	UNIQUE UQ_sys_users_user_name(user_name)
) ;


CREATE TABLE sys_role
(
	_id INTEGER NOT NULL,
	role_code VARCHAR(50) NOT NULL,
	role_name VARCHAR(50) NOT NULL,
	org_code VARCHAR(50),
	PRIMARY KEY (_id),
	UNIQUE UQ_t_role__id(_id),
	UNIQUE UQ_t_role_role_code(role_code)
) ;


CREATE TABLE sys_orgs
(
	org_code VARCHAR(50) NOT NULL,
	org_name VARCHAR(50) NOT NULL,
	parent_org VARCHAR(50) DEFAULT 000000 COMMENT 'parent organization,default value is "000000",means that it is the one of the root orgganization',
	desc VARCHAR(250) COMMENT 'the organization description',
	delete_flag INTEGER NOT NULL DEFAULT 0 COMMENT '0:not deleted 1:deleted',
	PRIMARY KEY (org_code),
	UNIQUE UQ_t_orgs_org_code(org_code)
)  COMMENT='organization table,each user belong to only organizaiton';
