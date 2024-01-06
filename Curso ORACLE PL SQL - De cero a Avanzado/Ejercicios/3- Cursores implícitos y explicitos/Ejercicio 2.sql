--Obtener e imprimir todas las opiniones de un usuario (enviar id de usuario por parámetro al cursor), imprimiendo primero el nombre de la película en mayúsculas y luego la opinión.

DECLARE

-- Devuelve la opinion y descripción de una pelicula 
-- para un determinado usuario 

CURSOR opinionUsuario(userID number) IS
    SELECT UPPER(p.titulo) AS titulo, o.opinion
    FROM OPINION o
    INNER JOIN PELICULA p ON o.idpelicula = p.idpelicula
    WHERE o.idusuario = userID;
    

BEGIN

 FOR reg IN opinionUsuario(5) LOOP        
    dbms_output.put_line(reg.titulo || ': ' ||reg.opinion);
 END LOOP;

END;

