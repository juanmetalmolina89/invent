CREATE OR REPLACE PACKAGE PK_T108_CODIGOCIIU is

/************************************************************************
DESCRIPCION       : Servicios CRUD sobre la tabla PART_T108_CODIGOCIIU

REALIZADO POR     : Julio Cesar Baracaldo
FECHA CREACION    : 14/11/2016

FECHA MODIFICA    : dd/MMM/aaaa
MODIFICADO POR    :
DESCRIPCION CAMBIO:
************************************************************************/
NOMBRE_PAQUETE CONSTANT VARCHAR2(100) := 'PART_T108_CODIGOCIIU';
TYPE CURSOR_SALIDA IS REF CURSOR;

-- Funciones y Procedimientos del paquete:
--  PROCEDURE Pr_Insertar
--  PROCEDURE Pr_Eliminar
--  PROCEDURE Pr_Actualizar
--  PROCEDURE Pr_ConsultarPorFiltro
----

PROCEDURE Pr_Insertar (p_A108CODIGOCIIU      IN PART_T108_CODIGOCIIU.A108CODIGOCIIU%TYPE,
                       p_A108DESCRIPCIONCIIU IN  PART_T108_CODIGOCIIU.A108DESCRIPCIONCIIU%TYPE,
                       p_idUsuario           IN NUMBER,
                       p_resultado           OUT CURSOR_SALIDA,
                       p_codError            OUT NUMBER,
                       p_msjError            OUT VARCHAR2);

PROCEDURE Pr_Eliminar (p_A108CODIGO IN PART_T108_CODIGOCIIU.A108CODIGO%TYPE,
                       p_idUsuario  IN NUMBER,
                       p_resultado  OUT CURSOR_SALIDA,
                       p_codError   OUT NUMBER,
                       p_msjError   OUT VARCHAR2);

PROCEDURE Pr_Actualizar (p_A108CODIGO          IN PART_T108_CODIGOCIIU.A108CODIGO%TYPE,
                         p_A108CODIGOCIIU      IN PART_T108_CODIGOCIIU.A108CODIGOCIIU%TYPE,
                         p_A108DESCRIPCIONCIIU IN  PART_T108_CODIGOCIIU.A108DESCRIPCIONCIIU%TYPE,
                         p_idUsuario         IN NUMBER,
                         p_resultado         OUT CURSOR_SALIDA,
                         p_codError          OUT NUMBER,
                         p_msjError          OUT VARCHAR2);

PROCEDURE Pr_ConsultarPorFiltro (p_Filtro    IN VARCHAR2,
                                 p_idUsuario IN NUMBER,
                                 p_resultado OUT CURSOR_SALIDA,
                                 p_codError  OUT NUMBER,
                                 p_msjError  OUT VARCHAR2);

end PK_T108_CODIGOCIIU;