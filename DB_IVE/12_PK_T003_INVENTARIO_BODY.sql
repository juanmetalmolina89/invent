CREATE OR REPLACE PACKAGE BODY "PK_T003_INVENTARIO" is

  /********************************************************************************
  DESCRIPCION       : Procedimiento para ingresar un inventario
  PARAMETROS        :
  IN    :
            p_A003OBJETO                   Descripci?n del inventario
            p_A003FECHA_INICIAL            Fecha de inicio del inventario
            p_A003FECHA_FINAL              Fecha estimada de finalizaci?n del inventario
            p_A003IDDIVIPOLA               C?digo DIVIPOLA del Municipio donde se desarrolla el Inventario
            p_A003DESCRIPCION_TERRITORIO   Descripci?n del territorio donde se realiza el inventario
            p_A003IDUSUARIOREGISTRO        Identificador del usuario que registra el inventario
            p_idUsuario                    Id del usuario logueado en el sistema

  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C?digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 01/12/2016

  FECHA MODIFICA    : 02/12/2016
  MODIFICADO POR    : Luis Felipe Rueda Forero
  DESCRIPCION CAMBIO: Ajustes solicitados Hugo Cendales
  *******************************************************************************/

PROCEDURE Pr_Insertar (p_A003OBJETO                 IN IVET_T003_INVENTARIO.A003OBJETO%TYPE,
                       p_A003FECHA_INICIAL          IN IVET_T003_INVENTARIO.A003FECHA_INICIAL%TYPE,
                       p_A003FECHA_FINAL            IN IVET_T003_INVENTARIO.A003FECHA_FINAL%TYPE,
                       p_A003IDDIVIPOLA             IN IVET_T003_INVENTARIO.A003IDDIVIPOLA%TYPE,
                       p_A003DESCRIPCION_TERRITORIO IN IVET_T003_INVENTARIO.A003DESCRIPCION_TERRITORIO%TYPE,
                       p_idUsuario   				        IN NUMBER,
                       p_resultado 				        	OUT CURSOR_SALIDA,
                       p_codError   			        	OUT NUMBER,
                       p_msjError  					        OUT VARCHAR2) IS

NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Insertar';
p_A003CODIGO         NUMBER;

BEGIN
      -- obtenemos el siguiente id
      p_A003CODIGO := PK_UTL_UTILIDAD.Fn_Obtenerid('T003_INVENTARIO_SEQ');

      pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                         p_paquete       => NOMBRE_PAQUETE,
                                         p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                         p_usuario       => p_idUsuario,
                                         p_descripcion   => 'Entro a Pr_Insertar ' || p_A003CODIGO);
      
      INSERT INTO IVET_T003_INVENTARIO(A003CODIGO,
                                       A003OBJETO,
                                       A003FECHA_INICIAL,
                                       A003FECHA_FINAL,
                                       A003ESTADO_INVENTARIO,
                                       A003IDDIVIPOLA,
                                       A003DESCRIPCION_TERRITORIO,
                                       A003IDUSUARIOREGISTRO,
                                       A003TOTALEMISION,
                                       A003ESTADOREGISTRO,
                                       A003FECHACREACION,
                                       A003USUARIOCREACION)
                               VALUES (p_A003CODIGO,
                                       p_A003OBJETO,
                                       p_A003FECHA_INICIAL,
                                       p_A003FECHA_FINAL,
                                       Fc_EstadoNuevoInv('ESTADOINVENTARIO','En diligenciamiento'),
                                       p_A003IDDIVIPOLA,
                                       p_A003DESCRIPCION_TERRITORIO,
                                       p_idUsuario,
                                       0,
                                       PK_UTL_CONSTANTE.COD_ACTIVO,
                                       sysdate,
                                       p_idUsuario);

      OPEN p_resultado FOR SELECT p_A003CODIGO A003CODIGO FROM dual;
      p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
      p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Insertar ' || p_A003CODIGO);

END Pr_Insertar;

  /********************************************************************************
  DESCRIPCION       : Procedimiento para hacer un borrado l?gico de un inventario
  PARAMETROS        :
  IN    :
            p_A003CODIGO                   C?digo identificador del inventario
            p_idUsuario                    Id del usuario logueado en el sistema

  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C?digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 01/12/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:
  *******************************************************************************/

