CREATE OR REPLACE PACKAGE "PK_T010_CATEGCOMBUSTIBLE" is

/************************************************************************
DESCRIPCION       : Servicios CRUD sobre la tabla IVET_T010_CATEGCOMBUSTIBLE

REALIZADO POR     : Julio Cesar Baracaldo
FECHA CREACION    : 14/11/2016

FECHA MODIFICA    : dd/MMM/aaaa
MODIFICADO POR    :
DESCRIPCION CAMBIO:
************************************************************************/
NOMBRE_PAQUETE CONSTANT VARCHAR2(100) := 'PK_T010_CATEGCOMBUSTIBLE';
TYPE CURSOR_SALIDA IS REF CURSOR;

-- Funciones y Procedimientos del paquete:
--  PROCEDURE Pr_Insertar
--  PROCEDURE Pr_Eliminar
--  PROCEDURE Pr_Actualizar
--  PROCEDURE Pr_ConsultarPorFiltro


PROCEDURE Pr_Insertar (p_A010CODCATEMISION     IN IVET_T010_CATEGCOMBUSTIBLE.A010CODCATEMISION%TYPE,
                       p_A010IDTIPOCOMBUSTIBLE IN IVET_T010_CATEGCOMBUSTIBLE.A010IDTIPOCOMBUSTIBLE%TYPE,
                       p_idUsuario             IN NUMBER,
                       p_resultado             OUT CURSOR_SALIDA,
                       p_codError              OUT NUMBER,
                       p_msjError              OUT VARCHAR);

PROCEDURE Pr_Eliminar (p_A010CODIGO IN IVET_T010_CATEGCOMBUSTIBLE.A010CODIGO%TYPE,
                       p_idUsuario  IN NUMBER,
                       p_resultado  OUT CURSOR_SALIDA,
                       p_codError   OUT NUMBER,
                       p_msjError   OUT VARCHAR2);

PROCEDURE Pr_Actualizar (p_A010CODIGO            IN IVET_T010_CATEGCOMBUSTIBLE.A010CODIGO%TYPE,
                         p_A010CODCATEMISION     IN IVET_T010_CATEGCOMBUSTIBLE.A010CODCATEMISION%TYPE,
                         p_A010IDTIPOCOMBUSTIBLE IN IVET_T010_CATEGCOMBUSTIBLE.A010IDTIPOCOMBUSTIBLE%TYPE,
                         p_idUsuario IN NUMBER,
                         p_resultado OUT CURSOR_SALIDA,
                         p_codError  OUT NUMBER,
                         p_msjError  OUT VARCHAR2);

PROCEDURE Pr_ConsultarPorFiltro (p_Filtro IN VARCHAR2,
                                 p_idUsuario IN NUMBER,
                                 p_resultado OUT CURSOR_SALIDA,
                                 p_codError  OUT NUMBER,
                                 p_msjError  OUT VARCHAR2);

end PK_T010_CATEGCOMBUSTIBLE;
