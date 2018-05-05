start "C:\Users\jsbon\Dropbox\Proyectos\NatAmE_MultiNivel\SCRIPT\Seguridad\Tablespace.sql";
start "C:\Users\jsbon\Dropbox\Proyectos\NatAmE_MultiNivel\SCRIPT\Seguridad\Multinivel.sql";
conn multinivel/finalbases
start "C:\Users\jsbon\Dropbox\Proyectos\NatAmE_MultiNivel\SCRIPT\ScriptModeloBD.sql";
start "C:\Users\jsbon\Dropbox\Proyectos\NatAmE_MultiNivel\SCRIPT\ScriptLlenado.sql";
start "C:\Users\jsbon\Dropbox\Proyectos\NatAmE_MultiNivel\SCRIPT\Seguridad\Vistas.sql";
start "C:\Users\jsbon\Dropbox\Proyectos\NatAmE_MultiNivel\SCRIPT\Seguridad\Sinonimos.sql";
conn system/123456
start "C:\Users\jsbon\Dropbox\Proyectos\NatAmE_MultiNivel\SCRIPT\Seguridad\Admin.sql";
conn f1005855668/finalbases
start "C:\Users\jsbon\Dropbox\Proyectos\NatAmE_MultiNivel\SCRIPT\Seguridad\Schemas.sql";
start "C:\Users\jsbon\Dropbox\Proyectos\NatAmE_MultiNivel\SCRIPT\Seguridad\Roles.sql";



