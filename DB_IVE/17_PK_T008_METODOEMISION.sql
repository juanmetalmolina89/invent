create or replace package PK_T008_METODOEMISION is

/************************************************************************
DESCRIPCION       : Servicios CRUD sobre la tabla IVET_T008_METODOEMISION

REALIZADO POR     : Julio Cesar Baracaldo
FECHA CREACION    : 14/11/2016

FECHA MODIFICA    : dd/MMM/aaaa
MODIFICADO POR    :
DESCRIPCION CAMBIO:
************************************************************************/
NOMBRE_PAQUETE CONSTANT VARCHAR2(100) := 'PK_T008_METODOEMISION';
TYPE CURSOR_SALIDA IS REF CURSOR;

-- Funciones y Procedimientos del paquete:
--  PROCEDURE Pr_Insertar
--  PROCEDURE Pr_Eliminar
--  PROCEDURE Pr_Actualizar
--  PROCEDURE Pr_ConsultarPorFiltro
----

PROCEDURE Pr_Insertar (p_A008METODODETEMISION IN  IVET_T008_METODOEMISION.A008METODODETEMISION%TYPE,
                       p_idUsuario IN NUMBER,
                       p_resultado OUT CURSOR_SALIDA,
                       p_codError   OUT NUMBER,
                       p_msjError  OUT VARCHAR2);

PROCEDURE Pr_Eliminar (p_A008CODIGO IN IVET_T008_METODOEMISION.A008CODIGO%TYPE,
                       p_idUsuario IN NUMBER,
                       p_resultado OUT CURSOR_SALIDA,
                       p_codError  OUT NUMBER,
                       p_msjError  OUT VARCHAR2);
                       
PROCEDURE Pr_Actualizar (p_A008CODIGO IN  IVET_T008_METODOEMISION.A008CODIGO%TYPE,
                         p_A008METODODETEMISION IN  IVET_T008_METODOEMISION.A008METODODETEMISION%TYPE,
                         p_A008FECHAMODIFICACION IN  IVET_T008_METODOEMISION.A008FECHAMODIFICACION%TYPE,
                         p_A008USUARIOMODIFICACION IN  IVET_T008_METODOEMISION.A008USUARIOMODIFICACION%TYPE,
                         p_idUsuario IN NUMBER,
                         p_resultado OUT CURSOR_SALIDA,
                         p_codError  OUT NUMBER,
                         p_msjError  OUT VARCHAR2);

PROCEDURE Pr_ConsultarPorFiltro (p_Filtro IN VARCHAR2,
                                 p_idUsuario IN NUMBER,
                                 p_resultado OUT CURSOR_SALIDA,
                                 p_codError  OUT NUMBER,
                                 p_msjError  OUT VARCHAR2);

end PK_T008_METODOEMISION;