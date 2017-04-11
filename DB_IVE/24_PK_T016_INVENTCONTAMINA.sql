CREATE OR REPLACE PACKAGE "PK_T016_INVENTCONTAMINA" is

/************************************************************************
DESCRIPCION       : Servicios CRUD sobre la tabla IVET_T016_INVENTCONTAMINA

REALIZADO POR     : Julio Cesar Baracaldo
FECHA CREACION    : 14/11/2016

FECHA MODIFICA    : dd/MMM/aaaa
MODIFICADO POR    :
DESCRIPCION CAMBIO:
************************************************************************/
NOMBRE_PAQUETE CONSTANT VARCHAR2(100) := 'PK_T016_INVENTCONTAMINA';

TYPE CURSOR_SALIDA IS REF CURSOR;

-- Funciones y Procedimientos del paquete:
--  PROCEDURE Pr_Insertar
--  PROCEDURE Pr_Eliminar
--  PROCEDURE Pr_Actualizar
--  PROCEDURE Pr_ConsultarPorFiltro
----

  /********************************************************************************
  DESCRIPCION       : Procedimiento para insertar la informaci?n de un usuario
  PARAMETROS        :
  IN    :
            p_A002NOMBRE                 Nombre usuario
            p_A002APELLIDO               Apellido Usuario
            p_A002IDTIPODOCUMENTO        Tipo de documento
            p_A002DOCUMENTO              Documento
            p_A002LGEXPEDIDODOC          Lugar expedici?n documento
            p_A002DIRECCIONCORRESP       Direcci?n de correspondencia
            p_A002LOCALIZACION           Ubicaci?n de residencia del usuario
            p_A002CORREOELECTRONICO      Correo electronico
            p_A002TELEFONO               Tel?fono usuario
            p_A002CELULAR                Celular usuario
            p_A002USUARIO                Usuario del sistema
            p_A002CONTRASENA             Contrase?a del sistema
            p_A002TIPOUSUARIO            Tipo de usuario
            p_A002AUTORIDADAMBIENTAL     Autoridad ambiental
            p_A002ESTADOUSUARIO          Estado del usuario
            p_idUsuario                  Id del usuario logueado en el sistema
      
  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C?digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 17/11/2016

  FECHA MODIFICA    : 02/12/2016
  MODIFICADO POR    :Luis Felipe Rueda Forero
  DESCRIPCION CAMBIO:Ajustes solicitados Hugo Cendales
  *******************************************************************************/

PROCEDURE Pr_Insertar (p_A016IDINVENTARIO   IN  IVET_T016_INVENTCONTAMINA.A016IDINVENTARIO%TYPE,
                       p_A016IDCONTAMINANTE IN  IVET_T016_INVENTCONTAMINA.A016IDCONTAMINANTE%TYPE,
                       p_idUsuario IN NUMBER,
                       p_resultado OUT CURSOR_SALIDA,
                       p_codError OUT NUMBER,
                       p_msjError OUT VARCHAR2);

PROCEDURE Pr_Eliminar (p_A016CODIGO IN IVET_T016_INVENTCONTAMINA.A016CODIGO%TYPE,
                       p_idUsuario IN NUMBER,
                       p_resultado OUT CURSOR_SALIDA,
                       p_codError  OUT NUMBER,
                       p_msjError  OUT VARCHAR2);

PROCEDURE Pr_Actualizar (p_A016CODIGO IN  IVET_T016_INVENTCONTAMINA.A016CODIGO%TYPE,
                         p_A016IDINVENTARIO IN  IVET_T016_INVENTCONTAMINA.A016IDINVENTARIO%TYPE,
                         p_A016IDCONTAMINANTE IN  IVET_T016_INVENTCONTAMINA.A016IDCONTAMINANTE%TYPE,
                         p_idUsuario IN NUMBER,
                         p_resultado OUT CURSOR_SALIDA,
                         p_codError OUT NUMBER,
                         p_msjError OUT VARCHAR2);

PROCEDURE Pr_ConsultarPorFiltro (p_Filtro IN VARCHAR2,
                                 p_idUsuario IN NUMBER,
                                 p_resultado OUT CURSOR_SALIDA,
                                 p_codError  OUT NUMBER,
                                 p_msjError  OUT VARCHAR2);
                                 
PROCEDURE Pr_InsertarTrig (p_A016IDINVENTARIO   IN IVET_T016_INVENTCONTAMINA.A016IDINVENTARIO%TYPE,
                           p_A016IDCONTAMINANTE IN IVET_T016_INVENTCONTAMINA.A016IDCONTAMINANTE%TYPE,
                           p_idUsuario IN NUMBER);
               
end PK_T016_INVENTCONTAMINA;