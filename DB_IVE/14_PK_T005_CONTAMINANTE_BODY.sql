CREATE OR REPLACE PACKAGE BODY "PK_T005_CONTAMINANTE" is

PROCEDURE Pr_Insertar (p_A005CONTAMINANTE IN  IVET_T005_CONTAMINANTE.A005CONTAMINANTE%TYPE,
                       p_idUsuario IN NUMBER,
                       p_resultado OUT CURSOR_SALIDA,
                       p_codError    OUT NUMBER,
                       p_msjError  OUT VARCHAR2) IS

NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Insertar';
p_A005CODIGO  NUMBER;

BEGIN
      -- obtenemos el siguiente id
      p_A005CODIGO := PK_UTL_UTILIDAD.Fn_Obtenerid('T005_CONTAMINANTE_SEQ');

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => p_idUsuario,
                                         p_descripcion   => 'Entro a Pr_Insertar ' || p_A005CONTAMINANTE);

      INSERT INTO IVET_T005_CONTAMINANTE(A005CODIGO,
                                        A005CONTAMINANTE,
                                        A005ESTADOREGISTRO,
                                        A005FECHACREACION,                                       
                                        A005USUARIOCREACION)
                                VALUES (p_A005CODIGO,
                                        p_A005CONTAMINANTE,
                                        PK_UTL_CONSTANTE.COD_ACTIVO, 
                                        sysdate, 
                                        p_idUsuario);
      
      OPEN p_resultado FOR SELECT p_A005CODIGO A005CODIGO FROM dual;
      p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
      p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

      pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                        p_paquete       => NOMBRE_PAQUETE,
                                        p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                        p_usuario       => p_idUsuario,
                                        p_descripcion   => 'Salio de Pr_Insertar ' || p_A005CONTAMINANTE);

  END Pr_Insertar;
  
  
  
  PROCEDURE Pr_Eliminar (p_A005CODIGO  IN IVET_T005_CONTAMINANTE.A005CODIGO%TYPE,
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
                                       p_descripcion   => 'Entro a Pr_Eliminar ' || p_A005CODIGO);

              UPDATE IVET_T005_CONTAMINANTE 
                 SET A005ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_INACTIVO, 
                     A005FECHAMODIFICACION = sysdate,
                     A005USUARIOMODIFICACION = p_idUsuario 
               WHERE A005CODIGO = p_A005CODIGO;
               
              OPEN p_resultado FOR SELECT p_A005CODIGO A005CODIGO FROM dual;
              p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
              p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Eliminar ' || p_A005CODIGO);

  END Pr_Eliminar;

  PROCEDURE Pr_Actualizar (p_A005CODIGO IN  IVET_T005_CONTAMINANTE.A005CODIGO%TYPE,
                           p_A005CONTAMINANTE IN  IVET_T005_CONTAMINANTE.A005CONTAMINANTE%TYPE,
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
                                       p_descripcion   => 'Entro a Pr_Actualizar ' || p_A005CODIGO);

      IF p_A005CODIGO IS NULL THEN
         p_codError := 4;
         p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
         OPEN p_resultado FOR SELECT '' FROM dual;
         return;
      END IF;

      SELECT COUNT(*) 
        INTO numReg 
        FROM IVET_T005_CONTAMINANTE 
       WHERE A005CODIGO = p_A005CODIGO 
         AND A005ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;

      IF numReg > 0 THEN
         
         UPDATE IVET_T005_CONTAMINANTE SET A005CONTAMINANTE=NVL(p_A005CONTAMINANTE, A005CONTAMINANTE),
                                          A005FECHAMODIFICACION = sysdate,
                                          A005USUARIOMODIFICACION = p_idUsuario 
                                    WHERE A005CODIGO = p_A005CODIGO;
                                    
         OPEN p_resultado FOR SELECT p_A005CODIGO A005CODIGO FROM dual;
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
                                      p_descripcion   => 'Salio de Pr_Actualizar ' || p_A005CODIGO);

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
           FROM IVET_T005_CONTAMINANTE
          WHERE A005ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;
         
         p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
         p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
         return;
      END IF;

             strSQL := 'SELECT * FROM IVET_T005_CONTAMINANTE WHERE ' || p_Filtro ||' AND A004ESTADOREGISTRO ='''
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

end PK_T005_CONTAMINANTE;