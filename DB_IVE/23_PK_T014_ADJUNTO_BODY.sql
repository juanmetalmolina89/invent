CREATE OR REPLACE PACKAGE BODY "PK_T014_ADJUNTO" is

  /********************************************************************************
  DESCRIPCION       : Procedimiento para insertar un documento adjunto
  PARAMETROS        :
  IN    :
            p_A014NOMBREADJUNTO          Nombre del adjunto
            p_A014RUTAADJUNTO               Ruta del adjunto
            p_A014IDINVENTARIO        Identificador del Inventario asociado
            p_idUsuario                  Id del usuario logueado en el sistema

  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C?digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 14/12/2016

  FECHA MODIFICA    : 
  MODIFICADO POR    : 
  DESCRIPCION CAMBIO: 
  *******************************************************************************/

PROCEDURE Pr_Insertar (p_A014NOMBREADJUNTO IN IVET_T014_ADJUNTO.A014NOMBREADJUNTO%TYPE,
                       p_A014RUTAADJUNTO   IN IVET_T014_ADJUNTO.A014RUTAADJUNTO%TYPE,
                       p_A014IDINVENTARIO  IN IVET_T014_ADJUNTO.A014IDINVENTARIO%TYPE,
                       p_idUsuario         IN NUMBER,
                       p_resultado         OUT CURSOR_SALIDA,
                       p_codError          OUT NUMBER,
                       p_msjError          OUT VARCHAR2) IS

NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Insertar';
p_A014CODIGO  NUMBER;

BEGIN
      -- obtenemos el siguiente id
      p_A014CODIGO := PK_UTL_UTILIDAD.Fn_Obtenerid('T014_ADJUNTO_SEQ');

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => p_idUsuario,
                                         p_descripcion   => 'Entro a Pr_Insertar ' || p_A014NOMBREADJUNTO);

      INSERT INTO IVET_T014_ADJUNTO(A014CODIGO,
                                    A014NOMBREADJUNTO,
                                    A014RUTAADJUNTO,
                                    A014IDINVENTARIO,
                                    A014ESTADOREGISTRO,
                                    A014FECHACREACION,
                                    A014USUARIOCREACION)
                            VALUES (p_A014CODIGO,
                                    p_A014NOMBREADJUNTO, 
                                    p_A014RUTAADJUNTO, 
                                    p_A014IDINVENTARIO,
                                    PK_UTL_CONSTANTE.COD_ACTIVO, 
                                    sysdate, 
                                    p_idUsuario);
                                    
      OPEN p_resultado FOR SELECT p_A014CODIGO A014CODIGO FROM dual;
      p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
      p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError); 

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Insertar ' || p_A014NOMBREADJUNTO);

  END Pr_Insertar;
  
    /********************************************************************************
  DESCRIPCION       : Procedimiento para eliminar un documento adjunto (borrado l?gico)
  PARAMETROS        :
  IN    :
            p_A014CODIGO                 C?digo identificado del registro
            p_idUsuario                  Id del usuario logueado en el sistema

  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C?digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 14/12/2016

  FECHA MODIFICA    : 
  MODIFICADO POR    : 
  DESCRIPCION CAMBIO: 
  *******************************************************************************/

PROCEDURE Pr_Eliminar (p_A014CODIGO  IN IVET_T014_ADJUNTO.A014CODIGO%TYPE,
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
                                       p_descripcion   => 'Entro a Pr_Eliminar ' || p_A014CODIGO);

              UPDATE IVET_T014_ADJUNTO 
                 SET A014ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_INACTIVO, 
                     A014FECHAMODIFICACION = sysdate,
                     A014USUARIOMODIFICACION = p_idUsuario 
               WHERE A014CODIGO = p_A014CODIGO;
               
              OPEN p_resultado FOR SELECT '' FROM dual;
              p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
              p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Eliminar ' || p_A014CODIGO);

  END Pr_Eliminar;
  
  /********************************************************************************
  DESCRIPCION       : Procedimiento para actualizar un documento adjunto
  PARAMETROS        :
  IN    :
            p_A014NOMBREADJUNTO          Nombre del adjunto
            p_A014RUTAADJUNTO               Ruta del adjunto
            p_A014IDINVENTARIO        Identificador del Inventario asociado
            p_idUsuario                  Id del usuario logueado en el sistema

  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C?digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 14/12/2016

  FECHA MODIFICA    : 
  MODIFICADO POR    : 
  DESCRIPCION CAMBIO: 
  *******************************************************************************/

PROCEDURE Pr_Actualizar (p_A014CODIGO IN  IVET_T014_ADJUNTO.A014CODIGO%TYPE,
                         p_A014NOMBREADJUNTO IN  IVET_T014_ADJUNTO.A014NOMBREADJUNTO%TYPE,
                         p_A014RUTAADJUNTO IN  IVET_T014_ADJUNTO.A014RUTAADJUNTO%TYPE,
                         p_A014IDINVENTARIO IN  IVET_T014_ADJUNTO.A014IDINVENTARIO%TYPE,
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
                                       p_descripcion   => 'Entro a Pr_Actualizar ' || p_A014CODIGO);


      IF p_A014CODIGO IS NULL THEN
         p_codError := 4;
         p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
         OPEN p_resultado FOR SELECT '' FROM dual;
         return;
      END IF;

      SELECT COUNT(*) INTO numReg 
        FROM IVET_T014_ADJUNTO 
       WHERE A014CODIGO = p_A014CODIGO 
         AND A014ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;
         
      IF numReg > 0 THEN
      
         UPDATE IVET_T014_ADJUNTO SET A014NOMBREADJUNTO=NVL(p_A014NOMBREADJUNTO, A014NOMBREADJUNTO),
                                      A014RUTAADJUNTO=NVL(p_A014RUTAADJUNTO,A014RUTAADJUNTO),
                                      A014IDINVENTARIO=NVL(p_A014IDINVENTARIO,A014IDINVENTARIO),
                                      A014FECHAMODIFICACION = sysdate,
                                      A014USUARIOMODIFICACION = p_idUsuario WHERE A014CODIGO = p_A014CODIGO;
         
         OPEN p_resultado FOR SELECT p_A014CODIGO A014CODIGO FROM dual;
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
                 p_descripcion   => 'Salio de Pr_Actualizar ' || p_A014CODIGO);

    p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
    p_msjError := pk_utl_utilidad.fn_ObtenerMensaje(p_codError);

  END Pr_Actualizar;

  /********************************************************************************
  DESCRIPCION       : Procedimiento para consultar un documento adjunto mediante un filtro
  PARAMETROS        :
  IN    :
            p_A014NOMBREADJUNTO          Nombre del adjunto
            p_A014RUTAADJUNTO               Ruta del adjunto
            p_A014IDINVENTARIO        Identificador del Inventario asociado
            p_idUsuario                  Id del usuario logueado en el sistema

  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C?digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 14/12/2016

  FECHA MODIFICA    : 
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
           FROM IVET_T014_ADJUNTO
          WHERE A014ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;
          
         p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
         p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
         return;
         
      END IF;
      
         strSQL := 'SELECT * FROM IVET_T014_ADJUNTO  WHERE ' || p_Filtro ||' AND A014ESTADOREGISTRO ='''
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

end PK_T014_ADJUNTO;