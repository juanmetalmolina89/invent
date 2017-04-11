CREATE OR REPLACE PACKAGE "PK_T997_MENSAJE_DEBUG" is

  PROCEDURE Pr_Insertar(p_a997fechaoperacion IN sist_t997_mensaje_debug.a997fechaoperacion%TYPE,
                        p_a997usuario        IN sist_t997_mensaje_debug.a997usuario%TYPE,
                        p_a997paquete        IN sist_t997_mensaje_debug.a997paquete%TYPE,
                        p_a997procedimiento  IN sist_t997_mensaje_debug.a997procedimiento%TYPE,
                        p_a997descripcion    IN sist_t997_mensaje_debug.a997descripcion%TYPE,
                        p_a997nivel          IN sist_t997_mensaje_debug.a997nivel%TYPE,
                        p_a997codigo         OUT sist_t997_mensaje_debug.a997codigo%TYPE);

end Pk_T997_MENSAJE_DEBUG;
/
CREATE OR REPLACE PACKAGE BODY "PK_T997_MENSAJE_DEBUG" is

  /********************************************************************************
  DESCRIPCION    : Procedimiento basico que permite realizar la insercion del
                   registro en la tabla T997_MENSAJE_DEBUG
  PARAMETROS    :
  IN    :
          p_a997fechaoperacion
          p_a997usuario
          p_a997paquete
          p_a997procedimiento
          p_a997descripcion
          p_a997nivel

  OUT    :
          p_a997codigo        Codigo generado

  REALIZADO POR     : Hugo Armando Cendales Prieto
  FECHA CREACION    : 18/02/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  CAMBIOS           :
  *******************************************************************************/
  PROCEDURE Pr_Insertar(p_a997fechaoperacion IN sist_t997_mensaje_debug.a997fechaoperacion%TYPE,
                        p_a997usuario        IN sist_t997_mensaje_debug.a997usuario%TYPE,
                        p_a997paquete        IN sist_t997_mensaje_debug.a997paquete%TYPE,
                        p_a997procedimiento  IN sist_t997_mensaje_debug.a997procedimiento%TYPE,
                        p_a997descripcion    IN sist_t997_mensaje_debug.a997descripcion%TYPE,
                        p_a997nivel          IN sist_t997_mensaje_debug.a997nivel%TYPE,
                        p_a997codigo         OUT sist_t997_mensaje_debug.a997codigo%TYPE) IS

    v_a997codigo sist_t997_mensaje_debug.a997codigo%TYPE;

  BEGIN

    p_a997codigo := PK_UTL_UTILIDAD.Fn_Obtenerid('t997_mensaje_debug_SEQ');

    INSERT INTO sist_t997_mensaje_debug
      (a997codigo,
       a997fechaoperacion,
       a997paquete,
       a997procedimiento,
       a997usuario,
       a997descripcion,
       a997nivel)
    VALUES
      (p_a997codigo,
       p_a997fechaoperacion,
       p_a997paquete,
       p_a997procedimiento,
       p_a997usuario,
       p_a997descripcion,
       p_a997nivel);

  END Pr_Insertar;

end Pk_T997_MENSAJE_DEBUG;
/
