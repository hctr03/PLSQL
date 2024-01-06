DECLARE
v_añoEstreno pelicula.año%TYPE;
v_descripcionPelicula pelicula.descripcion%TYPE;
v_sinDescripcion  pelicula.descripcion%TYPE;

BEGIN

SELECT MAX(año)
INTO v_añoEstreno
FROM PELICULA;

SELECT SUBSTR(descripcion,0,40)
INTO v_descripcionPelicula
FROM PELICULA
WHERE año = 2018;

SELECT NVL(DESCRIPCION, '-Sin descripción-')
INTO v_sinDescripcion
FROM PELICULA
WHERE idpelicula = 6;

dbms_output.put_line('Año de estreno mas alto: ' || v_añoEstreno);
dbms_output.put_line('(2018)' || ' ' || v_descripcionPelicula || '...');
dbms_output.put_line('Pelicula coco ' || v_sinDescripcion );

END;