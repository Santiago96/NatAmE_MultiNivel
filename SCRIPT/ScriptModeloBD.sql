CREATE TABLE "VENTA"
(
	"IDVENTA" NUMBER(4) NOT NULL,
	"FECHAVENTA" DATE NOT NULL,
	"TOTAL" NUMBER(17,3) NOT NULL,
	"IDCLIENTE" NUMBER(15) NOT NULL,
	"ESTADOVENTA" VARCHAR(20) NOT NULL
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

CREATE TABLE "REPRESENTANTEVENTAS"
(
	"IDREPRESENTANTEVENTAS" NUMBER(15) NOT NULL,
	"DIRECTOR" NUMBER(1) NULL,
	"IDTIPOREPRESENTANTE" NUMBER(1) NULL
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
	"IDCATEGORIA" NUMBER(2) NOT NULL,
	"PATH" VARCHAR2(4000) NOT NULL
)
;

CREATE TABLE "PERSONA"
(
	"IDPERSONA" NUMBER(15) NOT NULL,
	"NOMBRE" VARCHAR2(50) NOT NULL,
	"APELLIDO" VARCHAR2(50) NOT NULL,
	"GENERO" VARCHAR(1) NOT NULL,
	"IDCIUDAD" NUMBER(2) NOT NULL,
	"IDPAIS" NUMBER(2) NOT NULL,
	"IDREGION" NUMBER(2) NOT NULL,
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
	"IDPRODUCTO" NUMBER(4) NOT NULL,
	"CANTIDAD" NUMBER(4) NOT NULL,
	"PRECIOVENTA" NUMBER(10,3) NOT NULL,
	"IDREGION" NUMBER(2) NULL,
	"IDPAIS" NUMBER(2) NULL
)
;

CREATE TABLE "HISTORICOTIPOREP"
(
	"IDHISTORICOTIPOREP" NUMBER(3) NOT NULL,
	"IDREPRESENTANTEVENTAS" NUMBER(15) NOT NULL,
	"IDTIPOREPRESENTANTE" NUMBER(1) NOT NULL,
	"FECHACAMBIO" DATE NOT NULL
)
;

CREATE TABLE "HISTORICOCRV"
(
	"IDHISTORICOCRV" NUMBER(4) NOT NULL,
	"IDCLIENTE" NUMBER(15) NOT NULL,
	"IDREPRESENTANTEVENTAS" NUMBER(15) NOT NULL,
	"FECHAINICIO" DATE NOT NULL,
	"FECHAFIN" DATE NULL
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
	"DETALLECONTACTO" VARCHAR(150) NOT NULL,
	"IDPERSONA" NUMBER(15) NOT NULL
)
;

CREATE TABLE "CLIENTE"
(
	"IDCLIENTE" NUMBER(15) NOT NULL
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
	"NOMBRECATEGORIA" VARCHAR(100) NOT NULL,
	"IDCATEGORIAPADRE" NUMBER(2) NULL
)
;

CREATE TABLE "CALIFICACIONVENTA"
(
	"IDCALIFICACIONVENTA" NUMBER(4) NOT NULL,
	"CALIFICACION" NUMBER(1) NOT NULL,
	"DETALLECALIFICACION" VARCHAR(250) NULL,
	"IDVENTA" NUMBER(4) NOT NULL,
	"FECHA" DATE NULL
)
;

CREATE TABLE "BANCO"
(
	"IDBANCO" NUMBER(2) NOT NULL,
	"NOMBREBANCO" VARCHAR(25) NOT NULL
)
;



CREATE SEQUENCE "SEQ_VENTA_IDVENTA" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;


CREATE SEQUENCE "SEQ_TIPOREPRESENTANTEVENTAS_ID" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;


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


CREATE SEQUENCE "SEQ_HISTORICOTIPOREP_ID" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;


CREATE SEQUENCE "SEQ_HISTORICOCRV_ID" 
	INCREMENT BY 1 
	START WITH 1 
	NOMAXVALUE 
	MINVALUE  1 
	NOCYCLE 
	NOCACHE 
	NOORDER
;


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


CREATE SEQUENCE "SEQ_CALIFICACIONVENTA_ID"  
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



ALTER TABLE "VENTA" 
 ADD CONSTRAINT "PK_VENTA"
	PRIMARY KEY ("IDVENTA") USING INDEX
;

ALTER TABLE "VENTA" 
 ADD CONSTRAINT "CK_TOTAL" CHECK (TOTAL>0)
;

ALTER TABLE "VENTA" 
 ADD CONSTRAINT "CK_ESTADOVENTA" CHECK (ESTADOVENTA IN ('PENDIENTE', 'OK', 'NO AUTORIZADO', 'FALLIDO'))
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

ALTER TABLE "REPRESENTANTEVENTAS" 
 ADD CONSTRAINT "PK_REPRESENTANT_01"
	PRIMARY KEY ("IDREPRESENTANTEVENTAS") USING INDEX
;

ALTER TABLE "REPRESENTANTEVENTAS" 
 ADD CONSTRAINT "CK_DIRECTOR" CHECK (DIRECTOR IN (0,1))
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
 ADD CONSTRAINT "CK_PRECIOVENTA" CHECK (PRECIOVENTA>=0)
;

ALTER TABLE "HISTORICOTIPOREP" 
 ADD CONSTRAINT "PK_HISTORICOTIP_01"
	PRIMARY KEY ("IDHISTORICOTIPOREP") USING INDEX
;

ALTER TABLE "HISTORICOCRV" 
 ADD CONSTRAINT "PK_HISTORICOCRV"
	PRIMARY KEY ("IDHISTORICOCRV") USING INDEX
;

ALTER TABLE "HISTORICOCRV" 
 ADD CONSTRAINT "UK_HISTORICO" UNIQUE ("IDCLIENTE","IDREPRESENTANTEVENTAS","FECHAINICIO","FECHAFIN") USING INDEX
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

ALTER TABLE "DETALLEPAGO" 
 ADD CONSTRAINT "CK_TIPODEPAGO" CHECK (TIPODEPAGO IN ('PSE','TARJETA CREDITO'))
;

ALTER TABLE "CONTACTO" 
 ADD CONSTRAINT "PK_CONTACTO "
	PRIMARY KEY ("IDCONTACTO") USING INDEX
;

ALTER TABLE "CLIENTE" 
 ADD CONSTRAINT "PK_CLIENTE"
	PRIMARY KEY ("IDCLIENTE") USING INDEX
;

ALTER TABLE "CIUDAD" 
 ADD CONSTRAINT "PK_CIUDAD"
	PRIMARY KEY ("IDCIUDAD","IDPAIS","IDREGION") USING INDEX
;

ALTER TABLE "CATEGORIA" 
 ADD CONSTRAINT "PK_CATEGORIA"
	PRIMARY KEY ("IDCATEGORIA") USING INDEX
;

ALTER TABLE "CALIFICACIONVENTA" 
 ADD CONSTRAINT "PK_CALIFICACION_01"
	PRIMARY KEY ("IDCALIFICACIONVENTA") USING INDEX
;

ALTER TABLE "CALIFICACIONVENTA" 
 ADD CONSTRAINT "CK_CALIFICACION" CHECK (CALIFICACION>=1 AND CALIFICACION<=5)
;

ALTER TABLE "BANCO" 
 ADD CONSTRAINT "PK_BANCO"
	PRIMARY KEY ("IDBANCO") USING INDEX
;



ALTER TABLE "VENTA" 
 ADD CONSTRAINT "FK_VENTA_CLIENTE"
	FOREIGN KEY ("IDCLIENTE") REFERENCES "CLIENTE" ("IDCLIENTE")
;

ALTER TABLE "REPRESENTANTEVENTAS" 
 ADD CONSTRAINT "FK_REPRESENTANTEVENTAS_PERSONA"
	FOREIGN KEY ("IDREPRESENTANTEVENTAS") REFERENCES "PERSONA" ("IDPERSONA")
;

ALTER TABLE "REGION" 
 ADD CONSTRAINT "FK_REGION_PAIS "
	FOREIGN KEY ("IDPAIS") REFERENCES "PAIS" ("IDPAIS")
;

ALTER TABLE "PRODUCTO" 
 ADD CONSTRAINT "FK_PRODUCTO_CATEGORIA"
	FOREIGN KEY ("IDCATEGORIA") REFERENCES "CATEGORIA" ("IDCATEGORIA")
;

ALTER TABLE "PERSONA" 
 ADD CONSTRAINT "FK_PERSONA_CIUDAD"
	FOREIGN KEY ("IDCIUDAD","IDPAIS","IDREGION") REFERENCES "CIUDAD" ("IDCIUDAD","IDPAIS","IDREGION")
;

ALTER TABLE "ITEM" 
 ADD CONSTRAINT "FK_ITEM_PRODUCTO"
	FOREIGN KEY ("IDPRODUCTO") REFERENCES "PRODUCTO" ("IDPRODUCTO")
;

ALTER TABLE "ITEM" 
 ADD CONSTRAINT "FK_ITEM_REGION"
	FOREIGN KEY ("IDREGION","IDPAIS") REFERENCES "REGION" ("IDREGION","IDPAIS")
;

ALTER TABLE "HISTORICOTIPOREP" 
 ADD CONSTRAINT "FK_HISTORICOTIP_REPRESENTAN_01"
	FOREIGN KEY ("IDREPRESENTANTEVENTAS") REFERENCES "REPRESENTANTEVENTAS" ("IDREPRESENTANTEVENTAS")
;

ALTER TABLE "HISTORICOTIPOREP" 
 ADD CONSTRAINT "FK_HISTORICOTIP_TIPOREPRESE_01"
	FOREIGN KEY ("IDTIPOREPRESENTANTE") REFERENCES "TIPOREPRESENTANTEVENTAS" ("IDTIPOREPRESENTANTE")
;

ALTER TABLE "HISTORICOCRV" 
 ADD CONSTRAINT "FK_HISTORICOCRV_CLIENTE"
	FOREIGN KEY ("IDCLIENTE") REFERENCES "CLIENTE" ("IDCLIENTE")
;

ALTER TABLE "HISTORICOCRV" 
 ADD CONSTRAINT "FK_HISTORICOCRV_REPRESENTAN_01"
	FOREIGN KEY ("IDREPRESENTANTEVENTAS") REFERENCES "REPRESENTANTEVENTAS" ("IDREPRESENTANTEVENTAS")
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
 ADD CONSTRAINT "FK_DETALLEPAGO_TARJETA"
	FOREIGN KEY ("IDTARJETA") REFERENCES "TARJETA" ("IDTARJETA")
;

ALTER TABLE "DETALLEPAGO" 
 ADD CONSTRAINT "FK_DETALLEPAGO_VENTA"
	FOREIGN KEY ("IDVENTA") REFERENCES "VENTA" ("IDVENTA")
;

ALTER TABLE "CONTACTO" 
 ADD CONSTRAINT "FK_CONTACTO _TIPOCONTACTO"
	FOREIGN KEY ("IDTIPOCONTACTO") REFERENCES "TIPOCONTACTO" ("IDTIPOCONTACTO")
;

ALTER TABLE "CONTACTO" 
 ADD CONSTRAINT "FK_CONTACTO_PERSONA"
	FOREIGN KEY ("IDPERSONA") REFERENCES "PERSONA" ("IDPERSONA")
;

ALTER TABLE "CLIENTE" 
 ADD CONSTRAINT "FK_CLIENTE_PERSONA"
	FOREIGN KEY ("IDCLIENTE") REFERENCES "PERSONA" ("IDPERSONA")
;

ALTER TABLE "CIUDAD" 
 ADD CONSTRAINT "FK_CIUDAD_REGION"
	FOREIGN KEY ("IDREGION","IDPAIS") REFERENCES "REGION" ("IDREGION","IDPAIS")
;

ALTER TABLE "CATEGORIA" 
 ADD CONSTRAINT "FK_CATEGORIA_CATEGORIA"
	FOREIGN KEY ("IDCATEGORIAPADRE") REFERENCES "CATEGORIA" ("IDCATEGORIA")
;

ALTER TABLE "CALIFICACIONVENTA" 
 ADD CONSTRAINT "FK_CALIFICACIONVENTA_VENTA"
	FOREIGN KEY ("IDVENTA") REFERENCES "VENTA" ("IDVENTA")
;
