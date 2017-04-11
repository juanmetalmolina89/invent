create or replace package body PK_T008_METODOEMISION is

PROCEDURE Pr_Insertar (p_A008METODODETEMISION IN  IVET_T008_METODOEMISION.A008METODODETEMISION%TYPE,
                       p_idUsuario IN NUMBER,
                       p_resultado OUT CURSOR_SALIDA,
                       p_codError   OUT NUMBER,
                       p_msjError  OUT VARCHAR2) IS

NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Insertar';
p_A008CODIGO  NUMBER;

BEGIN
      -- obtenemos el siguiente id
      p_A008CODIGO := PK_UTL_UTILIDAD.Fn_Obtenerid('T008_METODOEMISION_SEQ');

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => p_idUsuario,
                                         p_descripcion   => 'Entro a Pr_Insertar ' || p_A008METODODETEMISION);


      INSERT INTO IVET_T008_METODOEMISION(A008CODIGO,
                                          A008METODODETEMISION,
                                          A008ESTADOREGISTRO,
                                          A008FECHACREACION,
                                          A008USUARIOCREACION)
                                  VALUES (p_A008CODIGO,
                                          p_A008METODODETEMISION,
                                          PK_UTL_CONSTANTE.COD_ACTIVO, 
                                          sysdate, 
                                          p_idUsuario);
      
      OPEN p_resultado FOR SELECT p_A008CODIGO A008CODIGO FROM dual;
      p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
      p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Insertar ' || p_A008METODODETEMISION);

  END Pr_Insertar;
  
  PROCEDURE Pr_Eliminar (p_A008CODIGO  IN IVET_T008_METODOEMISION.A008CODIGO%TYPE,
                         p_idUsuario IN NUMBER,
                         p_resultado OUT CURSOR_SALIDA,
                         p_codError OUT NUMBER,
                         p_msjError OUT VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Eliminar';

   BEGIN

    pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                       p_paquete       => NOMBRE_PAQUETE,
                                       p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                       p_usuario       => p_idUsuario,
                                       p_descripcion   => 'Entro a Pr_Eliminar ' || p_A008CODIGO);


              UPDATE IVET_T008_METODOEMISION 
                 SET A008ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_INACTIVO, 
                     A008FECHAMODIFICACION = sysdate,
                     A008USUARIOMODIFICACION = p_idUsuario 
               WHERE A008CODIGO = p_A008CODIGO;
               
              OPEN p_resultado FOR SELECT '' FROM dual;
              p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
              p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Eliminar ' || p_A008CODIGO);

  END Pr_Eliminar;
  
  

  PROCEDURE Pr_Actualizar (p_A008CODIGO IN  IVET_T008_METODOEMISION.A008CODIGO%TYPE,
                         p_A008METODODETEMISION IN  IVET_T008_METODOEMISION.A008METODODETEMISION%TYPE,
                         p_A008FECHAMODIFICACION IN  IVET_T008_METODOEMISION.A008FECHAMODIFICACION%TYPE,
                         p_A008USUARIOMODIFICACION IN  IVET_T008_METODOEMISION.A008USUARIOMODIFICACION%TYPE,
                         p_idUsuario IN NUMBER,
                         p_resultado OUT CURSOR_SALIDA,
                         p_codError  OUT NUMBER,
                         p_msjError  OUT VARCHAR2) IS

    codExcepcion         NUMBER;
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Actualizar';
    estadoReg            VARCHAR2(1);
    numReg               NUMBER;

   BEGIN
    pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                       p_paquete       => NOMBRE_PAQUETE,
                                       p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                       p_usuario       => p_idUsuario,
                                       p_descripcion   => 'Entro a Pr_Actualizar ' || p_A008CODIGO);


      IF p_A008CODIGO IS NULL THEN
         p_codError := 4;
         p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
         OPEN p_resultado FOR SELECT '' FROM dual;
         return;
      END IF;

      SELECT COUNT(*) 
        INTO numReg 
        FROM IVET_T008_METODOEMISION 
       WHERE A008CODIGO = p_A008CODIGO 
         AND A008ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;
      
      IF numReg > 0 THEN
         
         UPDATE IVET_T008_METODOEMISION SET A008METODODETEMISION=NVL(p_A008METODODETEMISION, A008METODODETEMISION),
                                            A008FECHAMODIFICACION = sysdate,
                                            A008USUARIOMODIFICACION = p_idUsuario 
                                      WHERE A008CODIGO = p_A008CODIGO;
                                            
         OPEN p_resultado FOR SELECT p_A008CODIGO A008CODIGO FROM dual;
         p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
         p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
         return;

      ELSE

         p_codError := 5;
         p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
         OPEN p_resultado FOR SELECT '' FROM dual;
         return;
      END IF;

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Actualizar ' || p_A008CODIGO);

  END Pr_Actualizar;



  PROCEDURE Pr_ConsultarPorFiltro (p_Filtro IN VARCHAR2,
                                   p_idUsuario IN NUMBER,
                                   p_resultado OUT CURSOR_SALIDA,
                                   p_codError OUT NUMBER,
                                   p_msjError OUT VARCHAR2) IS

    codExcepcion         NUMBER;
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ConsultarPorFiltro';
    estadoReg            VARCHAR2(1);
    strSQL               VARCHAR2(255);
    strSQL2              VARCHAR2(500);

   BEGIN

    pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                       p_paquete       => NOMBRE_PAQUETE,
                                       p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                       p_usuario       => p_idUsuario,
                                       p_descripcion   => 'Entro a Pr_ConsultarPorFiltro ' || p_Filtro);

      IF p_Filtro IS NULL THEN  --Si filtro es nulo hace select a la tabla
         
         OPEN p_resultado FOR 
         SELECT * 
           FROM IVET_T008_METODOEMISION
          WHERE A008ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;

          p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
          p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
          return;
       END IF;

             strSQL := 'SELECT * FROM IVET_T008_METODOEMISION WHERE ' || p_Filtro ||' AND A008ESTADOREGISTRO ='''|| PK_UTL_CONSTANTE.COD_ACTIVO;
             OPEN p_resultado FOR strSQL;
             
             p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
             p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_ConsultarPorFiltro ' || p_Filtro);

  END Pr_ConsultarPorFiltro;

end PK_T008_METODOEMISION;