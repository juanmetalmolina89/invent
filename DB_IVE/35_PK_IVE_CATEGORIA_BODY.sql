CREATE OR REPLACE PACKAGE BODY "PK_IVE_CATEGORIA" is

   /********************************************************************************
  DESCRIPCION       : Procedimiento para registrar un inventario
  PARAMETROS        :
  IN    :
            p_A009NOMCATEMISION          Nombre de la Categoria de Emision asociada al Inventario
            p_A009DESCCATEMISION         Descripcion de la Categoria de Emision asociada al Inventario
            p_A009IDTIPOCATEMISION       Identificador del tipo de Categor?a de emsion
            p_A009IDINVENTARIO           Identificador del Inventario
            p_A009IDTIPOCOMBUSTIBLE      Identificador del tipo de combustible
            p_A009CODIGOCIIU             COdigo de actividad CIIU
            p_A009CILINDRAJE             Cilindraje (aplica para fuentes moviles)
            p_A009ANIOMODELO             A?o / Modelo (aplica para fuentes moviles)
            p_A009NROFUENTES             N?mero estimado de fuentes de emision
            p_A009DETMETODFUENTES        Detalle del metodo de estimacion de fuentes de emision
            p_A009IDMETODOEMISION        M?todo con el que se determinO la emisiOn
            p_A009OBSERVACION            ObservaciOn de la categor?a
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

  PROCEDURE Pr_RegistrarCategoria (p_A009NOMCATEMISION       IN IVET_T009_CATEGEMISION.A009NOMCATEMISION%TYPE,
                                   p_A009DESCCATEMISION      IN IVET_T009_CATEGEMISION.A009DESCCATEMISION%TYPE,
                                   p_A009IDTIPOCATEMISION    IN IVET_T009_CATEGEMISION.A009IDTIPOCATEMISION%TYPE,
                                   p_A009IDINVENTARIO        IN IVET_T009_CATEGEMISION.A009IDINVENTARIO%TYPE,
                                   p_A009IDTIPOCOMBUSTIBLE   IN IVET_T009_CATEGEMISION.A009IDTIPOCOMBUSTIBLE%TYPE,
                                   p_A009CILINDRAJE          IN IVET_T009_CATEGEMISION.A009CILINDRAJE%TYPE,
                                   p_A009ANIOMODELO          IN IVET_T009_CATEGEMISION.A009ANIOMODELO%TYPE,
                                   p_A009NROFUENTES          IN IVET_T009_CATEGEMISION.A009NROFUENTES%TYPE,
                                   p_A009DETMETODFUENTES     IN IVET_T009_CATEGEMISION.A009DETMETODFUENTES%TYPE,
                                   p_A009IDMETODOEMISION     IN IVET_T009_CATEGEMISION.A009IDMETODOEMISION%TYPE,
                                   p_A009OBSERVACION         IN IVET_T009_CATEGEMISION.A009OBSERVACION%TYPE,
                                   p_idUsuario               IN NUMBER,
                                   p_Respuesta               OUT CURSOR_SALIDA,
                                   p_codError                OUT NUMBER,
                                   p_msjError                OUT VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_RegistrarCategoria';
    codExcepcion         NUMBER;

    BEGIN
      PK_T009_CATEGEMISION.Pr_Insertar (p_A009NOMCATEMISION => p_A009NOMCATEMISION,
                                        p_A009DESCCATEMISION => p_A009DESCCATEMISION,
                                        p_A009IDTIPOCATEMISION => p_A009IDTIPOCATEMISION,
                                        p_A009IDINVENTARIO => p_A009IDINVENTARIO,
                                        p_A009IDTIPOCOMBUSTIBLE => p_A009IDTIPOCOMBUSTIBLE,
                                        p_A009CILINDRAJE => p_A009CILINDRAJE,
                                        p_A009ANIOMODELO => p_A009ANIOMODELO,
                                        p_A009NROFUENTES => p_A009NROFUENTES,
                                        p_A009DETMETODFUENTES => p_A009DETMETODFUENTES,
                                        p_A009IDMETODOEMISION => p_A009IDMETODOEMISION,
                                        p_A009OBSERVACION => p_A009OBSERVACION,
                                        p_idUsuario => p_IdUsuario,
                                        p_resultado => p_Respuesta,
                                        p_codError => p_codError,
                                        p_msjError => p_msjError);
    EXCEPTION
       WHEN OTHERS THEN
          ROLLBACK;
          codExcepcion := PK_UTL_UTILIDAD.Fn_RegistrarExcepcion (PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                                 NOMBRE_PAQUETE,
                                                                 NOMBRE_PROCEDIMIENTO,
                                                                 SQLCODE,
                                                                 SQLERRM);
          OPEN p_Respuesta FOR SELECT '' FROM dual;
          p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
          p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);

  END Pr_RegistrarCategoria;

  PROCEDURE Pr_ActualizarCategoria (p_A009CODIGO            IN IVET_T009_CATEGEMISION.A009CODIGO%TYPE,
                                    p_A009NOMCATEMISION       IN IVET_T009_CATEGEMISION.A009NOMCATEMISION%TYPE,
                                    p_A009DESCCATEMISION      IN IVET_T009_CATEGEMISION.A009DESCCATEMISION%TYPE,
                                    p_A009IDTIPOCATEMISION    IN IVET_T009_CATEGEMISION.A009IDTIPOCATEMISION%TYPE,
                                    p_A009IDINVENTARIO        IN IVET_T009_CATEGEMISION.A009IDINVENTARIO%TYPE,
                                    p_A009IDTIPOCOMBUSTIBLE   IN IVET_T009_CATEGEMISION.A009IDTIPOCOMBUSTIBLE%TYPE,
                                    p_A009CILINDRAJE          IN IVET_T009_CATEGEMISION.A009CILINDRAJE%TYPE,
                                    p_A009ANIOMODELO          IN IVET_T009_CATEGEMISION.A009ANIOMODELO%TYPE,
                                    p_A009NROFUENTES          IN IVET_T009_CATEGEMISION.A009NROFUENTES%TYPE,
                                    p_A009DETMETODFUENTES     IN IVET_T009_CATEGEMISION.A009DETMETODFUENTES%TYPE,
                                    p_A009IDMETODOEMISION     IN IVET_T009_CATEGEMISION.A009IDMETODOEMISION%TYPE,
                                    p_A009OBSERVACION         IN IVET_T009_CATEGEMISION.A009OBSERVACION%TYPE,
                                    p_idUsuario               IN NUMBER,
                                    p_Respuesta               OUT CURSOR_SALIDA,
                                    p_codError                OUT NUMBER,
                                    p_msjError                OUT VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ActualizarInventario';
    codExcepcion         NUMBER;

    BEGIN
      PK_T009_CATEGEMISION.Pr_Actualizar (p_A009CODIGO => p_A009CODIGO,
                                          p_A009NOMCATEMISION => p_A009NOMCATEMISION,
                                          p_A009DESCCATEMISION => p_A009DESCCATEMISION,
                                          p_A009IDTIPOCATEMISION => p_A009IDTIPOCATEMISION,
                                          p_A009IDINVENTARIO => p_A009IDINVENTARIO,
                                          p_A009IDTIPOCOMBUSTIBLE => p_A009IDTIPOCOMBUSTIBLE,
                                          p_A009CILINDRAJE => p_A009CILINDRAJE,
                                          p_A009ANIOMODELO => p_A009ANIOMODELO,
                                          p_A009NROFUENTES => p_A009NROFUENTES,
                                          p_A009DETMETODFUENTES => p_A009DETMETODFUENTES,
                                          p_A009IDMETODOEMISION => p_A009IDMETODOEMISION,
                                          p_A009OBSERVACION => p_A009OBSERVACION,
                                          p_idUsuario => p_IdUsuario,
                                          p_resultado => p_Respuesta,
                                          p_codError => p_codError,
                                          p_msjError => p_msjError);
    EXCEPTION
       WHEN OTHERS THEN
          ROLLBACK;
          codExcepcion := PK_UTL_UTILIDAD.Fn_RegistrarExcepcion (PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                                 NOMBRE_PAQUETE,
                                                                 NOMBRE_PROCEDIMIENTO,
                                                                 SQLCODE,
                                                                 SQLERRM);
          OPEN p_Respuesta FOR SELECT '' FROM dual;
          p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
          p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);

  END Pr_ActualizarCategoria;
  
  PROCEDURE Pr_ConsultarCategoriaId (p_A009CODIGO IN  IVET_T009_CATEGEMISION.A009CODIGO%TYPE,
                                     p_idUsuario IN NUMBER,
                                     p_Respuesta OUT CURSOR_SALIDA,
                                     p_codError OUT NUMBER,
                                     p_msjError OUT VARCHAR2) IS
      
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ConsultarCategoriaId';
    codExcepcion         NUMBER;    
    
    BEGIN 
       PK_T009_CATEGEMISION.Pr_ConsultarPorFiltro (p_Filtro => 'A009CODIGO = ' || p_A009CODIGO,
                                                   p_idUsuario => p_IdUsuario,                         
                                                   p_resultado => p_Respuesta,
                                                   p_codError => p_codError,
                                                   p_msjError => p_msjError);
    EXCEPTION
       WHEN OTHERS THEN
          ROLLBACK;
          codExcepcion := PK_UTL_UTILIDAD.Fn_RegistrarExcepcion (PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                                 NOMBRE_PAQUETE,
                                                                 NOMBRE_PROCEDIMIENTO,
                                                                 SQLCODE,
                                                                 SQLERRM);
          OPEN p_Respuesta FOR SELECT '' FROM dual;
          p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
          p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);
          
  End Pr_ConsultarCategoriaId;
  
  PROCEDURE Pr_ListarCategoria (p_Filtro IN VARCHAR2,
                                p_idUsuario IN NUMBER,
                                p_Respuesta OUT CURSOR_SALIDA,
                                p_codError OUT NUMBER,
                                p_msjError OUT VARCHAR2) IS
      
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ConsultarCategoriaId';
    codExcepcion         NUMBER;    
    
    BEGIN 
       PK_T009_CATEGEMISION.Pr_ConsultarPorFiltro (p_Filtro => NULL,
                                                   p_idUsuario => p_IdUsuario,                         
                                                   p_resultado => p_Respuesta,
                                                   p_codError => p_codError,
                                                   p_msjError => p_msjError);
    EXCEPTION
       WHEN OTHERS THEN
          ROLLBACK;
          codExcepcion := PK_UTL_UTILIDAD.Fn_RegistrarExcepcion (PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                                 NOMBRE_PAQUETE,
                                                                 NOMBRE_PROCEDIMIENTO,
                                                                 SQLCODE,
                                                                 SQLERRM);
          OPEN p_Respuesta FOR SELECT '' FROM dual;
          p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
          p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);
          
  End Pr_ListarCategoria;
  
  procedure Pr_EliminarCategoria (p_A009CODIGO  IN IVET_T009_CATEGEMISION.A009CODIGO%TYPE,
                                  p_idUsuario IN NUMBER,
                                  p_Respuesta OUT CURSOR_SALIDA,
                                  p_codError OUT NUMBER,
                                  p_msjError OUT VARCHAR2) IS
                       
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_EliminarCategoria';
    codExcepcion         NUMBER;

    BEGIN
       PK_T009_CATEGEMISION.Pr_Eliminar (p_A009CODIGO => p_A009CODIGO,
                                         p_idUsuario => p_IdUsuario,
                                         p_resultado => p_Respuesta,
                                         p_codError => p_codError,
                                         p_msjError => p_msjError);

    EXCEPTION
       WHEN OTHERS THEN
          ROLLBACK;
          codExcepcion := PK_UTL_UTILIDAD.fn_RegistrarExcepcion(PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                                NOMBRE_PAQUETE,
                                                                NOMBRE_PROCEDIMIENTO,
                                                                SQLCODE,
                                                                SQLERRM);
          OPEN p_Respuesta FOR SELECT '' FROM dual;
          p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
          p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);                        
                       
  END Pr_EliminarCategoria;
  
    /********************************************************************************
  DESCRIPCION       : Procedimiento para consultar la informaci?n de una categoria mediante la grilla
  PARAMETROS        :
  IN    :
            p_PalabraClave               Par?metro para la busqueda de un usuario
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

  PROCEDURE Pr_ConsultarGrillaCat (p_PalabraClave IN VARCHAR2,
                                p_idUsuario IN NUMBER,
                                p_Respuesta OUT CURSOR_SALIDA,
                                p_codError OUT NUMBER,
                                p_msjError OUT VARCHAR2) IS

    codExcepcion         NUMBER;
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ConsultarGrillaCat';
    p_verif              VARCHAR2(10);
    strSQL               VARCHAR2(500);

   BEGIN

    pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                       p_paquete       => NOMBRE_PAQUETE,
                                       p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                       p_usuario       => p_idUsuario,
                                       p_descripcion   => 'Entro a Pr_ConsultarGrillaCat '
                                       || p_PalabraClave);

    BEGIN

      p_verif := 'PC';

         CASE p_verif
           WHEN NULL THEN
             p_codError := 5;
             p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
             OPEN p_Respuesta FOR SELECT '' FROM dual;
             return;
           WHEN 'PC' THEN
             strSQL := 'SELECT *
                        FROM IVEV_003_CATEGORIA
                        WHERE A009CODIGO LIKE ''%'||p_PalabraClave||'%''' ||
                       'or A009IDTIPOCATEMISION LIKE (''%'||p_PalabraClave||'%'')' ||
					             'or A009NOMCATEMISION LIKE (''%'||p_PalabraClave||'%'')' ||
                       'or DESC_TIPO_CAT_EMISION LIKE (''%'||p_PalabraClave||'%'')' ||
                       'or DESC_ID_TIPO_COMBUSTIBLE LIKE ''%'||p_PalabraClave||'%''' ||
                       'or A009NROFUENTES LIKE ''%'||p_PalabraClave||'%''' ;
             OPEN p_Respuesta FOR strSQL;
             --dbms_output.put_line('strSQL: '|| strSQL);
             p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
             p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
             return;
         END CASE;


    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        p_codError := 5;
        p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
        OPEN p_Respuesta FOR SELECT '' FROM dual;
        return;
    END;

    p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
    p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_ConsultarGrillaCat '
                                      || p_PalabraClave);

  EXCEPTION

    WHEN OTHERS THEN

      ROLLBACK;

      codExcepcion := PK_UTL_UTILIDAD.fn_RegistrarExcepcion(PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                            NOMBRE_PAQUETE,
                                                            NOMBRE_PROCEDIMIENTO,
                                                            SQLCODE,
                                                            SQLERRM);
      OPEN p_Respuesta FOR SELECT '' FROM dual;
      p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
      p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);

  END Pr_ConsultarGrillaCat;

  procedure Pr_RegistrarCatCombustible (p_A010CODCATEMISION     IN IVET_T010_CATEGCOMBUSTIBLE.A010CODCATEMISION%TYPE,
                                        p_A010IDTIPOCOMBUSTIBLE IN IVET_T010_CATEGCOMBUSTIBLE.A010IDTIPOCOMBUSTIBLE%TYPE,
                                        p_idUsuario             IN NUMBER,
                                        p_Respuesta             OUT CURSOR_SALIDA,
                                        p_codError              OUT NUMBER,
                                        p_msjError              OUT VARCHAR) IS
                       
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_RegistrarCatCombustible';
    codExcepcion         NUMBER;

    BEGIN
      PK_T010_CATEGCOMBUSTIBLE.Pr_Insertar (p_A010CODCATEMISION => p_A010CODCATEMISION,
                                            p_A010IDTIPOCOMBUSTIBLE => p_A010IDTIPOCOMBUSTIBLE,
                                            p_idUsuario => p_IdUsuario,                         
                                            p_resultado => p_Respuesta,
                                            p_codError => p_codError,
                                            p_msjError => p_msjError);
    EXCEPTION
       WHEN OTHERS THEN
          ROLLBACK;
          codExcepcion := PK_UTL_UTILIDAD.Fn_RegistrarExcepcion (PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                                 NOMBRE_PAQUETE,
                                                                 NOMBRE_PROCEDIMIENTO,
                                                                 SQLCODE,
                                                                 SQLERRM);
          OPEN p_Respuesta FOR SELECT '' FROM dual;
          p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
          p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);                   
                       
  END Pr_RegistrarCatCombustible;
  
  procedure Pr_EliminarCatCombustible (p_A010CODIGO IN IVET_T010_CATEGCOMBUSTIBLE.A010CODIGO%TYPE,
                                       p_idUsuario  IN NUMBER,
                                       p_Respuesta  OUT CURSOR_SALIDA,
                                       p_codError   OUT NUMBER,
                                       p_msjError   OUT VARCHAR2) IS
                       
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_EliminarInvFuente';
    codExcepcion         NUMBER;

    BEGIN
       PK_T010_CATEGCOMBUSTIBLE.Pr_Eliminar (p_A010CODIGO => p_A010CODIGO,
                                             p_idUsuario => p_IdUsuario,
                                             p_resultado => p_Respuesta,
                                             p_codError => p_codError,
                                             p_msjError => p_msjError);

    EXCEPTION
       WHEN OTHERS THEN
          ROLLBACK;
          codExcepcion := PK_UTL_UTILIDAD.fn_RegistrarExcepcion(PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                                NOMBRE_PAQUETE,
                                                                NOMBRE_PROCEDIMIENTO,
                                                                SQLCODE,
                                                                SQLERRM);
          OPEN p_Respuesta FOR SELECT '' FROM dual;
          p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
          p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);                        
                       
  END Pr_EliminarCatCombustible;
  
  PROCEDURE Pr_ConsultarCatCombustible (p_A010CODCATEMISION IN IVET_T010_CATEGCOMBUSTIBLE.A010CODCATEMISION%TYPE,
                                        p_idUsuario IN NUMBER,
                                        p_Respuesta OUT CURSOR_SALIDA,
                                        p_codError OUT NUMBER,
                                        p_msjError OUT VARCHAR2) IS  
                                
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ConsultarCatCombustible';
    codExcepcion         NUMBER;    
    
    BEGIN
       PK_T010_CATEGCOMBUSTIBLE.Pr_ConsultarPorFiltro (p_Filtro => 'A010CODCATEMISION = ' || p_A010CODCATEMISION,
                                                       p_idUsuario => p_IdUsuario,                         
                                                       p_resultado => p_Respuesta,
                                                       p_codError => p_codError,
                                                       p_msjError => p_msjError);
    EXCEPTION
       WHEN OTHERS THEN
          ROLLBACK;
          codExcepcion := PK_UTL_UTILIDAD.Fn_RegistrarExcepcion (PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                                 NOMBRE_PAQUETE,
                                                                 NOMBRE_PROCEDIMIENTO,
                                                                 SQLCODE,
                                                                 SQLERRM);
          OPEN p_Respuesta FOR SELECT '' FROM dual;
          p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
          p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion); 
                                                                 
  END Pr_ConsultarCatCombustible;
  
  procedure Pr_RegistrarCatCIIU (p_A017CODCATEMISION IN IVET_T017_CATGEMIS_CIIU.A017CODCATEMISION%TYPE,
                                 p_A017IDCODCIIU     IN IVET_T017_CATGEMIS_CIIU.A017IDCODCIIU%TYPE,
                                 p_idUsuario         IN NUMBER,
                                 p_Respuesta         OUT CURSOR_SALIDA,
                                 p_codError          OUT NUMBER,
                                 p_msjError          OUT VARCHAR) IS
                       
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_RegistrarCatCIIU';
    codExcepcion         NUMBER;

    BEGIN
      PK_T017_CATGEMIS_CIIU.Pr_Insertar (p_A017CODCATEMISION => p_A017CODCATEMISION,
                                            p_A017IDCODCIIU => p_A017IDCODCIIU,
                                            p_idUsuario => p_IdUsuario,                         
                                            p_resultado => p_Respuesta,
                                            p_codError => p_codError,
                                            p_msjError => p_msjError);
    EXCEPTION
       WHEN OTHERS THEN
          ROLLBACK;
          codExcepcion := PK_UTL_UTILIDAD.Fn_RegistrarExcepcion (PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                                 NOMBRE_PAQUETE,
                                                                 NOMBRE_PROCEDIMIENTO,
                                                                 SQLCODE,
                                                                 SQLERRM);
          OPEN p_Respuesta FOR SELECT '' FROM dual;
          p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
          p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);                   
                       
  END Pr_RegistrarCatCIIU;
  
  procedure Pr_EliminarCatCIIU (p_A017CODIGO IN IVET_T017_CATGEMIS_CIIU.A017CODIGO%TYPE,
                                p_idUsuario  IN NUMBER,
                                p_Respuesta  OUT CURSOR_SALIDA,
                                p_codError   OUT NUMBER,
                                p_msjError   OUT VARCHAR2) IS
                       
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_EliminarCatCIIU';
    codExcepcion         NUMBER;

    BEGIN
       PK_T017_CATGEMIS_CIIU.Pr_Eliminar (p_A017CODIGO => p_A017CODIGO,
                                             p_idUsuario => p_IdUsuario,
                                             p_resultado => p_Respuesta,
                                             p_codError => p_codError,
                                             p_msjError => p_msjError);

    EXCEPTION
       WHEN OTHERS THEN
          ROLLBACK;
          codExcepcion := PK_UTL_UTILIDAD.fn_RegistrarExcepcion(PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                                NOMBRE_PAQUETE,
                                                                NOMBRE_PROCEDIMIENTO,
                                                                SQLCODE,
                                                                SQLERRM);
          OPEN p_Respuesta FOR SELECT '' FROM dual;
          p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
          p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);                        
                       
  END Pr_EliminarCatCIIU;
  
  PROCEDURE Pr_ConsultarCIIU (p_A009CODIGO IN IVET_T009_CATEGEMISION.A009CODIGO%TYPE,
                              p_idUsuario IN NUMBER,
                              p_Respuesta OUT CURSOR_SALIDA,
                              p_codError OUT NUMBER,
                              p_msjError OUT VARCHAR2) IS  
                                
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ConsultarCIIU';
    codExcepcion         NUMBER;    
    
    BEGIN 
       PK_T017_CATGEMIS_CIIU.Pr_ConsultarPorFiltro (p_Filtro => 'A009CODIGO = ' || p_A009CODIGO,
                                                       p_idUsuario => p_IdUsuario,                         
                                                       p_resultado => p_Respuesta,
                                                       p_codError => p_codError,
                                                       p_msjError => p_msjError);
    EXCEPTION
       WHEN OTHERS THEN
          ROLLBACK;
          codExcepcion := PK_UTL_UTILIDAD.Fn_RegistrarExcepcion (PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                                 NOMBRE_PAQUETE,
                                                                 NOMBRE_PROCEDIMIENTO,
                                                                 SQLCODE,
                                                                 SQLERRM);
          OPEN p_Respuesta FOR SELECT '' FROM dual;
          p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
          p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion); 
                                                                 
  END Pr_ConsultarCIIU;


   /********************************************************************************
  DESCRIPCION       : Procedimiento para registrar un contaminante
  PARAMETROS        :
  IN    :
            p_A009NOMCATEMISION          Nombre de la Categoria de Emision asociada al Inventario
            p_A009DESCCATEMISION         Descripcion de la Categoria de Emision asociada al Inventario
            p_A009IDTIPOCATEMISION       Identificador del tipo de Categor?a de emsion
            p_A009IDINVENTARIO           Identificador del Inventario
            p_A009IDTIPOCOMBUSTIBLE      Identificador del tipo de combustible
            p_A009CODIGOCIIU             COdigo de actividad CIIU
            p_A009CILINDRAJE             Cilindraje (aplica para fuentes moviles)
            p_A009ANIOMODELO             A?o / Modelo (aplica para fuentes moviles)
            p_A009NROFUENTES             N?mero estimado de fuentes de emision
            p_A009DETMETODFUENTES        Detalle del metodo de estimacion de fuentes de emision
            p_A009IDMETODOEMISION        M?todo con el que se determinO la emisiOn
            p_A009OBSERVACION            ObservaciOn de la categor?a
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

  PROCEDURE Pr_RegistrarContaminante (p_A013IDCATEGORIAEMISION IN  IVET_T013_CATEGCONTAMINA.A013IDCATEGORIAEMISION%TYPE,
                                      p_A013IDCONTAMINANTE IN  IVET_T013_CATEGCONTAMINA.A013IDCONTAMINANTE%TYPE,
                                      p_A013VALORCONTAMINANTE IN  IVET_T013_CATEGCONTAMINA.A013VALORCONTAMINANTE%TYPE,
                                      p_A013FACTORACTIVIDAD IN  IVET_T013_CATEGCONTAMINA.A013FACTORACTIVIDAD%TYPE,
                                      p_A013UNDMEDFACTORACTIV IN  IVET_T013_CATEGCONTAMINA.A013UNDMEDFACTORACTIV%TYPE,
                                      p_A013FTEMETDFACTORACTIV IN  IVET_T013_CATEGCONTAMINA.A013FTEMETDFACTORACTIV%TYPE,
                                      p_A013FACTOREMISION IN  IVET_T013_CATEGCONTAMINA.A013FACTOREMISION%TYPE,
                                      p_A013UNDMEDFACTOREMIS IN  IVET_T013_CATEGCONTAMINA.A013UNDMEDFACTOREMIS%TYPE,
                                      p_A013FTEMETDFACTOREMIS IN  IVET_T013_CATEGCONTAMINA.A013FTEMETDFACTOREMIS%TYPE,
                                      p_idUsuario IN NUMBER,
                                      p_Respuesta OUT CURSOR_SALIDA,
                                      p_codError    OUT NUMBER,
                                      p_msjError  OUT VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_RegistrarCategoria';
    codExcepcion         NUMBER;

    BEGIN
      PK_T013_CATEGCONTAMINA.Pr_Insertar (p_A013IDCATEGORIAEMISION => p_A013IDCATEGORIAEMISION,
                                          p_A013IDCONTAMINANTE => p_A013IDCONTAMINANTE,
                                          p_A013VALORCONTAMINANTE => p_A013VALORCONTAMINANTE,
                                          p_A013FACTORACTIVIDAD => p_A013FACTORACTIVIDAD,
                                          p_A013UNDMEDFACTORACTIV => p_A013UNDMEDFACTORACTIV,
                                          p_A013FTEMETDFACTORACTIV => p_A013FTEMETDFACTORACTIV,
                                          p_A013FACTOREMISION => p_A013FACTOREMISION,
                                          p_A013UNDMEDFACTOREMIS => p_A013UNDMEDFACTOREMIS,
                                          p_A013FTEMETDFACTOREMIS => p_A013FTEMETDFACTOREMIS,
                                          p_idUsuario => p_IdUsuario,
                                          p_resultado => p_Respuesta,
                                          p_codError => p_codError,
                                          p_msjError => p_msjError);
    EXCEPTION
       WHEN OTHERS THEN
          ROLLBACK;
          codExcepcion := PK_UTL_UTILIDAD.Fn_RegistrarExcepcion (PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                                 NOMBRE_PAQUETE,
                                                                 NOMBRE_PROCEDIMIENTO,
                                                                 SQLCODE,
                                                                 SQLERRM);
          OPEN p_Respuesta FOR SELECT '' FROM dual;
          p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
          p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);

  END Pr_RegistrarContaminante;
  
  procedure Pr_EliminarContaminante (p_A013CODIGO IN  IVET_T013_CATEGCONTAMINA.A013CODIGO%TYPE,
                                  p_idUsuario IN NUMBER,
                                  p_Respuesta OUT CURSOR_SALIDA,
                                  p_codError OUT NUMBER,
                                  p_msjError OUT VARCHAR2) IS
                       
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_EliminarCategoria';
    codExcepcion         NUMBER;

    BEGIN
       PK_T013_CATEGCONTAMINA.Pr_Eliminar (p_A013CODIGO => p_A013CODIGO,
                                         p_idUsuario => p_IdUsuario,
                                         p_resultado => p_Respuesta,
                                         p_codError => p_codError,
                                         p_msjError => p_msjError);

    EXCEPTION
       WHEN OTHERS THEN
          ROLLBACK;
          codExcepcion := PK_UTL_UTILIDAD.fn_RegistrarExcepcion(PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                                NOMBRE_PAQUETE,
                                                                NOMBRE_PROCEDIMIENTO,
                                                                SQLCODE,
                                                                SQLERRM);
          OPEN p_Respuesta FOR SELECT '' FROM dual;
          p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
          p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);                        
                       
  END Pr_EliminarContaminante;
  
  PROCEDURE Pr_ActualizarContaminante (p_A013CODIGO IN  IVET_T013_CATEGCONTAMINA.A013CODIGO%TYPE,
                                       p_A013IDCATEGORIAEMISION IN  IVET_T013_CATEGCONTAMINA.A013IDCATEGORIAEMISION%TYPE,
                                       p_A013IDCONTAMINANTE IN  IVET_T013_CATEGCONTAMINA.A013IDCONTAMINANTE%TYPE,
                                       p_A013VALORCONTAMINANTE IN  IVET_T013_CATEGCONTAMINA.A013VALORCONTAMINANTE%TYPE,
                                       p_A013FACTORACTIVIDAD IN  IVET_T013_CATEGCONTAMINA.A013FACTORACTIVIDAD%TYPE,
                                       p_A013UNDMEDFACTORACTIV IN  IVET_T013_CATEGCONTAMINA.A013UNDMEDFACTORACTIV%TYPE,
                                       p_A013FTEMETDFACTORACTIV IN  IVET_T013_CATEGCONTAMINA.A013FTEMETDFACTORACTIV%TYPE,
                                       p_A013FACTOREMISION IN  IVET_T013_CATEGCONTAMINA.A013FACTOREMISION%TYPE,
                                       p_A013UNDMEDFACTOREMIS IN  IVET_T013_CATEGCONTAMINA.A013UNDMEDFACTOREMIS%TYPE,
                                       p_A013FTEMETDFACTOREMIS IN  IVET_T013_CATEGCONTAMINA.A013FTEMETDFACTOREMIS%TYPE,
                                       p_A013EMISIONTOTAL IN  IVET_T013_CATEGCONTAMINA.A013EMISIONTOTAL%TYPE,
                                       p_idUsuario IN NUMBER,
                                       p_Respuesta OUT CURSOR_SALIDA,
                                       p_codError OUT NUMBER,
                                       p_msjError OUT VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ActualizarInventario';
    codExcepcion         NUMBER;

    BEGIN
      PK_T013_CATEGCONTAMINA.Pr_Actualizar (p_A013CODIGO => p_A013CODIGO,
                                          p_A013IDCATEGORIAEMISION => p_A013IDCATEGORIAEMISION,
                                          p_A013IDCONTAMINANTE => p_A013IDCONTAMINANTE, 
                                          p_A013VALORCONTAMINANTE => p_A013VALORCONTAMINANTE,
                                          p_A013FACTORACTIVIDAD => p_A013FACTORACTIVIDAD,
                                          p_A013UNDMEDFACTORACTIV => p_A013UNDMEDFACTORACTIV,
                                          p_A013FTEMETDFACTORACTIV => p_A013FTEMETDFACTORACTIV,
                                          p_A013FACTOREMISION => p_A013FACTOREMISION,
                                          p_A013UNDMEDFACTOREMIS => p_A013UNDMEDFACTOREMIS,
                                          p_A013FTEMETDFACTOREMIS => p_A013FTEMETDFACTOREMIS,
                                          --p_A013EMISIONTOTAL => p_A013EMISIONTOTAL,
                                          p_idUsuario => p_idUsuario,
                                          p_resultado => p_Respuesta,
                                          p_codError => p_codError,
                                          p_msjError => p_msjError);
    EXCEPTION
       WHEN OTHERS THEN
          ROLLBACK;
          codExcepcion := PK_UTL_UTILIDAD.Fn_RegistrarExcepcion (PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                                 NOMBRE_PAQUETE,
                                                                 NOMBRE_PROCEDIMIENTO,
                                                                 SQLCODE,
                                                                 SQLERRM);
          OPEN p_Respuesta FOR SELECT '' FROM dual;
          p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
          p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);

  END Pr_ActualizarContaminante;
  
  
  PROCEDURE Pr_ConsultarContaminanteId (p_A013IDCATEGORIAEMISION IN IVET_T013_CATEGCONTAMINA.A013IDCATEGORIAEMISION%TYPE,
                                        p_idUsuario  IN NUMBER,
                                        p_Respuesta  OUT CURSOR_SALIDA,
                                        p_codError   OUT NUMBER,
                                        p_msjError   OUT VARCHAR2) IS
      
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ConsultarContaminanteId';
    codExcepcion         NUMBER;    
    
    BEGIN 
       PK_T013_CATEGCONTAMINA.Pr_ConsultarPorFiltro (p_Filtro => 'id_categoria = ' || p_A013IDCATEGORIAEMISION,
                                                     p_idUsuario => p_IdUsuario,                         
                                                     p_resultado => p_Respuesta,
                                                     p_codError => p_codError,
                                                     p_msjError => p_msjError);
    EXCEPTION
       WHEN OTHERS THEN
          ROLLBACK;
          codExcepcion := PK_UTL_UTILIDAD.Fn_RegistrarExcepcion (PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                                 NOMBRE_PAQUETE,
                                                                 NOMBRE_PROCEDIMIENTO,
                                                                 SQLCODE,
                                                                 SQLERRM);
          OPEN p_Respuesta FOR SELECT '' FROM dual;
          p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
          p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);
          
  End Pr_ConsultarContaminanteId;
  
    /********************************************************************************
  DESCRIPCION       : Procedimiento para consultar la informaci?n de un contaminante mediante la grilla
  PARAMETROS        :
  IN    :
            p_PalabraClave               Par?metro para la busqueda de un usuario
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

  PROCEDURE Pr_ConsultarGrillaCon (p_PalabraClave IN VARCHAR2,
                                   p_idUsuario IN NUMBER,
                                   p_Respuesta OUT CURSOR_SALIDA,
                                   p_codError OUT NUMBER,
                                   p_msjError OUT VARCHAR2) IS

    codExcepcion         NUMBER;
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ConsultarPorFiltro';
    p_verif              VARCHAR2(10);
    strSQL               VARCHAR2(500);

   BEGIN

    pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                       p_paquete       => NOMBRE_PAQUETE,
                                       p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                       p_usuario       => p_idUsuario,
                                       p_descripcion   => 'Entro a Pr_ConsultarGrilla - PC '
                                       || p_PalabraClave);

    BEGIN

      IF    p_PalabraClave IS NOT NULL THEN
            p_verif := 'PC';--valida si la busqueda es por palabra clave
      ELSE  
            p_verif := 'PC';
      END IF;


         CASE p_verif
           WHEN NULL THEN
             p_codError := 5;
             p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
             OPEN p_Respuesta FOR SELECT '' FROM dual;
             return;
           WHEN 'PC' THEN
             strSQL := 'SELECT *
                        FROM IVEV_004_CONTAMINANTE
                        WHERE cod_contaminante LIKE ''%'||p_PalabraClave||'%''' ||
                       'or a005contaminante LIKE (''%'||p_PalabraClave||'%'')' ||
                       'or id_categoria LIKE (''%'||p_PalabraClave||'%'')' ||
                       'or a009nomcatemision LIKE ''%'||p_PalabraClave||'%''' ||
                       'or a013ftemetdfactoractiv LIKE ''%'||p_PalabraClave||'%'''||
                       'or a013factoractividad LIKE ''%'||p_PalabraClave||'%'''||
                       'or a013undmedfactoractiv LIKE ''%'||p_PalabraClave||'%'''||
                       'or a013ftemetdfactoremis LIKE ''%'||p_PalabraClave||'%'''||
                       'or a013factoremision LIKE ''%'||p_PalabraClave||'%'''||
                       'or a013undmedfactoremis LIKE ''%'||p_PalabraClave||'%'''||
                       'or a013emisiontotal LIKE ''%'||p_PalabraClave||'%''' ;
             OPEN p_Respuesta FOR strSQL;
             --dbms_output.put_line('strSQL: '|| strSQL);
             p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
             p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
             return;
         END CASE;


    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        p_codError := 5;
        p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
        OPEN p_Respuesta FOR SELECT '' FROM dual;
        return;
    END;

    p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
    p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_ConsultarGrilla '
                                      || p_PalabraClave);

  EXCEPTION

    WHEN OTHERS THEN

      ROLLBACK;

      codExcepcion := PK_UTL_UTILIDAD.fn_RegistrarExcepcion(PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                            NOMBRE_PAQUETE,
                                                            NOMBRE_PROCEDIMIENTO,
                                                            SQLCODE,
                                                            SQLERRM);
      OPEN p_Respuesta FOR SELECT '' FROM dual;
      p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
      p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);

  END Pr_ConsultarGrillaCon;
  
end PK_IVE_CATEGORIA;