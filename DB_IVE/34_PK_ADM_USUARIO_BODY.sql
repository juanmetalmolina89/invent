CREATE OR REPLACE PACKAGE BODY "PK_ADM_USUARIO" is

 /********************************************************************************
  DESCRIPCION       : Procedimiento para registrar un usuario espec?fico
  PARAMETROS        :
  IN:
                      p_A002NOMBRE                 Nombre del usuario
                      p_A002APELLIDO               Apellidos del usuario
                      p_A002IDTIPODOCUMENTO        Determina los tipos de documento del usuario
                      p_A002DOCUMENTO              Numero del documento de identificaciOn
                      p_A002LGEXPEDIDODOC          Lugar de expediciOn del documento
                      p_A002DIRECCIONCORRESP       DirecciOn correspondencia del usuario
                      p_A002LOCALIZACION           Identificador del lugar de residencia del usuario
                      p_A002CORREOELECTRONICO      Correo electronico
                      p_A002TELEFONO               Tel?fono usuario
                      p_A002CELULAR                Celular usuario
                      p_A002PRIMERINGRESO          Parametro que indica si es el primer ingreso del usuario
                      p_A002USUARIO                Usuario o alias para acceder a la aplicaciOn
                      p_A002CONTRASENA             Contrase?a para acceder a la aplicaciOn
                      p_A002TIPOUSUARIO            Identifica el tipo de usuario
                      p_A002AUTORIDADAMBIENTAL     Identifica la Autoridad Ambiental a la que pertenece el usuario
                      p_idUsuario                  Id del usuario logueado en el sistema
  OUT:
                      p_Respuesta                  Matriz con el resultado del procedimiento
			                p_codError                   C?digo del error del procedimiento
			                p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 19/11/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:
  *******************************************************************************/

