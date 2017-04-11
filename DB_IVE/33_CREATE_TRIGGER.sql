CREATE OR REPLACE TRIGGER emision_total
 FOR INSERT OR UPDATE ON IVET_T013_CATEGCONTAMINA
 --FOR INSERT ON IVET_T013_CATEGCONTAMINA
 COMPOUND TRIGGER
 p_cont      NUMBER;
  p_cont1      NUMBER;
 p_invent    NUMBER;
 p_invent1    NUMBER;
 p_contam    NUMBER;
 p_contam1    NUMBER;
 p_categ     NUMBER;
 p_categ1     NUMBER;
 p_result    NUMBER;
 p_result1   NUMBER;
 p_result2   NUMBER;
 p_a  DATE;
 
 AFTER EACH ROW IS

 BEGIN
 
      p_contam1 := :new.a013idcontaminante;
      p_categ1  := :new.a013idcategoriaemision;
               
END AFTER EACH ROW;
  
  BEFORE EACH ROW IS
      
      BEGIN
      
      if :new.a013idcategoriaemision is null then
        p_categ := :old.a013idcategoriaemision;
      else
        p_categ  := :new.a013idcategoriaemision;
      end if;
      
      if :new.a013idcategoriaemision is null then
        p_contam := :old.a013idcontaminante;
      else
        p_contam  := :new.a013idcontaminante;
      end if;
      
     ---Se identifica el inventario
      SELECT A009IDINVENTARIO
        INTO p_invent
        FROM IVET_T009_CATEGEMISION
       WHERE A009CODIGO = p_categ;  
        
            select count (*) 
            INTO p_cont
           from IVET_T016_INVENTCONTAMINA
          where a016idinventario = p_invent
            and a016idcontaminante = p_contam;

      If p_cont = 0 then

         pk_t016_inventcontamina.Pr_InsertarTrig(p_a016idinventario => p_invent,
                                                 p_a016idcontaminante => p_contam,
                                                 p_idusuario => 1);  
      End if;
      
      
       
   END BEFORE EACH ROW;
   
   AFTER STATEMENT IS
   BEGIN
         

   --se ingresa la info de emision total por contaminante por inventario en la tabla IVET_T016_INVENTCONTAMINA
   SELECT SUM(co.a013emisiontotal)
    INTO p_result
     FROM IVET_T013_CATEGCONTAMINA co
LEFT JOIN IVET_T009_CATEGEMISION ca ON ca.a009codigo = co.a013idcategoriaemision
    WHERE ca.a009idinventario = p_invent
      AND co.a013idcontaminante = p_contam
      AND co.a013estadoregistro =PK_UTL_CONSTANTE.COD_ACTIVO; 
    
      update IVET_T016_INVENTCONTAMINA
             set a016emisiontotal = p_result
           where a016idcontaminante = p_contam
             and a016idinventario = p_invent;
             

      
    --se ingresa la info de emision total por categoria por inventario en la tabla IVET_T009_CATEGEMISION                             
    SELECT SUM(co.a013emisiontotal)
    INTO p_result1
     FROM IVET_T013_CATEGCONTAMINA co
LEFT JOIN IVET_T009_CATEGEMISION ca ON ca.a009codigo = co.a013idcategoriaemision
    WHERE ca.a009idinventario = p_invent
      AND ca.a009codigo = p_categ
      AND co.a013estadoregistro = PK_UTL_CONSTANTE.COD_ACTIVO;  
  
    update IVET_T009_CATEGEMISION 
       SET A009TOTALEMISION = p_result1
     WHERE a009codigo = p_categ
       AND A009IDINVENTARIO = p_invent; 
       
     -- se ingresa la info de emision total por inventario
         SELECT SUM(co.a013emisiontotal)
    INTO p_result2
     FROM IVET_T013_CATEGCONTAMINA co
LEFT JOIN IVET_T009_CATEGEMISION ca ON ca.a009codigo = co.a013idcategoriaemision
LEFT JOIN IVET_T003_INVENTARIO i ON i.a003codigo = ca.a009idinventario
    WHERE ca.a009idinventario = p_invent
      AND co.a013estadoregistro = PK_UTL_CONSTANTE.COD_ACTIVO;
      
     update IVET_T003_INVENTARIO
     SET A003TOTALEMISION = p_result2
     WHERE A003CODIGO = p_invent;
     
-------------------------
   
   SELECT A009IDINVENTARIO
        INTO p_invent1
        FROM IVET_T009_CATEGEMISION
       WHERE A009CODIGO = p_categ1;
             
   SELECT SUM(co.a013emisiontotal)
     INTO p_result1
     FROM IVET_T013_CATEGCONTAMINA co
LEFT JOIN IVET_T009_CATEGEMISION ca ON ca.a009codigo = co.a013idcategoriaemision
    WHERE ca.a009idinventario = p_invent1
      AND ca.a009codigo = p_categ1
      AND co.a013estadoregistro = PK_UTL_CONSTANTE.COD_ACTIVO;  
  
    update IVET_T009_CATEGEMISION 
       SET A009TOTALEMISION = p_result1
     WHERE a009codigo = p_categ1
       AND A009IDINVENTARIO = p_invent1;
   
   END AFTER STATEMENT;
   
 END;  