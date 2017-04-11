CREATE OR REPLACE PACKAGE "PK_T996_AUDITORIA" is

  PROCEDURE Pr_Insertar(p_a996idobjeto      IN SIST_T996_AUDITORIA.a996idobjeto%TYPE,
                        p_a996objeto        IN SIST_T996_AUDITORIA.a996objeto%TYPE,
                        p_a996operacion     IN SIST_T996_AUDITORIA.a996operacion%TYPE,
                        p_a996usuario       IN SIST_T996_AUDITORIA.a996usuario%TYPE,
                        p_a996procedimiento IN SIST_T996_AUDITORIA.a996procedimiento%TYPE,
                        p_a996paquete       IN SIST_T996_AUDITORIA.a996paquete%TYPE,
                        p_a996codigo        OUT SIST_T996_AUDITORIA.a996codigo%TYPE) ;
end PK_T996_AUDITORIA;
/
CREATE OR REPLACE PACKAGE BODY "PK_T996_AUDITORIA" is

  /********************************************************************************
  DESCRIPCION    : Procedimiento basico que permite realizar la inserciOn del
                   registro en la tabla T996_AUDITORIA
  PARAMETROS    :
  IN    :
                        p_a996idobjeto      Id del objeto afectado
                        p_a996objeto        Nombre de la tabla afectada
                        p_a996operacion     Operacion realizada : ELIMINAR, INSERTAR, ACTUALIZAR
                        p_a996usuario       Id del usuario que realiza operacion
                        p_a996procedimiento Procedimiento que realizo operacion
                        p_a996paquete       Paquete donde esta procedimiento

  OUT    :
          p_a996codigo Id del registro creado en auditoria

  REALIZADO POR    : Hugo Armando Cendales Prieto
  FECHA CREACION    : 5/OCT/2016

  FECHA MODIFICA      :  dd/MMM/aaaa
  MODIFICADO POR      :
  DESCRIPCION CAMBIOS :
  *******************************************************************************/
  PROCEDURE Pr_Insertar(p_a996idobjeto      IN SIST_T996_AUDITORIA.a996idobjeto%TYPE,
                        p_a996objeto        IN SIST_T996_AUDITORIA.a996objeto%TYPE,
                        p_a996operacion     IN SIST_T996_AUDITORIA.a996operacion%TYPE,
                        p_a996usuario       IN SIST_T996_AUDITORIA.a996usuario%TYPE,
                        p_a996procedimiento IN SIST_T996_AUDITORIA.a996procedimiento%TYPE,
                        p_a996paquete       IN SIST_T996_AUDITORIA.a996paquete%TYPE,
                        p_a996codigo        OUT SIST_T996_AUDITORIA.a996codigo%TYPE) IS

  BEGIN

    p_a996codigo := PK_UTL_UTILIDAD.Fn_Obtenerid('T996_AUDITORIA_SEQ');

    insert into sist_t996_auditoria
      (a996codigo,
       a996fecha,
       a996idobjeto,
       a996objeto,
       a996operacion,
       a996usuario,
       a996procedimiento,
       a996paquete)
    values
      (p_a996codigo,
       sysdate,
       p_a996idobjeto,
       p_a996objeto,
       p_a996operacion,
       p_a996usuario,
       p_a996procedimiento,
       p_a996paquete);

  END Pr_Insertar;

end PK_T996_AUDITORIA;
/
