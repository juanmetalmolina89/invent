---Vista para el manejo de usuarios

CREATE OR REPLACE VIEW IVEV_001_USUARIO AS
SELECT A002CODIGO,
                A002NOMBRE,
                A002APELLIDO,
                A002IDTIPODOCUMENTO,
                l.a102valor DESC_TIPODOCUMENTO,
                A002DOCUMENTO,
                A002EXPEDIDOEN,
                A002DIRECCIONCORRESP,
                d.A105CODDEPARTAMENTO,
                d.A105DEPARTAMENTO DEPTO_LOCALIZACION,
                d.A105CODMUNICIPIO,
                d.A105MUNICIPIO  MCIPIO_LOCALIZACION,
                A002CORREOELECTRONICO,
                A002TELEFONO,
                A002CELULAR,
                A002PRIMERINGRESO,
                A002USUARIO,
                A002CONTRASENA,
                A002TIPOUSUARIO,
                ls.a102valor TIPOUSUARIO,
                A002AUTORIDADAMBIENTAL,
                e.a001siglaautamb AUTORIDADAMBIENTAL,
                A002MENU,
                A002ESTADOUSUARIO,
                A002ESTADOREGISTRO
           FROM IVET_T002_USUARIO u
      LEFT JOIN PART_T102_LISTA l ON l.a102codigo = u.a002idtipodocumento
      LEFT JOIN PART_T105_DIVIPOLA d ON d.a105codigo = u.a002localizacion
      LEFT JOIN PART_T102_LISTA ls ON ls.a102codigo = u.a002tipousuario
      LEFT JOIN IVET_T001_ENTIDAD e ON e.a001codigo = u.a002autoridadambiental;
	  
	  
---Vista para el manejo de Inventarios

CREATE OR REPLACE VIEW IVEV_002_INVENTARIO AS
CREATE OR REPLACE VIEW IVEV_002_INVENTARIO AS
SELECT A003CODIGO,
          d.A105CODDEPARTAMENTO,
          d.A105DEPARTAMENTO DEPTO_LOCALIZACION,
          d.A105CODMUNICIPIO,
          d.A105MUNICIPIO MCIPIO_LOCALIZACION,
          d.A105CODDIVIPOLADM,
          g.A004GEOMETRIA,
          A003OBJETO,
          A003DESCRIPCION_TERRITORIO,
          A003FECHA_INICIAL,
          A003FECHA_FINAL,
          A003ESTADO_INVENTARIO,
          PK_T003_INVENTARIO.Fc_EstadoInventario('ESTADOINVENTARIO',A003ESTADO_INVENTARIO) DESC_ESTADO_INVENTARIO,
          u.A002AUTORIDADAMBIENTAL,  --Identificador de la autoridad ambiental del inventario
          e.a001siglaautamb SIGLA_AA,  --Autoridad Ambiental
          A003IDDIVIPOLA,
          A003OBS_RECHAZO,
          A003IDUSUARIOREGISTRO,
          A003ESTADOREGISTRO
     FROM IVET_T003_INVENTARIO i
LEFT JOIN IVET_T004_GEOMETRIA g on g.a004idinventario = i.a003codigo
LEFT JOIN PART_T105_DIVIPOLA d on d.a105codigo = i.a003iddivipola
LEFT JOIN IVET_T002_USUARIO u on u.a002codigo = i.a003idusuarioregistro
LEFT JOIN IVET_T001_ENTIDAD e on e.a001codigo = u.a002autoridadambiental;

