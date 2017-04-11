create or replace package PK_T012_UNIDADMEDIDAFACTOR is

/************************************************************************
DESCRIPCION       : Servicios CRUD sobre la tabla IVET_T012_UNIDADMEDIDAFACTOR

REALIZADO POR     : Julio Cesar Baracaldo
FECHA CREACION    : 14/11/2016

FECHA MODIFICA    : dd/MMM/aaaa
MODIFICADO POR    :
DESCRIPCION CAMBIO:
************************************************************************/
NOMBRE_PAQUETE CONSTANT VARCHAR2(100) := 'PK_T012_UNIDADMEDIDAFACTOR';
TYPE CURSOR_SALIDA IS REF CURSOR;

-- Funciones y Procedimientos del paquete:
--  PROCEDURE Pr_Insertar
--  PROCEDURE Pr_Eliminar
--  PROCEDURE Pr_Actualizar
--  PROCEDURE Pr_ConsultarPorFiltro
----

PROCEDURE Pr_Insertar (p_A012UNIDADMEDIDA IN IVET_T012_UNIDADMEDIDAFACTOR.A012UNIDADMEDIDA%TYPE,
                       p_idUsuario        IN NUMBER,
                       p_resultado        OUT CURSOR_SALIDA,
                       p_codError         OUT NUMBER,
                       p_msjError         OUT VARCHAR2);

PROCEDURE Pr_Eliminar (p_A012CODIGO IN IVET_T012_UNIDADMEDIDAFACTOR.A012CODIGO%TYPE,
                       p_idUsuario IN NUMBER,
                       p_resultado OUT CURSOR_SALIDA,
                       p_codError  OUT NUMBER,
                       p_msjError  OUT VARCHAR2);

PROCEDURE Pr_Actualizar (p_A012CODIGO IN IVET_T012_UNIDADMEDIDAFACTOR.A012CODIGO%TYPE,
                         p_A012UNIDADMEDIDA IN  IVET_T012_UNIDADMEDIDAFACTOR.A012UNIDADMEDIDA%TYPE,
                         p_idUsuario IN NUMBER,
                         p_resultado OUT CURSOR_SALIDA,
                         p_codError  OUT NUMBER,
                         p_msjError  OUT VARCHAR2);

PROCEDURE Pr_ConsultarPorFiltro (p_Filtro IN VARCHAR2,
                                 p_idUsuario IN NUMBER,
                                 p_resultado OUT CURSOR_SALIDA,
                                 p_codError  OUT NUMBER,
                                 p_msjError  OUT VARCHAR2);

end PK_T012_UNIDADMEDIDAFACTOR;