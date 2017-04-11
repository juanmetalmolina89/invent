CREATE OR REPLACE PACKAGE "PK_REPORTE" is

/************************************************************************
DESCRIPCION       : Paquete para el manejo de reportes

REALIZADO POR     : Luis Felipe Rueda Forero
FECHA CREACION    : 23/12/2016

FECHA MODIFICA    : dd/MMM/aaaa
MODIFICADO POR    :
DESCRIPCION CAMBIO:
************************************************************************/
NOMBRE_PAQUETE CONSTANT VARCHAR2(100) := 'PK_REPORTE';
TYPE CURSOR_SALIDA IS REF CURSOR;

-- Funciones y Procedimientos del paquete:
--  PROCEDURE Pr_generarreporte
----

PROCEDURE Pr_generarreporte (p_codigoinv  IN VARCHAR2,
                             p_reporte    IN NUMBER, 
                             p_idUsuario  IN NUMBER,
                             p_Respuesta  OUT CURSOR_SALIDA,
                             p_codError   OUT NUMBER,
                             p_msjError   OUT VARCHAR2);

End PK_REPORTE;