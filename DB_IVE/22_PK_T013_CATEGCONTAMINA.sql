CREATE OR REPLACE PACKAGE "PK_T013_CATEGCONTAMINA" is

/************************************************************************
DESCRIPCION       : Servicios CRUD sobre la tabla IVET_T013_CATEGCONTAMINA

REALIZADO POR     : Julio Cesar Baracaldo
FECHA CREACION    : 14/11/2016

FECHA MODIFICA    : dd/MMM/aaaa
MODIFICADO POR    :
DESCRIPCION CAMBIO:
************************************************************************/
NOMBRE_PAQUETE CONSTANT VARCHAR2(100) := 'PK_T013_CATEGCONTAMINA';

TYPE CURSOR_SALIDA IS REF CURSOR;

-- Funciones y Procedimientos del paquete:
--  PROCEDURE Pr_Insertar
--  PROCEDURE Pr_Eliminar
--  PROCEDURE Pr_Actualizar
--  PROCEDURE Pr_ConsultarPorId
--  PROCEDURE Pr_ConsultarPorFiltro
--  PROCEDURE Pr_Listar
----

PROCEDURE Pr_Insertar (p_A013IDCATEGORIAEMISION IN  IVET_T013_CATEGCONTAMINA.A013IDCATEGORIAEMISION%TYPE,
                       p_A013IDCONTAMINANTE IN  IVET_T013_CATEGCONTAMINA.A013IDCONTAMINANTE%TYPE,
                       p_A013VALORCONTAMINANTE IN  IVET_T013_CATEGCONTAMINA.A013VALORCONTAMINANTE%TYPE,
                       p_A013FACTORACTIVIDAD IN  IVET_T013_CATEGCONTAMINA.A013FACTORACTIVIDAD%TYPE,
                       p_A013UNDMEDFACTORACTIV IN  IVET_T013_CATEGCONTAMINA.A013UNDMEDFACTORACTIV%TYPE,
                       p_A013FTEMETDFACTORACTIV IN  IVET_T013_CATEGCONTAMINA.A013FTEMETDFACTORACTIV%TYPE,
                       p_A013FACTOREMISION IN  IVET_T013_CATEGCONTAMINA.A013FACTOREMISION%TYPE,
                       p_A013UNDMEDFACTOREMIS IN  IVET_T013_CATEGCONTAMINA.A013UNDMEDFACTOREMIS%TYPE,
                       p_A013FTEMETDFACTOREMIS IN  IVET_T013_CATEGCONTAMINA.A013FTEMETDFACTOREMIS%TYPE,
                       p_idUsuario IN NUMBER,
                       p_resultado OUT CURSOR_SALIDA,
                       p_codError    OUT NUMBER,
                       p_msjError  OUT VARCHAR2);

PROCEDURE Pr_Eliminar (p_A013CODIGO  IN IVET_T013_CATEGCONTAMINA.A013CODIGO%TYPE,
                         p_idUsuario IN NUMBER,
                         p_resultado OUT CURSOR_SALIDA,
                         p_codError OUT NUMBER,
                         p_msjError OUT VARCHAR2);

PROCEDURE Pr_Actualizar (p_A013CODIGO IN  IVET_T013_CATEGCONTAMINA.A013CODIGO%TYPE,
                         p_A013IDCATEGORIAEMISION IN  IVET_T013_CATEGCONTAMINA.A013IDCATEGORIAEMISION%TYPE,
                         p_A013IDCONTAMINANTE IN  IVET_T013_CATEGCONTAMINA.A013IDCONTAMINANTE%TYPE,
                         p_A013VALORCONTAMINANTE IN  IVET_T013_CATEGCONTAMINA.A013VALORCONTAMINANTE%TYPE,
                         p_A013FACTORACTIVIDAD IN  IVET_T013_CATEGCONTAMINA.A013FACTORACTIVIDAD%TYPE,
                         p_A013UNDMEDFACTORACTIV IN  IVET_T013_CATEGCONTAMINA.A013UNDMEDFACTORACTIV%TYPE,
                         p_A013FTEMETDFACTORACTIV IN  IVET_T013_CATEGCONTAMINA.A013FTEMETDFACTORACTIV%TYPE,
                         p_A013FACTOREMISION IN  IVET_T013_CATEGCONTAMINA.A013FACTOREMISION%TYPE,
                         p_A013UNDMEDFACTOREMIS IN  IVET_T013_CATEGCONTAMINA.A013UNDMEDFACTOREMIS%TYPE,
                         p_A013FTEMETDFACTOREMIS IN  IVET_T013_CATEGCONTAMINA.A013FTEMETDFACTOREMIS%TYPE,
                         --p_A013EMISIONTOTAL IN  IVET_T013_CATEGCONTAMINA.A013EMISIONTOTAL%TYPE,
                         p_idUsuario IN NUMBER,
                         p_resultado OUT CURSOR_SALIDA,
                         p_codError OUT NUMBER,
                         p_msjError OUT VARCHAR2);

PROCEDURE Pr_ConsultarPorFiltro (p_Filtro IN VARCHAR2,
                                 p_idUsuario IN NUMBER,
                                 p_resultado OUT CURSOR_SALIDA,
                                 p_codError  OUT NUMBER,
                                 p_msjError  OUT VARCHAR2);

end PK_T013_CATEGCONTAMINA;
