/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Construya una consulta que ordene la tabla por letra y valor (3ra columna).

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
    SELECT letra, fecha, valor
    FROM data ORDER BY letra, valor, fecha;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM data_counts;
