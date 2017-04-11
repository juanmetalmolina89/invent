CREATE OR REPLACE PACKAGE "PK_T998_EXCEPCION" is

  PROCEDURE Pr_Insertar(p_a998fechaexcepcion IN SIST_T998_EXCEPCION.a998fechaexcepcion%TYPE,
                        p_a998usuario        IN SIST_T998_EXCEPCION.a998usuario%TYPE,
                        p_a998paquete        IN SIST_T998_EXCEPCION.a998paquete%TYPE,
                        p_a998procedimiento  IN SIST_T998_EXCEPCION.a998procedimiento%TYPE,
                        p_a998coderror       IN SIST_T998_EXCEPCION.a998coderror%TYPE,
                        p_a998msjerror       IN SIST_T998_EXCEPCION.a998msjerror%TYPE,
                        p_a998codigo         OUT SIST_T998_EXCEPCION.a998codigo%TYPE);

end PK_T998_EXCEPCION;
/
CREATE OR REPLACE PACKAGE BODY "PK_T998_EXCEPCION" is

  /********************************************************************************
  DESCRIPCION    : Procedimiento basico que permite realizar la inserciOn del
                   registro en la tabla T998_EXCEPCION
  PARAMETROS    :
  IN    :
          p_a998fechaexcepcion
          p_a998usuario
          p_a998paquete
          p_a998procedimiento
          p_a998coderror
          p_a998msgerror

  OUT    :
          p_a998_codigo

  REALIZADO POR    : Hugo Armando Cendales Prieto
  FECHA CREACION    : 18/AGO/2016

  FECHA MODIFICA      :  dd/MMM/aaaa
  MODIFICADO POR      :
  DESCRIPCION CAMBIOS :
  *******************************************************************************/
  PROCEDURE Pr_Insertar(p_a998fechaexcepcion IN SIST_T998_EXCEPCION.a998fechaexcepcion%TYPE,
                        p_a998usuario        IN SIST_T998_EXCEPCION.a998usuario%TYPE,
                        p_a998paquete        IN SIST_T998_EXCEPCION.a998paquete%TYPE,
                        p_a998procedimiento  IN SIST_T998_EXCEPCION.a998procedimiento%TYPE,
                        p_a998coderror       IN SIST_T998_EXCEPCION.a998coderror%TYPE,
                        p_a998msjerror       IN SIST_T998_EXCEPCION.a998msjerror%TYPE,
                        p_a998codigo         OUT SIST_T998_EXCEPCION.a998codigo%TYPE) IS

  BEGIN

    p_a998codigo := PK_UTL_UTILIDAD.Fn_Obtenerid('T998_EXCEPCION_SEQ');

    INSERT INTO SIST_T998_EXCEPCION
      (a998codigo,
       a998fechaexcepcion,
       a998paquete,
       a998procedimiento,
       a998usuario,
       a998coderror,
       a998msjerror)
    VALUES
      (p_a998codigo,
       p_a998fechaexcepcion,
       p_a998paquete,
       p_a998procedimiento,
       p_a998usuario,
       p_a998coderror,
       p_a998msjerror);

  END Pr_Insertar;

end PK_T998_EXCEPCION;
/
