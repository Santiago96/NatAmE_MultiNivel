-- PRIVILEGIOS DE ROLES 
SELECT * FROM ROLE_TAB_PRIVS WHERE ROLE='R_MULTINIVEL';
SELECT * FROM ROLE_TAB_PRIVS WHERE ROLE='R_CLIENTE';
SELECT * FROM ROLE_TAB_PRIVS WHERE ROLE='R_REPRESENTANTEVENTAS';

-- Privilegios de los usuarios
SELECT a.GRANTEE,b.ROLE, b.PRIVILEGE FROM DBA_ROLE_PRIVS a FULL OUTER JOIN ROLE_TAB_PRIVS b ON b.ROLE=a.GRANTED_ROLE;

-- roles del usuario conectado en el momento 
select username, granted_role from user_role_privs; 

--Consultar roles asociados a un usuario
select grantee, granted_role from dba_role_privs where grantee = upper ('&grantee') order by grantee;
