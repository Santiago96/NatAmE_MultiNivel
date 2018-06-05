start "C:\Users\cathe\Desktop\Abril\BD II\NatAmE_MultiNivel\SCRIPT\Seguridad\Tablespace.sql";
start "C:\Users\cathe\Desktop\Abril\BD II\NatAmE_MultiNivel\SCRIPT\Seguridad\Multinivel.sql";
conn multinivel/finalbases;
start "C:\Users\cathe\Desktop\Abril\BD II\NatAmE_MultiNivel\SCRIPT\ScriptModeloBD.sql";
start "C:\Users\cathe\Desktop\Abril\BD II\NatAmE_MultiNivel\SCRIPT\ScriptLlenadoAbril.sql";
start "C:\Users\cathe\Desktop\Abril\BD II\NatAmE_MultiNivel\SCRIPT\Seguridad\Vistas.sql";
start "C:\Users\cathe\Desktop\Abril\BD II\NatAmE_MultiNivel\SCRIPT\Seguridad\Sinonimos.sql";

conn / as sysdba;
GRANT EXECUTE ON SYS.utl_file TO multinivel;

conn multinivel/finalbases;

start "C:\Users\cathe\Desktop\Abril\BD II\NatAmE_MultiNivel\SCRIPT\PL_SQL\Package\pk_procedimientos.hed.hed";
start "C:\Users\cathe\Desktop\Abril\BD II\NatAmE_MultiNivel\SCRIPT\PL_SQL\Package\pk_procedimientos.bod";

create or replace directory dir_temp as 'C:\temp';
	
conn system/rexilo;
start "C:\Users\cathe\Desktop\Abril\BD II\NatAmE_MultiNivel\SCRIPT\Seguridad\Admin.sql";
conn f1005855668/finalbases;
start "C:\Users\cathe\Desktop\Abril\BD II\NatAmE_MultiNivel\SCRIPT\Seguridad\Schemas.sql";
start "C:\Users\cathe\Desktop\Abril\BD II\NatAmE_MultiNivel\SCRIPT\Seguridad\Roles.sql";