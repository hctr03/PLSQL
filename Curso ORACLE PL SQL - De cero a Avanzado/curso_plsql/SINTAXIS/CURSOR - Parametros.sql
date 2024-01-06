DECLARE 

CURSOR empleados(p_inicio NUMBER, p_fin NUMBER) IS
    SELECT e.nombre, e.idcliente, e.limitecredito
    FROM PRODUCTOSDB.CLIENTES e
    WHERE e.limitecredito BETWEEN p_inicio AND p_fin;

v_inicio NUMBER;
v_fin NUMBER;

BEGIN

    v_inicio := 2000;
    
    SELECT MAX(limitecredito) 
    INTO v_fin
    FROM PRODUCTOSDB.CLIENTES;
    
    FOR reg IN empleados(v_inicio, v_fin) LOOP    
        DBMS_OUTPUT.PUT_LINE(reg. idcliente || ' ' ||reg.nombre || ' y tiene un limite de credito para: ' || reg.limitecredito);
    END LOOP;

END;