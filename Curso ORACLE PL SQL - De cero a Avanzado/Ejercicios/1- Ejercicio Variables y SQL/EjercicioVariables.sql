DECLARE
v_a�oEstreno pelicula.a�o%TYPE;
v_descripcionPelicula pelicula.descripcion%TYPE;
v_sinDescripcion  pelicula.descripcion%TYPE;

BEGIN

SELECT MAX(a�o)
INTO v_a�oEstreno
FROM PELICULA;

SELECT SUBSTR(descripcion,0,40)
INTO v_descripcionPelicula
FROM PELICULA
WHERE a�o = 2018;

SELECT NVL(DESCRIPCION, '-Sin descripci�n-')
INTO v_sinDescripcion
FROM PELICULA
WHERE idpelicula = 6;

dbms_output.put_line('A�o de estreno mas alto: ' || v_a�oEstreno);
dbms_output.put_line('(2018)' || ' ' || v_descripcionPelicula || '...');
dbms_output.put_line('Pelicula coco ' || v_sinDescripcion );

END;