----Vista para el manejo de las categorías
CREATE OR REPLACE VIEW IVEV_003_CATEGORIA AS
SELECT A009CODIGO,
          A009IDTIPOCATEMISION,
          l.a102valor DESC_TIPO_CAT_EMISION,
          A009NOMCATEMISION,
          a009desccatemision,
          CC.TIPO_COMBUSTIBLE,
          l.a102valor DESC_ID_TIPO_COMBUSTIBLE,
          c.a009idmetodoemision,
          m.a008metododetemision,
          c.a009cilindraje,
          c.a009aniomodelo,
          c.a009nrofuentes,
          c.a009detmetodfuentes,
          c.a009observacion,
          c.a009totalemision,
          A009ESTADOREGISTRO,
          c.a009idinventario
     FROM IVET_T009_CATEGEMISION c
     LEFT JOIN (SELECT ct.a010codcatemision CATEGORIA,
       LISTAGG(l.a102valor  , ',') WITHIN GROUP (ORDER BY l.a102valor  ) AS TIPO_COMBUSTIBLE
FROM   IVET_T010_CATEGCOMBUSTIBLE ct
LEFT JOIN PART_T102_LISTA l ON l.a102codigo = ct.a010idtipocombustible
WHERE ct.a010estadoregistro = 'A'
GROUP BY ct.a010codcatemision) CC ON CC.CATEGORIA = c.a009codigo
LEFT JOIN IVET_T008_METODOEMISION m ON m.a008codigo = c.a009idmetodoemision
LEFT JOIN PART_T102_LISTA l ON l.a102codigo = c.A009idtipocatemision
LEFT JOIN PART_T102_LISTA l2 ON l2.a102codigo = c.a009codigo
LEFT JOIN IVET_T003_INVENTARIO i ON i.A003CODIGO = c.A009IDINVENTARIO;

---Vista para el manejo de los contaminantes
  CREATE OR REPLACE FORCE VIEW "IVE"."IVEV_004_CONTAMINANTE" ("COD_CONTAMINANTE", "A013IDCONTAMINANTE", "A005CONTAMINANTE", "A013VALORCONTAMINANTE", "ID_CATEGORIA", "A009NOMCATEMISION", "A013FTEMETDFACTORACTIV", "A013FACTORACTIVIDAD", "A013UNDMEDFACTORACTIV", "A011UNIDADMEDIDA", "A013FTEMETDFACTOREMIS", "A013FACTOREMISION", "A013UNDMEDFACTOREMIS", "A012UNIDADMEDIDA", "A013EMISIONTOTAL", "A013ESTADOREGISTRO", "ID_INVENTARIO") AS 
  SELECT ca.a013codigo cod_contaminante,
			ca.a013idcontaminante,
			co.a005contaminante,
			ca.a013valorcontaminante,
			ca.a013idcategoriaemision id_categoria,
			ct.a009nomcatemision,
			ca.a013ftemetdfactoractiv,
			ca.a013factoractividad,          
			ca.a013undmedfactoractiv,
			um.a011unidadmedida,
			ca.a013ftemetdfactoremis,
			ca.a013factoremision,
			ca.a013undmedfactoremis,
			umfe.a012unidadmedida,
			ca.a013emisiontotal,
			ca.A013ESTADOREGISTRO,
			i.a003codigo id_inventario
       FROM IVET_T013_CATEGCONTAMINA ca
			LEFT JOIN IVET_T005_CONTAMINANTE co ON co.a005codigo = ca.a013idcontaminante
			LEFT JOIN IVET_T009_CATEGEMISION ct ON ct.a009codigo = ca.a013idcategoriaemision
			LEFT JOIN IVET_T003_INVENTARIO i ON i.a003codigo = ct.a009idinventario
			LEFT JOIN IVET_T012_UNIDADMEDIDAFACTOR umfe ON umfe.a012codigo = ca.a013undmedfactoremis
			LEFT JOIN IVET_T011_UNIDADMEDIDA um ON um.a011codigo = ca.a013undmedfactoractiv
			WHERE ca.a013estadoregistro = 'A';

---Vista para el manejo de catgorias CIUU
CREATE OR REPLACE VIEW IVEV_005_CATEGORIA_CIIU AS
SELECT c.A009CODIGO,
          c.A009IDTIPOCATEMISION,
          c.A009NOMCATEMISION,
          c.a009desccatemision,
          c.A009IDTIPOCOMBUSTIBLE,
          c.a009cilindraje,
          c.a009aniomodelo,
          c.a009nrofuentes,
          c.a009detmetodfuentes,
          c.a009observacion,
          c.a009totalemision,
          c.A009IDINVENTARIO,
          cc.a017codigo,
          cc.a017idcodciiu,
          ci.a108descripcionciiu,
          cc.a017estadoregistro
     FROM IVET_T009_CATEGEMISION c
