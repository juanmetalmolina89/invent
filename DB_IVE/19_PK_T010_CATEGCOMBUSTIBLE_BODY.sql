CREATE OR REPLACE PACKAGE BODY "PK_T010_CATEGCOMBUSTIBLE" is

PROCEDURE Pr_Insertar (p_A010CODCATEMISION     IN IVET_T010_CATEGCOMBUSTIBLE.A010CODCATEMISION%TYPE,
                       p_A010IDTIPOCOMBUSTIBLE IN IVET_T010_CATEGCOMBUSTIBLE.A010IDTIPOCOMBUSTIBLE%TYPE,
                       p_idUsuario             IN NUMBER,
                       p_resultado             OUT CURSOR_SALIDA,
                       p_codError              OUT NUMBER,
                       p_msjError              OUT VARCHAR) IS

NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Insertar';
p_A010CODIGO  NUMBER;

BEGIN
      -- obtenemos el siguiente id
      p_A010CODIGO := PK_UTL_UTILIDAD.Fn_Obtenerid('T010_CATEGCOMBUSTIBLE_SEQ');

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => p_idUsuario,
                                         p_descripcion   => 'Entro a Pr_Insertar ' || p_A010CODIGO);

      INSERT INTO IVET_T010_CATEGCOMBUSTIBLE(A010CODIGO,
                                            A010CODCATEMISION,
                                            A010IDTIPOCOMBUSTIBLE,
                                            A010ESTADOREGISTRO,
                                            A010FECHACREACION,
                                            A010USUARIOCREACION)
                                    VALUES (p_A010CODIGO,
                                            p_A010CODCATEMISION, 
                                            p_A010IDTIPOCOMBUSTIBLE,
                                            PK_UTL_CONSTANTE.COD_ACTIVO, 
                                            sysdate, 
                                            p_idUsuario);
                                            
      OPEN p_resultado FOR SELECT p_A010CODIGO A010CODIGO FROM dual;
      p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
      p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Insertar ' || p_A010CODIGO);

  END Pr_Insertar;
  
  PROCEDURE Pr_Eliminar (p_A010CODIGO  IN IVET_T010_CATEGCOMBUSTIBLE.A010CODIGO%TYPE,
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
                                       p_descripcion   => 'Entro a Pr_Eliminar ' || p_A010CODIGO);

              UPDATE IVET_T010_CATEGCOMBUSTIBLE 
                 SET A010ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_INACTIVO, 
                     A010FECHAMODIFICACION = sysdate,
                     A010USUARIOMODIFICACION = p_idUsuario 
               WHERE A010CODIGO = p_A010CODIGO;
               
              OPEN p_resultado FOR SELECT '' FROM dual;
              p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
              p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
              
    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Eliminar ' || p_A010CODIGO);

  END Pr_Eliminar;

  PROCEDURE Pr_Actualizar (p_A010CODIGO IN  IVET_T010_CATEGCOMBUSTIBLE.A010CODIGO%TYPE,
                           p_A010CODCATEMISION IN  IVET_T010_CATEGCOMBUSTIBLE.A010CODCATEMISION%TYPE,
                           p_A010IDTIPOCOMBUSTIBLE IN  IVET_T010_CATEGCOMBUSTIBLE.A010IDTIPOCOMBUSTIBLE%TYPE,
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
                                       p_descripcion   => 'Entro a Pr_Actualizar ' || p_A010CODIGO);

      IF p_A010CODIGO IS NULL THEN
         p_codError := 4;
         p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
         OPEN p_resultado FOR SELECT '' FROM dual;
         return;
      END IF;

      SELECT COUNT(*) 
        INTO numReg 
        FROM IVET_T010_CATEGCOMBUSTIBLE 
       WHERE A010CODIGO = p_A010CODIGO 
         AND A010ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;
      
      IF numReg > 0 THEN
        
         UPDATE IVET_T010_CATEGCOMBUSTIBLE SET A010CODCATEMISION=NVL(p_A010CODCATEMISION, A010CODCATEMISION),
                                              A010IDTIPOCOMBUSTIBLE=NVL(p_A010IDTIPOCOMBUSTIBLE,A010IDTIPOCOMBUSTIBLE),
                                              A010FECHAMODIFICACION = sysdate,
                                              A010USUARIOMODIFICACION = p_idUsuario WHERE A010CODIGO = p_A010CODIGO;
                                              
         OPEN p_resultado FOR SELECT p_A010CODIGO A010CODIGO FROM dual;
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
                                      p_descripcion   => 'Salio de Pr_Actualizar ' || p_A010CODIGO);

  END Pr_Actualizar;

  PROCEDURE Pr_ConsultarPorFiltro (p_Filtro    IN VARCHAR2,
                                   p_idUsuario IN NUMBER,
                                   p_resultado OUT CURSOR_SALIDA,
                                   p_codError  OUT NUMBER,
                                   p_msjError  OUT VARCHAR2) IS

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
           FROM IVET_T010_CATEGCOMBUSTIBLE
          WHERE A010ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO; 
           
         p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
         p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
         return;
         
      END IF;
      
         strSQL := 'SELECT c.a010codigo , A010IDTIPOCOMBUSTIBLE ,
         LISTAGG(l.a102valor  , '','') WITHIN GROUP (ORDER BY l.a102valor  ) AS TIPO_COMBUSTIBLE
         FROM   IVET_T010_CATEGCOMBUSTIBLE c
         LEFT JOIN PART_T102_LISTA l ON l.a102codigo = c.a010idtipocombustible
         WHERE ' || p_Filtro ||
         ' AND a010estadoregistro = '''|| PK_UTL_CONSTANTE.COD_ACTIVO ||''' GROUP BY c.a010codigo, A010IDTIPOCOMBUSTIBLE';

         OPEN p_resultado FOR strSQL;

         p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
         p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_ConsultarPorFiltro ' || p_Filtro);

END Pr_ConsultarPorFiltro;

end PK_T010_CATEGCOMBUSTIBLE;