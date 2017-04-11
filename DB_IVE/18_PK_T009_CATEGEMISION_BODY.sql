CREATE OR REPLACE PACKAGE BODY "PK_T009_CATEGEMISION" is
  
PROCEDURE Pr_Insertar (p_A009NOMCATEMISION     IN  IVET_T009_CATEGEMISION.A009NOMCATEMISION%TYPE,
                       p_A009DESCCATEMISION    IN  IVET_T009_CATEGEMISION.A009DESCCATEMISION%TYPE, 
                       p_A009IDTIPOCATEMISION  IN  IVET_T009_CATEGEMISION.A009IDTIPOCATEMISION%TYPE, 
                       p_A009IDINVENTARIO      IN  IVET_T009_CATEGEMISION.A009IDINVENTARIO%TYPE, 
                       p_A009IDTIPOCOMBUSTIBLE IN  IVET_T009_CATEGEMISION.A009IDTIPOCOMBUSTIBLE%TYPE, 
                       p_A009CILINDRAJE        IN  IVET_T009_CATEGEMISION.A009CILINDRAJE%TYPE, 
                       p_A009ANIOMODELO        IN  IVET_T009_CATEGEMISION.A009ANIOMODELO%TYPE, 
                       p_A009NROFUENTES        IN  IVET_T009_CATEGEMISION.A009NROFUENTES%TYPE, 
                       p_A009DETMETODFUENTES   IN  IVET_T009_CATEGEMISION.A009DETMETODFUENTES%TYPE, 
                       p_A009IDMETODOEMISION   IN  IVET_T009_CATEGEMISION.A009IDMETODOEMISION%TYPE, 
                       p_A009OBSERVACION       IN  IVET_T009_CATEGEMISION.A009OBSERVACION%TYPE,
                       p_idUsuario             IN NUMBER,
                       p_resultado             OUT CURSOR_SALIDA,
                       p_codError              OUT NUMBER,
                       p_msjError              OUT VARCHAR2) IS 

NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Insertar';
p_A009CODIGO  NUMBER;
    
