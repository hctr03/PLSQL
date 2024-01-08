create or replace NONEDITIONABLE FUNCTION ftn_CalificacionPeli(peliculaID NUMBER)
RETURN CLOB
IS

CURSOR prueba IS
    SELECT  p.titulo, COUNT(o.puntuacion) AS  "Puntuacion", ROUND(AVG(o.puntuacion),1) AS "Promedio"
    FROM opinion o
    INNER JOIN PELICULA p ON p.idpelicula = o.idpelicula
    WHERE o.idpelicula = peliculaID
    GROUP BY p.titulo;

    nombrePelicula VARCHAR2(40);
    numeroCalificaciones NUMBER;
    avgPuntuacion NUMBER;
    v_NumCalificacion VARCHAR(50);
    v_Calificacion CLOB;
    pelicula NUMBER;

BEGIN    

    SELECT DISTINCT(o.idpelicula) INTO pelicula FROM PELICULA o where o.idpelicula = peliculaID;

    FOR reg IN prueba LOOP

        nombrePelicula := reg.titulo;
        numeroCalificaciones := reg."Puntuacion";
        avgPuntuacion := reg."Promedio";        

        IF (avgPuntuacion BETWEEN 1 AND 2) THEN
                v_NumCalificacion := 'Mala';
                
            ELSIF (avgPuntuacion BETWEEN 3 AND 4) THEN
                v_NumCalificacion := 'Buena';
            ELSIF (avgPuntuacion > 4) THEN
                v_NumCalificacion := 'Excelente';
        END IF;


    END LOOP;

    v_NumCalificacion := v_NumCalificacion || '(' || avgPuntuacion || ')';

    v_Calificacion := nombrePelicula || ' - Calificación: ' || v_NumCalificacion || ' - Basada en ' || numeroCalificaciones || ' puntuaciónes.';

    
    --dbms_output.put_line(v_Calificacion);
    RETURN v_calificacion;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('No hay registro para la pelicula ingresada ');
END;