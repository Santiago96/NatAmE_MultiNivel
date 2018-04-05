/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 12.0 		*/
/*  Created On : 04-abr.-2018 5:59:51 p. m. 				*/
/*  DBMS       : Oracle 						*/
/* ---------------------------------------------------- */

/* Create Tables */

CREATE TABLE "VENTA"
(
	"IDVENTA" NUMBER(4) NOT NULL,
	"FECHAVENTA" DATE NOT NULL,
	"TOTAL" NUMBER(17,3) NOT NULL,
	"IDREPRESENTANTE" NUMBER(15) NOT NULL,
	"IDCLIENTE" NUMBER(15) NOT NULL,
	"IDESTADOVENTA" NUMBER(1) NOT NULL
)
;

CREATE TABLE "TIPOREPRESENTANTEVENTAS"
(
	"IDTIPOREPRESENTANTE" NUMBER(1) NOT NULL,
	"NOMBRETIPOREPRESENTANTE" VARCHAR(25) NOT NULL,
	"PORCENTAJE" NUMBER(3,2) NOT NULL
)
;

CREATE TABLE "TIPOCONTACTO"
(
	"IDTIPOCONTACTO" NUMBER(2) NOT NULL,
	"NOMBRETIPOCONTACTO" VARCHAR(25) NOT NULL
)
;

CREATE TABLE "TARJETA"
(
	"IDTARJETA" NUMBER(2) NOT NULL,
	"NOMBRETARJETA" VARCHAR(25) NOT NULL
)
;

CREATE TABLE "SUBCATEGORIA"
(
	"IDSUBCATEGORIA" NUMBER(3) NOT NULL,
	"NOMBRESUBCATEGORIA" VARCHAR(100) NOT NULL,
	"IDCATEGORIA" NUMBER(2) NOT NULL
)
;

CREATE TABLE "STOCK"
(
	"IDSTOCK" NUMBER(2) NOT NULL,
	"IDPAIS" NUMBER(2) NOT NULL,
	"IDREGION" NUMBER(2) NOT NULL,
	"DIRECCIONSTOCK" VARCHAR(200) NOT NULL
)
;

CREATE TABLE "REGION"
(
	"IDREGION" NUMBER(2) NOT NULL,
	"IDPAIS" NUMBER(2) NOT NULL,
	"NOMBREREGION" VARCHAR(25) NOT NULL
)
;

CREATE TABLE "PRODUCTO"
(
	"IDPRODUCTO" NUMBER(4) NOT NULL,
	"NOMBREPRODUCTO" VARCHAR(100) NOT NULL,
	"DESCRIPCION" VARCHAR(250) NOT NULL,
	"IDSUBCATEGORIA" NUMBER(3) NULL,
	"IDCATEGORIA" NUMBER(2) NOT NULL,
	"PATH" VARCHAR2(4000) NOT NULL
)
;

CREATE TABLE "PERSONA"
(
	"IDPERSONA" NUMBER(15) NOT NULL,
	"NOMBRE" VARCHAR(50) NOT NULL,
	"APELLIDO" VARCHAR(50) NOT NULL,
	"GENERO" VARCHAR(1) NOT NULL,
	"IDCIUDAD" NUMBER(2) NOT NULL,
	"IDPAIS" NUMBER(2) NOT NULL,
	"IDREGION" NUMBER(2) NOT NULL,
	"IDREPRESENTANTECLIENTE" NUMBER(15) NULL,
	"IDCARGO" NUMBER(1) NULL,
	"IDTIPOREPRESENTANTE" NUMBER(1) NULL,
	"ULTIMACONEXION" DATE NULL
)
;

CREATE TABLE "PAIS"
(
	"IDPAIS" NUMBER(2) NOT NULL,
	"NOMBREPAIS" VARCHAR(25) NULL
)
;

CREATE TABLE "ITEM"
(
	"IDITEM" NUMBER(4) NOT NULL,
	"IDSTOCK" NUMBER(2) NOT NULL,
	"IDPAIS" NUMBER(2) NULL,
	"IDREGION" NUMBER(2) NULL,
	"IDPRODUCTO" NUMBER(4) NOT NULL,
	"CANTIDAD" NUMBER(4) NOT NULL,
	"PRECIOVENTA" NUMBER(10,3) NOT NULL
)
;

