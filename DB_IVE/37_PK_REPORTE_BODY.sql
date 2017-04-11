CREATE OR REPLACE PACKAGE BODY "PK_REPORTE" is

/************************************************************************
DESCRIPCION       : Procedimiento para generar informaci?n b?sica del inventario, categorias y contaminantes
REALIZADO POR     : Luis Felipe Rueda Forero
FECHA CREACION    : 23/12/2016

FECHA MODIFICA    : dd/MMM/aaaa
MODIFICADO POR    :
DESCRIPCION CAMBIO:
************************************************************************/


  PROCEDURE Pr_generarreporte (p_codigoinv  IN  VARCHAR2,
                               p_reporte    IN  NUMBER, 
                               p_idUsuario  IN  NUMBER,
                               p_Respuesta  OUT CURSOR_SALIDA,
                               p_codError   OUT NUMBER,
                               p_msjError   OUT VARCHAR2) IS
                                
                               
  codExcepcion         NUMBER;
  NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_generarreporte';
  p_codcateg           NUMBER;
  p_query              VARCHAR2(1000);
  p_reportequery       VARCHAR2(1000);
  
  BEGIN

    pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                       p_paquete       => NOMBRE_PAQUETE,
                                       p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                       p_usuario       => p_idUsuario,
                                       p_descripcion   => 'Entro a Pr_generarreporte');   
  
    BEGIN
  
    SELECT A101CODIGO
    INTO   p_codcateg
    FROM   PART_T101_CATEGORIA
    WHERE  A101NOMBRE = 'QUERYREPORTE';
    
    SELECT A102VALOR  
    INTO   p_query                       
    FROM   PART_T102_LISTA 
    WHERE  A102CATEGORIA = p_codcateg;
    
/*    IF p_reporte = 33 then --info basica contaminantes
    */
       SELECT a102valorcorto 
       INTO   p_reportequery
       FROM   PART_T102_LISTA 
       WHERE  a102codigo = p_reporte;
       
 
    p_query := replace(p_query,'p_reportequery',p_reportequery);
    p_query := replace(p_query,'p_codigoinv',p_codigoinv);
    OPEN p_Respuesta FOR p_query;
     
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_codError := 5;
        p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
        OPEN p_Respuesta FOR SELECT '' FROM dual;
        return;
    END;
    
    p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
    p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);


    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_generarreporte');

  EXCEPTION

    WHEN OTHERS THEN

      ROLLBACK;

      codExcepcion := PK_UTL_UTILIDAD.fn_RegistrarExcepcion(PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                            NOMBRE_PAQUETE,
                                                            NOMBRE_PROCEDIMIENTO,
                                                            SQLCODE,
                                                            SQLERRM);
      OPEN p_Respuesta FOR SELECT '' FROM dual;
      p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
      p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);
      
END Pr_generarreporte;

End PK_REPORTE;