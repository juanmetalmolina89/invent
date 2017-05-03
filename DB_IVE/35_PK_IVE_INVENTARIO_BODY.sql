create or replace PACKAGE BODY "PK_IVE_INVENTARIO" is

   /********************************************************************************
  DESCRIPCION       : Procedimiento para registrar un inventario
  PARAMETROS        :
  IN    :
            p_A003OBJETO                   Descripci?n del inventario
            p_A003FECHA_INICIAL            Fecha de inicio del inventario
            p_A003FECHA_FINAL              Fecha estimada de finalizaci?n del inventario
            p_A003IDDIVIPOLA               C?digo DIVIPOLA del Municipio donde se desarrolla el Inventario
            p_A003DESCRIPCION_TERRITORIO   Descripci?n del territorio donde se realiza el inventario
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


  PROCEDURE Pr_RegistrarInventario (p_A003OBJETO                 IN IVET_T003_INVENTARIO.A003OBJETO%TYPE,
                                    p_A003FECHA_INICIAL          IN IVET_T003_INVENTARIO.A003FECHA_INICIAL%TYPE,
                                    p_A003FECHA_FINAL            IN IVET_T003_INVENTARIO.A003FECHA_FINAL%TYPE,
                                    p_A003IDDIVIPOLA             IN IVET_T003_INVENTARIO.A003IDDIVIPOLA%TYPE,
                                    p_A003DESCRIPCION_TERRITORIO IN IVET_T003_INVENTARIO.A003DESCRIPCION_TERRITORIO%TYPE,
                                    p_idUsuario                  IN NUMBER,
                                    p_Respuesta                  OUT CURSOR_SALIDA,
                                    p_codError                   OUT NUMBER,
                                    p_msjError                   OUT VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_RegistrarInventario';
    codExcepcion         NUMBER;

    BEGIN
      PK_T003_INVENTARIO.Pr_Insertar (p_A003OBJETO => p_A003OBJETO,
                                      p_A003FECHA_INICIAL => p_A003FECHA_INICIAL,
                                      p_A003FECHA_FINAL => p_A003FECHA_FINAL,
                                      p_A003IDDIVIPOLA => p_A003IDDIVIPOLA,
                                      p_A003DESCRIPCION_TERRITORIO => p_A003DESCRIPCION_TERRITORIO,
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

  END Pr_RegistrarInventario;
  
   /********************************************************************************
  DESCRIPCION       : Procedimiento para actualizar un inventario
  PARAMETROS        :
  IN    :
            p_A003CODIGO                   C?digo identificador del inventario
            p_A003OBJETO                   Descripci?n del inventario
            p_A003FECHA_INICIAL            Fecha de inicio del inventario
            p_A003FECHA_FINAL              Fecha estimada de finalizaci?n del inventario
            p_A003ESTADO_INVENTARIO        Identifica el estado en que se encuentra el inventario
            p_A003IDDIVIPOLA               C?digo DIVIPOLA del Municipio donde se desarrolla el Inventario
            p_A003DESCRIPCION_TERRITORIO   Descripci?n del territorio donde se realiza el inventario
            p_idUsuario                    Id del usuario logueado en el sistema
      
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
  
  PROCEDURE Pr_ActualizarInventario (p_A003CODIGO                 IN IVET_T003_INVENTARIO.A003CODIGO%TYPE,
                                     p_A003OBJETO                 IN IVET_T003_INVENTARIO.A003OBJETO%TYPE,
                                     p_A003FECHA_INICIAL          IN IVET_T003_INVENTARIO.A003FECHA_INICIAL%TYPE,
                                     p_A003FECHA_FINAL            IN IVET_T003_INVENTARIO.A003FECHA_FINAL%TYPE,
                                     p_A003ESTADO_INVENTARIO      IN IVET_T003_INVENTARIO.A003ESTADO_INVENTARIO%TYPE,
                                     p_A003IDDIVIPOLA             IN IVET_T003_INVENTARIO.A003IDDIVIPOLA%TYPE,
                                     p_A003DESCRIPCION_TERRITORIO IN IVET_T003_INVENTARIO.A003DESCRIPCION_TERRITORIO%TYPE,
                                     p_idUsuario                  IN NUMBER,
                                     p_Respuesta                  OUT CURSOR_SALIDA,
                                     p_codError                   OUT NUMBER,
                                     p_msjError                   OUT VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ActualizarInventario';
    codExcepcion         NUMBER;    
    
    BEGIN 
      PK_T003_INVENTARIO.Pr_Actualizar (p_A003CODIGO => p_A003CODIGO,
                                        p_A003OBJETO => p_A003OBJETO,
                                        p_A003FECHA_INICIAL => p_A003FECHA_INICIAL,
                                        p_A003FECHA_FINAL => p_A003FECHA_FINAL,
                                        p_A003ESTADO_INVENTARIO => p_A003ESTADO_INVENTARIO,
                                        p_A003IDDIVIPOLA => p_A003IDDIVIPOLA,
                                        p_A003DESCRIPCION_TERRITORIO => p_A003DESCRIPCION_TERRITORIO,
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
                                  
  END Pr_ActualizarInventario;
  
     /********************************************************************************
  DESCRIPCION       : Procedimiento para consultar un inventario por id
  PARAMETROS        :
  IN    :
            p_A003CODIGO                 C?digo identificador del inventario
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
  
  PROCEDURE Pr_ConsultarInventarioId (p_A003CODIGO IN IVET_T003_INVENTARIO.A003CODIGO%TYPE,
                                      p_idUsuario IN NUMBER,
                                      p_Respuesta OUT CURSOR_SALIDA,
                                      p_codError OUT NUMBER,
                                      p_msjError OUT VARCHAR2) IS  
                                
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ConsultarInventarioId';
    codExcepcion         NUMBER;    
    
    BEGIN 
       PK_T003_INVENTARIO.Pr_ConsultarPorFiltro (p_Filtro => 'A003CODIGO = ' || p_A003CODIGO,
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
                                                                 
  END Pr_ConsultarInventarioId;
  
  /********************************************************************************
  DESCRIPCION       : Procedimiento para listar un inventario por filtro
  PARAMETROS        :
  IN    :
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
  
  procedure Pr_ListarInventario (p_idUsuario  IN NUMBER,
                                 p_Respuesta  OUT CURSOR_SALIDA,
                                 p_codError   OUT NUMBER,
                                 p_msjError   OUT VARCHAR2) IS
                                
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ListarInventario';
    codExcepcion         NUMBER;    
    
    BEGIN 
       PK_T003_INVENTARIO.Pr_ConsultarPorFiltro (p_Filtro => NULL,
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
         
  END Pr_ListarInventario;
  
    /********************************************************************************
  DESCRIPCION       : Procedimiento para eliminar un inventario (borrado l?gico)
  PARAMETROS        :
  IN    :
            p_A003CODIGO                 C?digo identificador del inventario
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
  
  procedure Pr_EliminarInventario (p_A003CODIGO IN IVET_T003_INVENTARIO.A003CODIGO%TYPE,
                                   p_idUsuario  IN NUMBER,
                                   p_Respuesta  OUT CURSOR_SALIDA,
                                   p_codError   OUT NUMBER,
                                   p_msjError   OUT VARCHAR2) IS
                       
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_EliminarInventario';
    codExcepcion         NUMBER;

    BEGIN
       PK_T003_INVENTARIO.Pr_Eliminar (p_A003CODIGO => p_A003CODIGO,
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
                       
  END Pr_EliminarInventario;
  
   /********************************************************************************
  DESCRIPCION       : Procedimiento para consultar la informaci?n de un inventario mediante la grilla
  PARAMETROS        :
  IN    :
            p_PalabraClave               Par?metro para la busqueda de un inventario
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
                                
  procedure Pr_ConsultarGrillaInv (p_PalabraClave IN VARCHAR2,
                                   p_idUsuario IN NUMBER,
                                   p_Respuesta OUT CURSOR_SALIDA,
                                   p_codError OUT NUMBER,
                                   p_msjError OUT VARCHAR2) IS
                                   
      NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ConsultarGrillaInv';
      codExcepcion         NUMBER;
      p_tipousuario        IVET_T002_USUARIO.A002TIPOUSUARIO%TYPE;
      p_verificarpalclave  VARCHAR2(10);
      p_autoridadambiental IVET_T002_USUARIO.A002AUTORIDADAMBIENTAL%TYPE;
      strSQL               VARCHAR2(500);
      
  BEGIN
  
      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                       p_paquete       => NOMBRE_PAQUETE,
                                       p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                       p_usuario       => p_idUsuario,
                                       p_descripcion   => 'Entro a Pr_ConsultarGrillaInv'
                                       || p_PalabraClave);
                               
      BEGIN

      IF    p_PalabraClave IS NOT NULL THEN
            p_verificarpalclave := 'PC';--valida si la busqueda es por palabra clave
      ELSE
            p_verificarpalclave := 'PCN';--No se envia palabra clave - Palabra Clave Null
      END IF;
      
      SELECT A002TIPOUSUARIO --Se determina el tipo de usuario
        INTO p_tipousuario
        FROM IVET_T002_USUARIO
       WHERE A002CODIGO = p_idUsuario;
      
         CASE p_verificarpalclave
           WHEN 'PC' THEN
             
             if p_tipousuario = 7 then --tipo de usuario Funcionario MADS
             
               strSQL := 'SELECT *
                          FROM IVEV_002_INVENTARIO
                          WHERE (A003CODIGO) LIKE ''%' || p_palabraclave||'%''' ||
                          'or A105CODDEPARTAMENTO LIKE ''%' || p_palabraclave||'%''' ||
                          'or DEPTO_LOCALIZACION LIKE ''%' || p_palabraclave||'%''' ||
                          'or A105CODMUNICIPIO LIKE ''%' || p_palabraclave||'%''' ||
                          'or MCIPIO_LOCALIZACION LIKE ''%' || p_palabraclave||'%''' ||
                          'or A003OBJETO LIKE ''%' || p_palabraclave||'%''' ||
                          'or DESC_ESTADO_INVENTARIO LIKE ''%' || p_palabraclave||'%''' ||
                          'or A002AUTORIDADAMBIENTAL LIKE ''%' || p_palabraclave||'%''' ||
                          'or SIGLA_AA LIKE UPPER (''%'||p_PalabraClave||'%'')' ||
                          'or A003OBS_RECHAZO LIKE ''%' || p_palabraclave||'%''' ;
                        
               OPEN p_Respuesta FOR strSQL;
               p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
               p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
               return;
                        
             elsif  p_tipousuario = 9 then --tipo de usuario Admistrador Autoridad Ambiental
             
               select A002AUTORIDADAMBIENTAL
                 into p_autoridadambiental
                 from IVET_T002_USUARIO
                where A002CODIGO = p_idUsuario;
              
                strSQL := 'SELECT *
                          FROM IVEV_002_INVENTARIO
                           WHERE A003CODIGO LIKE ''%' || p_palabraclave||'%''' ||
                          'or A105CODDEPARTAMENTO LIKE ''%' || p_palabraclave||'%''' ||
                          'or DEPTO_LOCALIZACION LIKE ''%' || p_palabraclave||'%''' ||
                          'or A105CODMUNICIPIO LIKE ''%' || p_palabraclave||'%''' ||
                          'or MCIPIO_LOCALIZACION LIKE ''%' || p_palabraclave||'%''' ||
                          'or A003OBJETO LIKE ''%' || p_palabraclave||'%''' ||
                          'or DESC_ESTADO_INVENTARIO LIKE ''%' || p_palabraclave||'%''' ||
                          'or A002AUTORIDADAMBIENTAL LIKE ''%' || p_palabraclave||'%''' ||
                          'or SIGLA_AA LIKE UPPER (''%'||p_PalabraClave||'%'')' ||
                          'AND SIGLA_AA = ' || p_autoridadambiental;
                       
               OPEN p_Respuesta FOR strSQL;
               p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
               p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
               return;
             
             else 
           
               strSQL := 'SELECT *
                          FROM IVEV_002_INVENTARIO
                          WHERE A003CODIGO LIKE ''%' || p_palabraclave||'%''' ||
                          'or A105CODDEPARTAMENTO LIKE ''%' || p_palabraclave||'%''' ||
                          'or DEPTO_LOCALIZACION LIKE ''%' || p_palabraclave||'%''' ||
                          'or A105CODMUNICIPIO LIKE ''%' || p_palabraclave||'%''' ||
                          'or MCIPIO_LOCALIZACION LIKE ''%' || p_palabraclave||'%''' ||
                          'or A003OBJETO LIKE ''%' || p_palabraclave||'%''' ||
                          'or DESC_ESTADO_INVENTARIO LIKE ''%' || p_palabraclave||'%''' ||
                          'or A002AUTORIDADAMBIENTAL LIKE ''%' || p_palabraclave||'%''' ||
                          'or SIGLA_AA LIKE UPPER (''%'||p_PalabraClave||'%'')' ||
                          'AND A003IDUSUARIOREGISTRO = ' || p_idUsuario;
                          
               OPEN p_Respuesta FOR strSQL;
               p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
               p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
               return;
          
             end if;
           
           WHEN 'PCN' THEN
             
             if p_tipousuario = 7 then --tipo de usuario Funcionario MADS
             
               strSQL := 'SELECT *
                          FROM IVEV_002_INVENTARIO';
                        
               OPEN p_Respuesta FOR strSQL;
               p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
               p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
               return;
                        
             elsif  p_tipousuario = 9 then --tipo de usuario Admistrador Autoridad Ambiental
             
               select A002AUTORIDADAMBIENTAL
                 into p_autoridadambiental
                 from IVET_T002_USUARIO
                where A002CODIGO = p_idUsuario;
              
                --se hace un select a la vista por autoridad ambiental
                strSQL := 'SELECT *
                          FROM IVEV_002_INVENTARIO
                           WHERE A003IDDIVIPOLA = ' || p_autoridadambiental;
                       
               OPEN p_Respuesta FOR strSQL;
               p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
               p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
               return;
             
             else 
               
                --se hace un select a la vista por el usuario que registro el inventario 
               strSQL := 'SELECT *
                          FROM IVEV_002_INVENTARIO
                          WHERE A003IDUSUARIOREGISTRO = ' || p_idUsuario;
                          
               OPEN p_Respuesta FOR strSQL;
               p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
               p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
               return;
             
             end if;
             
         END CASE;


    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        p_codError := 5;
        p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
        OPEN p_Respuesta FOR SELECT '' FROM dual;
        return;
    END;

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
                                   
  END Pr_ConsultarGrillaInv;
  
  procedure Pr_RegistrarInvFuente (p_A007IDINVENTARIO IN  IVET_T007_INVENTARIOFUENTE.A007IDINVENTARIO%TYPE,
                                   p_A007IDFUENTE IN  IVET_T007_INVENTARIOFUENTE.A007IDFUENTE%TYPE,
                                   p_idUsuario IN NUMBER,
                                   p_Respuesta OUT CURSOR_SALIDA,
                                   p_codError   OUT NUMBER,
                                   p_msjError  OUT VARCHAR2) IS
                       
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_RegistrarInvFuente';
    codExcepcion         NUMBER;

    BEGIN
      PK_T007_INVENTARIOFUENTE.Pr_Insertar (p_A007IDINVENTARIO => p_A007IDINVENTARIO,
                                            p_A007IDFUENTE => p_A007IDFUENTE,
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
                       
  END Pr_RegistrarInvFuente;
  
  procedure Pr_EliminarInvFuente (p_A007CODIGO  IN IVET_T007_INVENTARIOFUENTE.A007CODIGO%TYPE,
                                  p_idUsuario IN NUMBER,
                                  p_Respuesta OUT CURSOR_SALIDA,
                                  p_codError OUT NUMBER,
                                  p_msjError OUT VARCHAR2) IS
                       
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_EliminarInvFuente';
    codExcepcion         NUMBER;

    BEGIN
       PK_T007_INVENTARIOFUENTE.Pr_Eliminar (p_A007CODIGO => p_A007CODIGO,
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
                       
  END Pr_EliminarInvFuente;
  
  PROCEDURE Pr_ConsultarInvFuente (p_A007IDINVENTARIO  IN IVET_T007_INVENTARIOFUENTE.A007IDINVENTARIO%TYPE,
                       p_idUsuario IN NUMBER,
                       p_Respuesta OUT CURSOR_SALIDA,
                       p_codError OUT NUMBER,
                       p_msjError OUT VARCHAR2) IS  
                                
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ConsultarInvFuente';
    codExcepcion         NUMBER;    
    
    BEGIN 
       PK_T007_INVENTARIOFUENTE.Pr_ConsultarPorFiltro (p_Filtro => 'A007IDINVENTARIO = ' || p_A007IDINVENTARIO,
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
                                                                 
  END Pr_ConsultarInvFuente;
  
  procedure Pr_RegistrarInvContamina (p_A016IDINVENTARIO   IN  IVET_T016_INVENTCONTAMINA.A016IDINVENTARIO%TYPE,
                                      p_A016IDCONTAMINANTE IN  IVET_T016_INVENTCONTAMINA.A016IDCONTAMINANTE%TYPE,
                                      p_idUsuario          IN NUMBER,
                                      p_Respuesta          OUT CURSOR_SALIDA,
                                      p_codError           OUT NUMBER,
                                      p_msjError           OUT VARCHAR2) IS
                       
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_RegistrarInvContamina';
    codExcepcion         NUMBER;

    BEGIN
      PK_T016_INVENTCONTAMINA.Pr_Insertar (p_A016IDINVENTARIO => p_A016IDINVENTARIO,
                                           p_A016IDCONTAMINANTE => p_A016IDCONTAMINANTE,
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
                       
   END Pr_RegistrarInvContamina;
   
   procedure Pr_EliminarInvContamina (p_A016CODIGO IN IVET_T016_INVENTCONTAMINA.A016CODIGO%TYPE,
                                      p_idUsuario IN NUMBER,
                                      p_Respuesta OUT CURSOR_SALIDA,
                                      p_codError  OUT NUMBER,
                                      p_msjError  OUT VARCHAR2) IS
                       
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_EliminarUsuario';
    codExcepcion         NUMBER;

    BEGIN
       PK_T016_INVENTCONTAMINA.Pr_Eliminar (p_A016CODIGO => p_A016CODIGO,
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
                       
  END Pr_EliminarInvContamina;
   
  PROCEDURE Pr_ConsultarInvContamina (p_A016IDINVENTARIO IN IVET_T016_INVENTCONTAMINA.A016IDINVENTARIO%TYPE,
                       p_idUsuario IN NUMBER,
                       p_Respuesta OUT CURSOR_SALIDA,
                       p_codError  OUT NUMBER,
                       p_msjError  OUT VARCHAR2) IS  
                                
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ConsultarInventarioId';
    codExcepcion         NUMBER;    
    
    BEGIN 
       PK_T016_INVENTCONTAMINA.Pr_ConsultarPorFiltro (p_Filtro => 'A016IDINVENTARIO = ' || p_A016IDINVENTARIO,
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
                                                                 
  END Pr_ConsultarInvContamina;
  
   /********************************************************************************
  DESCRIPCION       : Procedimiento para insertar geometr?a (GEOJSON) de un inventario
  PARAMETROS        :
  IN    :
            p_A004CODIGO                 Codigo identificador de la geometr?a
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
  
  PROCEDURE Pr_RegistrarGometria (p_A004GEOMETRIA IN  IVET_T004_GEOMETRIA.A004GEOMETRIA%TYPE,
                                  p_A004IDINVENTARIO IN  IVET_T004_GEOMETRIA.A004IDINVENTARIO%TYPE,
                                  p_idUsuario IN NUMBER,
                                  p_Respuesta OUT CURSOR_SALIDA,
                                  p_codError   OUT NUMBER,
                                  p_msjError  OUT VARCHAR2) IS
  
      NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_RegistrarGometria';
      codExcepcion         NUMBER;

    BEGIN
      PK_T004_GEOMETRIA.Pr_Insertar (p_A004GEOMETRIA => p_A004GEOMETRIA,
                                     p_A004IDINVENTARIO => p_A004IDINVENTARIO,
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

  END Pr_RegistrarGometria;
  
   /********************************************************************************
  DESCRIPCION       : Procedimiento para consultar geometr?a (GEOJSON) de un inventario por id
  PARAMETROS        :
  IN    :
            p_A004GEOMETRIA              Geometria del Inventario
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
  
  PROCEDURE Pr_ConsultarGometriaId (p_A004IDINVENTARIO IN  IVET_T004_GEOMETRIA.A004IDINVENTARIO%TYPE,
                                    p_idUsuario IN NUMBER,
                                    p_Respuesta OUT CURSOR_SALIDA,
                                    p_codError OUT NUMBER,
                                    p_msjError OUT VARCHAR2) IS
      
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ConsultarGometriaId';
    codExcepcion         NUMBER;    
    
    BEGIN 
       PK_T004_GEOMETRIA.Pr_ConsultarPorFiltro (p_Filtro => 'A004IDINVENTARIO = ' || p_A004IDINVENTARIO,
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
          
  End Pr_ConsultarGometriaId;
  
   /********************************************************************************
  DESCRIPCION       : Procedimiento para actualizar una geometr?a (GEOJSON) de un inventario por id
  PARAMETROS        :
  IN    :
            p_A004GEOMETRIA              Geometria del Inventario
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
  
    PROCEDURE Pr_ActualizarGeometria (p_A004CODIGO IN  IVET_T004_GEOMETRIA.A004CODIGO%TYPE,
                                      p_A004GEOMETRIA IN  IVET_T004_GEOMETRIA.A004GEOMETRIA%TYPE,
                                      p_A004IDINVENTARIO IN  IVET_T004_GEOMETRIA.A004IDINVENTARIO%TYPE,
                                      p_idUsuario IN NUMBER,
                                      p_Respuesta OUT CURSOR_SALIDA,
                                      p_codError OUT NUMBER,
                                      p_msjError OUT VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ActualizarInventario';
    codExcepcion         NUMBER;    
    
    BEGIN 
      PK_T004_GEOMETRIA.Pr_Actualizar (p_A004CODIGO => p_A004CODIGO,
                                       p_A004GEOMETRIA => p_A004GEOMETRIA,
                                       p_A004IDINVENTARIO => p_A004IDINVENTARIO,
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
                                  
  END Pr_ActualizarGeometria;
  
  PROCEDURE Pr_RegistrarAdjunto (p_A014NOMBREADJUNTO IN IVET_T014_ADJUNTO.A014NOMBREADJUNTO%TYPE,
                                 p_A014RUTAADJUNTO   IN IVET_T014_ADJUNTO.A014RUTAADJUNTO%TYPE,
                                 p_A014IDINVENTARIO  IN IVET_T014_ADJUNTO.A014IDINVENTARIO%TYPE,
                                 p_idUsuario         IN NUMBER,
                                 p_Respuesta         OUT CURSOR_SALIDA,
                                 p_codError          OUT NUMBER,
                                 p_msjError          OUT VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_RegistrarInventario';
    codExcepcion         NUMBER;

    BEGIN
      PK_T014_ADJUNTO.Pr_Insertar (p_A014NOMBREADJUNTO => p_A014NOMBREADJUNTO,
                                      p_A014RUTAADJUNTO => p_A014RUTAADJUNTO,
                                      p_A014IDINVENTARIO => p_A014IDINVENTARIO,
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

  END Pr_RegistrarAdjunto;
  
  PROCEDURE Pr_ActualizarAdjunto (p_A014CODIGO IN  IVET_T014_ADJUNTO.A014CODIGO%TYPE,
                                  p_A014NOMBREADJUNTO IN  IVET_T014_ADJUNTO.A014NOMBREADJUNTO%TYPE,
                                  p_A014RUTAADJUNTO IN  IVET_T014_ADJUNTO.A014RUTAADJUNTO%TYPE,
                                  p_A014IDINVENTARIO IN  IVET_T014_ADJUNTO.A014IDINVENTARIO%TYPE,
                                  p_idUsuario IN NUMBER,
                                  p_Respuesta OUT CURSOR_SALIDA,
                                  p_codError OUT NUMBER,
                                  p_msjError OUT VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ActualizarInventario';
    codExcepcion         NUMBER;    
    
    BEGIN 
      PK_T014_ADJUNTO.Pr_Actualizar (p_A014CODIGO => p_A014CODIGO,
                                     p_A014NOMBREADJUNTO => p_A014NOMBREADJUNTO,
                                     p_A014RUTAADJUNTO => p_A014RUTAADJUNTO,
                                     p_A014IDINVENTARIO => p_A014IDINVENTARIO,
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
                                  
  END Pr_ActualizarAdjunto;
  
  PROCEDURE Pr_ConsultarAdjuntoId (p_A014IDINVENTARIO IN IVET_T014_ADJUNTO.A014IDINVENTARIO%TYPE,
                                   p_idUsuario IN NUMBER,
                                   p_Respuesta OUT CURSOR_SALIDA,
                                   p_codError OUT NUMBER,
                                   p_msjError OUT VARCHAR2) IS  
                                
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ConsultarInventarioId';
    codExcepcion         NUMBER;    
    
    BEGIN 
       PK_T014_ADJUNTO.Pr_ConsultarPorFiltro (p_Filtro => 'A014IDINVENTARIO = ' || p_A014IDINVENTARIO,
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
                                                                 
  END Pr_ConsultarAdjuntoId;
  
  PROCEDURE Pr_CambioEstadoInv (p_A003CODIGO IN IVET_T003_INVENTARIO.A003CODIGO%TYPE,
                                p_A003OBS_RECHAZO IN IVET_T003_INVENTARIO.A003OBS_RECHAZO%TYPE,
                                p_estpasa   IN NUMBER, --estado al que pasa el inventario
                                p_idUsuario IN NUMBER,
                                p_Respuesta OUT CURSOR_SALIDA,
                                p_codError OUT NUMBER,
                                p_msjError OUT VARCHAR2) IS
  
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_CambioEstadoInv';
    p_estado             IVET_T018_CAMBIO_ESTADOS.A018ESTADO_ANT_INV%TYPE;
    p_obs_rechazo        IVET_T018_CAMBIO_ESTADOS.A018OBS_RECHAZO_ANT%TYPE;
    codExcepcion         NUMBER;
    
    BEGIN
      
       select a003estado_inventario, a003obs_rechazo 
         into p_estado, p_obs_rechazo
         from IVET_T003_INVENTARIO
        where a003codigo = p_A003CODIGO;
        
        PK_T018_CAMBIO_ESTADOS.Pr_Insertar(p_A018IDINVENTARIO => p_A003CODIGO,
                                           p_A018ESTADO_ANT_INV => p_estado,
                                           p_A018OBS_RECHAZO_ANT => p_obs_rechazo,
                                           p_A018ESTADO_NVO_INV => p_estpasa,
                                           p_idUsuario => p_IdUsuario,                         
                                           p_resultado => p_Respuesta,
                                           p_codError => p_codError,
                                           p_msjError => p_msjError);
      

      
    UPDATE IVET_T003_INVENTARIO
       SET A003ESTADO_INVENTARIO = p_estpasa,
           A003OBS_RECHAZO = p_A003OBS_RECHAZO
     WHERE A003CODIGO = p_A003CODIGO;
              
      OPEN p_Respuesta FOR SELECT p_A003CODIGO A009CODIGO FROM dual; 
      p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
      p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
    
    /*IF p_estpasa = 25 then
      
       select a003estado_inventario, a003obs_rechazo 
         into p_estado, p_obs_rechazo
         from IVET_T003_INVENTARIO
        where a003codigo = p_A003CODIGO;
        
        PK_T018_CAMBIO_ESTADOS.Pr_Insertar(p_A018IDINVENTARIO => p_A003CODIGO,
                                           p_A018ESTADO_ANT_INV => p_estado,
                                           p_A018OBS_RECHAZO_ANT => p_obs_rechazo,
                                           p_A018ESTADO_NVO_INV => p_estpasa,
                                           p_idUsuario => p_IdUsuario,                         
                                           p_resultado => p_Respuesta,
                                           p_codError => p_codError,
                                           p_msjError => p_msjError);
      
     END IF;*/
      
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
  
  END Pr_CambioEstadoInv;

END PK_IVE_INVENTARIO;