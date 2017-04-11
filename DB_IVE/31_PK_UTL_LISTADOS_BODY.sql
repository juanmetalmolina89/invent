CREATE OR REPLACE PACKAGE BODY "PK_UTL_LISTADOS" is

   /********************************************************************************
  DESCRIPCION       : Procedimiento para listar autoridades ambientales
  PARAMETROS        :
  IN    :
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
  *******************************************************************************/

 PROCEDURE Pr_ListarAutoridades (p_idUsuario IN NUMBER,
                                 p_Respuesta OUT CURSOR_SALIDA,
                                 p_codError OUT NUMBER,
                                 p_msjError OUT VARCHAR2) IS

    codExcepcion         NUMBER;
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ListarAutoridades';

  BEGIN
      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => 0,
                                         p_descripcion   => 'Entro a Pr_ListarAutoridades ');

      PK_T001_ENTIDAD.Pr_ConsultarPorFiltro (p_Filtro    => NULL,
                                             p_idUsuario => p_idUsuario,
                                             p_resultado => p_Respuesta,
                                             p_codError  => p_codError,
                                             p_msjError  => p_msjError);

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => 0,
                                         p_descripcion   => 'Salio de Pr_ListarAutoridades ');

  EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;

      codExcepcion := PK_UTL_UTILIDAD.fn_RegistrarExcepcion(PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                            NOMBRE_PAQUETE,
                                                            NOMBRE_PROCEDIMIENTO,
                                                            SQLCODE,
                                                            SQLERRM);

      p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
      p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);

 END Pr_ListarAutoridades;

  /********************************************************************************
  DESCRIPCION       : Procedimiento para listar informaci?n de la divipola x departamento
  PARAMETROS        :
  IN    :
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
  *******************************************************************************/

 PROCEDURE Pr_ListarDivipolaDepto (p_idUsuario IN NUMBER,
                                   p_Respuesta OUT CURSOR_SALIDA,
                                   p_codError OUT NUMBER,
                                   p_msjError OUT VARCHAR2) IS

    codExcepcion         NUMBER;
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ListarDivipola';

 BEGIN
      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => 0,
                                         p_descripcion   => 'Entro a Pr_ListarDivipola ');

      OPEN p_Respuesta FOR
        SELECT distinct(A105CODDEPARTAMENTO), A105DEPARTAMENTO
          FROM PART_T105_DIVIPOLA
      ORDER BY A105DEPARTAMENTO ASC;

      p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
      p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => 0,
                                         p_descripcion   => 'Salio de Pr_ListarDivipola ');

  EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;

      codExcepcion := PK_UTL_UTILIDAD.fn_RegistrarExcepcion(PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                            NOMBRE_PAQUETE,
                                                            NOMBRE_PROCEDIMIENTO,
                                                            SQLCODE,
                                                            SQLERRM);

      p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
      p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);

 END Pr_ListarDivipolaDepto;

  /********************************************************************************
  DESCRIPCION       : Procedimiento para listar informaci?n de la divipola x municipio
  PARAMETROS        :
  IN    :
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
  *******************************************************************************/

 PROCEDURE Pr_ListarDivipolaMcpio (p_A105CODDEPARTAMENTO IN PART_T105_DIVIPOLA.A105CODDEPARTAMENTO%TYPE,
                                   p_idUsuario IN NUMBER,
                                   p_Respuesta OUT CURSOR_SALIDA,
                                   p_codError OUT NUMBER,
                                   p_msjError OUT VARCHAR2) IS

    codExcepcion         NUMBER;
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ListarDivipola';

 BEGIN
      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => 0,
                                         p_descripcion   => 'Entro a Pr_ListarDivipola ');

      OPEN p_Respuesta FOR
         SELECT A105CODIGO, A105CODMUNICIPIO, A105MUNICIPIO, A105CODDIVIPOLADM
           FROM PART_T105_DIVIPOLA
          WHERE A105CODDEPARTAMENTO = p_A105CODDEPARTAMENTO;

      p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
      p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => 0,
                                         p_descripcion   => 'Salio de Pr_ListarDivipola ');

  EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;

      codExcepcion := PK_UTL_UTILIDAD.fn_RegistrarExcepcion(PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                            NOMBRE_PAQUETE,
                                                            NOMBRE_PROCEDIMIENTO,
                                                            SQLCODE,
                                                            SQLERRM);

      p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
      p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);

 END Pr_ListarDivipolaMcpio;

   /********************************************************************************
  DESCRIPCION       : Procedimiento para listar la lista x categor?a
  PARAMETROS        :
  IN    :
            p_Categoria                  Valor de la categor?a
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
  *******************************************************************************/

 PROCEDURE Pr_ListarParametricas (p_Categoria IN VARCHAR2,
                                  p_idUsuario IN NUMBER,
                                  p_Respuesta OUT CURSOR_SALIDA,
                                  p_codError OUT NUMBER,
                                  p_msjError OUT VARCHAR2) IS

    codExcepcion         NUMBER;
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ListarParametricas';

  BEGIN
    pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                       p_paquete       => NOMBRE_PAQUETE,
                                       p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                       p_usuario       => 0,
                                       p_descripcion   => 'Entro a Pr_ListarParametricas ');

    PK_UTL_UTILIDAD.Pr_ConsultarLista (p_Categoria => p_Categoria,
                                       p_datRespuesta => p_Respuesta,
                                       p_codError => p_codError,
                                       p_msjError => p_msjError);

    pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                       p_paquete       => NOMBRE_PAQUETE,
                                       p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                       p_usuario       => 0,
                                       p_descripcion   => 'Salio de Pr_ListarParametricas ');

  EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;

      codExcepcion := PK_UTL_UTILIDAD.fn_RegistrarExcepcion(PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                            NOMBRE_PAQUETE,
                                                            NOMBRE_PROCEDIMIENTO,
                                                            SQLCODE,
                                                            SQLERRM);

      p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
      p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);

 END Pr_ListarParametricas;
 
  /********************************************************************************
  DESCRIPCION       : Procedimiento para listar contaminantes por inhventario
  PARAMETROS        :
  IN    :
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
  *******************************************************************************/

 PROCEDURE Pr_ListarContamInv (p_idUsuario IN NUMBER,
                                p_Respuesta OUT CURSOR_SALIDA,
                                p_codError OUT NUMBER,
                                p_msjError OUT VARCHAR2) IS

    codExcepcion         NUMBER;
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ListarContamxInv';

  BEGIN
      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => 0,
                                         p_descripcion   => 'Entro a Pr_ListarContamxInv ');

      PK_T005_CONTAMINANTE.Pr_ConsultarPorFiltro (p_Filtro    => NULL,
                                                  p_idUsuario => p_idUsuario,
                                                  p_resultado => p_Respuesta,
                                                  p_codError  => p_codError,
                                                  p_msjError  => p_msjError);

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => 0,
                                         p_descripcion   => 'Salio de Pr_ListarContamxInv ');

  EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;

      codExcepcion := PK_UTL_UTILIDAD.fn_RegistrarExcepcion(PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                            NOMBRE_PAQUETE,
                                                            NOMBRE_PROCEDIMIENTO,
                                                            SQLCODE,
                                                            SQLERRM);

      p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
      p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);

 END Pr_ListarContamInv;
 
  /********************************************************************************
  DESCRIPCION       : Procedimiento para listar fuentes por inventario
  PARAMETROS        :
  IN    :
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
  *******************************************************************************/

 PROCEDURE Pr_ListarFuenteInv (p_idUsuario IN NUMBER,
                                p_Respuesta OUT CURSOR_SALIDA,
                                p_codError OUT NUMBER,
                                p_msjError OUT VARCHAR2) IS

    codExcepcion         NUMBER;
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ListarFuentexInv';

  BEGIN
      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => 0,
                                         p_descripcion   => 'Entro a Pr_ListarFuentexInv ');

      PK_T006_FUENTE.Pr_ConsultarPorFiltro (p_Filtro    => NULL,
                                                      p_idUsuario => p_idUsuario,
                                                      p_resultado => p_Respuesta,
                                                      p_codError  => p_codError,
                                                      p_msjError  => p_msjError);

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => 0,
                                         p_descripcion   => 'Salio de Pr_ListarFuentexInv ');

  EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;

      codExcepcion := PK_UTL_UTILIDAD.fn_RegistrarExcepcion(PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                            NOMBRE_PAQUETE,
                                                            NOMBRE_PROCEDIMIENTO,
                                                            SQLCODE,
                                                            SQLERRM);

      p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
      p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);

 END Pr_ListarFuenteInv;
 
  /********************************************************************************
  DESCRIPCION       : Procedimiento para listar los códigos CIIU
  PARAMETROS        :
  IN    :
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
  *******************************************************************************/

 PROCEDURE Pr_ListarCiiu (p_idUsuario IN NUMBER,
                          p_Respuesta OUT CURSOR_SALIDA,
                          p_codError OUT NUMBER,
                          p_msjError OUT VARCHAR2) IS

    codExcepcion         NUMBER;
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ListarCiiu';

  BEGIN
      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => 0,
                                         p_descripcion   => 'Entro a Pr_ListarCiiu ');

      PK_T108_CODIGOCIIU.Pr_ConsultarPorFiltro (p_Filtro    => NULL,
                                                   p_idUsuario => p_idUsuario,
                                                   p_resultado => p_Respuesta,
                                                   p_codError  => p_codError,
                                                   p_msjError  => p_msjError);

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => 0,
                                         p_descripcion   => 'Salio de Pr_ListarCiiu ');

  EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;

      codExcepcion := PK_UTL_UTILIDAD.fn_RegistrarExcepcion(PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                            NOMBRE_PAQUETE,
                                                            NOMBRE_PROCEDIMIENTO,
                                                            SQLCODE,
                                                            SQLERRM);

      p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
      p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);

 END Pr_ListarCiiu;
 
   /********************************************************************************
  DESCRIPCION       : Procedimiento para listar los métodos de emisión
  PARAMETROS        :
  IN    :
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
  *******************************************************************************/

 PROCEDURE Pr_ListarMetodoEmision (p_idUsuario IN NUMBER,
                                   p_Respuesta OUT CURSOR_SALIDA,
                                   p_codError OUT NUMBER,
                                   p_msjError OUT VARCHAR2) IS

    codExcepcion         NUMBER;
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ListarMetodoEmision';

  BEGIN
      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => 0,
                                         p_descripcion   => 'Entro a Pr_ListarMetodoEmision ');

      PK_T008_METODOEMISION.Pr_ConsultarPorFiltro (p_Filtro    => NULL,
                                                   p_idUsuario => p_idUsuario,
                                                   p_resultado => p_Respuesta,
                                                   p_codError  => p_codError,
                                                   p_msjError  => p_msjError);

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => 0,
                                         p_descripcion   => 'Salio de Pr_ListarMetodoEmision ');

  EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;

      codExcepcion := PK_UTL_UTILIDAD.fn_RegistrarExcepcion(PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                            NOMBRE_PAQUETE,
                                                            NOMBRE_PROCEDIMIENTO,
                                                            SQLCODE,
                                                            SQLERRM);

      p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
      p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);

 END Pr_ListarMetodoEmision;
 
  PROCEDURE Pr_ListarUniMedFacAct (p_idUsuario IN NUMBER,
                                   p_Respuesta OUT CURSOR_SALIDA,
                                   p_codError OUT NUMBER,
                                   p_msjError OUT VARCHAR2) IS

    codExcepcion         NUMBER;
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ListarUniMedFacAct';

  BEGIN
      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => 0,
                                         p_descripcion   => 'Entro a Pr_ListarUniMedFacAct ');

      PK_T011_UNIDADMEDIDA.Pr_ConsultarPorFiltro (p_Filtro    => NULL,
                                                   p_idUsuario => p_idUsuario,
                                                   p_resultado => p_Respuesta,
                                                   p_codError  => p_codError,
                                                   p_msjError  => p_msjError);

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => 0,
                                         p_descripcion   => 'Salio de Pr_ListarUniMedFacAct ');

  EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;

      codExcepcion := PK_UTL_UTILIDAD.fn_RegistrarExcepcion(PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                            NOMBRE_PAQUETE,
                                                            NOMBRE_PROCEDIMIENTO,
                                                            SQLCODE,
                                                            SQLERRM);

      p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
      p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);

 END Pr_ListarUniMedFacAct;
 
 PROCEDURE Pr_ListarUniMedFacEmi (p_idUsuario IN NUMBER,
                                  p_Respuesta OUT CURSOR_SALIDA,
                                  p_codError OUT NUMBER,
                                  p_msjError OUT VARCHAR2) IS

    codExcepcion         NUMBER;
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ListarUniMedFacEmi';

  BEGIN
      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => 0,
                                         p_descripcion   => 'Entro a Pr_ListarUniMedFacEmi ');

      PK_T012_UNIDADMEDIDAFACTOR.Pr_ConsultarPorFiltro (p_Filtro    => NULL,
                                                   p_idUsuario => p_idUsuario,
                                                   p_resultado => p_Respuesta,
                                                   p_codError  => p_codError,
                                                   p_msjError  => p_msjError);

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => 0,
                                         p_descripcion   => 'Salio de Pr_ListarUniMedFacEmi ');

  EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;

      codExcepcion := PK_UTL_UTILIDAD.fn_RegistrarExcepcion(PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                            NOMBRE_PAQUETE,
                                                            NOMBRE_PROCEDIMIENTO,
                                                            SQLCODE,
                                                            SQLERRM);

      p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
      p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);

 END Pr_ListarUniMedFacEmi;


 END PK_UTL_LISTADOS;