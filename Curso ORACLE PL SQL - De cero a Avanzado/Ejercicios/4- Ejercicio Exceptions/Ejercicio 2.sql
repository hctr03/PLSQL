--Continuando con el punto anterior, lanzar una exception e imprimir un mensaje si hay más de un usuario con el mismo email.
DECLARE

CURSOR email(email VARCHAR2) IS
    SELECT u.idusuario, u.apodo, u.email
    FROM USUARIO u
    WHERE u.email = email;
    
contador NUMBER;
emailBuscar VARCHAR2(40);
usuarioNoEncontrado EXCEPTION;
usuarioRepetido EXCEPTION;

BEGIN

emailBuscar := 'familiaperez@mailejemplo.com';
contador := 0;

    FOR reg IN email(emailBuscar) LOOP
        IF(reg.email = emailBuscar) THEN  
            contador := contador + 1;
            IF contador > 1 THEN
                RAISE usuarioRepetido;
            END IF;
            
            dbms_output.put_line(reg.apodo ||' ' || reg.idusuario);         
            
        END IF;
   END LOOP;
   
   IF contador < 1 THEN
    RAISE usuarioNoEncontrado;      
   END IF;  
    

EXCEPTION
    WHEN usuarioNoEncontrado THEN
        dbms_output.put_line('El email: "' ||emailBuscar || '" no se encuentra registrado en la Base de Datos.');
    WHEN usuarioRepetido THEN 
        dbms_output.put_line('Existe mas de un usuario con el siguiente email: ' || emailBuscar);
END;
