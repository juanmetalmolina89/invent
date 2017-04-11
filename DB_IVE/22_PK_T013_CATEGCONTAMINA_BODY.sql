CREATE OR REPLACE PACKAGE BODY "PK_T013_CATEGCONTAMINA" is

PROCEDURE Pr_Insertar (p_A013IDCATEGORIAEMISION IN IVET_T013_CATEGCONTAMINA.A013IDCATEGORIAEMISION%TYPE,
                       p_A013IDCONTAMINANTE     IN IVET_T013_CATEGCONTAMINA.A013IDCONTAMINANTE%TYPE,
                       p_A013VALORCONTAMINANTE  IN IVET_T013_CATEGCONTAMINA.A013VALORCONTAMINANTE%TYPE,
                       p_A013FACTORACTIVIDAD    IN IVET_T013_CATEGCONTAMINA.A013FACTORACTIVIDAD%TYPE,
                       p_A013UNDMEDFACTORACTIV  IN IVET_T013_CATEGCONTAMINA.A013UNDMEDFACTORACTIV%TYPE,
                       p_A013FTEMETDFACTORACTIV IN IVET_T013_CATEGCONTAMINA.A013FTEMETDFACTORACTIV%TYPE,
                       p_A013FACTOREMISION      IN IVET_T013_CATEGCONTAMINA.A013FACTOREMISION%TYPE,
                       p_A013UNDMEDFACTOREMIS   IN IVET_T013_CATEGCONTAMINA.A013UNDMEDFACTOREMIS%TYPE,
                       p_A013FTEMETDFACTOREMIS  IN IVET_T013_CATEGCONTAMINA.A013FTEMETDFACTOREMIS%TYPE,
                       p_idUsuario              IN NUMBER,
                       p_resultado              OUT CURSOR_SALIDA,
                       p_codError               OUT NUMBER,
                       p_msjError               OUT VARCHAR2) IS

NOMBRE_PROCEDIMIENTO  VARCHAR2(50) := 'Pr_Insertar';
p_A013CODIGO          NUMBER;
p_numerofuentes       IVET_T009_CATEGEMISION.A009NROFUENTES%TYPE;
p_A013EMISIONTOTAL    IVET_T013_CATEGCONTAMINA.A013EMISIONTOTAL%TYPE;

--cursor que consulta el nro de fuentes 
cursor c_nrofuentes is
SELECT A009NROFUENTES
  FROM IVET_T009_CATEGEMISION
 WHERE A009CODIGO = p_A013IDCATEGORIAEMISION;

