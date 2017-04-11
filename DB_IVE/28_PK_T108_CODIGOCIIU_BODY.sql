CREATE OR REPLACE PACKAGE BODY PK_T108_CODIGOCIIU is

/**********************************************************************
  DESCRIPCION       : Procedimiento para insertar un departamento y municipio de Colombia
  PARAMETROS        :
  IN    :
            p_A105IDDIVIPOLA             Nombre de la autoridad ambiental
            p_A105DEPARTAMENTO           Nombre del Departamento
            p_A105MUNICIPIO              Nombre del Municipio
            p_idUsuario                  Id del usuario logueado en el sistema

  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C?digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 10/11/2016

  FECHA MODIFICA    : 02/12/2016
  MODIFICADO POR    :Luis Felipe Rueda Forero
  DESCRIPCION CAMBIO:Ajustes solicitados Hugo Cendales
**************************************************************************/

PROCEDURE Pr_Insertar (p_A108CODIGOCIIU      IN PART_T108_CODIGOCIIU.A108CODIGOCIIU%TYPE,
                       p_A108DESCRIPCIONCIIU IN  PART_T108_CODIGOCIIU.A108DESCRIPCIONCIIU%TYPE,
                       p_idUsuario           IN NUMBER,
                       p_resultado           OUT CURSOR_SALIDA,
                       p_codError            OUT NUMBER,
                       p_msjError            OUT VARCHAR2) IS

NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Insertar';
p_A108CODIGO         NUMBER;

BEGIN
      -- obtenemos el siguiente id
      p_A108CODIGO := PK_UTL_UTILIDAD.Fn_Obtenerid('T108_CODIGOCIIU_SEQ');

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => p_idUsuario,
                                         p_descripcion   => 'Entro a Pr_Insertar ' || p_A108CODIGO);


       INSERT INTO PART_T108_CODIGOCIIU (A108CODIGO,
                                         A108CODIGOCIIU,
                                         A108DESCRIPCIONCIIU,
                                         A108ESTADOREGISTRO,
                                         A108FECHACREACION,
                                         A108USUARIOCREACION)
                                 VALUES (p_A108CODIGO,
                                         p_A108CODIGOCIIU,
                                         p_A108DESCRIPCIONCIIU,
                                         PK_UTL_CONSTANTE.COD_ACTIVO, --Estado del registro (Activo - A)
                                         sysdate,
                                         p_idUsuario);

       OPEN p_resultado FOR SELECT p_A108CODIGO A108CODIGO FROM dual;
       p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
       p_msjError := pk_utl_utilidad.fn_ObtenerMensaje(p_codError);

      pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                        p_paquete       => NOMBRE_PAQUETE,
                                        p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                        p_usuario       => p_idUsuario,
                                        p_descripcion   => 'Salio de Pr_Insertar ' || p_A108CODIGO);

END Pr_Insertar;

/*********************************************************************
  DESCRIPCION       : Procedimiento para hacer un borrado logico de un departamento y un municipio de Colombia
  PARAMETROS        :
  IN    :
            p_A105CODIGO                 Codigo identificador de la divipola
            p_idUsuario                  Id del usuario logueado en el sistema

  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C?digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 10/11/2016

  FECHA MODIFICA    : 02/12/2016
  MODIFICADO POR    :Luis Felipe Rueda Forero
  DESCRIPCION CAMBIO:Ajustes solicitados Hugo Cendales
************************************************************************/

PROCEDURE Pr_Eliminar (p_A108CODIGO IN PART_T108_CODIGOCIIU.A108CODIGO%TYPE,
                       p_idUsuario  IN NUMBER,
                       p_resultado  OUT CURSOR_SALIDA,
                       p_codError   OUT NUMBER,
                       p_msjError   OUT VARCHAR2) IS

NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Eliminar';

BEGIN

    pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                       p_paquete       => NOMBRE_PAQUETE,
                                       p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                       p_usuario       => p_idUsuario,
                                       p_descripcion   => 'Entro a Pr_Eliminar ' || p_A108CODIGO);

      IF p_A108CODIGO IS NULL THEN
         p_codError := 4;
         p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
         return;
      END IF;

              UPDATE PART_T108_CODIGOCIIU
                 SET A108ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_INACTIVO,
                     A108FECHAMODIFICACION = sysdate,
                     A108USUARIOMODIFICACION = p_idUsuario
               WHERE A108CODIGO = p_A108CODIGO;

              OPEN p_resultado FOR SELECT p_A108CODIGO A108CODIGO FROM dual;
              p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
              p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Eliminar ' || p_A108CODIGO);

END Pr_Eliminar;

/*******************************************************************************
  DESCRIPCION       : Procedimiento para actualizar un departamento y municipio de Colombia
  PARAMETROS        :
  IN    :
            p_A105CODIGO                 Codigo identificador de la divipola
            p_A105IDDIVIPOLA             Nombre de la autoridad ambiental
            p_A105DEPARTAMENTO           Nombre del Departamento
            p_A105MUNICIPIO              Nombre del Municipio
            p_idUsuario                  Id del usuario logueado en el sistema

  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C?digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 10/11/2016

  FECHA MODIFICA    : 02/12/2016
  MODIFICADO POR    :Luis Felipe Rueda Forero
  DESCRIPCION CAMBIO:Ajustes solicitados Hugo Cendales
*******************************************************************************/

PROCEDURE Pr_Actualizar (p_A108CODIGO          IN PART_T108_CODIGOCIIU.A108CODIGO%TYPE,
                         p_A108CODIGOCIIU      IN PART_T108_CODIGOCIIU.A108CODIGOCIIU%TYPE,
                         p_A108DESCRIPCIONCIIU IN  PART_T108_CODIGOCIIU.A108DESCRIPCIONCIIU%TYPE,
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
                                       p_descripcion   => 'Entro a Pr_Actualizar ' || p_A108CODIGO);

      IF p_A108CODIGO IS NULL THEN
         p_codError := 4;
         p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
         OPEN p_resultado FOR SELECT '' FROM dual;
         return;
      END IF;

      SELECT COUNT(*)
        INTO numReg
        FROM PART_T108_CODIGOCIIU
       WHERE A108CODIGO = p_A108CODIGO
         AND A108ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;

      IF numReg > 0 THEN

         UPDATE PART_T108_CODIGOCIIU SET A108CODIGOCIIU=NVL(p_A108CODIGOCIIU, A108CODIGOCIIU),
                                       A108DESCRIPCIONCIIU=NVL(p_A108DESCRIPCIONCIIU,A108DESCRIPCIONCIIU),
                                       A108FECHAMODIFICACION = sysdate,
                                       A108USUARIOMODIFICACION = p_idUsuario
                                 WHERE A108CODIGO = p_A108CODIGO;

         OPEN p_resultado FOR SELECT p_A108CODIGO A108CODIGO FROM dual;
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
                                      p_descripcion   => 'Salio de Pr_Actualizar ' || p_A108CODIGO);

END Pr_Actualizar;

/*************************************************************************
  DESCRIPCION       : Procedimiento para consultar depto o mcpio por filtro
  PARAMETROS        :
  IN    :
            p_Filtro                     Par?metro de busqueda (campo = valor)
            p_idUsuario                  Id del usuario logueado en el sistema

  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C?digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 10/11/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:
*****************************************************************************/

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
           FROM PART_T108_CODIGOCIIU
          WHERE A108ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;

         p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
         p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
         return;

      END IF;

         strSQL := 'SELECT * FROM PART_T108_CODIGOCIIU WHERE ' ||p_Filtro ||' AND A108ESTADOREGISTRO ='''
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

end PK_T108_CODIGOCIIU;