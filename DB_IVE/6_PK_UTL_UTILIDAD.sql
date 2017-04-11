CREATE OR REPLACE PACKAGE "PK_UTL_UTILIDAD" is

  /********************************************************************************
  DESCRIPCION    : Paquete utilizado para agrupar todos los procedimientos y funciones
                   de utilidades como declaraciones de variables, tipos, listas genericas,
                   registro de log de operaciones, registro de excepciones, mensajes de respuesta

  REALIZADO POR    : Hugo Armando Cendales Prieto
  FECHA CREACION    : 31/08/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:
  *******************************************************************************/
  NOMBRE_PAQUETE CONSTANT VARCHAR2(100) := 'PK_UTL_UTILIDAD';

  TYPE CURSOR_SALIDA IS REF CURSOR;


  -- Funciones y Procedimientos del paquete

  FUNCTION fn_ObtenerId(p_nombreSeq IN VARCHAR2) RETURN NUMBER;

  PROCEDURE pr_RegistrarDebug(p_nivelDebug    IN NUMBER,
                              p_paquete       IN VARCHAR2,
                              p_procedimiento IN VARCHAR2,
                              p_usuario       IN NUMBER,
                              p_descripcion   IN VARCHAR2);

  FUNCTION fn_ObtenerMensaje(p_codError IN VARCHAR2) RETURN VARCHAR2;

  FUNCTION fn_RegistrarExcepcion(p_usuario       IN NUMBER,
                                 p_paquete       IN VARCHAR2,
                                 p_procedimiento IN VARCHAR2,
                                 p_codError      IN NUMBER,
                                 p_msjError      IN VARCHAR2) RETURN NUMBER;

  FUNCTION fn_RegistrarAuditoria(p_a996idobjeto      IN number,
                                 p_a996objeto        IN varchar2,
                                 p_a996operacion     IN varchar2,
                                 p_a996usuario       IN number,
                                 p_a996procedimiento IN varchar2,
                                 p_a996paquete       IN varchar2) RETURN NUMBER;


  PROCEDURE Pr_ConsultarLista(p_categoria IN VARCHAR2,
                              p_datRespuesta OUT CURSOR_SALIDA,
                              p_codError  OUT NUMBER,
                              p_msjError  OUT VARCHAR2);
