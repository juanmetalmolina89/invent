CREATE OR REPLACE PACKAGE BODY "PK_T017_CATGEMIS_CIIU" is

PROCEDURE Pr_Insertar (p_A017CODCATEMISION IN IVET_T017_CATGEMIS_CIIU.A017CODCATEMISION%TYPE,
                       p_A017IDCODCIIU     IN IVET_T017_CATGEMIS_CIIU.A017IDCODCIIU%TYPE,
                       p_idUsuario         IN NUMBER,
                       p_resultado         OUT CURSOR_SALIDA,
                       p_codError          OUT NUMBER,
                       p_msjError          OUT VARCHAR2) IS

NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Insertar';
p_A017CODIGO  NUMBER;

BEGIN
      -- obtenemos el siguiente id
      p_A017CODIGO := PK_UTL_UTILIDAD.Fn_Obtenerid('T017_CATGEMIS_CIIU_SEQ');

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => p_idUsuario,
                                         p_descripcion   => 'Entro a Pr_Insertar ' || p_A017CODIGO);

      INSERT INTO IVET_T017_CATGEMIS_CIIU(A017CODIGO,
                                          A017CODCATEMISION,
                                          A017IDCODCIIU,
                                          A017ESTADOREGISTRO,
                                          A017FECHACREACION,
                                          A017USUARIOCREACION)
                                  VALUES (p_A017CODIGO,
                                          p_A017CODCATEMISION,
                                          p_A017IDCODCIIU,
                                          PK_UTL_CONSTANTE.COD_ACTIVO,
                                          sysdate,
                                          p_idUsuario);

      OPEN p_resultado FOR SELECT p_A017CODIGO A017CODIGO FROM dual;
      p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
      p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Insertar ' || p_A017CODIGO);

  END Pr_Insertar;

  PROCEDURE Pr_Eliminar (p_A017CODIGO  IN IVET_T017_CATGEMIS_CIIU.A017CODIGO%TYPE,
                         p_idUsuario IN NUMBER,
                         p_resultado OUT CURSOR_SALIDA,
                         p_codError  OUT NUMBER,
                         p_msjError  OUT VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Eliminar';

   BEGIN

    pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                       p_paquete       => NOMBRE_PAQUETE,
                                       p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                       p_usuario       => p_idUsuario,
                                       p_descripcion   => 'Entro a Pr_Eliminar ' || p_A017CODIGO);

              UPDATE IVET_T017_CATGEMIS_CIIU
                 SET A017ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_INACTIVO,
                     A017FECHAMODIFICACION = sysdate,
                     A017USUARIOMODIFICACION = p_idUsuario
               WHERE A017CODIGO = p_A017CODIGO;

              OPEN p_resultado FOR SELECT '' FROM dual;
              p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
              p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Eliminar ' || p_A017CODIGO);

  END Pr_Eliminar;

  PROCEDURE Pr_Actualizar (p_A017CODIGO        IN IVET_T017_CATGEMIS_CIIU.A017CODIGO%TYPE,
                         p_A017CODCATEMISION IN IVET_T017_CATGEMIS_CIIU.A017CODCATEMISION%TYPE,
                         p_A017IDCODCIIU     IN IVET_T017_CATGEMIS_CIIU.A017IDCODCIIU%TYPE,
                         p_idUsuario         IN NUMBER,
                         p_resultado         OUT CURSOR_SALIDA,
                         p_codError          OUT NUMBER,
                         p_msjError          OUT VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Actualizar';
    numReg               NUMBER;

   BEGIN
    pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                       p_paquete       => NOMBRE_PAQUETE,
                                       p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                       p_usuario       => p_idUsuario,
                                       p_descripcion   => 'Entro a Pr_Actualizar ' || p_A017CODIGO);

      IF p_A017CODIGO IS NULL THEN
         p_codError := 4;
         p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
         OPEN p_resultado FOR SELECT '' FROM dual;
         return;
      END IF;

      SELECT COUNT(*)
        INTO numReg
        FROM IVET_T017_CATGEMIS_CIIU
       WHERE A017CODIGO = p_A017CODIGO
         AND A017ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;

      IF numReg > 0 THEN

         UPDATE IVET_T017_CATGEMIS_CIIU SET A017CODCATEMISION=NVL(p_A017CODCATEMISION, A017CODCATEMISION),
                                            A017IDCODCIIU=NVL(p_A017IDCODCIIU,A017IDCODCIIU),
                                            A017FECHAMODIFICACION = sysdate,
                                            A017USUARIOMODIFICACION = p_idUsuario
                                      WHERE A017CODIGO = p_A017CODIGO;

         OPEN p_resultado FOR SELECT p_A017CODIGO A017CODIGO FROM dual;
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
                                      p_descripcion   => 'Salio de Pr_Actualizar ' || p_A017CODIGO);

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
           FROM IVET_T017_CATGEMIS_CIIU
          WHERE A017ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;

         p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
         p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
         return;

      END IF;

         strSQL := 'SELECT * FROM IVEV_005_CATEGORIA_CIIU WHERE ' || p_Filtro ||' AND A017ESTADOREGISTRO ='''
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

end PK_T017_CATGEMIS_CIIU;