CREATE TABLE "ESTADOVENTA"
(
	"IDESTADOVENTA" NUMBER(1) NOT NULL,
	"NOMBREESTADOVENTA" VARCHAR(15) NOT NULL
)
;

CREATE TABLE "DETALLEVENTA"
(
	"IDDETALLEVENTA" NUMBER(7) NOT NULL,
	"IDPRODUCTO" NUMBER(4) NOT NULL,
	"IDVENTA" NUMBER(4) NOT NULL,
	"CANTIDAD" NUMBER(3) NOT NULL,
	"PRECIOTOTAL" NUMBER(17,3) NOT NULL
)
;

CREATE TABLE "DETALLEPAGO"
(
	"IDDETALLEPAGO" NUMBER(4) NOT NULL,
	"NUMEROTARJETA" NUMBER(16) NULL,
	"CVV" NUMBER(3) NULL,
	"TIPODEPAGO" VARCHAR(15) NOT NULL,
	"IDVENTA" NUMBER(4) NOT NULL,
	"IDTARJETA" NUMBER(2) NULL,
	"IDBANCO" NUMBER(2) NULL,
	"FECHADEVENCIMIENTO" DATE NULL
)
;

CREATE TABLE "CONTACTO"
(
	"IDCONTACTO" NUMBER(15) NOT NULL,
	"IDTIPOCONTACTO" NUMBER(2) NOT NULL,
	"IDPERSONA" NUMBER(15) NULL,
	"DETALLECONTACTO" VARCHAR(150) NOT NULL
)
;

CREATE TABLE "CIUDAD"
(
	"IDCIUDAD" NUMBER(2) NOT NULL,
	"IDPAIS" NUMBER(2) NOT NULL,
	"IDREGION" NUMBER(2) NOT NULL,
	"NOMBRECIUDAD" VARCHAR(25) NOT NULL
)
;

CREATE TABLE "CATEGORIA"
(
	"IDCATEGORIA" NUMBER(2) NOT NULL,
	"NOMBRECATEGORIA" VARCHAR(100) NOT NULL
)
;

CREATE TABLE "CARGO"
(
	"IDCARGO" NUMBER(1) NOT NULL,
	"DETALLECARGO" VARCHAR(25) NOT NULL
)
;

CREATE TABLE "CALIFICACION"
(
	"IDCALIFICACION" NUMBER(4) NOT NULL,
	"IDCLIENTE" NUMBER(15) NOT NULL,
	"IDREPRESENTATE" NUMBER(15) NOT NULL,
	"PUNTAJECALIFICACION" NUMBER(1) NOT NULL,
	"COMENTARIO" VARCHAR(225) NULL
)
;

CREATE TABLE "BANCO"
(
	"IDBANCO" NUMBER(2) NOT NULL,
	"NOMBREBANCO" VARCHAR(25) NOT NULL
)
;

/* Create Comments, Sequences and Triggers for Autonumber Columns */

CREATE SEQUENCE "SEQ_VENTA_IDVENTA" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

/* CREATE SEQUENCE "SEQ_TIPOREPRESENTANTEVENTAS_IDTIPOREPRESENTANTE" */

CREATE SEQUENCE "SEQ_TIPOREPRESENTANTEVENTAS_ID" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;





/* CREATE SEQUENCE "SEQ_TIPOCONTACTO_IDTIPOCONTACTO" */
CREATE SEQUENCE "SEQ_TIPOCONTACTO_ID" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;


CREATE SEQUENCE "SEQ_TARJETA_IDTARJETA" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;


/* CREATE SEQUENCE "SEQ_SUBCATEGORIA_IDSUBCATEGORIA" */
CREATE SEQUENCE "SEQ_SUBCATEGORIA_ID"  
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;


CREATE SEQUENCE "SEQ_STOCK_IDSTOCK" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;


CREATE SEQUENCE "SEQ_REGION_IDREGION" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;


CREATE SEQUENCE "SEQ_PRODUCTO_IDPRODUCTO" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;


CREATE SEQUENCE "SEQ_PAIS_IDPAIS" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;


CREATE SEQUENCE "SEQ_ITEM_IDITEM" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;


