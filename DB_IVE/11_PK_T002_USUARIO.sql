CREATE OR REPLACE PACKAGE "PK_T002_USUARIO" is

/************************************************************************
DESCRIPCION       : Servicios CRUD sobre la tabla IVET_T002_USUARIO

REALIZADO POR     : Julio Cesar Baracaldo
FECHA CREACION    : 14/11/2016

FECHA MODIFICA    : dd/MMM/aaaa
MODIFICADO POR    :
DESCRIPCION CAMBIO:
************************************************************************/
NOMBRE_PAQUETE CONSTANT VARCHAR2(100) := 'PK_T002_USUARIO';
TYPE CURSOR_SALIDA IS REF CURSOR;

-- Funciones y Procedimientos del paquete:
--  PROCEDURE Pr_Insertar
--  PROCEDURE Pr_Eliminar
--  PROCEDURE Pr_Actualizar
--  PROCEDURE Pr_ConsultarPorFiltro
----

PROCEDURE Pr_Insertar ( p_A002NOMBRE             IN IVET_T002_USUARIO.A002NOMBRE%TYPE,
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
                        p_msjError               OUT VARCHAR2);

PROCEDURE Pr_Eliminar ( p_A002CODIGO IN IVET_T002_USUARIO.A002CODIGO%TYPE,
                        p_idUsuario IN NUMBER,
                        p_resultado OUT CURSOR_SALIDA,
                        p_codError  OUT NUMBER,
                        p_msjError  OUT VARCHAR2);

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
                         p_msjError               OUT VARCHAR2);

PROCEDURE Pr_ConsultarPorFiltro (p_Filtro    IN VARCHAR2,
                                 p_idUsuario IN NUMBER,
                                 p_resultado OUT CURSOR_SALIDA,
                                 p_codError  OUT NUMBER,
                                 p_msjError  OUT VARCHAR2);

end PK_T002_USUARIO;