PROCEDURE Pr_RegistrarUsuario (p_A002NOMBRE IN IVET_T002_USUARIO.A002NOMBRE%TYPE,
                               p_A002APELLIDO IN IVET_T002_USUARIO.A002APELLIDO%TYPE,
                               p_A002IDTIPODOCUMENTO IN IVET_T002_USUARIO.A002IDTIPODOCUMENTO%TYPE,
                               p_A002DOCUMENTO IN IVET_T002_USUARIO.A002DOCUMENTO%TYPE,
                               p_A002EXPEDIDOEN IN IVET_T002_USUARIO.A002EXPEDIDOEN%TYPE,
                               p_A002DIRECCIONCORRESP IN IVET_T002_USUARIO.A002DIRECCIONCORRESP%TYPE,
                               p_A002LOCALIZACION IN IVET_T002_USUARIO.A002LOCALIZACION%TYPE,
                               p_A002CORREOELECTRONICO IN IVET_T002_USUARIO.A002CORREOELECTRONICO%TYPE,
                               p_A002TELEFONO IN IVET_T002_USUARIO.A002TELEFONO%TYPE,
                               p_A002CELULAR IN IVET_T002_USUARIO.A002CELULAR%TYPE,
                               p_A002USUARIO IN IVET_T002_USUARIO.A002USUARIO%TYPE,
                               p_A002CONTRASENA IN IVET_T002_USUARIO.A002CONTRASENA%TYPE,
                               p_A002TIPOUSUARIO IN IVET_T002_USUARIO.A002TIPOUSUARIO%TYPE,
                               p_A002AUTORIDADAMBIENTAL IN IVET_T002_USUARIO.A002AUTORIDADAMBIENTAL%TYPE,
                               p_IdUsuario IN NUMBER,
                               p_Respuesta OUT CURSOR_SALIDA,
                               p_codError OUT number,
                               p_msjError OUT varchar2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_RegistrarUsuario';
    codExcepcion         NUMBER;

    BEGIN
       PK_T002_USUARIO.Pr_Insertar (p_A002NOMBRE => p_A002NOMBRE,
                                    p_A002APELLIDO => p_A002APELLIDO,
                                    p_A002IDTIPODOCUMENTO => p_A002IDTIPODOCUMENTO,
                                    p_A002DOCUMENTO => p_A002DOCUMENTO,
                                    p_A002EXPEDIDOEN => p_A002EXPEDIDOEN,
                                    p_A002DIRECCIONCORRESP => p_A002DIRECCIONCORRESP,
                                    p_A002LOCALIZACION => p_A002LOCALIZACION,
                                    p_A002CORREOELECTRONICO => p_A002CORREOELECTRONICO,
                                    p_A002TELEFONO => p_A002TELEFONO,
                                    p_A002CELULAR => p_A002CELULAR,
                                    p_A002USUARIO => p_A002USUARIO,
                                    p_A002CONTRASENA => p_A002CONTRASENA,
                                    p_A002TIPOUSUARIO => p_A002TIPOUSUARIO,
                                    p_A002AUTORIDADAMBIENTAL => p_A002AUTORIDADAMBIENTAL,
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

END Pr_RegistrarUsuario;

 /********************************************************************************
  DESCRIPCION       : Procedimiento para actualizar un usuario espec?fico

  IN:
                      p_A002CODIGO                 Codigo identificador del usuario
                      p_A002NOMBRE                 Nombre del usuario
                      p_A002APELLIDO               Apellidos del usuario
                      p_A002IDTIPODOCUMENTO        Determina los tipos de documento del usuario
                      p_A002DOCUMENTO              Numero del documento de identificaciOn
                      p_A002LGEXPEDIDODOC          Lugar de expediciOn del documento
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
  OUT:
                      p_Respuesta                  Matriz con el resultado del procedimiento
			                p_codError                   C?digo del error del procedimiento
			                p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 19/11/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:
  *******************************************************************************/

PROCEDURE Pr_ActualizarUsuario (p_A002CODIGO IN IVET_T002_USUARIO.A002CODIGO%TYPE,
                                p_A002NOMBRE IN IVET_T002_USUARIO.A002NOMBRE%TYPE,
                                p_A002APELLIDO IN IVET_T002_USUARIO.A002APELLIDO%TYPE,
                                p_A002IDTIPODOCUMENTO IN IVET_T002_USUARIO.A002IDTIPODOCUMENTO%TYPE,
                                p_A002DOCUMENTO IN IVET_T002_USUARIO.A002DOCUMENTO%TYPE,
                                p_A002EXPEDIDOEN IN IVET_T002_USUARIO.A002EXPEDIDOEN%TYPE,
                                p_A002DIRECCIONCORRESP IN IVET_T002_USUARIO.A002DIRECCIONCORRESP%TYPE,
                                p_A002LOCALIZACION IN IVET_T002_USUARIO.A002LOCALIZACION%TYPE,
                                p_A002CORREOELECTRONICO IN IVET_T002_USUARIO.A002CORREOELECTRONICO%TYPE,
                                p_A002TELEFONO IN IVET_T002_USUARIO.A002TELEFONO%TYPE,
                                p_A002CELULAR IN IVET_T002_USUARIO.A002CELULAR%TYPE,
                                p_A002USUARIO IN IVET_T002_USUARIO.A002USUARIO%TYPE,
                                p_A002CONTRASENA IN IVET_T002_USUARIO.A002CONTRASENA%TYPE,
                                p_A002TIPOUSUARIO IN IVET_T002_USUARIO.A002TIPOUSUARIO%TYPE,
                                p_A002AUTORIDADAMBIENTAL IN IVET_T002_USUARIO.A002AUTORIDADAMBIENTAL%TYPE,
                                p_A002ESTADOUSUARIO IN IVET_T002_USUARIO.A002ESTADOUSUARIO%TYPE,
                                p_IdUsuario IN NUMBER,
                                p_Respuesta OUT CURSOR_SALIDA,
                                p_codError OUT number,
                                p_msjError OUT varchar2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ActualizarUsuario';
    codExcepcion         NUMBER;

    BEGIN
       PK_T002_USUARIO.Pr_Actualizar (p_A002CODIGO => p_A002CODIGO,
                                      p_A002NOMBRE => p_A002NOMBRE,
                                      p_A002APELLIDO => p_A002APELLIDO,
                                      p_A002IDTIPODOCUMENTO => p_A002IDTIPODOCUMENTO,
                                      p_A002DOCUMENTO => p_A002DOCUMENTO,
                                      p_A002EXPEDIDOEN => p_A002EXPEDIDOEN,
                                      p_A002DIRECCIONCORRESP => p_A002DIRECCIONCORRESP,
                                      p_A002LOCALIZACION => p_A002LOCALIZACION,
                                      p_A002CORREOELECTRONICO => p_A002CORREOELECTRONICO,
                                      p_A002TELEFONO => p_A002TELEFONO,
                                      p_A002CELULAR => p_A002CELULAR,
                                      p_A002USUARIO => p_A002USUARIO,
                                      p_A002CONTRASENA => p_A002CONTRASENA,
                                      p_A002TIPOUSUARIO => p_A002TIPOUSUARIO,
                                      p_A002AUTORIDADAMBIENTAL => p_A002AUTORIDADAMBIENTAL,
                                      p_A002ESTADOUSUARIO => p_A002ESTADOUSUARIO,
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

END Pr_ActualizarUsuario;

 /********************************************************************************
  DESCRIPCION       : Procedimiento para eliminar un usuario (borrado l?gico)

  IN:
                      p_A002CODIGO                 Codigo identificador del usuario
                      p_idUsuario                  Id del usuario logueado en el sistema
  OUT:
                      p_Respuesta                  Matriz con el resultado del procedimiento
			                p_codError                   C?digo del error del procedimiento
			                p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 19/11/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:
  *******************************************************************************/

PROCEDURE Pr_EliminarUsuario (p_A002CODIGO IN IVET_T002_USUARIO.A002CODIGO%TYPE,
                              p_IdUsuario IN NUMBER,
                              p_Respuesta OUT CURSOR_SALIDA,
                              p_codError OUT number,
                              p_msjError OUT varchar2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_EliminarUsuario';
    codExcepcion         NUMBER;

    BEGIN
       PK_T002_USUARIO.Pr_Eliminar (p_A002CODIGO => p_A002CODIGO,
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

END Pr_EliminarUsuario;

  /********************************************************************************
  DESCRIPCION       : Procedimiento para cambio de contrase?a de un usuario
  PARAMETROS        :
  IN    :
            p_A002CODIGO                 Codigo identificador del usuario
            p_A002USUARIO                Usuario del sistema
            p_A002CONTRASENA             Contrase?a del sistema
            p_A002CLAVENUEVA             Nueva contrase?a
            p_idUsuario                  Id del usuario logueado en el sistema

  OUT   :
            p_Respuesta                  Matriz con el resultado del procedimiento
            p_codError                   C?digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 17/11/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:
  *******************************************************************************/

PROCEDURE Pr_CambiarContrasena (p_A002CODIGO IN IVET_T002_USUARIO.A002CODIGO%TYPE,
                                p_A002USUARIO IN IVET_T002_USUARIO.A002USUARIO%TYPE,
                                p_A002CONTRASENA IN IVET_T002_USUARIO.A002CONTRASENA%TYPE,
                                p_A002CLAVENUEVA IN IVET_T002_USUARIO.A002CONTRASENA%TYPE,
                                p_IdUsuario IN NUMBER,
                                p_Respuesta OUT CURSOR_SALIDA,
                                p_codError OUT number,
                                p_msjError OUT varchar2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_CambiarContrasena';
    codExcepcion         NUMBER;
    cursorTemp           CURSOR_SALIDA;
    pFiltro              VARCHAR2(255);
    T002_USUARIO_Record  IVEV_001_USUARIO%ROWTYPE;

    BEGIN
       OPEN p_Respuesta FOR SELECT '' FROM dual;
       IF p_A002CODIGO IS NULL THEN
          p_codError := 4;
          p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
          OPEN p_Respuesta FOR SELECT '--' FROM dual;
          return;
       END IF;
       IF p_A002USUARIO IS NULL THEN
          p_codError := 8;
          p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
          OPEN p_Respuesta FOR SELECT '--' FROM dual;
          return;
       END IF;
       IF p_A002CONTRASENA IS NULL THEN
          p_codError := 9;
          p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
          OPEN p_Respuesta FOR SELECT '--' FROM dual;
          return;
       END IF;
       IF p_A002CLAVENUEVA IS NULL THEN
          p_codError := 10;
          p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
          OPEN p_Respuesta FOR SELECT '--' FROM dual;
          return;
       END IF;

       --pFiltro := 'A002USERNAME = ''' || p_A002USERNAME || ''' AND A002CLAVE = ''' || p_A002CLAVEANT || ''';
       pFiltro := q'{A002CODIGO = '}' || p_A002CODIGO || q'{' AND A002USUARIO = '}' || p_A002USUARIO || q'{' AND A002CONTRASENA = '}' || p_A002CONTRASENA || q'{'}';

       PK_T002_USUARIO.Pr_ConsultarPorFiltro (p_Filtro => pFiltro,
                                              p_idUsuario => p_IdUsuario,
                                              p_resultado => cursorTemp,
                                              p_codError => p_codError,
                                              p_msjError => p_msjError);
       --dbms_output.put_line('p_codError: ' || p_codError);
       IF p_codError > 0 THEN
          p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
          OPEN p_Respuesta FOR SELECT '--' FROM dual;
          return;
       END IF;
       BEGIN
          LOOP
             FETCH cursorTemp INTO T002_USUARIO_Record;
             EXIT WHEN cursorTemp%NOTFOUND;
             --dbms_output.put_line('T002_USUARIO_Record.A002CODIGO: '|| T002_USUARIO_Record.A002CODIGO )
             IF T002_USUARIO_Record.A002CODIGO IS NOT NULL THEN
                   p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
                   p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
                   --OPEN p_Respuesta FOR
                   PK_T002_USUARIO.Pr_Actualizar (p_A002CODIGO => T002_USUARIO_Record.A002CODIGO,
                                                  p_A002NOMBRE => Null,
                                                  p_A002APELLIDO => Null,
                                                  p_A002IDTIPODOCUMENTO => Null,
                                                  p_A002DOCUMENTO => Null,
                                                  p_A002EXPEDIDOEN => Null,
                                                  p_A002DIRECCIONCORRESP => Null,
                                                  p_A002LOCALIZACION =>  Null,
                                                  p_A002CORREOELECTRONICO => Null,
                                                  p_A002TELEFONO => Null,
                                                  p_A002CELULAR =>  Null,
                                                  p_A002USUARIO => T002_USUARIO_Record.A002USUARIO,
                                                  p_A002CONTRASENA => p_A002CLAVENUEVA,
                                                  p_A002TIPOUSUARIO => Null,
                                                  p_A002AUTORIDADAMBIENTAL => Null,
                                                  p_A002ESTADOUSUARIO => Null,
                                                  p_idUsuario => p_IdUsuario,
                                                  p_resultado => p_Respuesta,
                                                  p_codError => p_codError,
                                                  p_msjError => p_msjError);

               END IF;
            END LOOP;
          CLOSE cursorTemp;
       END;

    EXCEPTION
       WHEN OTHERS THEN
          ROLLBACK;
          codExcepcion := PK_UTL_UTILIDAD.fn_RegistrarExcepcion(PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                                NOMBRE_PAQUETE,
                                                                NOMBRE_PROCEDIMIENTO,
                                                                SQLCODE,
                                                                SQLERRM);
          OPEN p_Respuesta FOR SELECT '--' FROM dual;
          p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
          p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);

END Pr_CambiarContrasena;

  /********************************************************************************
  DESCRIPCION       : Procedimiento para validar un usuario
  PARAMETROS        :
  IN    :
            p_A002USUARIO                Usuario del sistema
            p_A002CONTRASENA             Contrase?a del sistema
            p_idUsuario                  Id del usuario logueado en el sistema

  OUT   :
            p_Respuesta                  Matriz con el resultado del procedimiento
            p_codError                   C?digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 17/11/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:
  *******************************************************************************/


PROCEDURE Pr_ValidarUsuario (p_A002USUARIO IN IVET_T002_USUARIO.A002USUARIO%TYPE,
                             p_A002CONTRASENA IN IVET_T002_USUARIO.A002CONTRASENA%TYPE,
                             p_IdUsuario IN NUMBER,
                             p_Respuesta OUT CURSOR_SALIDA,
                             p_codError OUT number,
                             p_msjError OUT varchar2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ValidarUsuario';
    codExcepcion         NUMBER;
    pFiltro              VARCHAR2(255);
    NumReg               NUMBER;
    EstadoUsu            CHAR(1);

    BEGIN
       IF p_A002USUARIO IS NULL THEN
          p_codError := 8;
          p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
          OPEN p_Respuesta FOR SELECT '--' FROM dual;
          return;
       END IF;
       IF p_A002CONTRASENA IS NULL THEN
          p_codError := 11;
          p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
          OPEN p_Respuesta FOR SELECT '--' FROM dual;
          return;
       END IF;
       
       OPEN p_Respuesta FOR SELECT COUNT(*), A002ESTADOUSUARIO
                              FROM IVET_T002_USUARIO
                             WHERE A002USUARIO = p_A002USUARIO
                               AND A002CONTRASENA = p_A002CONTRASENA
                          GROUP BY A002ESTADOUSUARIO;
       FETCH p_Respuesta INTO NumReg, EstadoUsu;
       
       IF p_A002USUARIO = 'admin' or p_A002USUARIO = 'user' then
         
       OPEN p_Respuesta FOR SELECT *
                              FROM IVEV_001_USUARIO
                             WHERE A002USUARIO = p_A002USUARIO
                               AND A002CONTRASENA = p_A002CONTRASENA;
                               
       p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
       p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
       return;
       
       END IF;

       IF EstadoUsu != PK_UTL_CONSTANTE.COD_ACTIVO THEN
          p_codError := 14;--usuario inactivo
          p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
          OPEN p_Respuesta FOR SELECT '--' FROM dual;
          return;
       END IF;

       If NumReg is NULL then
       
            OPEN p_Respuesta FOR SELECT COUNT(*), A002ESTADOUSUARIO
                                   FROM IVET_T002_USUARIO
                                  WHERE A002USUARIO = p_A002USUARIO
                                  --AND A002CONTRASENA = p_A002CONTRASENA
                               GROUP BY A002ESTADOUSUARIO;
           FETCH p_Respuesta INTO NumReg, EstadoUsu;
           
           p_codError := 15;--contrase�a errada
           p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
           OPEN p_Respuesta FOR SELECT '--' FROM dual;
           return;
           
        End if;
       
       If NumReg > 0 then

       pFiltro := q'{ A002USUARIO = '}' || p_A002USUARIO || q'{' AND A002CONTRASENA = '}' || p_A002CONTRASENA || q'{'}';

       PK_T002_USUARIO.Pr_ConsultarPorFiltro (p_Filtro => pFiltro,
                                              p_idUsuario => p_IdUsuario,
                                              p_resultado => p_Respuesta,
                                              p_codError => p_codError,
                                              p_msjError => p_msjError);
       END IF;


    EXCEPTION
       WHEN OTHERS THEN
          ROLLBACK;
          codExcepcion := PK_UTL_UTILIDAD.fn_RegistrarExcepcion(PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                                NOMBRE_PAQUETE,
                                                                NOMBRE_PROCEDIMIENTO,
                                                                SQLCODE,
                                                                SQLERRM);
          OPEN p_Respuesta FOR SELECT '--' FROM dual;
          p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
          p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);

END Pr_ValidarUsuario;

  /********************************************************************************
  DESCRIPCION       : Procedimiento para consultar un usuario
  PARAMETROS        :
  IN    :
            p_A002CODIGO                 Codigo identificador del usuario
            p_idUsuario                  Id del usuario logueado en el sistema

  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C?digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 17/11/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:
  *******************************************************************************/

PROCEDURE Pr_ConsultarUsuario (p_A002CODIGO IN IVET_T002_USUARIO.A002CODIGO%TYPE,
                               p_IdUsuario IN NUMBER,
                               p_Respuesta OUT CURSOR_SALIDA,
                               p_codError OUT NUMBER,
                               p_msjError OUT VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ConsultarUsuario';
    codExcepcion         NUMBER;

    BEGIN
       IF p_A002CODIGO IS NULL THEN
          p_codError := 4;
          p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
          OPEN p_Respuesta FOR SELECT '--' FROM dual;
          return;
       ELSE

          PK_T002_USUARIO.Pr_ConsultarPorFiltro(p_Filtro => 'A002CODIGO ='||p_A002CODIGO,
                                                p_idUsuario => p_idUsuario,
                                                p_resultado => p_Respuesta,
                                                p_codError => p_codError,
                                                p_msjError => p_msjError);
          if p_codError = 0 then
             p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
             p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
          end if;
          return;
       END IF;

    EXCEPTION
       WHEN OTHERS THEN
          ROLLBACK;
          codExcepcion := PK_UTL_UTILIDAD.fn_RegistrarExcepcion(PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                                NOMBRE_PAQUETE,
                                                                NOMBRE_PROCEDIMIENTO,
                                                                SQLCODE,
                                                                SQLERRM);
          OPEN p_Respuesta FOR SELECT '--' FROM dual;
          p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
          p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);

END Pr_ConsultarUsuario;

  /********************************************************************************
  DESCRIPCION       : Procedimiento para consultar el total de usuarios
  PARAMETROS        :
  IN    :
            p_IdUsuario                  Id del usuario logueado en el sistema

  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C?digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 17/11/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:
  *******************************************************************************/

PROCEDURE Pr_ListarUsuario (p_IdUsuario IN NUMBER,
                            p_Respuesta OUT CURSOR_SALIDA,
                            p_codError OUT NUMBER,
                            p_msjError OUT VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ListarUsuario';
    codExcepcion         NUMBER;

    BEGIN

    PK_T002_USUARIO.Pr_ConsultarPorFiltro(p_Filtro => NULL,
                                          p_idUsuario => p_idUsuario,
                                          p_resultado => p_Respuesta,
                                          p_codError => p_codError,
                                          p_msjError => p_msjError);

       p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
       p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);

    EXCEPTION
       WHEN OTHERS THEN
          ROLLBACK;
          codExcepcion := PK_UTL_UTILIDAD.fn_RegistrarExcepcion(PK_UTL_CONSTANTE.COD_USUARIO_DEFECTO,
                                                                NOMBRE_PAQUETE,
                                                                NOMBRE_PROCEDIMIENTO,
                                                                SQLCODE,
                                                                SQLERRM);
          OPEN p_Respuesta FOR SELECT '--' FROM dual;
          p_codError := PK_UTL_CONSTANTE.ERROR_GENERAL;
          p_msjError := PK_UTL_CONSTANTE.MSJ_EXCEPCION_GENERAL || TO_CHAR(codExcepcion);

END Pr_ListarUsuario;

     /********************************************************************************
  DESCRIPCION       : Procedimiento para consultar la informaci?n de un usuario mediante la grilla
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

  PROCEDURE Pr_ConsultarGrilla (p_PalabraClave IN VARCHAR2,
                                p_idUsuario IN NUMBER,
                                p_Respuesta OUT CURSOR_SALIDA,
                                p_codError OUT NUMBER,
                                p_msjError OUT VARCHAR2) IS

    codExcepcion         NUMBER;
    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ConsultarGrilla';
    p_tipousuario        IVET_T002_USUARIO.A002TIPOUSUARIO%TYPE;
    p_verificarpalclave  VARCHAR2(10);
    p_autoridadambiental IVET_T002_USUARIO.A002AUTORIDADAMBIENTAL%TYPE;
    strSQL               VARCHAR2(3000);
    p_PalabraClaveMay    VARCHAR2(1000); --palabra clave en mayusculas
   BEGIN

    pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                       p_paquete       => NOMBRE_PAQUETE,
                                       p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                       p_usuario       => p_idUsuario,
                                       p_descripcion   => 'Entro a Pr_ConsultarGrilla '
                                       || p_PalabraClave);

    BEGIN

    SELECT UPPER(p_PalabraClave) 
    INTO p_PalabraClaveMay
    from dual;
    
      IF    p_PalabraClaveMay IS NOT NULL THEN
            p_verificarpalclave := 'PC';--valida si la busqueda es por palabra clave
      ELSE
            p_verificarpalclave := 'PCN'; --no se env?a palabra clave - Palabra Clave Null
      END IF;
      
      
      SELECT A002TIPOUSUARIO --Se determina el tipo de usuario
        INTO p_tipousuario
        FROM IVET_T002_USUARIO
       WHERE A002CODIGO = p_idUsuario;


       CASE p_verificarpalclave
         WHEN NULL THEN
             p_codError := 5;
             p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
             OPEN p_Respuesta FOR SELECT '' FROM dual;
             return;
         WHEN 'PC' THEN
           
          if p_tipousuario = 8 then--Tipo de usuario admin del sistema
          
             strSQL := 'SELECT * FROM (SELECT *
                        FROM IVEV_001_USUARIO WHERE A002CODIGO NOT IN (1, 2)) u
                        WHERE A002CODIGO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                       'or A002NOMBRE LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A002APELLIDO LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or DESC_TIPODOCUMENTO LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A002DOCUMENTO LIKE (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A002EXPEDIDOEN LIKE (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A002DIRECCIONCORRESP LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A105CODDEPARTAMENTO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                       'or DEPTO_LOCALIZACION LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A105CODMUNICIPIO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                       'or MCIPIO_LOCALIZACION LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or AUTORIDADAMBIENTAL LIKE UPPER (''%'||p_PalabraClaveMay||'%'')';
                       
             OPEN p_Respuesta FOR strSQL;
             p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
             p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
             return;
          
          elsif p_tipousuario = 7 then --tipo de usuario Funcionario MADS
             
             --Se hace un select a la vista de usuario
             strSQL := 'SELECT * FROM (SELECT A002CODIGO,
                                              UPPER(A002NOMBRE) A002NOMBRE,
                                              UPPER(A002APELLIDO) A002APELLIDO,
                                              A002IDTIPODOCUMENTO,
                                              UPPER(DESC_TIPODOCUMENTO) DESC_TIPODOCUMENTO,
                                              A002DOCUMENTO,
                                              UPPER(A002EXPEDIDOEN) A002EXPEDIDOEN,
                                              UPPER(A002DIRECCIONCORRESP) A002DIRECCIONCORRESP,
                                              A105CODDEPARTAMENTO,
                                              UPPER(DEPTO_LOCALIZACION) DEPTO_LOCALIZACION,
                                              A105CODMUNICIPIO,
                                              UPPER(MCIPIO_LOCALIZACION) MCIPIO_LOCALIZACION,
                                              A002CORREOELECTRONICO,
                                              A002TELEFONO,
                                              A002CELULAR,
                                              A002PRIMERINGRESO,
                                              A002USUARIO,
                                              A002CONTRASENA,
                                              A002TIPOUSUARIO,
                                              TIPOUSUARIO,
                                              A002AUTORIDADAMBIENTAL,
                                              UPPER(AUTORIDADAMBIENTAL) AUTORIDADAMBIENTAL,
                                              A002MENU,
                                              A002ESTADOUSUARIO,
                                              A002ESTADOREGISTRO
                        FROM IVEV_001_USUARIO WHERE A002CODIGO NOT IN (1, 2)) u
                        WHERE A002CODIGO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                       'or A002NOMBRE LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A002APELLIDO LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or DESC_TIPODOCUMENTO LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A002DOCUMENTO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                       'or A002EXPEDIDOEN LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A002DIRECCIONCORRESP LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A105CODDEPARTAMENTO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                       'or DEPTO_LOCALIZACION LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A105CODMUNICIPIO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                       'or MCIPIO_LOCALIZACION LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or AUTORIDADAMBIENTAL LIKE UPPER (''%'||p_PalabraClaveMay||'%'')';
                       
             OPEN p_Respuesta FOR strSQL;
             p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
             p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
             return;
             
           elsif p_tipousuario = 9 then --tipo de usuario Administrador Autoridad Ambiental
           
           -- se busca cual es la autoridad ambiental del usuario
             select A002AUTORIDADAMBIENTAL
               into p_autoridadambiental
               from IVET_T002_USUARIO
              where A002CODIGO = p_idUsuario;
              
             --Se hace un select a la vista de usuario por autoridad ambiental
             
             --buscar la entidad a la que pertenece al aaa
             
             strSQL := 'SELECT *
                        FROM (SELECT A002CODIGO,
                                              UPPER(A002NOMBRE) A002NOMBRE,
                                              UPPER(A002APELLIDO) A002APELLIDO,
                                              A002IDTIPODOCUMENTO,
                                              UPPER(DESC_TIPODOCUMENTO) DESC_TIPODOCUMENTO,
                                              A002DOCUMENTO,
                                              UPPER(A002EXPEDIDOEN) A002EXPEDIDOEN,
                                              UPPER(A002DIRECCIONCORRESP) A002DIRECCIONCORRESP,
                                              A105CODDEPARTAMENTO,
                                              UPPER(DEPTO_LOCALIZACION) DEPTO_LOCALIZACION,
                                              A105CODMUNICIPIO,
                                              UPPER(MCIPIO_LOCALIZACION) MCIPIO_LOCALIZACION,
                                              A002CORREOELECTRONICO,
                                              A002TELEFONO,
                                              A002CELULAR,
                                              A002PRIMERINGRESO,
                                              A002USUARIO,
                                              A002CONTRASENA,
                                              A002TIPOUSUARIO,
                                              TIPOUSUARIO,
                                              A002AUTORIDADAMBIENTAL,
                                              UPPER(AUTORIDADAMBIENTAL) AUTORIDADAMBIENTAL,
                                              A002MENU,
                                              A002ESTADOUSUARIO,
                                              A002ESTADOREGISTRO
                              FROM IVEV_001_USUARIO
                              WHERE A002AUTORIDADAMBIENTAL ='|| p_autoridadambiental||') u
                       WHERE u.A002CODIGO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                         'or u.A002NOMBRE LIKE UPPER(''%'||p_PalabraClaveMay||'%'')' ||
                         'or u.A002APELLIDO LIKE UPPER(''%'||p_PalabraClaveMay||'%'')' ||
                         'or u.DESC_TIPODOCUMENTO LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                         'or u.A002DOCUMENTO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                         'or u.A002EXPEDIDOEN LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                         'or u.A002DIRECCIONCORRESP LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                         'or u.A105CODDEPARTAMENTO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                         'or u.DEPTO_LOCALIZACION LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                         'or u.A105CODMUNICIPIO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                         'or u.MCIPIO_LOCALIZACION LIKE UPPER (''%'||p_PalabraClaveMay||'%'')';
                       
             OPEN p_Respuesta FOR strSQL;
             p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
             p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
             return;
             
           elsif p_tipousuario = 10 then --tipo de usuario publicador
             
             --Se hace un select a la vista de usuario
             strSQL := 'SELECT * FROM (SELECT A002CODIGO,
                                              UPPER(A002NOMBRE) A002NOMBRE,
                                              UPPER(A002APELLIDO) A002APELLIDO,
                                              A002IDTIPODOCUMENTO,
                                              UPPER(DESC_TIPODOCUMENTO) DESC_TIPODOCUMENTO,
                                              A002DOCUMENTO,
                                              UPPER(A002EXPEDIDOEN) A002EXPEDIDOEN,
                                              UPPER(A002DIRECCIONCORRESP) A002DIRECCIONCORRESP,
                                              A105CODDEPARTAMENTO,
                                              UPPER(DEPTO_LOCALIZACION) DEPTO_LOCALIZACION,
                                              A105CODMUNICIPIO,
                                              UPPER(MCIPIO_LOCALIZACION) MCIPIO_LOCALIZACION,
                                              A002CORREOELECTRONICO,
                                              A002TELEFONO,
                                              A002CELULAR,
                                              A002PRIMERINGRESO,
                                              A002USUARIO,
                                              A002CONTRASENA,
                                              A002TIPOUSUARIO,
                                              TIPOUSUARIO,
                                              A002AUTORIDADAMBIENTAL,
                                              UPPER(AUTORIDADAMBIENTAL) AUTORIDADAMBIENTAL,
                                              A002MENU,
                                              A002ESTADOUSUARIO,
                                              A002ESTADOREGISTRO
                        FROM IVEV_001_USUARIO WHERE A002CODIGO NOT IN (1, 2)) u
                        WHERE A002CODIGO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                       'or A002NOMBRE LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A002APELLIDO LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or DESC_TIPODOCUMENTO LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A002DOCUMENTO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                       'or A002EXPEDIDOEN LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A002DIRECCIONCORRESP LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A105CODDEPARTAMENTO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                       'or DEPTO_LOCALIZACION LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A105CODMUNICIPIO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                       'or MCIPIO_LOCALIZACION LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or AUTORIDADAMBIENTAL LIKE UPPER (''%'||p_PalabraClaveMay||'%'')';
                       
             OPEN p_Respuesta FOR strSQL;
             p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
             p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
             return;
             
           elsif p_tipousuario = 11 then --tipo de usuario P?blico General
             
             OPEN p_Respuesta FOR SELECT '' FROM dual;
             p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
             p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
             return;
            
           else
              
              --Se hace un select a la vista de usuario
              strSQL := 'SELECT A002CODIGO,
                                              UPPER(A002NOMBRE) A002NOMBRE,
                                              UPPER(A002APELLIDO) A002APELLIDO,
                                              A002IDTIPODOCUMENTO,
                                              UPPER(DESC_TIPODOCUMENTO) DESC_TIPODOCUMENTO,
                                              A002DOCUMENTO,
                                              UPPER(A002EXPEDIDOEN) A002EXPEDIDOEN,
                                              UPPER(A002DIRECCIONCORRESP) A002DIRECCIONCORRESP,
                                              A105CODDEPARTAMENTO,
                                              UPPER(DEPTO_LOCALIZACION) DEPTO_LOCALIZACION,
                                              A105CODMUNICIPIO,
                                              UPPER(MCIPIO_LOCALIZACION) MCIPIO_LOCALIZACION,
                                              A002CORREOELECTRONICO,
                                              A002TELEFONO,
                                              A002CELULAR,
                                              A002PRIMERINGRESO,
                                              A002USUARIO,
                                              A002CONTRASENA,
                                              A002TIPOUSUARIO,
                                              TIPOUSUARIO,
                                              A002AUTORIDADAMBIENTAL,
                                              UPPER(AUTORIDADAMBIENTAL) AUTORIDADAMBIENTAL,
                                              A002MENU,
                                              A002ESTADOUSUARIO,
                                              A002ESTADOREGISTRO
                         FROM IVEV_001_USUARIO';
                       
             OPEN p_Respuesta FOR strSQL;
             p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
             p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
             return;
             
           end if;
           
         WHEN 'PCN' THEN  -- palabra clave null
           
             if p_tipousuario = 8 then--Tipo de usuario admin del sistema
          
             strSQL := 'SELECT * FROM (SELECT A002CODIGO,
                                              UPPER(A002NOMBRE) A002NOMBRE,
                                              UPPER(A002APELLIDO) A002APELLIDO,
                                              A002IDTIPODOCUMENTO,
                                              UPPER(DESC_TIPODOCUMENTO) DESC_TIPODOCUMENTO,
                                              A002DOCUMENTO,
                                              UPPER(A002EXPEDIDOEN) A002EXPEDIDOEN,
                                              UPPER(A002DIRECCIONCORRESP) A002DIRECCIONCORRESP,
                                              A105CODDEPARTAMENTO,
                                              UPPER(DEPTO_LOCALIZACION) DEPTO_LOCALIZACION,
                                              A105CODMUNICIPIO,
                                              UPPER(MCIPIO_LOCALIZACION) MCIPIO_LOCALIZACION,
                                              A002CORREOELECTRONICO,
                                              A002TELEFONO,
                                              A002CELULAR,
                                              A002PRIMERINGRESO,
                                              A002USUARIO,
                                              A002CONTRASENA,
                                              A002TIPOUSUARIO,
                                              TIPOUSUARIO,
                                              A002AUTORIDADAMBIENTAL,
                                              UPPER(AUTORIDADAMBIENTAL) AUTORIDADAMBIENTAL,
                                              A002MENU,
                                              A002ESTADOUSUARIO,
                                              A002ESTADOREGISTRO
                        FROM IVEV_001_USUARIO WHERE A002CODIGO NOT IN (1, 2)) u
                        WHERE A002CODIGO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                       'or A002NOMBRE LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A002APELLIDO LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or DESC_TIPODOCUMENTO LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A002DOCUMENTO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                       'or A002EXPEDIDOEN LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A002DIRECCIONCORRESP LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A105CODDEPARTAMENTO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                       'or DEPTO_LOCALIZACION LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A105CODMUNICIPIO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                       'or MCIPIO_LOCALIZACION LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or AUTORIDADAMBIENTAL LIKE UPPER (''%'||p_PalabraClaveMay||'%'')';
                       
             OPEN p_Respuesta FOR strSQL;
             p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
             p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
             return;    
         
             elsif p_tipousuario = 7 then --tipo de usuario Funcionario MADS
             
             --Se hace un select a la vista de usuario
             strSQL := 'SELECT * FROM (SELECT A002CODIGO,
                                              UPPER(A002NOMBRE) A002NOMBRE,
                                              UPPER(A002APELLIDO) A002APELLIDO,
                                              A002IDTIPODOCUMENTO,
                                              UPPER(DESC_TIPODOCUMENTO) DESC_TIPODOCUMENTO,
                                              A002DOCUMENTO,
                                              UPPER(A002EXPEDIDOEN) A002EXPEDIDOEN,
                                              UPPER(A002DIRECCIONCORRESP) A002DIRECCIONCORRESP,
                                              A105CODDEPARTAMENTO,
                                              UPPER(DEPTO_LOCALIZACION) DEPTO_LOCALIZACION,
                                              A105CODMUNICIPIO,
                                              UPPER(MCIPIO_LOCALIZACION) MCIPIO_LOCALIZACION,
                                              A002CORREOELECTRONICO,
                                              A002TELEFONO,
                                              A002CELULAR,
                                              A002PRIMERINGRESO,
                                              A002USUARIO,
                                              A002CONTRASENA,
                                              A002TIPOUSUARIO,
                                              TIPOUSUARIO,
                                              A002AUTORIDADAMBIENTAL,
                                              UPPER(AUTORIDADAMBIENTAL) AUTORIDADAMBIENTAL,
                                              A002MENU,
                                              A002ESTADOUSUARIO,
                                              A002ESTADOREGISTRO
                        FROM IVEV_001_USUARIO WHERE A002CODIGO NOT IN (1, 2)) u
                        WHERE A002CODIGO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                       'or A002NOMBRE LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A002APELLIDO LIKE UPPER(''%'||p_PalabraClaveMay||'%'')' ||
                       'or DESC_TIPODOCUMENTO LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A002DOCUMENTO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                       'or A002EXPEDIDOEN LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A002DIRECCIONCORRESP LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A105CODDEPARTAMENTO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                       'or DEPTO_LOCALIZACION LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or A105CODMUNICIPIO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                       'or MCIPIO_LOCALIZACION LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                       'or AUTORIDADAMBIENTAL LIKE UPPER (''%'||p_PalabraClaveMay||'%'')';
                       
             OPEN p_Respuesta FOR strSQL;
             p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
             p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
             return;
             
           elsif p_tipousuario = 9 then --tipo de usuario Administrador Autoridad Ambiental
           
           -- se busca cual es la autoridad ambiental del usuario
             select A002AUTORIDADAMBIENTAL
               into p_autoridadambiental
               from IVET_T002_USUARIO
              where A002CODIGO = p_idUsuario;
              
             --Se hace un select a la vista de usuario por autoridad ambiental
             
             --buscar la entidad a la que pertenece al aaa
             
             strSQL := 'SELECT *
                        FROM (SELECT A002CODIGO,
                                              UPPER(A002NOMBRE) A002NOMBRE,
                                              UPPER(A002APELLIDO) A002APELLIDO,
                                              A002IDTIPODOCUMENTO,
                                              UPPER(DESC_TIPODOCUMENTO) DESC_TIPODOCUMENTO,
                                              A002DOCUMENTO,
                                              UPPER(A002EXPEDIDOEN) A002EXPEDIDOEN,
                                              UPPER(A002DIRECCIONCORRESP) A002DIRECCIONCORRESP,
                                              A105CODDEPARTAMENTO,
                                              UPPER(DEPTO_LOCALIZACION) DEPTO_LOCALIZACION,
                                              A105CODMUNICIPIO,
                                              UPPER(MCIPIO_LOCALIZACION) MCIPIO_LOCALIZACION,
                                              A002CORREOELECTRONICO,
                                              A002TELEFONO,
                                              A002CELULAR,
                                              A002PRIMERINGRESO,
                                              A002USUARIO,
                                              A002CONTRASENA,
                                              A002TIPOUSUARIO,
                                              TIPOUSUARIO,
                                              A002AUTORIDADAMBIENTAL,
                                              UPPER(AUTORIDADAMBIENTAL) AUTORIDADAMBIENTAL,
                                              A002MENU,
                                              A002ESTADOUSUARIO,
                                              A002ESTADOREGISTRO
                              FROM IVEV_001_USUARIO
                              WHERE A002AUTORIDADAMBIENTAL ='|| p_autoridadambiental||') u
                       WHERE u.A002CODIGO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                         'or u.A002NOMBRE LIKE UPPER(''%'||p_PalabraClaveMay||'%'')' ||
                         'or u.A002APELLIDO LIKE UPPER(''%'||p_PalabraClaveMay||'%'')' ||
                         'or u.DESC_TIPODOCUMENTO LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                         'or u.A002DOCUMENTO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                         'or u.A002EXPEDIDOEN LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                         'or u.A002DIRECCIONCORRESP LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                         'or u.A105CODDEPARTAMENTO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                         'or u.DEPTO_LOCALIZACION LIKE UPPER (''%'||p_PalabraClaveMay||'%'')' ||
                         'or u.A105CODMUNICIPIO LIKE ''%'||p_PalabraClaveMay||'%''' ||
                         'or u.MCIPIO_LOCALIZACION LIKE UPPER (''%'||p_PalabraClaveMay||'%'')';
                       
             OPEN p_Respuesta FOR strSQL;
             p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
             p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
             return;
             
           elsif p_tipousuario = 11 then --tipo de usuario P?blico General
             
             OPEN p_Respuesta FOR SELECT '' FROM dual;
             p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
             p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
             return;
            
           else
              
              --Se hace un select a la vista de usuario
              strSQL := 'SELECT A002CODIGO,
                                              UPPER(A002NOMBRE) A002NOMBRE,
                                              UPPER(A002APELLIDO) A002APELLIDO,
                                              A002IDTIPODOCUMENTO,
                                              UPPER(DESC_TIPODOCUMENTO) DESC_TIPODOCUMENTO,
                                              A002DOCUMENTO,
                                              UPPER(A002EXPEDIDOEN) A002EXPEDIDOEN,
                                              UPPER(A002DIRECCIONCORRESP) A002DIRECCIONCORRESP,
                                              A105CODDEPARTAMENTO,
                                              UPPER(DEPTO_LOCALIZACION) DEPTO_LOCALIZACION,
                                              A105CODMUNICIPIO,
                                              UPPER(MCIPIO_LOCALIZACION) MCIPIO_LOCALIZACION,
                                              A002CORREOELECTRONICO,
                                              A002TELEFONO,
                                              A002CELULAR,
                                              A002PRIMERINGRESO,
                                              A002USUARIO,
                                              A002CONTRASENA,
                                              A002TIPOUSUARIO,
                                              TIPOUSUARIO,
                                              A002AUTORIDADAMBIENTAL,
                                              UPPER(AUTORIDADAMBIENTAL) AUTORIDADAMBIENTAL,
                                              A002MENU,
                                              A002ESTADOUSUARIO,
                                              A002ESTADOREGISTRO
                         FROM IVEV_001_USUARIO
                         WHERE A002CODIGO ='|| p_idUsuario;
                       
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

    p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
    p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_ConsultarGrilla '
                                      || p_PalabraClaveMay);

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

END Pr_ConsultarGrilla;

end PK_ADM_USUARIO;