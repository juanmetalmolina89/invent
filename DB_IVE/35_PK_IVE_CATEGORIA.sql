CREATE OR REPLACE PACKAGE "PK_IVE_CATEGORIA" is
 /********************************************************************************
  DESCRIPCION       : Paquete utilizado para agrupar todos los procedimientos y funciones
                      para la administraci?n de categorias del inventario

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 12/12/2016

  FECHA MODIFICA    :
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:
  *******************************************************************************/
  NOMBRE_PAQUETE CONSTANT VARCHAR2(100) := 'PK_IVE_CATEGORIA';
  TYPE CURSOR_SALIDA IS REF CURSOR;

  procedure Pr_RegistrarCategoria (p_A009NOMCATEMISION       IN IVET_T009_CATEGEMISION.A009NOMCATEMISION%TYPE,
                                   p_A009DESCCATEMISION      IN IVET_T009_CATEGEMISION.A009DESCCATEMISION%TYPE,
                                   p_A009IDTIPOCATEMISION    IN IVET_T009_CATEGEMISION.A009IDTIPOCATEMISION%TYPE,
                                   p_A009IDINVENTARIO        IN IVET_T009_CATEGEMISION.A009IDINVENTARIO%TYPE,
                                   p_A009IDTIPOCOMBUSTIBLE   IN IVET_T009_CATEGEMISION.A009IDTIPOCOMBUSTIBLE%TYPE,
                                   p_A009CILINDRAJE          IN IVET_T009_CATEGEMISION.A009CILINDRAJE%TYPE,
                                   p_A009ANIOMODELO          IN IVET_T009_CATEGEMISION.A009ANIOMODELO%TYPE,
                                   p_A009NROFUENTES          IN IVET_T009_CATEGEMISION.A009NROFUENTES%TYPE,
                                   p_A009DETMETODFUENTES     IN IVET_T009_CATEGEMISION.A009DETMETODFUENTES%TYPE,
                                   p_A009IDMETODOEMISION     IN IVET_T009_CATEGEMISION.A009IDMETODOEMISION%TYPE,
                                   p_A009OBSERVACION         IN IVET_T009_CATEGEMISION.A009OBSERVACION%TYPE,
                                   p_idUsuario               IN NUMBER,
                                   p_Respuesta               OUT CURSOR_SALIDA,
                                   p_codError                OUT NUMBER,
                                   p_msjError                OUT VARCHAR2);

  procedure Pr_ActualizarCategoria (p_A009CODIGO              IN IVET_T009_CATEGEMISION.A009CODIGO%TYPE,
                                    p_A009NOMCATEMISION       IN IVET_T009_CATEGEMISION.A009NOMCATEMISION%TYPE,
                                    p_A009DESCCATEMISION      IN IVET_T009_CATEGEMISION.A009DESCCATEMISION%TYPE,
                                    p_A009IDTIPOCATEMISION    IN IVET_T009_CATEGEMISION.A009IDTIPOCATEMISION%TYPE,
                                    p_A009IDINVENTARIO        IN IVET_T009_CATEGEMISION.A009IDINVENTARIO%TYPE,
                                    p_A009IDTIPOCOMBUSTIBLE   IN IVET_T009_CATEGEMISION.A009IDTIPOCOMBUSTIBLE%TYPE,
                                    p_A009CILINDRAJE          IN IVET_T009_CATEGEMISION.A009CILINDRAJE%TYPE,
                                    p_A009ANIOMODELO          IN IVET_T009_CATEGEMISION.A009ANIOMODELO%TYPE,
                                    p_A009NROFUENTES          IN IVET_T009_CATEGEMISION.A009NROFUENTES%TYPE,
                                    p_A009DETMETODFUENTES     IN IVET_T009_CATEGEMISION.A009DETMETODFUENTES%TYPE,
                                    p_A009IDMETODOEMISION     IN IVET_T009_CATEGEMISION.A009IDMETODOEMISION%TYPE,
                                    p_A009OBSERVACION         IN IVET_T009_CATEGEMISION.A009OBSERVACION%TYPE,
                                    p_idUsuario               IN NUMBER,
                                    p_Respuesta               OUT CURSOR_SALIDA,
                                    p_codError                OUT NUMBER,
                                    p_msjError                OUT VARCHAR2);
                                    
  procedure Pr_ConsultarCategoriaId (p_A009CODIGO IN IVET_T009_CATEGEMISION.A009CODIGO%TYPE,
                                     p_idUsuario  IN NUMBER,
                                     p_Respuesta  OUT CURSOR_SALIDA,
                                     p_codError   OUT NUMBER,
                                     p_msjError   OUT VARCHAR2);
                                      
                                      
  procedure Pr_ListarCategoria (p_Filtro IN VARCHAR2,
                                p_idUsuario  IN NUMBER,
                                p_Respuesta  OUT CURSOR_SALIDA,
                                p_codError   OUT NUMBER,
                                p_msjError   OUT VARCHAR2);
                                
  procedure Pr_EliminarCategoria (p_A009CODIGO  IN IVET_T009_CATEGEMISION.A009CODIGO%TYPE,
                                  p_idUsuario IN NUMBER,
                                  p_Respuesta OUT CURSOR_SALIDA,
                                  p_codError OUT NUMBER,
                                  p_msjError OUT VARCHAR2);
                                  
  procedure Pr_ConsultarGrillaCat (p_PalabraClave IN VARCHAR2,
                                   p_idUsuario IN NUMBER,
                                   p_Respuesta OUT CURSOR_SALIDA,
                                   p_codError OUT NUMBER,
                                   p_msjError OUT VARCHAR2);
                                  
  procedure Pr_RegistrarCatCombustible (p_A010CODCATEMISION     IN IVET_T010_CATEGCOMBUSTIBLE.A010CODCATEMISION%TYPE,
                                        p_A010IDTIPOCOMBUSTIBLE IN IVET_T010_CATEGCOMBUSTIBLE.A010IDTIPOCOMBUSTIBLE%TYPE,
                                        p_idUsuario             IN NUMBER,
                                        p_Respuesta             OUT CURSOR_SALIDA,
                                        p_codError              OUT NUMBER,
                                        p_msjError              OUT VARCHAR);
                                        
  procedure Pr_EliminarCatCombustible (p_A010CODIGO IN IVET_T010_CATEGCOMBUSTIBLE.A010CODIGO%TYPE,
                                       p_idUsuario  IN NUMBER,
                                       p_Respuesta  OUT CURSOR_SALIDA,
                                       p_codError   OUT NUMBER,
                                       p_msjError   OUT VARCHAR2);
                                       
  procedure Pr_ConsultarCatCombustible (p_A010CODCATEMISION IN IVET_T010_CATEGCOMBUSTIBLE.A010CODCATEMISION%TYPE,
                                        p_idUsuario IN NUMBER,
                                        p_Respuesta OUT CURSOR_SALIDA,
                                        p_codError OUT NUMBER,
                                        p_msjError OUT VARCHAR2);
                                        
  procedure Pr_RegistrarCatCIIU (p_A017CODCATEMISION IN IVET_T017_CATGEMIS_CIIU.A017CODCATEMISION%TYPE,
                                 p_A017IDCODCIIU     IN IVET_T017_CATGEMIS_CIIU.A017IDCODCIIU%TYPE,
                                 p_idUsuario         IN NUMBER,
                                 p_Respuesta         OUT CURSOR_SALIDA,
                                 p_codError          OUT NUMBER,
                                 p_msjError          OUT VARCHAR);
                                        
  procedure Pr_EliminarCatCIIU (p_A017CODIGO IN IVET_T017_CATGEMIS_CIIU.A017CODIGO%TYPE,
                                p_idUsuario  IN NUMBER,
                                p_Respuesta  OUT CURSOR_SALIDA,
                                p_codError   OUT NUMBER,
                                p_msjError   OUT VARCHAR2);
                                       
  procedure Pr_ConsultarCIIU (p_A009CODIGO IN IVET_T009_CATEGEMISION.A009CODIGO%TYPE,
                              p_idUsuario IN NUMBER,
                              p_Respuesta OUT CURSOR_SALIDA,
                              p_codError OUT NUMBER,
                              p_msjError OUT VARCHAR2);
                                   
  procedure Pr_RegistrarContaminante (p_A013IDCATEGORIAEMISION IN  IVET_T013_CATEGCONTAMINA.A013IDCATEGORIAEMISION%TYPE,
                                      p_A013IDCONTAMINANTE IN  IVET_T013_CATEGCONTAMINA.A013IDCONTAMINANTE%TYPE,
                                      p_A013VALORCONTAMINANTE IN  IVET_T013_CATEGCONTAMINA.A013VALORCONTAMINANTE%TYPE,
                                      p_A013FACTORACTIVIDAD IN  IVET_T013_CATEGCONTAMINA.A013FACTORACTIVIDAD%TYPE,
                                      p_A013UNDMEDFACTORACTIV IN  IVET_T013_CATEGCONTAMINA.A013UNDMEDFACTORACTIV%TYPE,
                                      p_A013FTEMETDFACTORACTIV IN  IVET_T013_CATEGCONTAMINA.A013FTEMETDFACTORACTIV%TYPE,
                                      p_A013FACTOREMISION IN  IVET_T013_CATEGCONTAMINA.A013FACTOREMISION%TYPE,
                                      p_A013UNDMEDFACTOREMIS IN  IVET_T013_CATEGCONTAMINA.A013UNDMEDFACTOREMIS%TYPE,
                                      p_A013FTEMETDFACTOREMIS IN  IVET_T013_CATEGCONTAMINA.A013FTEMETDFACTOREMIS%TYPE,
                                      p_idUsuario IN NUMBER,
                                      p_Respuesta OUT CURSOR_SALIDA,
                                      p_codError    OUT NUMBER,
                                      p_msjError  OUT VARCHAR2);
                                      
  procedure Pr_EliminarContaminante (p_A013CODIGO IN  IVET_T013_CATEGCONTAMINA.A013CODIGO%TYPE,
                                  p_idUsuario IN NUMBER,
                                  p_Respuesta OUT CURSOR_SALIDA,
                                  p_codError OUT NUMBER,
                                  p_msjError OUT VARCHAR2);
                                   
  procedure Pr_ActualizarContaminante (p_A013CODIGO IN  IVET_T013_CATEGCONTAMINA.A013CODIGO%TYPE,
                                       p_A013IDCATEGORIAEMISION IN  IVET_T013_CATEGCONTAMINA.A013IDCATEGORIAEMISION%TYPE,
                                       p_A013IDCONTAMINANTE IN  IVET_T013_CATEGCONTAMINA.A013IDCONTAMINANTE%TYPE,
                                       p_A013VALORCONTAMINANTE IN  IVET_T013_CATEGCONTAMINA.A013VALORCONTAMINANTE%TYPE,
                                       p_A013FACTORACTIVIDAD IN  IVET_T013_CATEGCONTAMINA.A013FACTORACTIVIDAD%TYPE,
                                       p_A013UNDMEDFACTORACTIV IN  IVET_T013_CATEGCONTAMINA.A013UNDMEDFACTORACTIV%TYPE,
                                       p_A013FTEMETDFACTORACTIV IN  IVET_T013_CATEGCONTAMINA.A013FTEMETDFACTORACTIV%TYPE,
                                       p_A013FACTOREMISION IN  IVET_T013_CATEGCONTAMINA.A013FACTOREMISION%TYPE,
                                       p_A013UNDMEDFACTOREMIS IN  IVET_T013_CATEGCONTAMINA.A013UNDMEDFACTOREMIS%TYPE,
                                       p_A013FTEMETDFACTOREMIS IN  IVET_T013_CATEGCONTAMINA.A013FTEMETDFACTOREMIS%TYPE,
                                       p_A013EMISIONTOTAL IN  IVET_T013_CATEGCONTAMINA.A013EMISIONTOTAL%TYPE,
                                       p_idUsuario IN NUMBER,
                                       p_Respuesta OUT CURSOR_SALIDA,
                                       p_codError OUT NUMBER,
                                       p_msjError OUT VARCHAR2);
                                       
  procedure Pr_ConsultarContaminanteId (p_A013IDCATEGORIAEMISION IN IVET_T013_CATEGCONTAMINA.A013IDCATEGORIAEMISION%TYPE,
                                        p_idUsuario IN NUMBER,
                                        p_Respuesta OUT CURSOR_SALIDA,
                                        p_codError OUT NUMBER,
                                        p_msjError OUT VARCHAR2);
                                        
  procedure Pr_ConsultarGrillaCon (p_PalabraClave IN VARCHAR2,
                                   p_idUsuario IN NUMBER,
                                   p_Respuesta OUT CURSOR_SALIDA,
                                   p_codError OUT NUMBER,
                                   p_msjError OUT VARCHAR2);
								   
end PK_IVE_CATEGORIA;