CREATE SEQUENCE "SEQ_ESTADOVENTA_IDESTADOVENTA" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;


/* CREATE SEQUENCE "SEQ_DETALLEVENTA_IDDETALLEVENTA" */
CREATE SEQUENCE "SEQ_DETALLEVENTA_ID" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

CREATE SEQUENCE "SEQ_DETALLEPAGO_IDDETALLEPAGO" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;


CREATE SEQUENCE "SEQ_CONTACTO_IDCONTACTO" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;


CREATE SEQUENCE "SEQ_CIUDAD_IDCIUDAD" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;


CREATE SEQUENCE "SEQ_CATEGORIA_IDCATEGORIA" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;


CREATE SEQUENCE "SEQ_CARGO_IDCARGO" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;


CREATE SEQUENCE "SEQ_BANCO_IDBANCO" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;

/* Create Primary Keys, Indexes, Uniques, Checks, Triggers */

ALTER TABLE "VENTA" 
 ADD CONSTRAINT "PK_VENTA"
	PRIMARY KEY ("IDVENTA") USING INDEX
;

ALTER TABLE "VENTA" 
 ADD CONSTRAINT "CK_TOTAL" CHECK (TOTAL>0)
;

ALTER TABLE "TIPOREPRESENTANTEVENTAS" 
 ADD CONSTRAINT "PK_TIPOREPRESEN_01"
	PRIMARY KEY ("IDTIPOREPRESENTANTE") USING INDEX
;

ALTER TABLE "TIPOREPRESENTANTEVENTAS" 
 ADD CONSTRAINT "CK_PORCENTAJE" CHECK (PORCENTAJE>0 AND PORCENTAJE<=1)
;

ALTER TABLE "TIPOCONTACTO" 
 ADD CONSTRAINT "PK_TIPOCONTACTO"
	PRIMARY KEY ("IDTIPOCONTACTO") USING INDEX
;

ALTER TABLE "TARJETA" 
 ADD CONSTRAINT "PK_TARJETA"
	PRIMARY KEY ("IDTARJETA") USING INDEX
;

ALTER TABLE "SUBCATEGORIA" 
 ADD CONSTRAINT "PK_SUBCATEGORIA"
	PRIMARY KEY ("IDSUBCATEGORIA") USING INDEX
;

ALTER TABLE "STOCK" 
 ADD CONSTRAINT "PK_STOCK"
	PRIMARY KEY ("IDSTOCK","IDPAIS","IDREGION") USING INDEX
;

ALTER TABLE "STOCK" 
 ADD CONSTRAINT "UK_STOCK" UNIQUE ("IDPAIS","IDREGION") USING INDEX
;

ALTER TABLE "REGION" 
 ADD CONSTRAINT "PK_REGION"
	PRIMARY KEY ("IDREGION","IDPAIS") USING INDEX
;

ALTER TABLE "PRODUCTO" 
 ADD CONSTRAINT "PK_PRODUCTO"
	PRIMARY KEY ("IDPRODUCTO") USING INDEX
;

ALTER TABLE "PERSONA" 
 ADD CONSTRAINT "PK_PERSONA"
	PRIMARY KEY ("IDPERSONA") USING INDEX
;

ALTER TABLE "PERSONA" 
 ADD CONSTRAINT "CK_GENERO" CHECK (GENERO IN ('F','M'))
;

ALTER TABLE "PERSONA" 
 ADD CONSTRAINT "CK_IDPERSONA" CHECK (IDPERSONA>0)
;

ALTER TABLE "PAIS" 
 ADD CONSTRAINT "PK_PAIS "
	PRIMARY KEY ("IDPAIS") USING INDEX
;

ALTER TABLE "ITEM" 
 ADD CONSTRAINT "PK_ITEM"
	PRIMARY KEY ("IDITEM") USING INDEX
;

ALTER TABLE "ITEM" 
 ADD CONSTRAINT "CK_CANTIDADITEM" CHECK (CANTIDAD>=0)
;

ALTER TABLE "ITEM" 
 ADD CONSTRAINT "CK_PRECIOVENTA" CHECK (PRECIOVENTA>0)
;

ALTER TABLE "ESTADOVENTA" 
 ADD CONSTRAINT "PK_ESTADOVENTA"
	PRIMARY KEY ("IDESTADOVENTA") USING INDEX
