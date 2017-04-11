create or replace package body PK_T006_FUENTE is



PROCEDURE Pr_Insertar (p_A006FUENTE IN  IVET_T006_FUENTE.A006FUENTE%TYPE,
                       p_idUsuario IN NUMBER,
                       p_resultado OUT CURSOR_SALIDA,
                       p_codError   OUT NUMBER,
                       p_msjError  OUT VARCHAR2) IS

NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Insertar';
p_A006CODIGO  NUMBER;

BEGIN
      -- obtenemos el siguiente id
      p_A006CODIGO := PK_UTL_UTILIDAD.Fn_Obtenerid('T006_FUENTE_SEQ');

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => p_idUsuario,
                                         p_descripcion   => 'Entro a Pr_Insertar ' || p_A006FUENTE);

      INSERT INTO IVET_T006_FUENTE(A006CODIGO,
                                   A006FUENTE,
                                   A006ESTADOREGISTRO,
                                   A006FECHACREACION,
                                   A006USUARIOCREACION)
                           VALUES (p_A006CODIGO,
                                   p_A006FUENTE, 
                                   PK_UTL_CONSTANTE.COD_ACTIVO, 
                                   sysdate, 
                                   p_idUsuario);
                                   
      OPEN p_resultado FOR SELECT p_A006CODIGO A006CODIGO FROM dual;
      p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
      p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Insertar ' || p_A006FUENTE);

  END Pr_Insertar;
  
  PROCEDURE Pr_Eliminar (p_A006CODIGO  IN IVET_T006_FUENTE.A006CODIGO%TYPE,
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
                                       p_descripcion   => 'Entro a Pr_Eliminar ' || p_A006CODIGO);

              UPDATE IVET_T006_FUENTE 
                 SET A006ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_INACTIVO, 
                     A006FECHAMODIFICACION = sysdate,
                     A006USUARIOMODIFICACION = p_idUsuario 
               WHERE A006CODIGO = p_A006CODIGO;
              
              OPEN p_resultado FOR SELECT '' FROM dual;
              p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
              p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Eliminar ' || p_A006CODIGO);

  END Pr_Eliminar;

  PROCEDURE Pr_Actualizar (p_A006CODIGO IN  IVET_T006_FUENTE.A006CODIGO%TYPE,
                           p_A006FUENTE IN  IVET_T006_FUENTE.A006FUENTE%TYPE,
                           p_idUsuario IN NUMBER,
                           p_resultado OUT CURSOR_SALIDA,
                           p_codError OUT NUMBER,
                           p_msjError OUT VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Actualizar';
    numReg               NUMBER;

   BEGIN
   
    pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                       p_paquete       => NOMBRE_PAQUETE,
                                       p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                       p_usuario       => p_idUsuario,
                                       p_descripcion   => 'Entro a Pr_Actualizar ' || p_A006CODIGO);

      IF p_A006CODIGO IS NULL THEN
         p_codError := 4;
         p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
         OPEN p_resultado FOR SELECT '' FROM dual;
         return;
      END IF;

      SELECT COUNT(*) 
        INTO numReg 
        FROM IVET_T006_FUENTE 
       WHERE A006CODIGO = p_A006CODIGO 
         AND A006ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;
         
      IF numReg > 0 THEN
         
         UPDATE IVET_T006_FUENTE SET A006FUENTE=NVL(p_A006FUENTE, A006FUENTE),
                                     A006FECHAMODIFICACION = sysdate,
                                     A006USUARIOMODIFICACION = p_idUsuario 
                               WHERE A006CODIGO = p_A006CODIGO;

         OPEN p_resultado FOR SELECT p_A006CODIGO A006CODIGO FROM dual;
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
                                      p_descripcion   => 'Salio de Pr_Actualizar ' || p_A006CODIGO);

  END Pr_Actualizar;



  PROCEDURE Pr_ConsultarPorFiltro (p_Filtro IN VARCHAR2,
                                   p_idUsuario IN NUMBER,
                                   p_resultado OUT CURSOR_SALIDA,
                                   p_codError OUT NUMBER,
                                   p_msjError OUT VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ConsultarPorFiltro';
    strSQL               VARCHAR2(1000);

   BEGIN

    pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                       p_paquete       => NOMBRE_PAQUETE,
                                       p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                       p_usuario       => p_idUsuario,
                                       p_descripcion   => 'Entro a Pr_ConsultarPorFiltro ' || p_Filtro);


      IF p_Filtro IS NULL THEN
         OPEN p_resultado FOR 
         
         SELECT * 
           FROM IVET_T006_FUENTE
          WHERE A006ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;
          
         p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
         p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
         return;
         
       END IF; 
         
         strSQL := 'SELECT * FROM IVET_T006_FUENTE WHERE ' || p_Filtro ||' AND A003ESTADOREGISTRO ='''
                   || PK_UTL_CONSTANTE.COD_ACTIVO ||''''; 
                   
         OPEN p_resultado FOR strSQL;
            
         p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
         p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
         
    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_ConsultarPorFiltro ' || p_Filtro);

END Pr_ConsultarPorFiltro;

end PK_T006_FUENTE;