LEFT JOIN IVET_T017_CATGEMIS_CIIU cc ON cc.a017codcatemision = c.a009codigo
LEFT JOIN PART_T108_CODIGOCIIU ci ON ci.a108codigo = cc.a017idcodciiu
LEFT JOIN IVET_T003_INVENTARIO i ON i.A003CODIGO = c.A009IDINVENTARIO;

---Vista de reportes - Información Básica Contaminantes
CREATE OR REPLACE VIEW IVEV_006_INFOBAS_CONTAM AS
SELECT i.a003codigo CODIGO_INVENTARIO,
          e.a001codigo "CODIGO ENTIDAD",
          e.a001siglaautamb "SIGLA ENTIDAD",
          e.a001nombreautamb "NOMBRE ENTIDAD",
          i.a003objeto "OBEJETO INV",
          i.a003fecha_inicial "FECHA INICIAL INV",
          i.a003fecha_final "FECHA FINAL INV",
          c.a009totalemision "EMISION TOTAL CATEG",
          i.a003descripcion_territorio "DESC TERRITORIO",
          d.a105coddepartamento "COD DEPTO",
          d.a105departamento DEPARTAMENTO,
          d.a105codmunicipio "COD MCPIO",
          d.a105municipio MUNICIPIO,
          cco.a013idcontaminante "ID CONTAMINANTE",
          co.a005contaminante "DESC CONTAMINANTE",
          cco.a013valorcontaminante "VALOR CONTAMINANTE",
          cco.a013factoractividad "FACTOR ACTIVIDAD",
          cco.a013undmedfactoractiv "UN MED FAC ACT",
          cco.a013ftemetdfactoractiv "FTE MED FAC ACT",
          cco.a013factoremision "FACTOR EMISION",
          cco.a013undmedfactoremis "UN MED FAC EMI",
          cco.a013ftemetdfactoremis "FTE MED FAC EMI",
          cco.a013emisiontotal "TOTAL EMISION"
     FROM IVET_T003_INVENTARIO i
LEFT JOIN IVET_T002_USUARIO u ON u.a002codigo = i.a003idusuarioregistro
LEFT JOIN IVET_T001_ENTIDAD e ON e.a001codigo = u.a002autoridadambiental
LEFT JOIN IVET_T009_CATEGEMISION c ON c.a009idinventario = i.a003codigo
LEFT JOIN IVET_T013_CATEGCONTAMINA cco ON cco.a013idcategoriaemision = c.a009codigo
LEFT JOIN PART_T105_DIVIPOLA d ON d.a105codigo = i.a003iddivipola
LEFT JOIN IVET_T005_CONTAMINANTE co ON co.a005codigo = cco.a013idcontaminante
ORDER BY 1;

---Vista de reportes - Información basica de la categoría
CREATE OR REPLACE VIEW IVEV_007_INFOBAS_CATEG AS
SELECT i.a003codigo CODIGO_INVENTARIO,
          e.a001codigo "COD ENTIDAD",
          e.a001siglaautamb "SIGLA ENTIDAD",
          e.a001nombreautamb "NOMBRE ENTIDAD",
          i.a003objeto "OBJET}O INV",
          i.a003fecha_inicial "FECHA INICIAL INV",
          i.a003fecha_final "FECHA FINAL INV",
          c.a009totalemision "EMISION TOTAL CAT",
          i.a003descripcion_territorio  "DESC TERRITORIO",
          d.a105coddepartamento "COD DEPTO",
          d.a105departamento "DEPARTAMENTO",
          d.a105codmunicipio  "COD MCIPIO",
          d.a105municipio MUNICIPIO,
          c.a009nomcatemision "NOMBRE CATEGORIA",
          c.a009idtipocatemision "ID TIPO CAT EMI",
          l.a102valor "TIPO CATEGORIA",
          c.a009idtipocombustible "ID TIPO COMBUST",
          l1.a102valor "TIPO COMBUSTIBLE",
          c.a009desccatemision "DESC CATEGORIA",
          ci.a017idcodciiu "COD CIIU",
          cc.a108descripcionciiu "DESC CODIGO CIIU"
     FROM IVET_T003_INVENTARIO i
