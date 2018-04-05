--Todo se ejecuta desde system


-- Role para Cliente 

CREATE ROLE R_CLIENTE;

GRANT CONNECT TO R_CLIENTE;

GRANT SELECT ON PERSON TO R_CLIENTE;
GRANT SELECT ON CATEGORY TO R_CLIENTE;
GRANT SELECT ON SUBCATEGORY TO R_CLIENTE;
GRANT SELECT ON PRODUCT TO R_CLIENTE;
GRANT SELECT ON DETAILSALE TO R_CLIENTE;
GRANT SELECT ON BANK TO R_CLIENTE;
GRANT SELECT ON CARD TO R_CLIENTE;
GRANT SELECT ON STATESALE TO R_CLIENTE;
GRANT SELECT ON SALE TO R_CLIENTE;
GRANT SELECT ON ITEM TO R_CLIENTE;
GRANT SELECT ON INVENTARIO TO R_CLIENTE;
GRANT SELECT ON MULTINIVEL.ARTICULO TO R_CLIENTE;
GRANT SELECT ON DETAILPAYMENT TO R_CLIENTE;
--GRANT SELECT ON MULTINIVEL.HISTORICOCOMPRA TO R_CLIENTE;
GRANT INSERT ON SALE TO R_CLIENTE;
GRANT INSERT ON DETAILSALE TO R_CLIENTE;
GRANT INSERT ON DETAILPAYMENT TO R_CLIENTE;

GRANT INSERT (PUNTAJECALIFICACION, COMENTARIO) ON QUALIFICATION TO R_CLIENTE;
GRANT UPDATE (ULTIMACONEXION) ON PERSON TO R_CLIENTE;
GRANT UPDATE ON ITEM TO R_CLIENTE;

-- GRANT R_CLIENTE TO USER_CLIENTE->Script asignacion cliente desde la aplicación 

-- SECUENCIAS IMPORTANTE DEFINIR PERMISOS DE LAS SECUENCIAS QUE EL RV PUEDE UTILIZAR

GRANT SELECT ON MULTINIVEL.SEQ_VENTA_IDVENTA TO R_CLIENTE;
GRANT SELECT ON MULTINIVEL.SEQ_DETALLEVENTA_ID TO R_CLIENTE;
GRANT SELECT ON MULTINIVEL.SEQ_DETALLEPAGO_IDDETALLEPAGO TO R_CLIENTE;


-- Role para Representante de Ventas 

CREATE ROLE R_REPRESENTANTEVENTAS;

GRANT CONNECT TO R_REPRESENTANTEVENTAS;
GRANT CREATE USER TO R_REPRESENTANTEVENTAS;
GRANT R_CLIENTE TO R_REPRESENTANTEVENTAS WITH ADMIN OPTION;

GRANT SELECT ON PERSON TO R_REPRESENTANTEVENTAS;
GRANT SELECT ON COUNTRY TO R_REPRESENTANTEVENTAS;
GRANT SELECT ON REGION TO R_REPRESENTANTEVENTAS;
GRANT SELECT ON CITY TO R_REPRESENTANTEVENTAS;
GRANT SELECT ON QUALIFICATION TO R_REPRESENTANTEVENTAS;
GRANT SELECT ON TYPEAGENTSALES TO R_REPRESENTANTEVENTAS;
GRANT SELECT ON JOB TO R_REPRESENTANTEVENTAS;
GRANT SELECT ON CONTACT TO R_REPRESENTANTEVENTAS;
GRANT SELECT ON TYPECONTACT TO R_REPRESENTANTEVENTAS;
GRANT SELECT ON STATESALE TO R_REPRESENTANTEVENTAS;
GRANT SELECT ON SALE TO R_REPRESENTANTEVENTAS;
GRANT INSERT ON PERSON TO R_REPRESENTANTEVENTAS;
GRANT UPDATE ON PERSON TO R_REPRESENTANTEVENTAS;
GRANT INSERT ON CONTACT TO R_REPRESENTANTEVENTAS;
GRANT SELECT ON MULTINIVEL.ARTICULO TO R_REPRESENTANTEVENTAS;

-- SECUENCIAS IMPORTANTE DEFINIR PERMISOS DE LAS SECUENCIAS QUE EL RV PUEDE UTILIZAR

GRANT SELECT ON MULTINIVEL.SEQ_CONTACTO_IDCONTACTO TO R_REPRESENTANTEVENTAS;


-- GRANT R_REPRESENTANTEVENTAS TO USER_REPRESENTANTEVENTAS 

GRANT R_REPRESENTANTEVENTAS TO s1018485092;
GRANT R_REPRESENTANTEVENTAS TO a1005855865;
GRANT R_REPRESENTANTEVENTAS TO j1016091072;
GRANT R_REPRESENTANTEVENTAS TO p1023944061;
GRANT R_REPRESENTANTEVENTAS TO j1018492522;