;

ALTER TABLE "DETALLEVENTA" 
 ADD CONSTRAINT "PK_DETALLEVENTA"
	PRIMARY KEY ("IDDETALLEVENTA") USING INDEX
;

ALTER TABLE "DETALLEVENTA" 
 ADD CONSTRAINT "CK_CANTIDADDETALLEVENTA" CHECK (CANTIDAD>0)
;

ALTER TABLE "DETALLEVENTA" 
 ADD CONSTRAINT "CK_PRECIOTOTAL" CHECK (PRECIOTOTAL>0)
;

ALTER TABLE "DETALLEPAGO" 
 ADD CONSTRAINT "PK_DETALLEPAGO"
	PRIMARY KEY ("IDDETALLEPAGO") USING INDEX
;

ALTER TABLE "DETALLEPAGO" 
 ADD CONSTRAINT "CK_CVV" CHECK (CVV>0)
;

ALTER TABLE "DETALLEPAGO" 
 ADD CONSTRAINT "CK_NUMEROTARJETA" CHECK (NUMEROTARJETA>0)
;

ALTER TABLE "CONTACTO" 
 ADD CONSTRAINT "PK_CONTACTO "
	PRIMARY KEY ("IDCONTACTO") USING INDEX
;

ALTER TABLE "CIUDAD" 
 ADD CONSTRAINT "PK_CIUDAD"
	PRIMARY KEY ("IDCIUDAD","IDPAIS","IDREGION") USING INDEX
;

ALTER TABLE "CATEGORIA" 
 ADD CONSTRAINT "PK_CATEGORIA"
	PRIMARY KEY ("IDCATEGORIA") USING INDEX
;

ALTER TABLE "CARGO" 
 ADD CONSTRAINT "PK_CARGO"
	PRIMARY KEY ("IDCARGO") USING INDEX
;

ALTER TABLE "CALIFICACION" 
 ADD CONSTRAINT "PK_CALIFICACION"
	PRIMARY KEY ("IDCALIFICACION") USING INDEX
;

ALTER TABLE "CALIFICACION" 
 ADD CONSTRAINT "CK_PUNTAJECALIFICACION" CHECK (PUNTAJECALIFICACION>= 1 AND PUNTAJECALIFICACION<=5)
;

ALTER TABLE "BANCO" 
 ADD CONSTRAINT "PK_BANCO"
	PRIMARY KEY ("IDBANCO") USING INDEX
;

/* Create Foreign Key Constraints */

ALTER TABLE "VENTA" 
 ADD CONSTRAINT "FK_VENTA_ESTADOVENTA"
	FOREIGN KEY ("IDESTADOVENTA") REFERENCES "ESTADOVENTA" ("IDESTADOVENTA")
;

ALTER TABLE "VENTA" 
 ADD CONSTRAINT "FK_VENTA_PERSONA"
	FOREIGN KEY ("IDREPRESENTANTE") REFERENCES "PERSONA" ("IDPERSONA")
;

ALTER TABLE "VENTA" 
 ADD CONSTRAINT "FK_VENTA_PERSONA02"
	FOREIGN KEY ("IDCLIENTE") REFERENCES "PERSONA" ("IDPERSONA")
;

ALTER TABLE "SUBCATEGORIA" 
 ADD CONSTRAINT "FK_SUBCATEGORIA_CATEGORIA"
	FOREIGN KEY ("IDCATEGORIA") REFERENCES "CATEGORIA" ("IDCATEGORIA")
;

ALTER TABLE "REGION" 
 ADD CONSTRAINT "FK_REGION_PAIS "
	FOREIGN KEY ("IDPAIS") REFERENCES "PAIS" ("IDPAIS")
;

ALTER TABLE "PRODUCTO" 
 ADD CONSTRAINT "FK_PRODUCTO_CATEGORIA"
	FOREIGN KEY ("IDCATEGORIA") REFERENCES "CATEGORIA" ("IDCATEGORIA")
;

ALTER TABLE "PRODUCTO" 
 ADD CONSTRAINT "FK_PRODUCTO_SUBCATEGORIA"
	FOREIGN KEY ("IDSUBCATEGORIA") REFERENCES "SUBCATEGORIA" ("IDSUBCATEGORIA")