end PK_UTL_UTILIDAD;
/
CREATE OR REPLACE PACKAGE BODY "PK_UTL_UTILIDAD" is

  /********************************************************************************
   DESCRIPCION   : Funcion para asignar los consecutivos a los identificadores
                   de llave primaria

   PARAMETROS    :
   IN            : p_nombreSeq    Nombre de la secuencia correspondiente de la tabla
                                   a la que se le va a generar el consecutivo

   OUT           : p_valor    Retorna el consecutivo respectivo de la tabla

  REALIZADO POR    : Hugo Armando Cendales Prieto
  FECHA CREACION   : 31/AGO/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:
  *******************************************************************************/

  FUNCTION fn_ObtenerId(p_nombreSeq IN VARCHAR2) RETURN NUMBER IS

    sentencia VARCHAR2(1000);
    p_valor   NUMBER;

  BEGIN

    sentencia := 'SELECT ' || p_nombreSeq || '.NEXTVAL FROM DUAL';
    EXECUTE IMMEDIATE sentencia
      INTO p_valor;

    RETURN p_valor;

  END fn_ObtenerId;

  /********************************************************************************
  DESCRIPCION    : Procedimiento para registrar los mensajes de depuracion
                   Se activan los mensajes utilizando las tablas de
                   NIVEL_DEPURACION_SISTEMA, NIVEL_DEPURACION_PROCEDIMIENTO

  PARAMETROS    :
  IN    :
          p_nivelDepuracion          Nivel del mensaje
          p_paquete                  Nombre del paquete
          p_procedimiento            Nombre del procedimiento
          p_usuario                  Usuario que realiza la operacion
          p_descripcion              Descripcion de la operacion realizada

  OUT    :
          p_codError        Codigo de error generado
          p_msjError        Mensaje del error generado

  REALIZADO POR    : Hugo Armando Cendales Prieto
  FECHA CREACION    : 31/AGO/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:

  *******************************************************************************/
  PROCEDURE pr_RegistrarDebug(p_nivelDebug    IN NUMBER,
                              p_paquete       IN VARCHAR2,
                              p_procedimiento IN VARCHAR2,
                              p_usuario       IN NUMBER,
                              p_descripcion   IN VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO varchar2(50) := 'pr_RegistraDebug';

    numReg           number;
    nivelActualDebug number;

    codExcepcion number;

    p_a997codigo NUMBER;

  BEGIN

    -- validar si el paquete y procedimiento tienen debug activo
    select count(*)
      into numReg
      from debt_t901_nivel_procedimiento
     where a901paquete = p_paquete
       and a901procedimiento = p_procedimiento
       and a901estadoRegistro = PK_UTL_CONSTANTE.COD_ACTIVO;

    -- Si no esta parametrizado no registra debug
    if (numReg = 0) then
      return;
    end if;

    -- validar nivel de log activo

    select a900codigo
      into nivelActualDebug
      from debt_t900_nivel_sistema
     where a900estadoregistro = PK_UTL_CONSTANTE.COD_ACTIVO;

    -- No hay ningun nivel activado
    if (nivelActualDebug is null) then
      return;
    end if;

    -- Si el nivel actual es menor que el del mensaje no registrar
    if (nivelActualDebug < p_nivelDebug) then
      return;
    end if;

    pk_t997_mensaje_debug.Pr_Insertar(SYSDATE,
                                      p_usuario,
                                      p_paquete,
                                      p_procedimiento,
                                      p_descripcion,
                                      p_nivelDebug,
                                      p_a997codigo);

  EXCEPTION
    WHEN OTHERS THEN
      codExcepcion := PK_UTL_UTILIDAD.fn_RegistrarExcepcion(PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                            NOMBRE_PAQUETE,
                                                            NOMBRE_PROCEDIMIENTO,
                                                            SQLCODE,
                                                            SQLERRM);

  END pr_RegistrarDebug;

  /********************************************************************************
   DESCRIPCION   : Funcion para devolver el mensaje de respuesta

   PARAMETROS    :
   IN            : p_codError    Codigo del error

   OUT           : p_msjRespuesta    Retorna el mensaje de respuesta

  REALIZADO POR    : Hugo Armando Cendales Prieto
  FECHA CREACION   : 31/AGO/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:

  *******************************************************************************/
  FUNCTION fn_ObtenerMensaje(p_codError IN VARCHAR2) RETURN VARCHAR2 IS

    CURSOR c_msj IS
      SELECT a999mensaje
        FROM sist_t999_mensaje_respuesta
       WHERE a999codigo = p_codError
         AND a999estadoRegistro = PK_UTL_CONSTANTE.COD_ACTIVO;

    p_msjRespuesta sist_t999_mensaje_respuesta.a999mensaje%TYPE;

  BEGIN

    OPEN c_msj;
    FETCH c_msj
      INTO p_msjRespuesta;
    CLOSE c_msj;

    IF p_msjRespuesta IS NULL THEN

      p_msjRespuesta := 'MENSAJE NO PARAMETRIZADO ' || p_codError;

    END IF;

    RETURN p_msjRespuesta;

  END fn_ObtenerMensaje;

  /********************************************************************************
   DESCRIPCION   : Funcion para registrar excepcion del sistema y retornar el codigo asignado

   PARAMETROS    :
   IN            :         p_usuario        Usuario que esta ejecutando la operacion,
                           p_paquete        Paquete donde se genero la excepcion,
                           p_procedimiento  Procedimiento que genero la excepcio,
                           p_codError       Codigo de error generado por oracle,
                           p_msjError       Descripcion de la excepcion generado por oracle

   OUT           : p_codigoExcepcion    Retorna el codigo de excepcion

  REALIZADO POR    : Hugo Armando Cendales Prieto
  FECHA CREACION   : 31/AGO/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:

  *******************************************************************************/
  FUNCTION fn_RegistrarExcepcion(p_usuario       IN NUMBER,
                                 p_paquete       IN VARCHAR2,
                                 p_procedimiento IN VARCHAR2,
                                 p_codError      IN NUMBER,
                                 p_msjError      IN VARCHAR2) RETURN NUMBER IS

    v_codigoExcepcion number;
  BEGIN

    -- REGISTRA EXCEPCION EN TABLA T98

    pk_t998_excepcion.pr_insertar(SYSDATE,
                                  p_usuario,
                                  p_paquete,
                                  p_procedimiento,
                                  p_codError,
                                  p_msjError,
                                  v_codigoExcepcion);

    return v_codigoExcepcion;

  END fn_RegistrarExcepcion;

  /********************************************************************************
   DESCRIPCION   : Funcion para registrar la auditoria sobre los datos

   PARAMETROS    :
  IN    :
                        p_a996idobjeto      Id del objeto afectado
                        p_a996objeto        Nombre de la tabla afectada
                        p_a996operacion     Operacion realizada : ELIMINAR, INSERTAR, ACTUALIZAR
                        p_a996usuario       Id del usuario que realiza operacion
                        p_a996procedimiento Procedimiento que realizo operacion
                        p_a996paquete       Paquete donde esta procedimiento

  OUT    :
          p_a996codigo Id del registro creado en auditoria

  REALIZADO POR    : Hugo Armando Cendales Prieto
  FECHA CREACION   : 05/OCT/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:

  *******************************************************************************/
  FUNCTION fn_RegistrarAuditoria(p_a996idobjeto      IN number,
                                 p_a996objeto        IN varchar2,
                                 p_a996operacion     IN varchar2,
                                 p_a996usuario       IN number,
                                 p_a996procedimiento IN varchar2,
                                 p_a996paquete       IN varchar2)
    RETURN NUMBER IS

    p_a996codigo number;
  BEGIN

    -- REGISTRA AUDITORIA EN TABLA T996

    pk_t996_auditoria.pr_insertar(p_a996idobjeto,
                                  p_a996objeto,
                                  p_a996operacion,
                                  p_a996usuario,
                                  p_a996procedimiento,
                                  p_a996paquete,
                                  p_a996codigo);

    return p_a996codigo;

  END fn_RegistrarAuditoria;

  /********************************************************************************
  DESCRIPCION    : Procedimiento para consultar las diferentes listas por categoria

  PARAMETROS    :
  IN    :
          p_categoria    Valor de la categoria a consultar
          p_filtro       Valor del filtro sobre la lista

  OUT    :
          p_resultado       Cursor con el resultado generado
          p_codError        Codigo de error generado
          p_msjError        Mensaje del error generado

  REALIZADO POR    : Hugo Cendales Prieto


  FECHA CREACION    : 05/OCT/2016

  FECHA MODIFICA    : dd/mmm/yyyy
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:

  *******************************************************************************/
  PROCEDURE Pr_ConsultarLista(p_categoria IN VARCHAR2,
                              p_datRespuesta OUT CURSOR_SALIDA,
                              p_codError  OUT NUMBER,
                              p_msjError  OUT VARCHAR2) IS

    codExcepcion         NUMBER;
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ConsultarLista';
    numReg               NUMBER;
    SIN_REGISTRO_ACTIVO  EXCEPTION;

  BEGIN

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => 0,
                                      p_descripcion   => 'Entro a Pr_ConsultarLista ' ||
                                                         p_categoria);

    -- VALIDAR QUE ESTE PRESENTE LA CATEGORIA
    IF p_categoria IS NULL THEN
      p_codError := 2;
      p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
      return;
    END IF;

    BEGIN
       SELECT COUNT(*)
         INTO numReg
         FROM PART_T102_lista, PART_T101_categoria
        WHERE A102CATEGORIA = A101CODIGO
          AND upper(A101NOMBRE) = upper(p_categoria)
          AND A102ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;
           --dbms_output.put_line('****numReg:' || numReg);

      IF numReg > 0 THEN
         OPEN p_datRespuesta FOR
         SELECT A102CODIGO idItem,
                A102VALOR valorItem,
                A102VALORCORTO valorItem2
           FROM PART_T102_lista, PART_T101_categoria
          WHERE A102CATEGORIA = A101CODIGO
            AND upper(A101NOMBRE) = upper(p_categoria)
            AND A102ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO
            ORDER BY A102VALOR;
    ELSE
        RAISE SIN_REGISTRO_ACTIVO;
    END IF;

    EXCEPTION
      WHEN SIN_REGISTRO_ACTIVO THEN
        p_codError := 3;
        p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
        return;
      WHEN NO_DATA_FOUND THEN
        p_codError := 3;
        p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
        return;
    END;

    p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
    p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => 0,
                                      p_descripcion   => 'Salio de Pr_ConsultarLista ' ||
                                                         p_categoria);

    p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
    p_msjError := pk_utl_utilidad.fn_ObtenerMensaje(p_codError);

  EXCEPTION

    WHEN OTHERS THEN

      ROLLBACK;

      codExcepcion := PK_UTL_UTILIDAD.fn_RegistrarExcepcion(PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                            NOMBRE_PAQUETE,
                                                            NOMBRE_PROCEDIMIENTO,
                                                            SQLCODE,
                                                            SQLERRM);

      p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
      p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL ||
                    TO_CHAR(codExcepcion);

  end Pr_ConsultarLista;

end PK_UTL_UTILIDAD;
/
