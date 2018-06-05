start "C:\Users\pablo\Documents\BasesProyecto\BD\Seguridad\Tablespace.sql";
start "C:\Users\pablo\Documents\BasesProyecto\BD\Seguridad\Multinivel.sql";
conn multinivel/finalbases
start "C:\Users\pablo\Documents\BasesProyecto\BD\ScriptModeloBD.sql";
start "C:\Users\pablo\Documents\BasesProyecto\BD\ScriptLlenado.sql";
start "C:\Users\pablo\Documents\BasesProyecto\BD\Seguridad\Vistas.sql";
start "C:\Users\pablo\Documents\BasesProyecto\BD\Seguridad\Sinonimos.sql";
create or replace directory DIR_TMP as 'C:\temp';


conn / as sysdba;
GRANT EXECUTE ON SYS.utl_file TO multinivel;	


conn multinivel/finalbases;

start "C:\Users\pablo\Documents\BasesProyecto\BD\PL_SQL\Package\pk_procedimientos.hed.hed";
start "C:\Users\pablo\Documents\BasesProyecto\BD\PL_SQL\Package\pk_procedimientos.bod";
start "C:\Users\pablo\Documents\BasesProyecto\BD\PL_SQL\TRIGGERS.sql";
	
conn system/bogota1995
start "C:\Users\pablo\Documents\BasesProyecto\BD\Seguridad\Admin.sql";
conn f1005855668/finalbases
start "C:\Users\pablo\Documents\BasesProyecto\BD\Seguridad\Schemas.sql";
start "C:\Users\pablo\Documents\BasesProyecto\BD\Seguridad\Roles.sql";


conn / as sysdba;
GRANT EXECUTE ON SYS.utl_file TO r_cliente;
GRANT EXECUTE ON SYS.utl_file TO r_representanteventas;
GRANT read, write on directory DIR_TMP to r_cliente;
GRANT read, write on directory DIR_TMP to r_representanteventas;

