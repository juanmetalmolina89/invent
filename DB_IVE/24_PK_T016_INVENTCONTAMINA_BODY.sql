CREATE OR REPLACE PACKAGE BODY "PK_T016_INVENTCONTAMINA" is

  /********************************************************************************
  DESCRIPCION       : Procedimiento para insertar la informaci?n de un contaminante
  PARAMETROS        :
  IN    :
            p_A016IDINVENTARIO           Identificador del Inventario
            p_A016IDCONTAMINANTE         Identificador del Contaminante
            p_idUsuario                  Id del usuario logueado en el sistema
      
  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C?digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 08/12/2016

  FECHA MODIFICA    : 
  MODIFICADO POR    : 
  DESCRIPCION CAMBIO: 
  *******************************************************************************/

PROCEDURE Pr_Insertar (p_A016IDINVENTARIO   IN IVET_T016_INVENTCONTAMINA.A016IDINVENTARIO%TYPE,
                       p_A016IDCONTAMINANTE IN IVET_T016_INVENTCONTAMINA.A016IDCONTAMINANTE%TYPE,
                       p_idUsuario IN NUMBER,
                       p_resultado OUT CURSOR_SALIDA,
                       p_codError OUT NUMBER,
                       p_msjError OUT VARCHAR2) IS

NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Insertar';
p_A016CODIGO  NUMBER;

BEGIN
      -- obtenemos el siguiente id
      p_A016CODIGO := PK_UTL_UTILIDAD.Fn_Obtenerid('T016_INVENTCONTAMINA_SEQ');

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => p_idUsuario,
                                         p_descripcion   => 'Entro a Pr_Insertar ' || p_A016IDINVENTARIO);

      INSERT INTO IVET_T016_INVENTCONTAMINA(A016CODIGO,
                                            A016IDINVENTARIO,
                                            A016IDCONTAMINANTE,
                                            A016ESTADOREGISTRO,
                                            A016FECHACREACION,
                                            A016USUARIOCREACION)
                                    VALUES (p_A016CODIGO,
                                            p_A016IDINVENTARIO,
                                            p_A016IDCONTAMINANTE,
                                            PK_UTL_CONSTANTE.COD_ACTIVO, 
                                            sysdate, 
                                            p_idUsuario);
      
      /*OPEN p_resultado FOR SELECT p_A016CODIGO A016CODIGO FROM dual;
      p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
      p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);*/
  
    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Insertar ' || p_A016IDINVENTARIO);

END Pr_Insertar;

   /********************************************************************************
  DESCRIPCION       : Procedimiento para hacer un borrado l?gico de un contaminante
  PARAMETROS        :
  IN    :
            p_A016CODIGO                 Codigo identificador del contaminante x inventario
            p_idUsuario                  Id del usuario logueado en el sistema
      
  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C?digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 08/12/2016

  FECHA MODIFICA    : 02/12/2016
  MODIFICADO POR    : Luis Felipe Rueda Forero
  DESCRIPCION CAMBIO: Ajustes solicitados Hugo Cendales
  *******************************************************************************/ 
  
PROCEDURE Pr_Eliminar (p_A016CODIGO  IN IVET_T016_INVENTCONTAMINA.A016CODIGO%TYPE,
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
                                       p_descripcion   => 'Entro a Pr_Eliminar ' || p_A016CODIGO);


              UPDATE IVET_T016_INVENTCONTAMINA 
                 SET A016ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_INACTIVO, 
                     A016FECHAMODIFICACION = sysdate,
                     A016USUARIOMODIFICACION = p_idUsuario 
               WHERE A016CODIGO = p_A016CODIGO;
               
              OPEN p_resultado FOR SELECT '' FROM dual;
              p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
              p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Eliminar ' || p_A016CODIGO);

