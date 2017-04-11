CREATE OR REPLACE PACKAGE "PK_T003_INVENTARIO" is

/************************************************************************
DESCRIPCION       : Servicios CRUD sobre la tabla IVET_T003_INVENTARIO

REALIZADO POR     : Julio Cesar Baracaldo
FECHA CREACION    : 14/11/2016

FECHA MODIFICA    : dd/MMM/aaaa
MODIFICADO POR    :
DESCRIPCION CAMBIO:
************************************************************************/
NOMBRE_PAQUETE CONSTANT VARCHAR2(100) := 'PK_T003_INVENTARIO';

TYPE CURSOR_SALIDA IS REF CURSOR;

-- Funciones y Procedimientos del paquete:
--  PROCEDURE Pr_Insertar
--  PROCEDURE Pr_Eliminar
--  PROCEDURE Pr_Actualizar
--  PROCEDURE Pr_ConsultarPorFiltro
----

PROCEDURE Pr_Insertar (p_A003OBJETO                 IN IVET_T003_INVENTARIO.A003OBJETO%TYPE,
                       p_A003FECHA_INICIAL          IN IVET_T003_INVENTARIO.A003FECHA_INICIAL%TYPE,
                       p_A003FECHA_FINAL            IN IVET_T003_INVENTARIO.A003FECHA_FINAL%TYPE,
                       p_A003IDDIVIPOLA             IN IVET_T003_INVENTARIO.A003IDDIVIPOLA%TYPE,
                       p_A003DESCRIPCION_TERRITORIO IN IVET_T003_INVENTARIO.A003DESCRIPCION_TERRITORIO%TYPE,
                       p_idUsuario                  IN NUMBER,
                       p_resultado                  OUT CURSOR_SALIDA,
                       p_codError                   OUT NUMBER,
                       p_msjError                   OUT VARCHAR2);

PROCEDURE Pr_Eliminar (p_A003CODIGO IN IVET_T003_INVENTARIO.A003CODIGO%TYPE,
                       p_idUsuario  IN NUMBER,
                       p_resultado  OUT CURSOR_SALIDA,
                       p_codError   OUT NUMBER,
                       p_msjError   OUT VARCHAR2);

PROCEDURE Pr_Actualizar (p_A003CODIGO                 IN IVET_T003_INVENTARIO.A003CODIGO%TYPE,
                         p_A003OBJETO                 IN IVET_T003_INVENTARIO.A003OBJETO%TYPE,
                         p_A003FECHA_INICIAL          IN IVET_T003_INVENTARIO.A003FECHA_INICIAL%TYPE,
                         p_A003FECHA_FINAL            IN IVET_T003_INVENTARIO.A003FECHA_FINAL%TYPE,
                         p_A003ESTADO_INVENTARIO      IN IVET_T003_INVENTARIO.A003ESTADO_INVENTARIO%TYPE,
                         p_A003IDDIVIPOLA             IN IVET_T003_INVENTARIO.A003IDDIVIPOLA%TYPE,
                         p_A003DESCRIPCION_TERRITORIO IN IVET_T003_INVENTARIO.A003DESCRIPCION_TERRITORIO%TYPE,
                         p_idUsuario                  IN NUMBER,
                         p_resultado                  OUT CURSOR_SALIDA,
                         p_codError                   OUT NUMBER,
                         p_msjError                   OUT VARCHAR2);

PROCEDURE Pr_ConsultarPorFiltro (p_Filtro    IN VARCHAR2,
                                 p_idUsuario IN NUMBER,
                                 p_resultado OUT CURSOR_SALIDA,
                                 p_codError  OUT NUMBER,
                                 p_msjError  OUT VARCHAR2);
                                 
FUNCTION Fc_EstadoNuevoInv (p_categoria VARCHAR2,
                              p_lista     VARCHAR2)
                              RETURN NUMBER;
                              
FUNCTION Fc_EstadoInventario (p_categoria VARCHAR2,
                              p_lista     VARCHAR2)
                              RETURN VARCHAR2;
                              
end PK_T003_INVENTARIO;
