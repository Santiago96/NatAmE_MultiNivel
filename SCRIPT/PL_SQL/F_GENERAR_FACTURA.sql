CREATE OR REPLACE FUNCTION FN_GENERAR_FACTURA 
(
  P_IDVENTA IN NUMBER 
, P_IDCLIENTE IN NUMBER 
, P_IDREPVENTAS IN NUMBER 
) RETURN VARCHAR2 AS 
  
  v_archivo utl_file.file_type;  
  cursor factura(pp_idventa VENTA.IDVENTA%TYPE) IS SELECT * FROM FACTURA WHERE idventa=pp_idventa;
  cursor comprador(pp_idcliente PERSONA.IDPERSONA%TYPE) IS SELECT * FROM PERSONA WHERE idpersona = pp_idcliente;
  cursor vendedor(pp_idrepventas PERSONA.IDPERSONA%TYPE) IS SELECT * FROM PERSONA WHERE idpersona = pp_idrepventas;
  l_total VENTA.TOTAL%TYPE;

BEGIN
  
  v_archivo := utl_file.fopen ('DIR_TMP', P_IDCLIENTE||'_'||P_IDVENTA||'.txt', 'w');
  utl_file.put_line (v_archivo, '');
  utl_file.put_line (v_archivo, '');
  utl_file.put_line (v_archivo, '=====================================================');
  utl_file.put_line (v_archivo, '            NAT_AME MULTINIVEL');
  utl_file.put_line (v_archivo, '            DIR: KRA 7 # 40-65');
  utl_file.put_line (v_archivo, '=====================================================');
  utl_file.put_line (v_archivo, 'Factura de Venta No.' ||P_IDVENTA);
  utl_file.put_line (v_archivo, 'Fecha: ');
  utl_file.put_line (v_archivo, 'Hora: ');
  FOR cliente in comprador(P_IDCLIENTE) LOOP
    utl_file.put_line (v_archivo, 'Cliente: '||cliente.NOMBRE||' '||cliente.APELLIDO );
    utl_file.put_line (v_archivo, 'NIT/CC: '||cliente.IDPERSONA);
  END LOOP;
  
  FOR v in vendedor(P_IDREPVENTAS) LOOP
    utl_file.put_line (v_archivo, 'Vendedor: '||v.NOMBRE||' '||v.APELLIDO);
    utl_file.put_line (v_archivo, '');
  END LOOP;
  
  utl_file.put_line (v_archivo, 'PRODUCTO                              CANT      V.UNIDAD               TOTAL ');
  
  FOR l_factura in factura(P_IDVENTA) LOOP
    l_total := l_factura.TOTAL;    
    utl_file.put_line (v_archivo, l_factura.NOMBREPRODUCTO||'                              '||l_factura.CANTIDAD||'      '||l_factura.PRECIOVENTA||'               '||l_factura.PRECIOTOTAL);
  END LOOP;
  
  
  utl_file.put_line (v_archivo, '');
  utl_file.put_line (v_archivo, '=====================================================');
  utl_file.put_line (v_archivo, '');
  utl_file.put_line (v_archivo, 'SUBTOTAL: '||l_total);
  utl_file.put_line (v_archivo, 'IVA: ');
    
  utl_file.put_line (v_archivo, '');
  utl_file.put_line (v_archivo, '');
  utl_file.put_line (v_archivo, 'TOTAL A PAGAR: ');
  

  utl_file.fclose(v_archivo); 
  
  return 'Factura generada';

END FN_GENERAR_FACTURA;