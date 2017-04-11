CREATE OR REPLACE PACKAGE PK_T018_CAMBIO_ESTADOS is

/************************************************************************
DESCRIPCION       : Servicios CRUD sobre la tabla IVET_T001_ENTIDAD

REALIZADO POR     : Julio Cesar Baracaldo
FECHA CREACION    : 14/11/2016

FECHA MODIFICA    : dd/MMM/aaaa
MODIFICADO POR    :
DESCRIPCION CAMBIO:
************************************************************************/
NOMBRE_PAQUETE CONSTANT VARCHAR2(100) := 'PK_T018_CAMBIO_ESTADOS';

TYPE CURSOR_SALIDA IS REF CURSOR;

-- Funciones y Procedimientos del paquete:
--  PROCEDURE Pr_Insertar
--  PROCEDURE Pr_Eliminar
--  PROCEDURE Pr_Actualizar
--  PROCEDURE Pr_ConsultarPorFiltro
----

PROCEDURE Pr_Insertar (p_A018IDINVENTARIO    IN IVET_T018_CAMBIO_ESTADOS.A018IDINVENTARIO%TYPE,
                       p_A018ESTADO_ANT_INV  IN IVET_T018_CAMBIO_ESTADOS.A018ESTADO_ANT_INV%TYPE,
                       p_A018OBS_RECHAZO_ANT IN IVET_T018_CAMBIO_ESTADOS.A018OBS_RECHAZO_ANT%TYPE,
                       p_A018ESTADO_NVO_INV  IN IVET_T018_CAMBIO_ESTADOS.A018ESTADO_NVO_INV%TYPE,
                       p_idUsuario        IN NUMBER,
                       p_resultado        OUT CURSOR_SALIDA,
                       p_codError         OUT NUMBER,
                       p_msjError         OUT VARCHAR2);

end PK_T018_CAMBIO_ESTADOS;