;

ALTER TABLE "PERSONA" 
 ADD CONSTRAINT "FK_PERSONA_CARGO"
	FOREIGN KEY ("IDCARGO") REFERENCES "CARGO" ("IDCARGO")
;

ALTER TABLE "PERSONA" 
 ADD CONSTRAINT "FK_PERSONA_CIUDAD"
	FOREIGN KEY ("IDCIUDAD","IDPAIS","IDREGION") REFERENCES "CIUDAD" ("IDCIUDAD","IDPAIS","IDREGION")
;

ALTER TABLE "PERSONA" 
 ADD CONSTRAINT "FK_PERSONA_PERSONA"
	FOREIGN KEY ("IDREPRESENTANTECLIENTE") REFERENCES "PERSONA" ("IDPERSONA")
;

ALTER TABLE "PERSONA" 
 ADD CONSTRAINT "FK_PERSONA_TIPOREPRESENTANT_01"
	FOREIGN KEY ("IDTIPOREPRESENTANTE") REFERENCES "TIPOREPRESENTANTEVENTAS" ("IDTIPOREPRESENTANTE")
;

ALTER TABLE "ITEM" 
 ADD CONSTRAINT "FK_ITEM_PRODUCTO"
	FOREIGN KEY ("IDPRODUCTO") REFERENCES "PRODUCTO" ("IDPRODUCTO")
;

ALTER TABLE "ITEM" 
 ADD CONSTRAINT "FK_ITEM_STOCK"
	FOREIGN KEY ("IDSTOCK","IDPAIS","IDREGION") REFERENCES "STOCK" ("IDSTOCK","IDPAIS","IDREGION")
;

ALTER TABLE "DETALLEVENTA" 
 ADD CONSTRAINT "FK_DETALLEVENTA_PRODUCTO"
	FOREIGN KEY ("IDPRODUCTO") REFERENCES "PRODUCTO" ("IDPRODUCTO")
;

ALTER TABLE "DETALLEVENTA" 
 ADD CONSTRAINT "FK_DETALLEVENTA_VENTA"
	FOREIGN KEY ("IDVENTA") REFERENCES "VENTA" ("IDVENTA")
;

ALTER TABLE "DETALLEPAGO" 
 ADD CONSTRAINT "FK_DETALLEPAGO_BANCO"
	FOREIGN KEY ("IDBANCO") REFERENCES "BANCO" ("IDBANCO")
;

ALTER TABLE "DETALLEPAGO" 
 ADD CONSTRAINT "FK_DETALLEPAGO_TARJETA02"
	FOREIGN KEY ("IDTARJETA") REFERENCES "TARJETA" ("IDTARJETA")
;

ALTER TABLE "DETALLEPAGO" 
 ADD CONSTRAINT "FK_DETALLEPAGO_VENTA"
	FOREIGN KEY ("IDVENTA") REFERENCES "VENTA" ("IDVENTA")
;

ALTER TABLE "CONTACTO" 
 ADD CONSTRAINT "FK_CONTACTO _PERSONA"
	FOREIGN KEY ("IDPERSONA") REFERENCES "PERSONA" ("IDPERSONA")
;

ALTER TABLE "CONTACTO" 
 ADD CONSTRAINT "FK_CONTACTO _TIPOCONTACTO"
	FOREIGN KEY ("IDTIPOCONTACTO") REFERENCES "TIPOCONTACTO" ("IDTIPOCONTACTO")
;

ALTER TABLE "CIUDAD" 
 ADD CONSTRAINT "FK_CIUDAD_REGION"
	FOREIGN KEY ("IDREGION","IDPAIS") REFERENCES "REGION" ("IDREGION","IDPAIS")
;

ALTER TABLE "CALIFICACION" 
 ADD CONSTRAINT "FK_CALIFICACION_PERSONA"
	FOREIGN KEY ("IDCLIENTE") REFERENCES "PERSONA" ("IDPERSONA")
;

ALTER TABLE "CALIFICACION" 
 ADD CONSTRAINT "FK_CALIFICACION_PERSONA02"
	FOREIGN KEY ("IDREPRESENTATE") REFERENCES "PERSONA" ("IDPERSONA")
;

