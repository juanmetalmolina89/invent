create or replace PACKAGE "PK_IVE_INVENTARIO" is
 /********************************************************************************
  DESCRIPCION       : Paquete utilizado para agrupar todos los procedimientos y funciones
                      para la administraci?n de inventarios

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 08/12/2016

  FECHA MODIFICA    :
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:
  *******************************************************************************/
  NOMBRE_PAQUETE CONSTANT VARCHAR2(100) := 'PK_IVE_INVENTARIO';
  TYPE CURSOR_SALIDA IS REF CURSOR;

  procedure Pr_RegistrarInventario (p_A003OBJETO                 IN IVET_T003_INVENTARIO.A003OBJETO%TYPE,
                                    p_A003FECHA_INICIAL          IN IVET_T003_INVENTARIO.A003FECHA_INICIAL%TYPE,
                                    p_A003FECHA_FINAL            IN IVET_T003_INVENTARIO.A003FECHA_FINAL%TYPE,
                                    p_A003IDDIVIPOLA             IN IVET_T003_INVENTARIO.A003IDDIVIPOLA%TYPE,
                                    p_A003DESCRIPCION_TERRITORIO IN IVET_T003_INVENTARIO.A003DESCRIPCION_TERRITORIO%TYPE,
                                    p_idUsuario                  IN NUMBER,
                                    p_Respuesta                  OUT CURSOR_SALIDA,
                                    p_codError                   OUT NUMBER,
                                    p_msjError                   OUT VARCHAR2);

  procedure Pr_ActualizarInventario (p_A003CODIGO                 IN IVET_T003_INVENTARIO.A003CODIGO%TYPE,
                                     p_A003OBJETO                 IN IVET_T003_INVENTARIO.A003OBJETO%TYPE,
                                     p_A003FECHA_INICIAL          IN IVET_T003_INVENTARIO.A003FECHA_INICIAL%TYPE,
                                     p_A003FECHA_FINAL            IN IVET_T003_INVENTARIO.A003FECHA_FINAL%TYPE,
                                     p_A003ESTADO_INVENTARIO      IN IVET_T003_INVENTARIO.A003ESTADO_INVENTARIO%TYPE,
                                     p_A003IDDIVIPOLA             IN IVET_T003_INVENTARIO.A003IDDIVIPOLA%TYPE,
                                     p_A003DESCRIPCION_TERRITORIO IN IVET_T003_INVENTARIO.A003DESCRIPCION_TERRITORIO%TYPE,
                                     p_idUsuario                  IN NUMBER,
                                     p_Respuesta                  OUT CURSOR_SALIDA,
                                     p_codError                   OUT NUMBER,
                                     p_msjError                   OUT VARCHAR2);
                                     
  procedure Pr_ConsultarInventarioId (p_A003CODIGO IN IVET_T003_INVENTARIO.A003CODIGO%TYPE,
                                      p_idUsuario  IN NUMBER,
                                      p_Respuesta  OUT CURSOR_SALIDA,
                                      p_codError   OUT NUMBER,
                                      p_msjError   OUT VARCHAR2);
                                      
  procedure Pr_EliminarInventario (p_A003CODIGO IN IVET_T003_INVENTARIO.A003CODIGO%TYPE,
                                   p_idUsuario  IN NUMBER,
                                   p_Respuesta  OUT CURSOR_SALIDA,
                                   p_codError   OUT NUMBER,
                                   p_msjError   OUT VARCHAR2);
                                      
  procedure Pr_ListarInventario (p_idUsuario  IN NUMBER,
                                 p_Respuesta  OUT CURSOR_SALIDA,
                                 p_codError   OUT NUMBER,
                                 p_msjError   OUT VARCHAR2);
                                
  procedure Pr_ConsultarGrillaInv (p_PalabraClave IN VARCHAR2,
                                   p_idUsuario    IN NUMBER,
                                   p_Respuesta    OUT CURSOR_SALIDA,
                                   p_codError     OUT NUMBER,
                                   p_msjError     OUT VARCHAR2);
                                   
  procedure Pr_RegistrarInvFuente (p_A007IDINVENTARIO IN IVET_T007_INVENTARIOFUENTE.A007IDINVENTARIO%TYPE,
                                   p_A007IDFUENTE     IN IVET_T007_INVENTARIOFUENTE.A007IDFUENTE%TYPE,
                                   p_idUsuario        IN NUMBER,
                                   p_Respuesta        OUT CURSOR_SALIDA,
                                   p_codError         OUT NUMBER,
                                   p_msjError         OUT VARCHAR2);
                       
  procedure Pr_EliminarInvFuente (p_A007CODIGO IN IVET_T007_INVENTARIOFUENTE.A007CODIGO%TYPE,
                                  p_idUsuario  IN NUMBER,
                                  p_Respuesta  OUT CURSOR_SALIDA,
                                  p_codError   OUT NUMBER,
                                  p_msjError   OUT VARCHAR2);
                       
  procedure Pr_ConsultarInvFuente (p_A007IDINVENTARIO IN IVET_T007_INVENTARIOFUENTE.A007IDINVENTARIO%TYPE,
                                   p_idUsuario        IN NUMBER,
                                   p_Respuesta        OUT CURSOR_SALIDA,
                                   p_codError         OUT NUMBER,
                                   p_msjError         OUT VARCHAR2);
                       
  procedure Pr_RegistrarInvContamina (p_A016IDINVENTARIO   IN IVET_T016_INVENTCONTAMINA.A016IDINVENTARIO%TYPE,
                                      p_A016IDCONTAMINANTE IN IVET_T016_INVENTCONTAMINA.A016IDCONTAMINANTE%TYPE,
                                      p_idUsuario          IN NUMBER,
                                      p_Respuesta          OUT CURSOR_SALIDA,
                                      p_codError           OUT NUMBER,
                                      p_msjError           OUT VARCHAR2);
                       
  procedure  Pr_EliminarInvContamina (p_A016CODIGO IN IVET_T016_INVENTCONTAMINA.A016CODIGO%TYPE,
                                      p_idUsuario  IN NUMBER,
                                      p_Respuesta  OUT CURSOR_SALIDA, 
                                      p_codError   OUT NUMBER,
                                      p_msjError   OUT VARCHAR2);
                       
  procedure Pr_ConsultarInvContamina (p_A016IDINVENTARIO IN IVET_T016_INVENTCONTAMINA.A016IDINVENTARIO%TYPE,
                                      p_idUsuario  IN NUMBER,
                                      p_Respuesta  OUT CURSOR_SALIDA,
                                      p_codError   OUT NUMBER,
                                      p_msjError   OUT VARCHAR2);
                                     
  procedure Pr_RegistrarGometria (p_A004GEOMETRIA    IN IVET_T004_GEOMETRIA.A004GEOMETRIA%TYPE,
                                  p_A004IDINVENTARIO IN IVET_T004_GEOMETRIA.A004IDINVENTARIO%TYPE,
                                  p_idUsuario        IN NUMBER,
                                  p_Respuesta        OUT CURSOR_SALIDA,
                                  p_codError         OUT NUMBER,
                                  p_msjError         OUT VARCHAR2);
                                  
  procedure Pr_ConsultarGometriaId (p_A004IDINVENTARIO IN  IVET_T004_GEOMETRIA.A004IDINVENTARIO%TYPE,
                                    p_idUsuario        IN NUMBER,
                                    p_Respuesta        OUT CURSOR_SALIDA,
                                    p_codError         OUT NUMBER,
                                    p_msjError         OUT VARCHAR2);
                                    
  procedure Pr_ActualizarGeometria (p_A004CODIGO       IN IVET_T004_GEOMETRIA.A004CODIGO%TYPE,
                                    p_A004GEOMETRIA    IN IVET_T004_GEOMETRIA.A004GEOMETRIA%TYPE,
                                    p_A004IDINVENTARIO IN IVET_T004_GEOMETRIA.A004IDINVENTARIO%TYPE,
                                    p_idUsuario        IN NUMBER,
                                    p_Respuesta        OUT CURSOR_SALIDA,
                                    p_codError         OUT NUMBER,
                                    p_msjError         OUT VARCHAR2);
                                    
  procedure Pr_RegistrarAdjunto  (p_A014NOMBREADJUNTO IN IVET_T014_ADJUNTO.A014NOMBREADJUNTO%TYPE,
                                  p_A014RUTAADJUNTO   IN IVET_T014_ADJUNTO.A014RUTAADJUNTO%TYPE,
                                  p_A014IDINVENTARIO  IN IVET_T014_ADJUNTO.A014IDINVENTARIO%TYPE,
                                  p_idUsuario         IN NUMBER,
                                  p_Respuesta         OUT CURSOR_SALIDA,
                                  p_codError          OUT NUMBER,
                                  p_msjError          OUT VARCHAR2);
                                 
  procedure Pr_ActualizarAdjunto (p_A014CODIGO        IN IVET_T014_ADJUNTO.A014CODIGO%TYPE,
                                  p_A014NOMBREADJUNTO IN IVET_T014_ADJUNTO.A014NOMBREADJUNTO%TYPE,
                                  p_A014RUTAADJUNTO   IN IVET_T014_ADJUNTO.A014RUTAADJUNTO%TYPE,
                                  p_A014IDINVENTARIO  IN IVET_T014_ADJUNTO.A014IDINVENTARIO%TYPE,
                                  p_idUsuario         IN NUMBER,
                                  p_Respuesta         OUT CURSOR_SALIDA,
                                  p_codError          OUT NUMBER,
                                  p_msjError          OUT VARCHAR2);
                                   
  procedure Pr_ConsultarAdjuntoId (p_A014IDINVENTARIO IN IVET_T014_ADJUNTO.A014IDINVENTARIO%TYPE,
                                   p_idUsuario  IN NUMBER,
                                   p_Respuesta  OUT CURSOR_SALIDA,
                                   p_codError   OUT NUMBER,
                                   p_msjError   OUT VARCHAR2);
                                
  procedure Pr_CambioEstadoInv (p_A003CODIGO            IN IVET_T003_INVENTARIO.A003CODIGO%TYPE,
                                p_A003OBS_RECHAZO       IN IVET_T003_INVENTARIO.A003OBS_RECHAZO%TYPE,
                                p_estpasa               IN NUMBER, --estado al que pasa el inventario 
                                p_idUsuario             IN NUMBER,
                                p_Respuesta             OUT CURSOR_SALIDA,
                                p_codError              OUT NUMBER,
                                p_msjError              OUT VARCHAR2);

end PK_IVE_INVENTARIO;