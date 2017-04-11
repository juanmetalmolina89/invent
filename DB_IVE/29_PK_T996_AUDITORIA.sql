CREATE OR REPLACE PACKAGE "PK_T996_AUDITORIA" is

  PROCEDURE Pr_Insertar(p_a996idobjeto      IN SIST_T996_AUDITORIA.a996idobjeto%TYPE,
                        p_a996objeto        IN SIST_T996_AUDITORIA.a996objeto%TYPE,
                        p_a996operacion     IN SIST_T996_AUDITORIA.a996operacion%TYPE,
                        p_a996usuario       IN SIST_T996_AUDITORIA.a996usuario%TYPE,
                        p_a996procedimiento IN SIST_T996_AUDITORIA.a996procedimiento%TYPE,
                        p_a996paquete       IN SIST_T996_AUDITORIA.a996paquete%TYPE,
                        p_a996codigo        OUT SIST_T996_AUDITORIA.a996codigo%TYPE) ;
end PK_T996_AUDITORIA;