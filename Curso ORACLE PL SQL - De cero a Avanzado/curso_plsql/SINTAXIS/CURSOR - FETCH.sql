DECLARE

CURSOR empleados IS
SELECT e.nombre, e.apellido, e.limitecredito
FROM PRODUCTOSDB.clientes e
WHERE e.limitecredito BETWEEN 2000 AND 6000
ORDER BY e.limitecredito DESC;

v_nombre VARCHAR(25);
v_apellido VARCHAR(25);
v_limitecredito NUMBER;

BEGIN

    OPEN empleados;
    
        LOOP
        
        FETCH empleados into v_nombre, v_apellido, v_limitecredito;
        
        EXIT WHEN empleados%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Buenas noches: ' || v_nombre || ' ' || v_apellido || ' felicidades se le aprobó su credito con un limite de: ' || v_limitecredito);
        
        END LOOP;
    
    CLOSE empleados;
    
    
END;


-- Investigar dbms_javascript