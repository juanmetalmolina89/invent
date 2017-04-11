CREATE OR REPLACE PACKAGE BODY "PK_T002_USUARIO" is

  /********************************************************************************
  DESCRIPCION       : Procedimiento para insertar la informaci?n de un usuario
  PARAMETROS        :
  IN    :
            p_A002NOMBRE                 Nombre del usuario
            p_A002APELLIDO               Apellidos del usuario
            p_A002IDTIPODOCUMENTO        Determina los tipos de documento del usuario
            p_A002DOCUMENTO              Numero del documento de identificaciOn
            p_A002EXPEDIDOEN             Lugar de expediciOn del documento
            p_A002DIRECCIONCORRESP       DirecciOn correspondencia del usuario
            p_A002LOCALIZACION           Identificador del lugar de residencia del usuario
            p_A002CORREOELECTRONICO      Correo electronico
            p_A002TELEFONO               Tel?fono usuario
            p_A002CELULAR                Celular usuario
            p_A002USUARIO                Usuario o alias para acceder a la aplicaciOn
            p_A002CONTRASENA             Contrase?a para acceder a la aplicaciOn
            p_A002TIPOUSUARIO            Identifica el tipo de usuario
            p_A002AUTORIDADAMBIENTAL     Identifica la Autoridad Ambiental a la que pertenece el usuario
            p_idUsuario                  Id del usuario logueado en el sistema

  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C?digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 17/11/2016

  FECHA MODIFICA    : 02/12/2016
  MODIFICADO POR    : Luis Felipe Rueda Forero
  DESCRIPCION CAMBIO: Ajustes solicitados Hugo Cendales
  *******************************************************************************/

PROCEDURE Pr_Insertar (p_A002NOMBRE             IN IVET_T002_USUARIO.A002NOMBRE%TYPE,
                       p_A002APELLIDO           IN IVET_T002_USUARIO.A002APELLIDO%TYPE,
                       p_A002IDTIPODOCUMENTO    IN IVET_T002_USUARIO.A002IDTIPODOCUMENTO%TYPE,
                       p_A002DOCUMENTO          IN IVET_T002_USUARIO.A002DOCUMENTO%TYPE,
                       p_A002EXPEDIDOEN         IN IVET_T002_USUARIO.A002EXPEDIDOEN%TYPE,
                       p_A002DIRECCIONCORRESP   IN IVET_T002_USUARIO.A002DIRECCIONCORRESP%TYPE,
                       p_A002LOCALIZACION       IN IVET_T002_USUARIO.A002LOCALIZACION%TYPE,
                       p_A002CORREOELECTRONICO  IN IVET_T002_USUARIO.A002CORREOELECTRONICO%TYPE,
                       p_A002TELEFONO           IN IVET_T002_USUARIO.A002TELEFONO%TYPE,
                       p_A002CELULAR            IN IVET_T002_USUARIO.A002CELULAR%TYPE,
                       p_A002USUARIO            IN IVET_T002_USUARIO.A002USUARIO%TYPE,
                       p_A002CONTRASENA         IN IVET_T002_USUARIO.A002CONTRASENA%TYPE,
                       p_A002TIPOUSUARIO        IN IVET_T002_USUARIO.A002TIPOUSUARIO%TYPE,
                       p_A002AUTORIDADAMBIENTAL IN IVET_T002_USUARIO.A002AUTORIDADAMBIENTAL%TYPE,
                       p_idUsuario              IN NUMBER,
                       p_resultado              OUT CURSOR_SALIDA,
                       p_codError               OUT NUMBER,
                       p_msjError               OUT VARCHAR2) IS

NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Insertar';
p_A002CODIGO         NUMBER;

