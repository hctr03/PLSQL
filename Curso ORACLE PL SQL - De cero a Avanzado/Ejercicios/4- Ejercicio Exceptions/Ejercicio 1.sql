DECLARE

CURSOR email(email VARCHAR2) IS
    SELECT u.idusuario, u.apodo, u.email
    FROM USUARIO u
    WHERE u.email = email;
    
contador NUMBER;
emailBuscar VARCHAR2(40);
usuarioNoEncontrado EXCEPTION;

BEGIN

emailBuscar := 'familiaperez@mailejemplo.com';
contador := 0;

    FOR reg IN email(emailBuscar) LOOP
        IF(reg.email = emailBuscar) THEN  
            contador := contador + 1;
            dbms_output.put_line(reg.apodo ||' ' || reg.idusuario);            
        END IF;
   END LOOP;
   
   IF contador < 1 THEN
    RAISE usuarioNoEncontrado;      
   END IF;
   
    

EXCEPTION
    WHEN usuarioNoEncontrado THEN
        dbms_output.put_line('El email: "' ||emailBuscar || '" no se encuentra registrado en la Base de Datos.');
END;
