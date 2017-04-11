CREATE OR REPLACE PACKAGE BODY "PK_T004_GEOMETRIA" is

   /********************************************************************************
  DESCRIPCION       : Procedimiento para insertar geometr?a (GEOJSON) de un inventario
  PARAMETROS        :
  IN    :
            p_A004GEOMETRIA              Geometria del Inventario
            p_A004IDINVENTARIO           Identificador del Inventario asociado
            p_idUsuario                  Id del usuario logueado en el sistema
      
  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C?digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 12/12/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:
  *******************************************************************************/ 

PROCEDURE Pr_Insertar (p_A004GEOMETRIA    CLOB,
                       p_A004IDINVENTARIO IN IVET_T004_GEOMETRIA.A004IDINVENTARIO%TYPE,
                       p_idUsuario        IN NUMBER,
                       p_resultado        OUT CURSOR_SALIDA,
                       p_codError         OUT NUMBER,
                       p_msjError         OUT VARCHAR2) IS

NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Insertar';
p_A004CODIGO  NUMBER;

BEGIN
      -- obtenemos el siguiente id
      p_A004CODIGO := PK_UTL_UTILIDAD.Fn_Obtenerid('T004_GEOMETRIA_SEQ');

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => p_idUsuario,
                                         p_descripcion   => 'Entro a Pr_Insertar ' || p_A004CODIGO);

      INSERT INTO IVET_T004_GEOMETRIA(A004CODIGO,
                                      A004GEOMETRIA,
                                      A004IDINVENTARIO,
                                      A004ESTADOREGISTRO,
                                      A004FECHACREACION,
                                      A004USUARIOCREACION)
                              VALUES (p_A004CODIGO,
                                      p_A004GEOMETRIA, 
                                      p_A004IDINVENTARIO,
                                      PK_UTL_CONSTANTE.COD_ACTIVO, 
                                      sysdate, 
                                      p_idUsuario);
                                      
      --DBMS_LOB.WRITE(A004GEOMETRIA,  p_A004GEOMETRIA);                                  
                                     
      OPEN p_resultado FOR SELECT p_A004CODIGO A004CODIGO FROM dual;
      p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
      p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Insertar ' || p_A004CODIGO);

  END Pr_Insertar;
  
    /********************************************************************************
  DESCRIPCION       : Procedimiento para eliminar geometr?a (GEOJSON) de un inventario (borrado l?gico)
  PARAMETROS        :
  IN    :
            p_A004CODIGO                 Codigo identificador de la geometr?a
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

  PROCEDURE Pr_Eliminar (p_A004CODIGO  IN IVET_T004_GEOMETRIA.A004CODIGO%TYPE,
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
                                       p_descripcion   => 'Entro a Pr_Eliminar ' || p_A004CODIGO);


              UPDATE IVET_T004_GEOMETRIA 
                 SET A004ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_INACTIVO, 
                     A004FECHAMODIFICACION = sysdate,
                     A004USUARIOMODIFICACION = p_idUsuario 
               WHERE A004CODIGO = p_A004CODIGO;
               
              OPEN p_resultado FOR SELECT p_A004CODIGO A004CODIGO FROM dual;
              p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
              p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

              pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                                p_paquete       => NOMBRE_PAQUETE,
                                                p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                                p_usuario       => p_idUsuario,
                                                p_descripcion   => 'Salio de Pr_Eliminar ' || p_A004CODIGO);

  END Pr_Eliminar;
  
   /********************************************************************************
  DESCRIPCION       : Procedimiento para actualizar la geometr?a (GEOJSON) de un inventario
  PARAMETROS        :
  IN    :
            p_A004CODIGO                 Codigo identificador de la geometr?a
            p_A004GEOMETRIA              Geometria del Inventario
            p_A004IDINVENTARIO           Identificador del Inventario asociado
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

  PROCEDURE Pr_Actualizar (p_A004CODIGO IN  IVET_T004_GEOMETRIA.A004CODIGO%TYPE,
                           p_A004GEOMETRIA IN  IVET_T004_GEOMETRIA.A004GEOMETRIA%TYPE,
                           p_A004IDINVENTARIO IN  IVET_T004_GEOMETRIA.A004IDINVENTARIO%TYPE,
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
                                       p_descripcion   => 'Entro a Pr_Actualizar ' || p_A004CODIGO);


      IF p_A004CODIGO IS NULL THEN
         p_codError := 4;
         p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
         OPEN p_resultado FOR SELECT '' FROM dual;
         return;
      END IF;

      SELECT COUNT(*) 
        INTO numReg 
        FROM IVET_T004_GEOMETRIA 
       WHERE A004CODIGO = p_A004CODIGO 
         AND A004ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;
         
      IF numReg > 0 THEN
      
         UPDATE IVET_T004_GEOMETRIA 
            SET A004GEOMETRIA=NVL(p_A004GEOMETRIA, A004GEOMETRIA),
                A004IDINVENTARIO=NVL(p_A004IDINVENTARIO,A004IDINVENTARIO),
                A004FECHAMODIFICACION = sysdate,
                A004USUARIOMODIFICACION = p_idUsuario 
          WHERE A004CODIGO = p_A004CODIGO;
         
         OPEN p_resultado FOR SELECT p_A004CODIGO A004CODIGO FROM dual;
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
                                      p_descripcion   => 'Salio de Pr_Actualizar ' || p_A004CODIGO);

  END Pr_Actualizar;

   /********************************************************************************
  DESCRIPCION       : Procedimiento para consultar una geometr?a por filtro
  PARAMETROS        :
  IN    :
            p_Filtro                     Filtro de b?squeda
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
         FROM IVET_T004_GEOMETRIA
         WHERE A004ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;
         
         p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
         p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
         return;
      END IF;
      
         strSQL := 'SELECT * FROM IVET_T004_GEOMETRIA WHERE ' || p_Filtro ||' AND A004ESTADOREGISTRO ='''
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

end PK_T004_GEOMETRIA;