PROCEDURE Pr_Eliminar (p_A003CODIGO  IN IVET_T003_INVENTARIO.A003CODIGO%TYPE,
                       p_idUsuario 	 IN NUMBER,
                       p_resultado 	 OUT CURSOR_SALIDA,
                       p_codError 	 OUT NUMBER,
                       p_msjError 	 OUT VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Eliminar';

   BEGIN

    pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                       p_paquete       => NOMBRE_PAQUETE,
                                       p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                       p_usuario       => p_idUsuario,
                                       p_descripcion   => 'Entro a Pr_Eliminar ' || p_A003CODIGO);

              UPDATE IVET_T003_INVENTARIO
                 SET A003ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_INACTIVO,
                     A003FECHAMODIFICACION = sysdate,
                     A003USUARIOMODIFICACION = p_idUsuario
               WHERE A003CODIGO = p_A003CODIGO;

              OPEN p_resultado FOR SELECT p_A003CODIGO A003CODIGO FROM dual;
              p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
              p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);


    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Eliminar ' || p_A003CODIGO);
                                      
END Pr_Eliminar;

  /********************************************************************************
  DESCRIPCION       : Procedimiento para actualizar la informaci?n de un inventario
  PARAMETROS        :
  IN    :
            p_A003CODIGO                   C?digo identificador del inventario
            p_A003OBJETO                   Descripci?n del inventario
            p_A003FECHA_INICIAL            Fecha de inicio del inventario
            p_A003FECHA_FINAL              Fecha estimada de finalizaci?n del inventario
            p_A003ESTADO_INVENTARIO        Identifica el estado en que se encuentra el inventario
            p_A003IDDIVIPOLA               C?digo DIVIPOLA del Municipio donde se desarrolla el Inventario
            p_A003DESCRIPCION_TERRITORIO   Descripci?n del territorio donde se realiza el inventario
            p_idUsuario                    Id del usuario logueado en el sistema

  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C?digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 10/11/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:
  *******************************************************************************/

PROCEDURE Pr_Actualizar (p_A003CODIGO 				        IN IVET_T003_INVENTARIO.A003CODIGO%TYPE,
                         p_A003OBJETO 			 	        IN IVET_T003_INVENTARIO.A003OBJETO%TYPE,
                         p_A003FECHA_INICIAL 		      IN IVET_T003_INVENTARIO.A003FECHA_INICIAL%TYPE,
                         p_A003FECHA_FINAL     		    IN IVET_T003_INVENTARIO.A003FECHA_FINAL%TYPE,
                         p_A003ESTADO_INVENTARIO      IN IVET_T003_INVENTARIO.A003ESTADO_INVENTARIO%TYPE,
                         p_A003IDDIVIPOLA             IN IVET_T003_INVENTARIO.A003IDDIVIPOLA%TYPE,
                         p_A003DESCRIPCION_TERRITORIO IN IVET_T003_INVENTARIO.A003DESCRIPCION_TERRITORIO%TYPE,
                         p_idUsuario 				          IN NUMBER,
                         p_resultado 				          OUT CURSOR_SALIDA,
                         p_codError 				          OUT NUMBER,
                         p_msjError 				          OUT VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_Actualizar';
    numReg               NUMBER;

   BEGIN
   
    pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
								                       p_paquete       => NOMBRE_PAQUETE,
									                     p_procedimiento => NOMBRE_PROCEDIMIENTO,
									                     p_usuario       => p_idUsuario,
									                     p_descripcion   => 'Entro a Pr_Actualizar ' || p_A003CODIGO);


      IF p_A003CODIGO IS NULL THEN
         p_codError := 4;
         p_msjError := PK_UTL_UTILIDAD.Fn_Obtenermensaje(p_codError);
         OPEN p_resultado FOR SELECT '' FROM dual;
         return;
      END IF;

      SELECT COUNT(*)
        INTO numReg
        FROM IVET_T003_INVENTARIO
       WHERE A003CODIGO = p_A003CODIGO
         AND A003ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;

      IF numReg > 0 THEN

         UPDATE IVET_T003_INVENTARIO SET A003OBJETO=NVL(p_A003OBJETO, A003OBJETO),
                                         A003FECHA_INICIAL=NVL(p_A003FECHA_INICIAL,A003FECHA_INICIAL),
                                         A003FECHA_FINAL=NVL(p_A003FECHA_FINAL,A003FECHA_FINAL),
                                         A003ESTADO_INVENTARIO=NVL(p_A003ESTADO_INVENTARIO,A003ESTADO_INVENTARIO),
                                         A003IDDIVIPOLA=NVL(p_A003IDDIVIPOLA,A003IDDIVIPOLA),
                                         A003DESCRIPCION_TERRITORIO=NVL(p_A003DESCRIPCION_TERRITORIO,A003DESCRIPCION_TERRITORIO),
                                         A003FECHAMODIFICACION = sysdate,
                                         A003USUARIOMODIFICACION = p_idUsuario
							                     WHERE A003CODIGO = p_A003CODIGO;

         OPEN p_resultado FOR SELECT p_A003CODIGO A003CODIGO FROM dual;
         p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
         p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
         return;

      ELSE

         p_codError := 5;
         p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
         OPEN p_resultado FOR SELECT '' FROM dual;
         return;
      END IF;

    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_Actualizar ' || p_A003CODIGO);
                                      
