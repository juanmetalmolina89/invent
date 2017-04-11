CREATE OR REPLACE PACKAGE "PK_T009_CATEGEMISION" is

/************************************************************************
DESCRIPCION       : Servicios CRUD sobre la tabla IVET_T009_CATEGEMISION

REALIZADO POR     : Julio Cesar Baracaldo
FECHA CREACION    : 14/11/2016

FECHA MODIFICA    : dd/MMM/aaaa
MODIFICADO POR    :
DESCRIPCION CAMBIO:
************************************************************************/
NOMBRE_PAQUETE CONSTANT VARCHAR2(100) := 'PK_T009_CATEGEMISION';

TYPE CURSOR_SALIDA IS REF CURSOR;

-- Funciones y Procedimientos del paquete:
--	PROCEDURE Pr_Insertar
--	PROCEDURE Pr_Eliminar
--	PROCEDURE Pr_Actualizar
--	PROCEDURE Pr_ConsultarPorFiltro
----
  
PROCEDURE Pr_Insertar (p_A009NOMCATEMISION     IN  IVET_T009_CATEGEMISION.A009NOMCATEMISION%TYPE,
                       p_A009DESCCATEMISION    IN  IVET_T009_CATEGEMISION.A009DESCCATEMISION%TYPE, 
                       p_A009IDTIPOCATEMISION  IN  IVET_T009_CATEGEMISION.A009IDTIPOCATEMISION%TYPE, 
                       p_A009IDINVENTARIO      IN  IVET_T009_CATEGEMISION.A009IDINVENTARIO%TYPE, 
                       p_A009IDTIPOCOMBUSTIBLE IN  IVET_T009_CATEGEMISION.A009IDTIPOCOMBUSTIBLE%TYPE,
                       p_A009CILINDRAJE        IN  IVET_T009_CATEGEMISION.A009CILINDRAJE%TYPE, 
                       p_A009ANIOMODELO        IN  IVET_T009_CATEGEMISION.A009ANIOMODELO%TYPE, 
                       p_A009NROFUENTES        IN  IVET_T009_CATEGEMISION.A009NROFUENTES%TYPE, 
                       p_A009DETMETODFUENTES   IN  IVET_T009_CATEGEMISION.A009DETMETODFUENTES%TYPE, 
                       p_A009IDMETODOEMISION   IN  IVET_T009_CATEGEMISION.A009IDMETODOEMISION%TYPE, 
                       p_A009OBSERVACION       IN  IVET_T009_CATEGEMISION.A009OBSERVACION%TYPE,
                       p_idUsuario             IN NUMBER,
                       p_resultado             OUT CURSOR_SALIDA,
                       p_codError              OUT NUMBER,
                       p_msjError              OUT VARCHAR2);

PROCEDURE Pr_Eliminar (p_A009CODIGO IN IVET_T009_CATEGEMISION.A009CODIGO%TYPE,
                       p_idUsuario  IN NUMBER,
                       p_resultado  OUT CURSOR_SALIDA,
                       p_codError   OUT NUMBER,
                       p_msjError   OUT VARCHAR2);
  
PROCEDURE Pr_Actualizar (p_A009CODIGO              IN  IVET_T009_CATEGEMISION.A009CODIGO%TYPE,  
                         p_A009NOMCATEMISION       IN  IVET_T009_CATEGEMISION.A009NOMCATEMISION%TYPE,
                         p_A009DESCCATEMISION      IN  IVET_T009_CATEGEMISION.A009DESCCATEMISION%TYPE, 
                         p_A009IDTIPOCATEMISION    IN  IVET_T009_CATEGEMISION.A009IDTIPOCATEMISION%TYPE, 
                         p_A009IDINVENTARIO        IN  IVET_T009_CATEGEMISION.A009IDINVENTARIO%TYPE, 
                         p_A009IDTIPOCOMBUSTIBLE   IN  IVET_T009_CATEGEMISION.A009IDTIPOCOMBUSTIBLE%TYPE, 
                         p_A009CILINDRAJE          IN  IVET_T009_CATEGEMISION.A009CILINDRAJE%TYPE, 
                         p_A009ANIOMODELO          IN  IVET_T009_CATEGEMISION.A009ANIOMODELO%TYPE, 
                         p_A009NROFUENTES          IN  IVET_T009_CATEGEMISION.A009NROFUENTES%TYPE, 
                         p_A009DETMETODFUENTES     IN  IVET_T009_CATEGEMISION.A009DETMETODFUENTES%TYPE, 
                         p_A009IDMETODOEMISION     IN  IVET_T009_CATEGEMISION.A009IDMETODOEMISION%TYPE, 
                         p_A009OBSERVACION         IN  IVET_T009_CATEGEMISION.A009OBSERVACION%TYPE,
                         p_idUsuario               IN NUMBER,                           
                         p_resultado               OUT CURSOR_SALIDA,
                         p_codError                OUT NUMBER,
                         p_msjError                OUT VARCHAR2);
                 
PROCEDURE Pr_ConsultarPorFiltro (p_Filtro    IN VARCHAR2,
                                 p_idUsuario IN NUMBER,
                                 p_resultado OUT CURSOR_SALIDA,
                                 p_codError  OUT NUMBER,
                                 p_msjError  OUT VARCHAR2);

end PK_T009_CATEGEMISION;