BEGIN

      -- obtenemos el siguiente id
      p_A002CODIGO := PK_UTL_UTILIDAD.Fn_Obtenerid('T002_USUARIO_SEQ');

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => p_idUsuario,
                                         p_descripcion   => 'Entro a Pr_Insertar ' || p_A002CODIGO);

    INSERT INTO IVET_T002_USUARIO(A002CODIGO,
                                  A002NOMBRE,
                                  A002APELLIDO,
                                  A002IDTIPODOCUMENTO,
                                  A002DOCUMENTO,
                                  A002EXPEDIDOEN,
                                  A002DIRECCIONCORRESP,
                                  A002LOCALIZACION,
                                  A002CORREOELECTRONICO,
                                  A002TELEFONO,
                                  A002CELULAR,
                                  A002PRIMERINGRESO,
                                  A002USUARIO,
                                  A002CONTRASENA,
                                  A002TIPOUSUARIO,
                                  A002AUTORIDADAMBIENTAL,
                                  A002ESTADOUSUARIO,
                                  A002ESTADOREGISTRO,
                                  A002FECHACREACION,
                                  A002USUARIOCREACION)
                          VALUES (p_A002CODIGO,
                                  p_A002NOMBRE,
                                  p_A002APELLIDO,
                                  p_A002IDTIPODOCUMENTO,
                                  p_A002DOCUMENTO,
                                  p_A002EXPEDIDOEN,
                                  p_A002DIRECCIONCORRESP,
                                  p_A002LOCALIZACION,
                                  p_A002CORREOELECTRONICO,
                                  p_A002TELEFONO,
                                  p_A002CELULAR,
                                  'SI',
                                  p_A002USUARIO,
                                  p_A002CONTRASENA,
                                  p_A002TIPOUSUARIO,
                                  p_A002AUTORIDADAMBIENTAL,
                                  PK_UTL_CONSTANTE.COD_ACTIVO, -- Estado del usuario (Activo - A)
                                  PK_UTL_CONSTANTE.COD_ACTIVO, -- Estado del registro (Activo - A)
                                  sysdate,
                                  p_idUsuario);

      OPEN p_resultado FOR SELECT p_A002CODIGO A002CODIGO FROM dual;
      p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
      p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Insertar ' || p_A002CODIGO);

END Pr_Insertar;

   /********************************************************************************
  DESCRIPCION       : Procedimiento para hacer un borrado l?gico de un usuario
  PARAMETROS        :
  IN    :
            p_A002CODIGO                 Codigo identificador del usuario
            p_idUsuario                  Id del usuario logueado en el sistema

  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C?digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 10/11/2016

  FECHA MODIFICA    : 02/12/2016
  MODIFICADO POR    : Luis Felipe Rueda Forero
  DESCRIPCION CAMBIO: Ajustes solicitados Hugo Cendales
  *******************************************************************************/

PROCEDURE Pr_Eliminar (p_A002CODIGO IN IVET_T002_USUARIO.A002CODIGO%TYPE,
                       p_idUsuario  IN NUMBER,
                       p_resultado  OUT CURSOR_SALIDA,
                       p_codError   OUT NUMBER,
                       p_msjError   OUT VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Eliminar';

   BEGIN

    pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                       p_paquete       => NOMBRE_PAQUETE,
                                       p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                       p_usuario       => p_idUsuario,
                                       p_descripcion   => 'Entro a Pr_Eliminar ' || p_A002CODIGO);

                 UPDATE IVET_T002_USUARIO
                    SET A002ESTADOUSUARIO = PK_UTL_CONSTANTE.COD_INACTIVO,
                        A002FECHAMODIFICACION = sysdate,
                        A002USUARIOMODIFICACION = p_idUsuario
                  WHERE A002CODIGO = p_A002CODIGO;

                 OPEN p_resultado FOR SELECT p_A002CODIGO A002CODIGO FROM dual;
                 p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
                 p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);


    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Eliminar ' || p_A002CODIGO);

