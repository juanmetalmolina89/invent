CREATE OR REPLACE PACKAGE "PK_T001_ENTIDAD" is

/************************************************************************
DESCRIPCION       : Servicios CRUD sobre la tabla IVET_T001_ENTIDAD

REALIZADO POR     : Julio Cesar Baracaldo
FECHA CREACION    : 14/11/2016

FECHA MODIFICA    : dd/MMM/aaaa
MODIFICADO POR    :
DESCRIPCION CAMBIO:
************************************************************************/
NOMBRE_PAQUETE CONSTANT VARCHAR2(100) := 'PK_T001_ENTIDAD';

TYPE CURSOR_SALIDA IS REF CURSOR;

-- Funciones y Procedimientos del paquete:
--  PROCEDURE Pr_Insertar
--  PROCEDURE Pr_Eliminar
--  PROCEDURE Pr_Actualizar
--  PROCEDURE Pr_ConsultarPorFiltro

PROCEDURE Pr_Insertar (p_A001SIGLAAUTAMB  IN IVET_T001_ENTIDAD.A001SIGLAAUTAMB%TYPE,
                       p_A001NOMBREAUTAMB IN IVET_T001_ENTIDAD.A001NOMBREAUTAMB%TYPE,
                       p_A001CODDIVIPOLA  IN IVET_T001_ENTIDAD.A001CODDIVIPOLA%TYPE,
                       p_idUsuario        IN NUMBER,
                       p_resultado        OUT CURSOR_SALIDA,
                       p_codError         OUT NUMBER,
                       p_msjError         OUT VARCHAR2);

PROCEDURE Pr_Eliminar (p_A001CODIGO IN IVET_T001_ENTIDAD.A001CODIGO%TYPE,
                       p_idUsuario  IN NUMBER,
                       p_resultado  OUT CURSOR_SALIDA,
                       p_codError   OUT NUMBER,
                       p_msjError   OUT VARCHAR2);

PROCEDURE Pr_Actualizar (p_A001CODIGO       IN IVET_T001_ENTIDAD.A001CODIGO%TYPE,
                         p_A001SIGLAAUTAMB  IN IVET_T001_ENTIDAD.A001SIGLAAUTAMB%TYPE,
                         p_A001NOMBREAUTAMB IN IVET_T001_ENTIDAD.A001NOMBREAUTAMB%TYPE,
                         p_idUsuario        IN NUMBER,
                         p_resultado        OUT CURSOR_SALIDA,
                         p_codError         OUT NUMBER,
                         p_msjError         OUT VARCHAR2);

PROCEDURE Pr_ConsultarPorFiltro (p_Filtro    IN VARCHAR2,
                                 p_idUsuario IN NUMBER,
                                 p_resultado OUT CURSOR_SALIDA,
                                 p_codError  OUT NUMBER,
                                 p_msjError  OUT VARCHAR2);

end PK_T001_ENTIDAD;
