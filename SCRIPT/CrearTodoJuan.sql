start "C:\Users\juana\Downloads\NatAmE_MultiNivel-master\SCRIPT\Seguridad\Tablespace.sql";
start "C:\Users\juana\Downloads\NatAmE_MultiNivel-master\SCRIPT\Seguridad\Multinivel.sql";
conn multinivel/finalbases
start "C:\Users\juana\Downloads\NatAmE_MultiNivel-master\SCRIPT\ScriptModeloBD.sql";
start "C:\Users\juana\Downloads\NatAmE_MultiNivel-master\SCRIPT\ScriptLlenado.sql";
start "C:\Users\juana\Downloads\NatAmE_MultiNivel-master\SCRIPT\Seguridad\Vistas.sql";
start "C:\Users\juana\Downloads\NatAmE_MultiNivel-master\SCRIPT\Seguridad\Sinonimos.sql";

conn / as sysdba;
GRANT EXECUTE ON SYS.utl_file TO multinivel;

conn multinivel/finalbases;

start "C:\Users\juana\Downloads\NatAmE_MultiNivel\SCRIPT\PL_SQL\Package\pk_procedimientos.hed.hed";
start "C:\Users\juana\Downloads\NatAmE_MultiNivel\SCRIPT\PL_SQL\Package\pk_procedimientos.bod";
create or replace directory dir_temp as 'C:\temp';

	
conn system/system
start "C:\Users\juana\Downloads\NatAmE_MultiNivel-master\SCRIPT\Seguridad\Admin.sql";
conn f1005855668/finalbases
start "C:\Users\juana\Downloads\NatAmE_MultiNivel-master\SCRIPT\Seguridad\Schemas.sql";
start "C:\Users\juana\Downloads\NatAmE_MultiNivel-master\SCRIPT\Seguridad\Roles.sql";