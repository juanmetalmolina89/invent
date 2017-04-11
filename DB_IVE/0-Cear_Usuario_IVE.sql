-- EJECUTAR CON USUARIO SYS

DROP TABLESPACE IVEDAT including contents and datafiles; 

-- borrado de usuario y todos sus objetos
drop user IVE cascade;

-- Create the user IVE
create user IVE
  identified by "ive123"; 
  
-- Grant/Revoke role privileges 
grant connect to IVE;
grant resource to IVE;
-- Grant/Revoke system privileges 
grant create any context to IVE;
grant create cluster to IVE;
grant create dimension to IVE;
grant create indextype to IVE;
grant create job to IVE;
grant create materialized view to IVE;
grant create operator to IVE;
grant create procedure to IVE;
grant create sequence to IVE;
grant create session to IVE;
grant create synonym to IVE;
grant create table to IVE;
grant create trigger to IVE;
grant create type to IVE;
grant create view to IVE;
grant debug any procedure to IVE;
grant debug connect session to IVE;
grant unlimited tablespace to IVE;

CREATE TABLESPACE IVEDAT
  DATAFILE 'C:\Users\Julio C\Dropbox\IVE\BD\IVE\IVEDAT.dbf'
  SIZE 20M AUTOEXTEND ON;
  
  
alter user IVE
  default tablespace IVEDAT;

 
grant read, write on directory DATA_PUMP_DIR to IVE;  