BEGIN
      -- obtenemos el siguiente id
      p_A009CODIGO := PK_UTL_UTILIDAD.Fn_Obtenerid('T009_CATEGEMISION_SEQ');
   
      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => p_idUsuario,
                                         p_descripcion   => 'Entro a Pr_Insertar ' || p_A009NOMCATEMISION);
        
       INSERT INTO IVET_T009_CATEGEMISION(A009CODIGO,
                                          A009NOMCATEMISION,
                                          A009DESCCATEMISION,
                                          A009IDTIPOCATEMISION,
                                          A009IDINVENTARIO,
                                          A009IDTIPOCOMBUSTIBLE,
                                          A009CILINDRAJE,
                                          A009ANIOMODELO,
                                          A009NROFUENTES,
                                          A009DETMETODFUENTES,
                                          A009IDMETODOEMISION,
                                          A009OBSERVACION,
                                          A009TOTALEMISION,
                                          A009ESTADOREGISTRO,
                                          A009FECHACREACION,
                                          A009USUARIOCREACION)
                                  VALUES (p_A009CODIGO,
                                          p_A009NOMCATEMISION, 
                                          p_A009DESCCATEMISION, 
                                          p_A009IDTIPOCATEMISION, 
                                          p_A009IDINVENTARIO, 
                                          p_A009IDTIPOCOMBUSTIBLE, 
                                          p_A009CILINDRAJE, 
                                          p_A009ANIOMODELO, 
                                          p_A009NROFUENTES, 
                                          p_A009DETMETODFUENTES,
                                          p_A009IDMETODOEMISION, 
                                          p_A009OBSERVACION, 
                                          0, 
                                          PK_UTL_CONSTANTE.COD_ACTIVO, 
                                          sysdate, 
                                          p_idUsuario);
                                          
      OPEN p_resultado FOR SELECT p_A009CODIGO A009CODIGO FROM dual;
      p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
      p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
              
    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Insertar ' || p_A009NOMCATEMISION);   
             
  END Pr_Insertar; 
  
  PROCEDURE Pr_Eliminar (p_A009CODIGO  IN IVET_T009_CATEGEMISION.A009CODIGO%TYPE,
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
                                       p_descripcion   => 'Entro a Pr_Eliminar ' || p_A009CODIGO);
  
              UPDATE IVET_T009_CATEGEMISION 
                 SET A009ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_INACTIVO, 
                     A009FECHAMODIFICACION = sysdate,
                     A009USUARIOMODIFICACION = p_idUsuario 
               WHERE A009CODIGO = p_A009CODIGO;
              
              OPEN p_resultado FOR SELECT '' FROM dual;
              p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
              p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError); 
  
    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Eliminar ' || p_A009CODIGO);
                                      
  END Pr_Eliminar;            

  PROCEDURE Pr_Actualizar (p_A009CODIGO              IN  IVET_T009_CATEGEMISION.A009CODIGO%TYPE,  
                           p_A009NOMCATEMISION       IN  IVET_T009_CATEGEMISION.A009NOMCATEMISION%TYPE,
                           p_A009DESCCATEMISION      IN  IVET_T009_CATEGEMISION.A009DESCCATEMISION%TYPE, 
                           p_A009IDTIPOCATEMISION    IN  IVET_T009_CATEGEMISION.A009IDTIPOCATEMISION%TYPE, 
                           p_A009IDINVENTARIO        IN  IVET_T009_CATEGEMISION.A009IDINVENTARIO%TYPE, 
                           p_A009IDTIPOCOMBUSTIBLE   IN  IVET_T009_CATEGEMISION.A009IDTIPOCOMBUSTIBLE%TYPE, 
                           p_A009CILINDRAJE          IN  IVET_T009_CATEGEMISION.A009CILINDRAJE%TYPE, 
                           p_A009ANIOMODELO          IN  IVET_T009_CATEGEMISION.A009ANIOMODELO%TYPE, 
                           p_A009NROFUENTES          IN  IVET_T009_CATEGEMISION.A009NROFUENTES%TYPE, 
                           p_A009DETMETODFUENTES     IN  IVET_T009_CATEGEMISION.A009DETMETODFUENTES%TYPE, 
                           p_A009IDMETODOEMISION     IN  IVET_T009_CATEGEMISION.A009IDMETODOEMISION%TYPE, 
                           p_A009OBSERVACION         IN  IVET_T009_CATEGEMISION.A009OBSERVACION%TYPE,
                           p_idUsuario               IN NUMBER,                           
                           p_resultado               OUT CURSOR_SALIDA,
                           p_codError                OUT NUMBER,
                           p_msjError                OUT VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Actualizar';
    numReg               NUMBER;
    
   BEGIN
   
    pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                       p_paquete       => NOMBRE_PAQUETE,
                                       p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                       p_usuario       => p_idUsuario,
                                       p_descripcion   => 'Entro a Pr_Actualizar ' || p_A009CODIGO);
  
      IF p_A009CODIGO IS NULL THEN
         p_codError := 4;
         p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
         OPEN p_resultado FOR SELECT '' FROM dual;
         return;      
      END IF;
      
      SELECT COUNT(*) 
        INTO numReg 
        FROM IVET_T009_CATEGEMISION 
       WHERE A009CODIGO = p_A009CODIGO 
         AND A009ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO; 
         
      
      
      IF numReg > 0 THEN
         
         UPDATE IVET_T009_CATEGEMISION SET A009NOMCATEMISION=NVL(p_A009NOMCATEMISION, A009NOMCATEMISION), 
                                           A009DESCCATEMISION=NVL(p_A009DESCCATEMISION,A009DESCCATEMISION),
                                           A009IDTIPOCATEMISION=NVL(p_A009IDTIPOCATEMISION,A009IDTIPOCATEMISION),
                                           A009IDINVENTARIO=NVL(p_A009IDINVENTARIO,A009IDINVENTARIO),
                                           A009IDTIPOCOMBUSTIBLE=NVL(p_A009IDTIPOCOMBUSTIBLE,A009IDTIPOCOMBUSTIBLE),
                                           A009CILINDRAJE=NVL(p_A009CILINDRAJE,A009CILINDRAJE),
                                           A009ANIOMODELO=NVL(p_A009ANIOMODELO,A009ANIOMODELO),
                                           A009NROFUENTES=NVL(p_A009NROFUENTES,A009NROFUENTES),
                                           A009DETMETODFUENTES=NVL(p_A009DETMETODFUENTES,A009DETMETODFUENTES),
                                           A009IDMETODOEMISION=NVL(p_A009IDMETODOEMISION,A009IDMETODOEMISION),
                                           A009OBSERVACION=NVL(p_A009OBSERVACION,A009OBSERVACION),
                                           A009FECHAMODIFICACION = sysdate,
                                           A009USUARIOMODIFICACION = p_idUsuario 
                                     WHERE A009CODIGO = p_A009CODIGO;    
         
         OPEN p_resultado FOR SELECT p_A009CODIGO A009CODIGO FROM dual;
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
                                      p_descripcion   => 'Salio de Pr_Actualizar ' || p_A009CODIGO);

  END Pr_Actualizar;

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
           FROM IVET_T009_CATEGEMISION
          WHERE A009ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;
         
         p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
         p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
         return;
         
      END IF;
      
         strSQL := 'SELECT * FROM IVEV_003_CATEGORIA WHERE ' || p_Filtro ||' AND A009ESTADOREGISTRO ='''
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

end PK_T009_CATEGEMISION;