--Obtener e imprimir todas las opiniones de un usuario (enviar id de usuario por par�metro al cursor), imprimiendo primero el nombre de la pel�cula en may�sculas y luego la opini�n.

DECLARE

-- Devuelve la opinion y descripci�n de una pelicula 
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