END Pr_Eliminar;

  /********************************************************************************
  DESCRIPCION       : Procedimiento para actualizar la informaci?n de un usuario
  PARAMETROS        :
  IN    :
            p_A002CODIGO                 Codigo identificador del usuario
            p_A002NOMBRE                 Nombre del usuario
            p_A002APELLIDO               Apellidos del usuario
            p_A002IDTIPODOCUMENTO        Determina los tipos de documento del usuario
            p_A002DOCUMENTO              Numero del documento de identificaciOn
            p_A002EXPEDIDOEN             Lugar de expediciOn del documento
            p_A002DIRECCIONCORRESP       DirecciOn correspondencia del usuario
            p_A002LOCALIZACION           Identificador del lugar de residencia del usuario
            p_A002CORREOELECTRONICO      Correo electronico
            p_A002TELEFONO               Tel?fono usuario
            p_A002CELULAR                Celular usuario
            p_A002USUARIO                Usuario o alias para acceder a la aplicaciOn
            p_A002CONTRASENA             Contrase?a para acceder a la aplicaciOn
            p_A002TIPOUSUARIO            Identifica el tipo de usuario
            p_A002AUTORIDADAMBIENTAL     Identifica la Autoridad Ambiental a la que pertenece el usuario
            p_A002ESTADOUSUARIO          Estado del usuario
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

PROCEDURE Pr_Actualizar (p_A002CODIGO             IN IVET_T002_USUARIO.A002CODIGO%TYPE,
                         p_A002NOMBRE             IN IVET_T002_USUARIO.A002NOMBRE%TYPE,
                         p_A002APELLIDO           IN IVET_T002_USUARIO.A002APELLIDO%TYPE,
                         p_A002IDTIPODOCUMENTO    IN IVET_T002_USUARIO.A002IDTIPODOCUMENTO%TYPE,
                         p_A002DOCUMENTO          IN IVET_T002_USUARIO.A002DOCUMENTO%TYPE,
                         p_A002EXPEDIDOEN         IN IVET_T002_USUARIO.A002EXPEDIDOEN%TYPE,
                         p_A002DIRECCIONCORRESP   IN IVET_T002_USUARIO.A002DIRECCIONCORRESP%TYPE,
                         p_A002LOCALIZACION       IN IVET_T002_USUARIO.A002LOCALIZACION%TYPE,
                         p_A002CORREOELECTRONICO  IN IVET_T002_USUARIO.A002CORREOELECTRONICO%TYPE,
                         p_A002TELEFONO           IN IVET_T002_USUARIO.A002TELEFONO%TYPE,
                         p_A002CELULAR            IN IVET_T002_USUARIO.A002CELULAR%TYPE,
                         p_A002USUARIO            IN IVET_T002_USUARIO.A002USUARIO%TYPE,
                         p_A002CONTRASENA         IN IVET_T002_USUARIO.A002CONTRASENA%TYPE,
                         p_A002TIPOUSUARIO        IN IVET_T002_USUARIO.A002TIPOUSUARIO%TYPE,
                         p_A002AUTORIDADAMBIENTAL IN IVET_T002_USUARIO.A002AUTORIDADAMBIENTAL%TYPE,
                         p_A002ESTADOUSUARIO      IN IVET_T002_USUARIO.A002ESTADOUSUARIO%TYPE,
                         p_idUsuario              IN NUMBER,
                         p_resultado              OUT CURSOR_SALIDA,
                         p_codError               OUT NUMBER,
                         p_msjError               OUT VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Actualizar';
    numReg               NUMBER;
    V_CODDEPTO           PART_T105_DIVIPOLA.A105CODDEPARTAMENTO%TYPE;
    V_NOMDEPTO           PART_T105_DIVIPOLA.A105DEPARTAMENTO%TYPE;
    V_CODMCIPIO          PART_T105_DIVIPOLA.A105CODMUNICIPIO%TYPE;
    V_NOMMCPIO           PART_T105_DIVIPOLA.A105MUNICIPIO%TYPE;

   BEGIN

   pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Entro a Pr_Actualizar ' || p_A002CODIGO);


      IF p_A002CODIGO IS NULL THEN
         p_codError := 4;
         p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
         OPEN p_resultado FOR SELECT '' FROM dual;
         return;
      END IF;

      SELECT COUNT(*)
        INTO numReg
        FROM IVET_T002_USUARIO
       WHERE A002CODIGO = p_A002CODIGO
         AND A002ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;

    IF numReg > 0 THEN

        UPDATE IVET_T002_USUARIO SET A002NOMBRE=NVL(p_A002NOMBRE, A002NOMBRE),
                                     A002APELLIDO=NVL(p_A002APELLIDO,A002APELLIDO),
                                     A002IDTIPODOCUMENTO=NVL(p_A002IDTIPODOCUMENTO,A002IDTIPODOCUMENTO),
                                     A002DOCUMENTO=NVL(p_A002DOCUMENTO,A002DOCUMENTO),
                                     A002EXPEDIDOEN=NVL(p_A002EXPEDIDOEN,A002EXPEDIDOEN),
                                     A002DIRECCIONCORRESP=NVL(p_A002DIRECCIONCORRESP,A002DIRECCIONCORRESP),
                                     A002LOCALIZACION=NVL(p_A002LOCALIZACION,A002LOCALIZACION),
                                     A002CORREOELECTRONICO=NVL(p_A002CORREOELECTRONICO,A002CORREOELECTRONICO),
                                     A002TELEFONO=NVL(p_A002TELEFONO,A002TELEFONO),
                                     A002CELULAR=NVL(p_A002CELULAR,A002CELULAR),
                                     A002USUARIO=NVL(p_A002USUARIO,A002USUARIO),
                                     A002CONTRASENA=NVL(p_A002CONTRASENA,A002CONTRASENA),
                                     A002TIPOUSUARIO=NVL(p_A002TIPOUSUARIO,A002TIPOUSUARIO),
                                     A002AUTORIDADAMBIENTAL=NVL(p_A002AUTORIDADAMBIENTAL,A002AUTORIDADAMBIENTAL),
                                     A002ESTADOUSUARIO=NVL(p_A002ESTADOUSUARIO,A002ESTADOUSUARIO),
                                     A002FECHAMODIFICACION=sysdate,
                                     A002USUARIOMODIFICACION=p_idUsuario
                               WHERE A002CODIGO = p_A002CODIGO;

       SELECT a105coddepartamento , a105departamento ,  a105codmunicipio , a105municipio 
         INTO V_CODDEPTO, V_NOMDEPTO, V_CODMCIPIO, V_NOMMCPIO
         FROM PART_T105_DIVIPOLA
        WHERE A105CODIGO = p_A002LOCALIZACION;

         OPEN p_resultado FOR SELECT p_A002CODIGO A002CODIGO,
                                     V_CODDEPTO A105CODDEPARTAMENTO,
                                     V_NOMDEPTO A105DEPARTAMENTO,
                                     V_CODMCIPIO A105CODMUNICIPIO,
                                     V_NOMMCPIO A105MUNICIPIO
                                FROM dual;
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
                                      p_descripcion   => 'Salio de Pr_Actualizar ' || p_A002CODIGO);

  END Pr_Actualizar;

  /********************************************************************************
  DESCRIPCION       : Procedimiento para consultar la informaci?n de un usuario por filtro o sin filtro
  PARAMETROS        :
  IN    :
            p_Filtro                     Paqrametro de busqueda (campo = valor)
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
    strSQL               VARCHAR2(2000);

   BEGIN

    pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                       p_paquete       => NOMBRE_PAQUETE,
                                       p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                       p_usuario       => p_idUsuario,
                                       p_descripcion   => 'Entro a Pr_ConsultarPorFiltro ' || p_Filtro);


      IF p_Filtro IS NULL THEN --Si filtro es nulo hace select a la tabla

         OPEN p_resultado FOR
         SELECT *
           FROM IVET_T002_USUARIO
          WHERE A002ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO
            AND A002CODIGO NOT IN (1,2);--Se debe excluir el usuario 1 - Administrador del sistema y
                                                       -- el usuario 2 - Usuario Invitado

          p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
          p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
          return;
      END IF;
      
          IF   p_idUsuario = 1 or p_idUsuario = 2 then
             
               strSQL := 'SELECT * FROM IVEV_001_USUARIO WHERE ' || p_Filtro ||' 
                         AND A002ESTADOREGISTRO ='''|| PK_UTL_CONSTANTE.COD_ACTIVO || '''';
              
               OPEN p_resultado FOR strSQL;

               p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
               p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
               return;
               
           END IF;    
  
             --Si filtro NO es nulo hace select a la vista
             strSQL := 'SELECT * FROM IVEV_001_USUARIO WHERE ' || p_Filtro ||' AND A002ESTADOREGISTRO ='''|| PK_UTL_CONSTANTE.COD_ACTIVO ||
                        ''' AND A002CODIGO NOT IN (1,2)';
             OPEN p_resultado FOR strSQL;

             p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
             p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);


    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_ConsultarPorFiltro ' || p_Filtro);

END Pr_ConsultarPorFiltro;

end PK_T002_USUARIO;