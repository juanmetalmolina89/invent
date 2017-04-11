CREATE OR REPLACE PACKAGE BODY PK_T018_CAMBIO_ESTADOS is

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
            p_codError                   Código del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 10/11/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:
  *******************************************************************************/

PROCEDURE Pr_Insertar (p_A018IDINVENTARIO    IN IVET_T018_CAMBIO_ESTADOS.A018IDINVENTARIO%TYPE,
                       p_A018ESTADO_ANT_INV  IN IVET_T018_CAMBIO_ESTADOS.A018ESTADO_ANT_INV%TYPE,
                       p_A018OBS_RECHAZO_ANT IN IVET_T018_CAMBIO_ESTADOS.A018OBS_RECHAZO_ANT%TYPE,
                       p_A018ESTADO_NVO_INV  IN IVET_T018_CAMBIO_ESTADOS.A018ESTADO_NVO_INV%TYPE,
                       p_idUsuario           IN NUMBER,
                       p_resultado           OUT CURSOR_SALIDA,
                       p_codError            OUT NUMBER,
                       p_msjError            OUT VARCHAR2) IS

NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Insertar';
p_A018CODIGO  NUMBER;

BEGIN

      p_A018CODIGO := PK_UTL_UTILIDAD.Fn_Obtenerid('T018_CAMBIO_ESTADOS_SEQ');-- obtenemos el siguiente id

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => p_idUsuario,
                                         p_descripcion   => 'Entro a Pr_Insertar ' || p_A018IDINVENTARIO);


     INSERT INTO IVET_T018_CAMBIO_ESTADOS (A018CODIGO,
                                           A018IDINVENTARIO,
                                           A018ESTADO_ANT_INV,
                                           A018OBS_RECHAZO_ANT,
                                           A018ESTADO_NVO_INV,
                                           A018ESTADOREGISTRO,
                                           A018FECHACREACION,
                                           A018USUARIOCREACION)
                                   VALUES (p_A018CODIGO,
                                           p_A018IDINVENTARIO,
                                           p_A018ESTADO_ANT_INV,
                                           p_A018OBS_RECHAZO_ANT,
                                           p_A018ESTADO_NVO_INV,
                                           PK_UTL_CONSTANTE.COD_ACTIVO,
                                           sysdate,
                                           p_idUsuario);

      OPEN p_resultado FOR SELECT p_A018CODIGO A018CODIGO FROM dual;
      p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
      p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

      pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                        p_paquete       => NOMBRE_PAQUETE,
                                        p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                        p_usuario       => p_idUsuario,
                                        p_descripcion   => 'Salio de Pr_Insertar ' || p_A018IDINVENTARIO);

  END Pr_Insertar;

  END PK_T018_CAMBIO_ESTADOS;