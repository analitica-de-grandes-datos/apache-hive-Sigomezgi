/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Compute la cantidad de registros por cada letra de la columna 1.
Escriba el resultado ordenado por letra. 

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/

DROP TABLE IF EXISTS data;
DROP TABLE IF EXISTS data_counts;
CREATE TABLE data (
  letra string,
  fecha date,
  valor int
  )
  ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
;

LOAD DATA LOCAL INPATH "data.tsv" INTO TABLE data;
CREATE TABLE data_counts AS
    SELECT letra, COUNT(*) AS count
    FROM data GROUP BY letra ORDER BY letra;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM data_counts;
