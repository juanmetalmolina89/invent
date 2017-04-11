CREATE OR REPLACE PACKAGE "PK_T997_MENSAJE_DEBUG" is

  PROCEDURE Pr_Insertar(p_a997fechaoperacion IN sist_t997_mensaje_debug.a997fechaoperacion%TYPE,
                        p_a997usuario        IN sist_t997_mensaje_debug.a997usuario%TYPE,
                        p_a997paquete        IN sist_t997_mensaje_debug.a997paquete%TYPE,
                        p_a997procedimiento  IN sist_t997_mensaje_debug.a997procedimiento%TYPE,
                        p_a997descripcion    IN sist_t997_mensaje_debug.a997descripcion%TYPE,
                        p_a997nivel          IN sist_t997_mensaje_debug.a997nivel%TYPE,
                        p_a997codigo         OUT sist_t997_mensaje_debug.a997codigo%TYPE);

end Pk_T997_MENSAJE_DEBUG;