CREATE OR REPLACE PACKAGE BODY "PK_T001_ENTIDAD" is

   /********************************************************************************
  DESCRIPCION       : Procedimiento para insertar una autoridad ambiental
  PARAMETROS        :
  IN    :
            p_A001SIGLAAUTAMB            Sigla de la autoridad ambiental
            p_A001NOMBREAUTAMB           Nombre de la autoridad ambiental
            p_A001CODDIVIPOLA            Identificador divipola municipios
            p_idUsuario                  Id del usuario logueado en el sistema

  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C�digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 10/11/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:
  *******************************************************************************/

PROCEDURE Pr_Insertar (p_A001SIGLAAUTAMB  IN  IVET_T001_ENTIDAD.A001SIGLAAUTAMB%TYPE,
                       p_A001NOMBREAUTAMB IN  IVET_T001_ENTIDAD.A001NOMBREAUTAMB%TYPE,
                       p_A001CODDIVIPOLA  IN IVET_T001_ENTIDAD.A001CODDIVIPOLA%TYPE,
                       p_idUsuario        IN NUMBER,
                       p_resultado        OUT CURSOR_SALIDA,
                       p_codError         OUT NUMBER,
                       p_msjError                        OUT VARCHAR2) IS

NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Insertar';
p_A001CODIGO  NUMBER;

BEGIN

      p_A001CODIGO := PK_UTL_UTILIDAD.Fn_Obtenerid('T001_ENTIDAD_SEQ');-- obtenemos el siguiente id

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => p_idUsuario,
                                         p_descripcion   => 'Entro a Pr_Insertar ' || p_A001SIGLAAUTAMB);


     INSERT INTO IVET_T001_ENTIDAD (A001CODIGO,
                                    A001SIGLAAUTAMB,
                                    A001NOMBREAUTAMB,
                                    A001CODDIVIPOLA,
                                    A001ESTADOREGISTRO,
                                    A001FECHACREACION,
                                    A001USUARIOCREACION)
                            VALUES (p_A001CODIGO,
                                    p_A001SIGLAAUTAMB,
                                    p_A001NOMBREAUTAMB,
                                    p_A001CODDIVIPOLA,
                                    PK_UTL_CONSTANTE.COD_ACTIVO,
                                    sysdate,
                                    p_idUsuario);

      OPEN p_resultado FOR SELECT p_A001CODIGO A001CODIGO FROM dual;
      p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
      p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

      pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                        p_paquete       => NOMBRE_PAQUETE,
                                        p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                        p_usuario       => p_idUsuario,
                                        p_descripcion   => 'Salio de Pr_Insertar ' || p_A001SIGLAAUTAMB);

  END Pr_Insertar;

    /********************************************************************************
  DESCRIPCION       : Procedimiento para eliminar una autoridad ambiental (borrado l�gico)
  PARAMETROS        :
  IN    :
            p_A001CODIGO                 Codigo identificador de la autoridad ambiental
            p_idUsuario                  Id del usuario logueado en el sistema

  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C�digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 10/11/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:
  *******************************************************************************/

PROCEDURE Pr_Eliminar (p_A001CODIGO  IN IVET_T001_ENTIDAD.A001CODIGO%TYPE,
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
                                       p_descripcion   => 'Entro a Pr_Eliminar ' || p_A001CODIGO);

              UPDATE IVET_T001_ENTIDAD
                 SET A001ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_INACTIVO,
                     A001FECHAMODIFICACION = sysdate,
                     A001USUARIOMODIFICACION = p_idUsuario
               WHERE A001CODIGO = p_A001CODIGO;

              OPEN p_resultado FOR SELECT '' FROM dual;
              p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
              p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

              pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                                p_paquete       => NOMBRE_PAQUETE,
                                                p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                                p_usuario       => p_idUsuario,
                                                p_descripcion   => 'Salio de Pr_Eliminar ' || p_A001CODIGO);

  END Pr_Eliminar;

   /********************************************************************************
  DESCRIPCION       : Procedimiento para actualizar una autoridad ambiental
  PARAMETROS        :
  IN    :
            p_A001CODIGO                 Codigo identificador de la autoridad ambiental
            p_A001SIGLAAUTAMB            Sigla de la autoridad ambiental
            p_A001NOMBREAUTAMB           Nombre de la autoridad ambiental
            p_idUsuario                  Id del usuario logueado en el sistema

  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C�digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 10/11/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:
  *******************************************************************************/

PROCEDURE Pr_Actualizar (p_A001CODIGO IN  IVET_T001_ENTIDAD.A001CODIGO%TYPE,
                         p_A001SIGLAAUTAMB IN  IVET_T001_ENTIDAD.A001SIGLAAUTAMB%TYPE,
                         p_A001NOMBREAUTAMB IN  IVET_T001_ENTIDAD.A001NOMBREAUTAMB%TYPE,
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
                                       p_descripcion   => 'Entro a Pr_Actualizar ' || p_A001CODIGO);


      IF p_A001CODIGO IS NULL THEN
         p_codError := 4;
         p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
         OPEN p_resultado FOR SELECT '' FROM dual;
         return;
      END IF;

      SELECT COUNT(*)
        INTO numReg
        FROM IVET_T001_ENTIDAD
       WHERE A001CODIGO = p_A001CODIGO
         AND A001ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;

      IF numReg > 0 THEN

         UPDATE IVET_T001_ENTIDAD
            SET A001SIGLAAUTAMB=NVL(p_A001SIGLAAUTAMB, A001SIGLAAUTAMB),
                A001NOMBREAUTAMB=NVL(p_A001NOMBREAUTAMB,A001NOMBREAUTAMB),
                A001FECHAMODIFICACION=sysdate,
                A001USUARIOMODIFICACION = p_idUsuario
          WHERE A001CODIGO = p_A001CODIGO;

         OPEN p_resultado FOR SELECT p_A001CODIGO A001CODIGO FROM dual;

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
                                      p_descripcion   => 'Salio de Pr_Actualizar ' || p_A001CODIGO);

  END Pr_Actualizar;

   /********************************************************************************
  DESCRIPCION       : Procedimiento para consultar una autoridad ambiental por filtro
  PARAMETROS        :
  IN    :
            p_Filtro                     Filtro de b�squeda
            p_idUsuario                  Id del usuario logueado en el sistema

  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C�digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 10/11/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:
  *******************************************************************************/

  PROCEDURE Pr_ConsultarPorFiltro (p_Filtro IN VARCHAR2,
                                   p_idUsuario IN NUMBER,
                                   p_resultado OUT CURSOR_SALIDA,
                                   p_codError OUT NUMBER,
                                   p_msjError OUT VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ConsultarPorFiltro';
    strSQL               VARCHAR2(2000);

BEGIN

    pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                       p_paquete       => NOMBRE_PAQUETE,
                                       p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                       p_usuario       => p_idUsuario,
                                       p_descripcion   => 'Entro a Pr_ConsultarPorFiltro ' || p_Filtro);

      IF p_Filtro IS NULL THEN
         OPEN p_resultado FOR
         SELECT *
           FROM IVET_T001_ENTIDAD
          WHERE A001ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;

         p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
         p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
         return;
      END IF;

             strSQL := 'SELECT * FROM IVET_T001_ENTIDAD WHERE '|| p_Filtro ||' AND A001ESTADOREGISTRO ='''
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

end PK_T001_ENTIDAD;