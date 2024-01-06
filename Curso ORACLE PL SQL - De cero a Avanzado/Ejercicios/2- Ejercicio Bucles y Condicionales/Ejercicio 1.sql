/*Dada una determinada opinión, 
si esta fue de 1 o 2 puntos llenar una variable con el valor "Mala".
Si fue de 3 o 4 puntos "Buena" y 
si fue de 5 puntos "Excelente". 
Luego imprimir el resultado junto al título de la película.*/

DECLARE 

v_IdOpinion NUMBER := 15;
v_puntuacion NUMBER(20);
v_pelicula VARCHAR(1000);
v_opinion VARCHAR(100);

BEGIN

SELECT PUNTUACION
INTO v_puntuacion
FROM OPINION
WHERE idopinion = v_idopinion;

SELECT TITULO
INTO v_pelicula
FROM PELICULA
WHERE idpelicula = (
     SELECT IDPELICULA
     FROM opinion p
     WHERE p.idopinion = v_IdOpinion);

IF v_puntuacion <= 2 THEN 
    v_opinion := 'MALA';
ELSIF v_puntuacion BETWEEN 3 AND 4 THEN
     v_opinion := 'BUENA';
ELSE 
    v_opinion := 'EXCELENTE';
END IF;

dbms_output.put_line('La pelicula correspondiente a el Id ' || v_IdOpinion || ' es: ' || v_pelicula || ' y su respectiva opinión es ' || v_opinion);
    
END;

