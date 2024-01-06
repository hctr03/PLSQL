--Obtener e imprimir todas las opiniones para la película con ID 5.

DECLARE

CURSOR opinion IS
    SELECT OPINION
    FROM OPINION
    WHERE idpelicula = 5;

BEGIN

    FOR reg IN opinion LOOP
        dbms_output.put_line(reg.opinion);
    END LOOP;

END;