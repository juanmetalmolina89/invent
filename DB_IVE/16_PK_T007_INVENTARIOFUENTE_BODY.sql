CREATE OR REPLACE PACKAGE BODY "PK_T007_INVENTARIOFUENTE" is

PROCEDURE Pr_Insertar (p_A007IDINVENTARIO IN  IVET_T007_INVENTARIOFUENTE.A007IDINVENTARIO%TYPE,
                       p_A007IDFUENTE IN  IVET_T007_INVENTARIOFUENTE.A007IDFUENTE%TYPE,
                       p_idUsuario IN NUMBER,
                       p_resultado OUT CURSOR_SALIDA,
                       p_codError   OUT NUMBER,
                       p_msjError  OUT VARCHAR2) IS

NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Insertar';
p_A007CODIGO  NUMBER;

BEGIN
      -- obtenemos el siguiente id
      p_A007CODIGO := PK_UTL_UTILIDAD.Fn_Obtenerid('T007_INVENTARIOFUENTE_SEQ');

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => p_idUsuario,
                                         p_descripcion   => 'Entro a Pr_Insertar ' || p_A007IDINVENTARIO);

      INSERT INTO IVET_T007_INVENTARIOFUENTE(A007CODIGO,
                                             A007IDINVENTARIO,
                                             A007IDFUENTE,
                                             A007ESTADOREGISTRO,
                                             A007FECHACREACION,
                                             A007USUARIOCREACION)
                                     VALUES (p_A007CODIGO,
                                             p_A007IDINVENTARIO, 
                                             p_A007IDFUENTE, 
                                             PK_UTL_CONSTANTE.COD_ACTIVO, 
                                             sysdate, 
                                             p_idUsuario);
                                             
      OPEN p_resultado FOR SELECT p_A007CODIGO A007CODIGO FROM dual;
      p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
      p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError); 

      pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                        p_paquete       => NOMBRE_PAQUETE,
                                        p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                        p_usuario       => p_idUsuario,
                                        p_descripcion   => 'Salio de Pr_Insertar ' || p_A007IDINVENTARIO);
 
END Pr_Insertar;

PROCEDURE Pr_Eliminar (p_A007CODIGO  IN IVET_T007_INVENTARIOFUENTE.A007CODIGO%TYPE,
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
                                       p_descripcion   => 'Entro a Pr_Eliminar ' || p_A007CODIGO);


              UPDATE IVET_T007_INVENTARIOFUENTE 
                 SET A007ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_INACTIVO, 
                     A007FECHAMODIFICACION = sysdate,
                     A007USUARIOMODIFICACION = p_idUsuario 
               WHERE A007CODIGO = p_A007CODIGO;
               
              OPEN p_resultado FOR SELECT p_A007CODIGO A007CODIGO FROM dual;
              p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
              p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);


    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Eliminar ' || p_A007CODIGO);

END Pr_Eliminar;



PROCEDURE Pr_Actualizar (p_A007CODIGO IN  IVET_T007_INVENTARIOFUENTE.A007CODIGO%TYPE,
                         p_A007IDINVENTARIO IN  IVET_T007_INVENTARIOFUENTE.A007IDINVENTARIO%TYPE,
                         p_A007IDFUENTE IN  IVET_T007_INVENTARIOFUENTE.A007IDFUENTE%TYPE,
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
                                       p_descripcion   => 'Entro a Pr_Actualizar ' || p_A007CODIGO);

      IF p_A007CODIGO IS NULL THEN
         p_codError := 4;
         p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
         OPEN p_resultado FOR SELECT '' FROM dual;
         return;
      END IF;

      SELECT COUNT(*) INTO numReg 
        FROM IVET_T007_INVENTARIOFUENTE 
       WHERE A007CODIGO = p_A007CODIGO 
         AND A007ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;
         
      IF numReg > 0 THEN
      
         UPDATE IVET_T007_INVENTARIOFUENTE SET A007IDINVENTARIO=NVL(p_A007IDINVENTARIO, A007IDINVENTARIO),
                                               A007IDFUENTE=NVL(p_A007IDFUENTE,A007IDFUENTE),
                                               A007FECHAMODIFICACION = sysdate,
                                               A007USUARIOMODIFICACION = p_idUsuario 
                                         WHERE A007CODIGO = p_A007CODIGO;
                                         
         OPEN p_resultado FOR SELECT p_A007CODIGO A007CODIGO FROM dual;
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
                 p_descripcion   => 'Salio de Pr_Actualizar ' || p_A007CODIGO);

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
           FROM IVET_T007_INVENTARIOFUENTE
          WHERE A007ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;
          
         p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
         p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
         return;
      END IF;
      
         strSQL := 'SELECT * FROM IVET_T007_INVENTARIOFUENTE WHERE ' || p_Filtro ||' AND A007ESTADOREGISTRO ='''
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

end PK_T007_INVENTARIOFUENTE;