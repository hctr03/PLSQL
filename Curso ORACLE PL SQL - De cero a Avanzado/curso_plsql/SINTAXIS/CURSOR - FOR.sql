DECLARE 

CURSOR empleados(p_inicio NUMBER, p_fin NUMBER) IS
    SELECT e.nombre, e.idcliente
    FROM PRODUCTOSDB.CLIENTES e
    WHERE e.limitecredito BETWEEN p_inicio AND p_fin;

v_inicio NUMBER;
v_fin NUMBER;

BEGIN

    v_inicio := 2000;
    
    p_fin := (SELECT MAX(limitecredito) FROM PRODUCTOSDB.CLIENTES);
    
    FOR reg IN empleados LOOP    
        DBMS_OUTPUT.PUT_LINE('ID: ' || reg.idCliente || ' pertenece a: ' || reg.nombre);     
    END LOOP;

END;