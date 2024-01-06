//Calcular la potencia de un número cualquiera e imprimir el resultado. Ejemplo: 2^4 = 16.

DECLARE

v_numeroEvaluar NUMBER := 10;
v_potencia NUMBER := 10;
v_resultado NUMBER;
BEGIN

    SELECT POWER(v_numeroEvaluar, v_potencia)
    INTO v_resultado
    FROM DUAL;
    
    DBMS_OUTPUT.PUT_LINE(v_numeroEvaluar || ' elevado al ' || v_potencia || ' es igual a : ' || v_resultado);
 
END;