DECLARE

CURSOR email(email VARCHAR2) IS
    SELECT u.idusuario, u.apodo, u.email
    FROM USUARIO u
    WHERE u.email = email;
    emailBuscar         VARCHAR2(40);
    v_longitud          NUMBER;
    contador            NUMBER;
    v_longitudMaxima    NUMBER;            
    v_ExcepcionCorreo   EXCEPTION;
    usuarioNoEncontrado EXCEPTION;
    usuarioRepetido     EXCEPTION;

BEGIN

contador := 0;

emailBuscar := 'familiaperezmailejemplo.com';
v_longitud := LENGTH(emailBuscar);

SELECT MAX(v_longitud) 
INTO v_longitudMaxima
FROM DUAL;

FOR i IN 1..v_longitud LOOP
    IF(SUBSTR(emailBuscar,i,1) = '@') THEN  
        EXIT;
    END IF;
    
    IF (i = v_longitudMaxima) THEN
        RAISE v_ExcepcionCorreo;    
    END IF;    
END LOOP;

FOR reg IN email(emailBuscar) LOOP
      IF(reg.email = emailBuscar) THEN  
            contador := contador + 1;
            IF contador > 1 THEN
                RAISE usuarioRepetido;
            END IF;            
            dbms_output.put_line(reg.apodo ||' ' || reg.idusuario);                        
      END IF;
END LOOP;

IF(contador = 0) THEN
    RAISE usuarioNoEncontrado;
END IF;

EXCEPTION 

WHEN v_ExcepcionCorreo THEN
    dbms_output.put_line('El correo ingresado es invalido no tiene @');
WHEN usuarioNoEncontrado THEN
    dbms_output.put_line('El email: "' ||emailBuscar || '" no se encuentra registrado en la Base de Datos.');
WHEN usuarioRepetido THEN 
    dbms_output.put_line('Existe mas de un usuario con el siguiente email: ' || emailBuscar);

END;
