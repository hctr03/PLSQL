--Cambiar todos los textos de opiniones para la película con ID 4. Modificar concatenando el nombre del usuario delante del texto. Ej: "Juan: Aquí iría la opinión del usuario". Imprimir cuantas filas fueron afectadas utilizando cursor implícito.


DECLARE

CURSOR peliculaID IS
    SELECT o.idopinion,o.opinion, u.apodo
    FROM OPINION o
    INNER JOIN USUARIO u ON u.idusuario = o.idusuario
    WHERE o.idpelicula = 4
FOR UPDATE;

fila NUMBER;

BEGIN



FOR reg IN peliculaID LOOP

   UPDATE opinion o
   SET o.opinion = reg.apodo || ': ' || reg.opinion
   WHERE o.idopinion = reg.idopinion;
   
   fila := SQL%ROWCOUNT; 
   dbms_output.put_line('Filas afectadas: ' || fila);
   
END LOOP; 

END;



/*Le falto algo	JuanPerez123
no me gusto	Pedro456
No merece menos que el maximo puntaje	Maria789
Un genial largometraje	Josefina987*/