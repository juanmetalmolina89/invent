CREATE OR REPLACE PACKAGE "PK_UTL_LISTADOS" is
 /********************************************************************************
  DESCRIPCION       : Paquete utilizado para agrupar todos los procedimientos y funciones
                      para la generaci?n de listados

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 17/11/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:
  *******************************************************************************/
  NOMBRE_PAQUETE CONSTANT VARCHAR2(100) := 'PK_UTL_LISTADOS';
  TYPE CURSOR_SALIDA IS REF CURSOR;

  procedure Pr_ListarAutoridades (p_idUsuario IN NUMBER,
                                  p_Respuesta OUT CURSOR_SALIDA,
                                  p_codError  OUT NUMBER,
                                  p_msjError  OUT VARCHAR2);

  procedure Pr_ListarDivipolaDepto (p_idUsuario IN NUMBER,
                                    p_Respuesta OUT CURSOR_SALIDA,
                                    p_codError  OUT NUMBER,
                                    p_msjError  OUT VARCHAR2);

  procedure Pr_ListarDivipolaMcpio (p_A105CODDEPARTAMENTO IN PART_T105_DIVIPOLA.A105CODDEPARTAMENTO%TYPE,
                                    p_idUsuario           IN NUMBER,
                                    p_Respuesta           OUT CURSOR_SALIDA,
                                    p_codError            OUT NUMBER,
                                    p_msjError            OUT VARCHAR2);

  procedure Pr_ListarParametricas (p_Categoria IN VARCHAR2,
                                  p_idUsuario  IN NUMBER,
                                  p_Respuesta  OUT CURSOR_SALIDA,
                                  p_codError   OUT NUMBER,
                                  p_msjError   OUT VARCHAR2);
                                  
  procedure Pr_ListarContamInv (p_idUsuario IN NUMBER,
                                 p_Respuesta OUT CURSOR_SALIDA,
                                 p_codError  OUT NUMBER,
                                 p_msjError  OUT VARCHAR2);
                                 
  procedure Pr_ListarFuenteInv (p_idUsuario IN NUMBER,
                                p_Respuesta OUT CURSOR_SALIDA,
                                p_codError OUT NUMBER,
                                p_msjError OUT VARCHAR2);
                                
  procedure Pr_ListarCiiu (p_idUsuario IN NUMBER,
                           p_Respuesta OUT CURSOR_SALIDA,
                           p_codError OUT NUMBER,
                           p_msjError OUT VARCHAR2);
                           
  procedure Pr_ListarMetodoEmision (p_idUsuario IN NUMBER,
                                    p_Respuesta OUT CURSOR_SALIDA,
                                    p_codError OUT NUMBER,
                                    p_msjError OUT VARCHAR2);
                                    
  procedure Pr_ListarUniMedFacAct (p_idUsuario IN NUMBER,
                                   p_Respuesta OUT CURSOR_SALIDA,
                                   p_codError OUT NUMBER,
                                   p_msjError OUT VARCHAR2);
                                   
  procedure Pr_ListarUniMedFacEmi (p_idUsuario IN NUMBER,
                                   p_Respuesta OUT CURSOR_SALIDA,
                                   p_codError OUT NUMBER,
                                   p_msjError OUT VARCHAR2);

end PK_UTL_LISTADOS;