/*Todo se ejecuta desde system*/
/* Role para Multinivel */
/*Se debe primero crear el user multinivel, para poder asignarle el rol*/
CREATE ROLE R_MULTINIVEL;

GRANT CONNECT,RESOURCE TO R_MULTINIVEL;
GRANT R_MULTINIVEL TO MULTINIVEL;

/* Role para Cliente */

CREATE ROLE R_CLIENTE;

GRANT CONNECT TO R_CLIENTE;

GRANT SELECT ON MULTINIVEL.CATEGORIA TO R_CLIENTE;
GRANT SELECT ON MULTINIVEL.SUBCATEGORIA TO R_CLIENTE;
GRANT SELECT ON MULTINIVEL.PRODUCTO TO R_CLIENTE;
GRANT SELECT ON MULTINIVEL.DETALLEVENTA TO R_CLIENTE;
GRANT SELECT ON MULTINIVEL.TIPOPAGO TO R_CLIENTE;
GRANT SELECT ON MULTINIVEL.BANCO TO R_CLIENTE;
GRANT SELECT ON MULTINIVEL.ESTADOVENTA TO R_CLIENTE;
GRANT SELECT ON MULTINIVEL.VENTA TO R_CLIENTE;
GRANT SELECT ON MULTINIVEL.ITEM TO R_CLIENTE;
GRANT SELECT ON MULTINIVEL.STOCK TO R_CLIENTE;
GRANT INSERT (PUNTAJECALIFICACION, COMENTARIO) ON MULTINIVEL.CALIFICACION TO R_CLIENTE;

/* GRANT R_CLIENTE TO USER_CLIENTE->Script asignacion cliente desde la aplicación */


/* Role para Representante de Ventas */

CREATE ROLE R_REPRESENTANTEVENTAS;

GRANT CONNECT TO R_REPRESENTANTEVENTAS;
GRANT CREATE USER TO R_REPRESENTANTEVENTAS;
GRANT R_CLIENTE TO R_REPRESENTANTEVENTAS WITH ADMIN OPTION;

GRANT SELECT ON MULTINIVEL.PERSONA TO R_REPRESENTANTEVENTAS;
GRANT SELECT ON MULTINIVEL.PAIS TO R_REPRESENTANTEVENTAS;
GRANT SELECT ON MULTINIVEL.REGION TO R_REPRESENTANTEVENTAS;
GRANT SELECT ON MULTINIVEL.CIUDAD TO R_REPRESENTANTEVENTAS;
GRANT SELECT ON MULTINIVEL.CALIFICACION TO R_REPRESENTANTEVENTAS;
GRANT SELECT ON MULTINIVEL.TIPOREPRESENTANTEVENTAS TO R_REPRESENTANTEVENTAS;
GRANT SELECT ON MULTINIVEL.CARGO TO R_REPRESENTANTEVENTAS;
GRANT SELECT ON MULTINIVEL.CONTACTO TO R_REPRESENTANTEVENTAS;
GRANT SELECT ON MULTINIVEL.TIPOCONTACTO TO R_REPRESENTANTEVENTAS;
GRANT SELECT ON MULTINIVEL.ESTADOVENTA TO R_REPRESENTANTEVENTAS;
GRANT SELECT ON MULTINIVEL.VENTA TO R_REPRESENTANTEVENTAS;
GRANT INSERT ON MULTINIVEL.PERSONA TO R_REPRESENTANTEVENTAS;
GRANT UPDATE ON MULTINIVEL.PERSONA TO R_REPRESENTANTEVENTAS;
GRANT INSERT ON MULTINIVEL.CONTACTO TO R_REPRESENTANTEVENTAS;

/* SECUENCIAS IMPORTANTE DEFINIR PERMISOS DE LAS SECUENCIAS QUE EL RV PUEDE UTILIZAR*/

GRANT SELECT ON MULTINIVEL.SEQ_CONTACTO_IDCONTACTO TO R_REPRESENTANTEVENTAS;


/* GRANT R_REPRESENTANTEVENTAS TO USER_REPRESENTANTEVENTAS */

GRANT R_REPRESENTANTEVENTAS TO s1018485092;
GRANT R_REPRESENTANTEVENTAS TO a1005855865;
GRANT R_REPRESENTANTEVENTAS TO j1016091072;
GRANT R_REPRESENTANTEVENTAS TO p1023944061;
GRANT R_REPRESENTANTEVENTAS TO j1018492522;