LEFT JOIN IVET_T002_USUARIO u ON u.a002codigo = i.a003idusuarioregistro
LEFT JOIN IVET_T001_ENTIDAD e ON e.a001codigo = u.a002autoridadambiental
LEFT JOIN IVET_T009_CATEGEMISION c ON c.a009idinventario = i.a003codigo
LEFT JOIN PART_T105_DIVIPOLA d ON d.a105codigo = i.a003iddivipola
LEFT JOIN PART_T102_LISTA l ON l.a102codigo =  c.a009idtipocatemision
LEFT JOIN PART_T102_LISTA l1 ON l1.a102codigo = c.a009idtipocombustible
LEFT JOIN IVET_T017_CATGEMIS_CIIU ci ON ci.a017codcatemision = c.a009codigo
LEFT JOIN PART_T108_CODIGOCIIU cc ON cc.a108codigo = ci.a017idcodciiu
ORDER BY 1;

---Vista de reportes - Información General del Inventario
CREATE OR REPLACE VIEW IVEV_008_INFOGRAL_INVENT AS
SELECT i.a003codigo CODIGO_INVENTARIO,
          i.a003estado_inventario "ESTADO INV",
          l2.a102valor "DESC ESTDO INV",
          e.a001codigo "COD ENTIDAD",
          e.a001siglaautamb "SIGLA ENTIDAD",
          e.a001nombreautamb "NOMBRE ENTIDAD",
          i.a003objeto "OBJETO INV",
          i.a003fecha_inicial "FECHA INICIAL INV",
          i.a003fecha_final "FECHA FINAL INV",
          c.a009totalemision "EMISION TOTAL CAT",
          i.a003descripcion_territorio "DESC TERRITORIO",
          d.a105coddepartamento "COD DEPTO",
          d.a105departamento "DEPARTAMENTO",
          d.a105codmunicipio "COD MCIPIO",
          d.a105municipio MUNICIPIO,
          c.a009nomcatemision CATEGORIA,
          c.a009idtipocatemision "ID TIPO CAT EMI",
          l.a102valor "CAT EMISION",
          c.a009idtipocombustible "ID TIPO COM",
          l1.a102valor "TIPO COMBUSTIBLE",
          c.a009desccatemision "DESC CATEG EMISION",
          ci.a017idcodciiu "COD CIIU",
          cc.a108descripcionciiu "DESC COD CIUU",
          cco.a013idcontaminante "ID CONTAMINANTE",
          co.a005contaminante "DESC CONTAMINANTE",
          cco.a013valorcontaminante "VALOR CONTAM",
          cco.a013factoractividad "FACTOR DE ACTIV",
          cco.a013undmedfactoractiv "UN MED FAC ACT",
          cco.a013ftemetdfactoractiv "FTE MED FAC ACT",
          cco.a013factoremision "FACTOR EMISION",
          cco.a013undmedfactoremis "UN MED FAC EMI",
          cco.a013ftemetdfactoremis "FTE MED FAC EMI",
          cco.a013emisiontotal "TOTAL EMISION"
     FROM IVET_T003_INVENTARIO i
LEFT JOIN IVET_T002_USUARIO u ON u.a002codigo = i.a003idusuarioregistro
LEFT JOIN IVET_T001_ENTIDAD e ON e.a001codigo = u.a002autoridadambiental
LEFT JOIN IVET_T009_CATEGEMISION c ON c.a009idinventario = i.a003codigo
LEFT JOIN IVET_T013_CATEGCONTAMINA cco ON cco.a013idcategoriaemision = c.a009codigo
LEFT JOIN PART_T105_DIVIPOLA d ON d.a105codigo = i.a003iddivipola
LEFT JOIN IVET_T005_CONTAMINANTE co ON co.a005codigo = cco.a013idcontaminante
LEFT JOIN PART_T102_LISTA l ON l.a102codigo =  c.a009idtipocatemision
LEFT JOIN PART_T102_LISTA l1 ON l1.a102codigo = c.a009idtipocombustible
LEFT JOIN PART_T102_LISTA l2 ON l2.a102codigo = i.a003estado_inventario
LEFT JOIN IVET_T017_CATGEMIS_CIIU ci ON ci.a017codcatemision = c.a009codigo
LEFT JOIN PART_T108_CODIGOCIIU cc ON cc.a108codigo = ci.a017idcodciiu
ORDER BY 1;