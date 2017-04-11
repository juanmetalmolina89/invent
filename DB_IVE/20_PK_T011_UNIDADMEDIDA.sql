create or replace package PK_T011_UNIDADMEDIDA is

/************************************************************************
DESCRIPCION       : Servicios CRUD sobre la tabla IVET_T011_UNIDADMEDIDA

REALIZADO POR     : Julio Cesar Baracaldo
FECHA CREACION    : 14/11/2016

FECHA MODIFICA    : dd/MMM/aaaa
MODIFICADO POR    :
DESCRIPCION CAMBIO:
************************************************************************/
NOMBRE_PAQUETE CONSTANT VARCHAR2(100) := 'PK_T011_UNIDADMEDIDA';
TYPE CURSOR_SALIDA IS REF CURSOR;

-- Funciones y Procedimientos del paquete:
--  PROCEDURE Pr_Insertar
--  PROCEDURE Pr_Eliminar
--  PROCEDURE Pr_Actualizar
--  PROCEDURE Pr_ConsultarPorFiltro
----

PROCEDURE Pr_Insertar (p_A011UNIDADMEDIDA IN IVET_T011_UNIDADMEDIDA.A011UNIDADMEDIDA%TYPE,
                       p_idUsuario        IN NUMBER,
                       p_resultado        OUT CURSOR_SALIDA,
                       p_codError         OUT NUMBER,
                       p_msjError         OUT VARCHAR2);

PROCEDURE Pr_Eliminar (p_A011CODIGO IN IVET_T011_UNIDADMEDIDA.A011CODIGO%TYPE,
                       p_idUsuario  IN NUMBER,
                       p_resultado  OUT CURSOR_SALIDA,
                       p_codError   OUT NUMBER,
                       p_msjError   OUT VARCHAR2);

PROCEDURE Pr_Actualizar (p_A011CODIGO       IN IVET_T011_UNIDADMEDIDA.A011CODIGO%TYPE,
                         p_A011UNIDADMEDIDA IN IVET_T011_UNIDADMEDIDA.A011UNIDADMEDIDA%TYPE,
                         p_idUsuario        IN NUMBER,
                         p_resultado        OUT CURSOR_SALIDA,
                         p_codError         OUT NUMBER,
                         p_msjError         OUT VARCHAR2);

PROCEDURE Pr_ConsultarPorFiltro (p_Filtro IN VARCHAR2,
                                 p_idUsuario IN NUMBER,
                                 p_resultado OUT CURSOR_SALIDA,
                                 p_codError  OUT NUMBER,
                                 p_msjError  OUT VARCHAR2);

end PK_T011_UNIDADMEDIDA;