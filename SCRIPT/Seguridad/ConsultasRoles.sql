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


select * from dba_tab_privs where privilege = 'EXECUTE';

select 'grant '||privilege||' on '||owner||'.'||table_name||' to '||grantee||';' from dba_tab_privs where grantee = upper('&1') order by grantee;



select
    lpad(' ', 2*level) || granted_role "User, his roles and privileges"
  from
    (
    /* THE USERS */
      select
        null     grantee,
        username granted_role
      from
        dba_users
      where
        username like upper('%&enter_username%')
    /* THE ROLES TO ROLES RELATIONS */
    union
      select
        grantee,
        granted_role
      from
        dba_role_privs
    /* THE ROLES TO PRIVILEGE RELATIONS */
    union
      select
        grantee,
        privilege
      from
        dba_sys_privs
    )
  start with grantee is null
  connect by grantee = prior granted_role;