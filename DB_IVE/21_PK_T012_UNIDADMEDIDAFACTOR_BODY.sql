create or replace package body PK_T012_UNIDADMEDIDAFACTOR is

PROCEDURE Pr_Insertar (p_A012UNIDADMEDIDA IN  IVET_T012_UNIDADMEDIDAFACTOR.A012UNIDADMEDIDA%TYPE,
                       p_idUsuario IN NUMBER,
                       p_resultado OUT CURSOR_SALIDA,
                       p_codError   OUT NUMBER,
                       p_msjError  OUT VARCHAR2) IS

NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Insertar';
p_A012CODIGO  NUMBER;

BEGIN
      -- obtenemos el siguiente id
      p_A012CODIGO := PK_UTL_UTILIDAD.Fn_Obtenerid('T012_UNIDADMEDIDAFACTOR_SEQ');

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,      
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => p_idUsuario,
                                         p_descripcion   => 'Entro a Pr_Insertar ' || p_A012UNIDADMEDIDA);

      INSERT INTO IVET_T012_UNIDADMEDIDAFACTOR(A012CODIGO,
                                               A012UNIDADMEDIDA,
                                               A012ESTADOREGISTRO,
                                               A012FECHACREACION,
                                               A012USUARIOCREACION)
                                       VALUES (p_A012CODIGO,
                                               p_A012UNIDADMEDIDA, 
                                               PK_UTL_CONSTANTE.COD_ACTIVO, 
                                               sysdate, 
                                               p_idUsuario);
                                               
      OPEN p_resultado FOR SELECT p_A012CODIGO A012CODIGO FROM dual;
      p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
      p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Insertar ' || p_A012UNIDADMEDIDA);

  END Pr_Insertar;
  
  PROCEDURE Pr_Eliminar (p_A012CODIGO  IN IVET_T012_UNIDADMEDIDAFACTOR.A012CODIGO%TYPE,
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
                                       p_descripcion   => 'Entro a Pr_Eliminar ' || p_A012CODIGO);


              UPDATE IVET_T012_UNIDADMEDIDAFACTOR 
                 SET A012ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_INACTIVO, 
                     A012FECHAMODIFICACION = sysdate,
                     A012USUARIOMODIFICACION = p_idUsuario 
               WHERE A012CODIGO = p_A012CODIGO;
               
              OPEN p_resultado FOR SELECT '' FROM dual;
              p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
              p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Eliminar ' || p_A012CODIGO);

  END Pr_Eliminar;

  PROCEDURE Pr_Actualizar (p_A012CODIGO IN IVET_T012_UNIDADMEDIDAFACTOR.A012CODIGO%TYPE,
                           p_A012UNIDADMEDIDA IN  IVET_T012_UNIDADMEDIDAFACTOR.A012UNIDADMEDIDA%TYPE,
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
                                       p_descripcion   => 'Entro a Pr_Actualizar ' || p_A012CODIGO);

      IF p_A012CODIGO IS NULL THEN
         p_codError := 4;
         p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
         OPEN p_resultado FOR SELECT '' FROM dual;
         return;
      END IF;

      SELECT COUNT(*) 
        INTO numReg 
        FROM IVET_T012_UNIDADMEDIDAFACTOR 
       WHERE A012CODIGO = p_A012CODIGO 
         AND A012ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;
         
      IF numReg > 0 THEN
      
         UPDATE IVET_T012_UNIDADMEDIDAFACTOR SET A012UNIDADMEDIDA=NVL(p_A012UNIDADMEDIDA, A012UNIDADMEDIDA),
                                                 A012FECHAMODIFICACION = sysdate,
                                                 A012USUARIOMODIFICACION = p_idUsuario WHERE A012CODIGO = p_A012CODIGO;

         OPEN p_resultado FOR SELECT p_A012CODIGO A012CODIGO FROM dual;
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
                                      p_descripcion   => 'Salio de Pr_Actualizar ' || p_A012CODIGO);

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
           FROM IVET_T012_UNIDADMEDIDAFACTOR 
          WHERE A012ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;
         
         p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
         p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
         return;

      END IF;
      
         strSQL := 'SELECT * FROM IVET_T012_UNIDADMEDIDAFACTOR WHERE ' || p_Filtro ||' AND A003ESTADOREGISTRO ='''
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

end PK_T012_UNIDADMEDIDAFACTOR;