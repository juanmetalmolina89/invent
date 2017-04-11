CREATE OR REPLACE PACKAGE "PK_T105_DIVIPOLA" is

/************************************************************************
DESCRIPCION       : Servicios CRUD sobre la tabla PART_T105_DIVIPOLA

REALIZADO POR     : Julio Cesar Baracaldo
FECHA CREACION    : 14/11/2016

FECHA MODIFICA    : dd/MMM/aaaa
MODIFICADO POR    :
DESCRIPCION CAMBIO:
************************************************************************/
NOMBRE_PAQUETE CONSTANT VARCHAR2(100) := 'PK_T105_DIVIPOLA';
TYPE CURSOR_SALIDA IS REF CURSOR;

-- Funciones y Procedimientos del paquete:
--  PROCEDURE Pr_Insertar
--  PROCEDURE Pr_Eliminar
--  PROCEDURE Pr_Actualizar
--  PROCEDURE Pr_ConsultarPorFiltro
----

PROCEDURE Pr_Insertar (p_A105CODDIVIPOLA    IN PART_T105_DIVIPOLA.A105CODDIVIPOLA%TYPE,
                       p_A105CODDIVIPOLADM  IN PART_T105_DIVIPOLA.A105CODDIVIPOLADM%TYPE,
                       p_A105DEPARTAMENTO IN  PART_T105_DIVIPOLA.A105DEPARTAMENTO%TYPE,
                       p_A105MUNICIPIO IN  PART_T105_DIVIPOLA.A105MUNICIPIO%TYPE,
                       p_idUsuario IN NUMBER,
                       p_resultado OUT CURSOR_SALIDA,
                       p_codError  OUT NUMBER,
                       p_msjError  OUT VARCHAR2);

PROCEDURE Pr_Eliminar (p_A105CODIGO IN PART_T105_DIVIPOLA.A105CODIGO%TYPE,
                       p_idUsuario IN NUMBER,
                       p_resultado OUT CURSOR_SALIDA,
                       p_codError  OUT NUMBER,
                       p_msjError  OUT VARCHAR2);

PROCEDURE Pr_Actualizar (p_A105CODIGO IN PART_T105_DIVIPOLA.A105CODIGO%TYPE,
                         p_A105CODDIVIPOLA IN  PART_T105_DIVIPOLA.A105CODDIVIPOLA%TYPE,
                         p_A105CODDIVIPOLADM IN  PART_T105_DIVIPOLA.A105CODDIVIPOLADM%TYPE,
                         p_A105DEPARTAMENTO IN  PART_T105_DIVIPOLA.A105DEPARTAMENTO%TYPE,
                         p_A105MUNICIPIO IN  PART_T105_DIVIPOLA.A105MUNICIPIO%TYPE,
                         p_idUsuario IN NUMBER,
                         p_resultado OUT CURSOR_SALIDA,
                         p_codError  OUT NUMBER,
                         p_msjError  OUT VARCHAR2);

PROCEDURE Pr_ConsultarPorFiltro (p_Filtro IN VARCHAR2,
                                 p_idUsuario IN NUMBER,
                                 p_resultado OUT CURSOR_SALIDA,
                                 p_codError  OUT NUMBER,
                                 p_msjError  OUT VARCHAR2);

end PK_T105_DIVIPOLA;