start "C:\Users\juana\Downloads\NatAmE_MultiNivel-master\SCRIPT\Seguridad\Tablespace.sql";
start "C:\Users\juana\Downloads\NatAmE_MultiNivel-master\SCRIPT\Seguridad\Multinivel.sql";
conn multinivel/finalbases
start "C:\Users\juana\Downloads\NatAmE_MultiNivel-master\SCRIPT\ScriptModeloBD.sql";
start "C:\Users\juana\Downloads\NatAmE_MultiNivel-master\SCRIPT\ScriptLlenado.sql";
start "C:\Users\juana\Downloads\NatAmE_MultiNivel-master\SCRIPT\Seguridad\Vistas.sql";
start "C:\Users\juana\Downloads\NatAmE_MultiNivel-master\SCRIPT\Seguridad\Sinonimos.sql";
conn system/system
start "C:\Users\juana\Downloads\NatAmE_MultiNivel-master\SCRIPT\Seguridad\Admin.sql";
conn f1005855668/finalbases
start "C:\Users\juana\Downloads\NatAmE_MultiNivel-master\SCRIPT\Seguridad\Schemas.sql";
start "C:\Users\juana\Downloads\NatAmE_MultiNivel-master\SCRIPT\Seguridad\Roles.sql";