BEGIN
      -- obtenemos el siguiente id
      p_A013CODIGO := PK_UTL_UTILIDAD.Fn_Obtenerid('T013_CATEGCONTAMINA_SEQ');

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => p_idUsuario,
                                         p_descripcion   => 'Entro a Pr_Insertar ' || p_A013IDCATEGORIAEMISION);

      OPEN c_nrofuentes;
          LOOP
              FETCH c_nrofuentes INTO p_numerofuentes;
          EXIT WHEN c_nrofuentes%NOTFOUND;
          END LOOP;
      CLOSE c_nrofuentes;                                 
       
      p_A013EMISIONTOTAL := p_numerofuentes * p_a013factoremision * p_a013factoractividad;


      INSERT INTO IVET_T013_CATEGCONTAMINA(A013CODIGO,
                                          A013IDCATEGORIAEMISION,
                                          A013IDCONTAMINANTE,
                                          A013VALORCONTAMINANTE,
                                          A013FACTORACTIVIDAD,
                                          A013UNDMEDFACTORACTIV,
                                          A013FTEMETDFACTORACTIV,
                                          A013FACTOREMISION,
                                          A013UNDMEDFACTOREMIS,
                                          A013FTEMETDFACTOREMIS,
                                          A013EMISIONTOTAL,
                                          A013ESTADOREGISTRO,
                                          A013FECHACREACION,
                                          A013USUARIOCREACION)
                                  VALUES (p_A013CODIGO,
                                          p_A013IDCATEGORIAEMISION, 
                                          p_A013IDCONTAMINANTE, 
                                          p_A013VALORCONTAMINANTE, 
                                          p_A013FACTORACTIVIDAD, 
                                          p_A013UNDMEDFACTORACTIV, 
                                          p_A013FTEMETDFACTORACTIV, 
                                          p_A013FACTOREMISION, 
                                          p_A013UNDMEDFACTOREMIS, 
                                          p_A013FTEMETDFACTOREMIS, 
                                          p_A013EMISIONTOTAL,
                                          PK_UTL_CONSTANTE.COD_ACTIVO, 
                                          sysdate, 
                                          p_idUsuario);
                                          
      OPEN p_resultado FOR SELECT p_A013CODIGO A013CODIGO FROM dual;
      p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
      p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Insertar ' || p_A013IDCATEGORIAEMISION);

  END Pr_Insertar;
  
  PROCEDURE Pr_Eliminar (p_A013CODIGO  IN IVET_T013_CATEGCONTAMINA.A013CODIGO%TYPE,
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
                                       p_descripcion   => 'Entro a Pr_Eliminar ' || p_A013CODIGO);

              UPDATE IVET_T013_CATEGCONTAMINA 
                 SET A013ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_INACTIVO, 
                     A013FECHAMODIFICACION = sysdate,
                     A013USUARIOMODIFICACION = p_idUsuario 
               WHERE A013CODIGO = p_A013CODIGO;
               
              OPEN p_resultado FOR SELECT '' FROM dual;
              p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
              p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Eliminar ' || p_A013CODIGO);

  END Pr_Eliminar;

  PROCEDURE Pr_Actualizar (p_A013CODIGO IN  IVET_T013_CATEGCONTAMINA.A013CODIGO%TYPE,
                           p_A013IDCATEGORIAEMISION IN  IVET_T013_CATEGCONTAMINA.A013IDCATEGORIAEMISION%TYPE,
                           p_A013IDCONTAMINANTE IN  IVET_T013_CATEGCONTAMINA.A013IDCONTAMINANTE%TYPE,
                           p_A013VALORCONTAMINANTE IN  IVET_T013_CATEGCONTAMINA.A013VALORCONTAMINANTE%TYPE,
                           p_A013FACTORACTIVIDAD IN  IVET_T013_CATEGCONTAMINA.A013FACTORACTIVIDAD%TYPE,
                           p_A013UNDMEDFACTORACTIV IN  IVET_T013_CATEGCONTAMINA.A013UNDMEDFACTORACTIV%TYPE,
                           p_A013FTEMETDFACTORACTIV IN  IVET_T013_CATEGCONTAMINA.A013FTEMETDFACTORACTIV%TYPE,
                           p_A013FACTOREMISION IN  IVET_T013_CATEGCONTAMINA.A013FACTOREMISION%TYPE,
                           p_A013UNDMEDFACTOREMIS IN  IVET_T013_CATEGCONTAMINA.A013UNDMEDFACTOREMIS%TYPE,
                           p_A013FTEMETDFACTOREMIS IN  IVET_T013_CATEGCONTAMINA.A013FTEMETDFACTOREMIS%TYPE,
                           --p_A013EMISIONTOTAL IN  IVET_T013_CATEGCONTAMINA.A013EMISIONTOTAL%TYPE,
                           p_idUsuario IN NUMBER,
                           p_resultado OUT CURSOR_SALIDA,
                           p_codError OUT NUMBER,
                           p_msjError OUT VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Actualizar';
    numReg               NUMBER;
    p_numerofuentes       IVET_T009_CATEGEMISION.A009NROFUENTES%TYPE;
    p_A013EMISIONTOTAL    IVET_T013_CATEGCONTAMINA.A013EMISIONTOTAL%TYPE;
    
cursor c_nrofuentes is
SELECT A009NROFUENTES
  FROM IVET_T009_CATEGEMISION
 WHERE A009CODIGO = p_A013IDCATEGORIAEMISION;

   BEGIN
    pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                       p_paquete       => NOMBRE_PAQUETE,
                                       p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                       p_usuario       => p_idUsuario,
                                       p_descripcion   => 'Entro a Pr_Actualizar ' || p_A013CODIGO);
                                       
    OPEN c_nrofuentes;
          LOOP
              FETCH c_nrofuentes INTO p_numerofuentes;
          EXIT WHEN c_nrofuentes%NOTFOUND;
          END LOOP;
      CLOSE c_nrofuentes;

      IF p_A013CODIGO IS NULL THEN
         p_codError := 4;
         p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
         OPEN p_resultado FOR SELECT '' FROM dual;
         return;
      END IF;

      SELECT COUNT(*) 
        INTO numReg 
        FROM IVET_T013_CATEGCONTAMINA 
       WHERE A013IDCATEGORIAEMISION = p_A013IDCATEGORIAEMISION
         AND A013IDCONTAMINANTE = A013IDCONTAMINANTE
         AND A013ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;
         
      IF numReg > 0 THEN

 p_A013EMISIONTOTAL := p_numerofuentes * p_a013factoremision * p_a013factoractividad;     
         
         UPDATE IVET_T013_CATEGCONTAMINA SET A013IDCATEGORIAEMISION=NVL(p_A013IDCATEGORIAEMISION, A013IDCATEGORIAEMISION),
                                             A013IDCONTAMINANTE=NVL(p_A013IDCONTAMINANTE,A013IDCONTAMINANTE),
                                             A013VALORCONTAMINANTE=NVL(p_A013VALORCONTAMINANTE,A013VALORCONTAMINANTE),
                                             A013FACTORACTIVIDAD=NVL(p_A013FACTORACTIVIDAD,A013FACTORACTIVIDAD),
                                             A013UNDMEDFACTORACTIV=NVL(p_A013UNDMEDFACTORACTIV,A013UNDMEDFACTORACTIV),
                                             A013FTEMETDFACTORACTIV=NVL(p_A013FTEMETDFACTORACTIV,A013FTEMETDFACTORACTIV),
                                             A013FACTOREMISION=NVL(p_A013FACTOREMISION,A013FACTOREMISION),
                                             A013UNDMEDFACTOREMIS=NVL(p_A013UNDMEDFACTOREMIS,A013UNDMEDFACTOREMIS),
                                             A013FTEMETDFACTOREMIS=NVL(p_A013FTEMETDFACTOREMIS,A013FTEMETDFACTOREMIS),
                                             A013EMISIONTOTAL=NVL(p_A013EMISIONTOTAL,A013EMISIONTOTAL),
                                             A013FECHAMODIFICACION = sysdate,
                                             A013USUARIOMODIFICACION = p_idUsuario 
                                       WHERE A013CODIGO = p_A013CODIGO;
                                      
         OPEN p_resultado FOR SELECT p_A013CODIGO A013CODIGO FROM dual;
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
                                      p_descripcion   => 'Salio de Pr_Actualizar ' || p_A013CODIGO);

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
           FROM IVET_T013_CATEGCONTAMINA
          WHERE A013ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;
          
         p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
         p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
         return;
         
      END IF;
      
         strSQL := 'SELECT * FROM IVEV_004_CONTAMINANTE WHERE ' || p_Filtro ||' AND A013ESTADOREGISTRO ='''
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
        
end PK_T013_CATEGCONTAMINA;