
/* Role para Multinivel */

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
GRANT INSERT ON MULTINIVEL.CONTACTO TO R_REPRESENTANTEVENTAS;