END Pr_Actualizar;

   /********************************************************************************
  DESCRIPCION       : Procedimiento para consultar la informaci?n de un inventario mediante un filtro
  PARAMETROS        :
  IN    :
            p_Filtro                     Paqrametro de busqueda (campo = valor)
            p_idUsuario                  Id del usuario logueado en el sistema
      
  OUT   :
            p_resultado                  Matriz con el resultado del procedimiento
            p_codError                   C?digo del error del procedimiento
            p_msjError                   Mensaje de error del procedimiento

  REALIZADO POR     : Luis Felipe Rueda Forero
  FECHA CREACION    : 10/11/2016

  FECHA MODIFICA    : dd/MMM/aaaa
  MODIFICADO POR    :
  DESCRIPCION CAMBIO:
  *******************************************************************************/ 

  PROCEDURE Pr_ConsultarPorFiltro (p_Filtro IN VARCHAR2,
                                   p_idUsuario IN NUMBER,
                                   p_resultado OUT CURSOR_SALIDA,
                                   p_codError OUT NUMBER,
                                   p_msjError OUT VARCHAR2) IS

    NOMBRE_PROCEDIMIENTO VARCHAR2(50) := 'Pr_ConsultarPorFiltro';
    strSQL               VARCHAR2(1000);

   BEGIN

    pk_utl_utilidad.pr_registrardebug (p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                       p_paquete       => NOMBRE_PAQUETE,
                                       p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                       p_usuario       => p_idUsuario,
                                       p_descripcion   => 'Entro a Pr_ConsultarPorFiltro ' || p_Filtro);

      IF p_Filtro IS NULL THEN
         OPEN p_resultado FOR
         
         SELECT * 
           FROM IVET_T003_INVENTARIO
          WHERE A003ESTADOREGISTRO = PK_UTL_CONSTANTE.COD_ACTIVO;
         
         p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
         p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);
         return;
      
      END IF;
      
         strSQL := 'SELECT * FROM IVEV_002_INVENTARIO WHERE ' || p_Filtro ||' AND A003ESTADOREGISTRO ='''
                   || PK_UTL_CONSTANTE.COD_ACTIVO ||''''; 

         OPEN p_resultado FOR strSQL;
 
         p_codError := PK_UTL_CONSTANTE.COD_OPERACION_CORRECTA;
         p_msjError := PK_UTL_UTILIDAD.fn_ObtenerMensaje(p_codError);


    pk_utl_utilidad.pr_registrardebug(p_niveldebug    => PK_UTL_CONSTANTE.NIVEL_TRACE,
                                      p_paquete       => NOMBRE_PAQUETE,
                                      p_procedimiento => NOMBRE_PROCEDIMIENTO,
                                      p_usuario       => p_idUsuario,
                                      p_descripcion   => 'Salio de Pr_ConsultarPorFiltro ' || p_Filtro);

  END Pr_ConsultarPorFiltro;

  FUNCTION Fc_EstadoNuevoInv(p_categoria VARCHAR2, 
                             p_lista     VARCHAR2) 
  RETURN NUMBER 
  IS

  result NUMBER;

  BEGIN
       SELECT A102CODIGO
         INTO result
         FROM PART_T101_CATEGORIA c, PART_T102_LISTA l
        WHERE c.a101codigo = l.a102categoria
          AND c.a101nombre = p_categoria
          AND l.a102valor = p_lista;
        return(result);
        
   End Fc_EstadoNuevoInv;
   
  FUNCTION Fc_EstadoInventario(p_categoria VARCHAR2, 
                               p_lista     VARCHAR2) 
  RETURN VARCHAR2 
  IS

  result VARCHAR2(300);

  BEGIN
       SELECT a102valor 
         INTO result
         FROM PART_T101_CATEGORIA c, PART_T102_LISTA l
        WHERE c.a101codigo = l.a102categoria
          AND c.a101nombre = p_categoria
          AND l.a102codigo = p_lista;
        return(result);
        
   End Fc_EstadoInventario;
   
end PK_T003_INVENTARIO;