END Pr_Eliminar;

  /********************************************************************************
  DESCRIPCION       : Procedimiento para actualizar la informaci?n de un contaminante 
  PARAMETROS        :
  IN    :
            p_A016CODIGO                 Identificador del Contaminante x inventario
            p_A016IDCONTAMINANTE         Identificador del Contaminante
            p_idUsuario                  Id del usuario logueado en el sistema
      
  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C?digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 08/12/2016

  FECHA MODIFICA    : 
  MODIFICADO POR    : 
  DESCRIPCION CAMBIO: 
  *******************************************************************************/ 

PROCEDURE Pr_Actualizar (p_A016CODIGO IN  IVET_T016_INVENTCONTAMINA.A016CODIGO%TYPE,
                         p_A016IDINVENTARIO IN  IVET_T016_INVENTCONTAMINA.A016IDINVENTARIO%TYPE,
                         p_A016IDCONTAMINANTE IN  IVET_T016_INVENTCONTAMINA.A016IDCONTAMINANTE%TYPE,
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
                                      p_descripcion   => 'Entro a Pr_Actualizar ' || p_A016CODIGO);


      IF p_A016CODIGO IS NULL THEN
         p_codError := 4;
         p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
         OPEN p_resultado FOR SELECT '' FROM dual;
         return;
      END IF;

      SELECT COUNT(*) 
        INTO numReg 
        FROM IVET_T016_INVENTCONTAMINA 
       WHERE A016CODIGO = p_A016CODIGO 
         AND A016ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;
      
      IF numReg > 0 THEN
         
         UPDATE IVET_T016_INVENTCONTAMINA SET A016IDINVENTARIO=NVL(p_A016IDINVENTARIO, A016IDINVENTARIO),
                                              A016IDCONTAMINANTE=NVL(p_A016IDCONTAMINANTE,A016IDCONTAMINANTE),
                                              A016FECHAMODIFICACION = sysdate,
                                              A016USUARIOMODIFICACION = p_idUsuario 
                                        WHERE A016CODIGO = p_A016CODIGO;
         
         OPEN p_resultado FOR SELECT p_A016CODIGO A016CODIGO FROM dual;
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
                                      p_descripcion   => 'Salio de Pr_Actualizar ' || p_A016CODIGO);

END Pr_Actualizar;

  /********************************************************************************
  DESCRIPCION       : Procedimiento para consultar la informaci?n de un contaminate mediante un filtro
  PARAMETROS        :
  IN    :
            p_Filtro                     Paqrametro de busqueda (campo = valor)
            p_idUsuario                  Id del usuario logueado en el sistema
      
  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C?digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 08/12/2016

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
           FROM IVET_T016_INVENTCONTAMINA
          WHERE A016ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;
          
          p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
          p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
          return;
      
      END IF;
      
         
         strSQL := 'SELECT * FROM IVET_T016_INVENTCONTAMINA WHERE ' || p_Filtro ||' AND A016ESTADOREGISTRO ='''
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

PROCEDURE Pr_InsertarTrig (p_A016IDINVENTARIO   IN IVET_T016_INVENTCONTAMINA.A016IDINVENTARIO%TYPE,
                           p_A016IDCONTAMINANTE IN IVET_T016_INVENTCONTAMINA.A016IDCONTAMINANTE%TYPE,
                           p_idUsuario IN NUMBER) IS
                           
p_A016CODIGO  NUMBER;                           
        
    Begin               
        p_A016CODIGO := PK_UTL_UTILIDAD.Fn_Obtenerid('T016_INVENTCONTAMINA_SEQ');
                       
        INSERT INTO IVET_T016_INVENTCONTAMINA(A016CODIGO,
                                            A016IDINVENTARIO,
                                            A016IDCONTAMINANTE,
                                            A016ESTADOREGISTRO,
                                            A016FECHACREACION,
                                            A016USUARIOCREACION)
                                    VALUES (p_A016CODIGO,
                                            p_A016IDINVENTARIO,
                                            p_A016IDCONTAMINANTE,
                                            PK_UTL_CONSTANTE.COD_ACTIVO, 
                                            sysdate, 
                                            p_idUsuario);
                                            
    End Pr_InsertarTrig;                                            
     
end PK_T016_INVENTCONTAMINA;
