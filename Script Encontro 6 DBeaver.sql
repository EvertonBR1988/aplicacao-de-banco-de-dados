USE DB_T2_EVERTON_SILVA;
 
 
create table users(
	id int auto_increment primary key,
	NAME varchar (100),
	Idade int
);
 
SET GLOBAL local_infile = 1;
 
SHOW VARIABLES LIKE 'local_infile';
 
LOAD DATA LOCAL INFILE 'C:/BD Workbench/usuarios.csv'
INTO TABLE users
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@vname, @vidade)
SET NAME = @vname, Idade = @vidade;