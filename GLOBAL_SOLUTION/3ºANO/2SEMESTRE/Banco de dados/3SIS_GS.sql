/*
88632 – Gabriel Mota Basaglia
86944 – Vinicius Bouvier
87023 – Yasmin Verderame
*/


-- Procedimento otimizado -------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE update_time_in_hospital (
    p_last_change_date IN diabetes.last_change_date%TYPE,
    p_time_in_hospital IN diabetes.time_in_hospital%TYPE
)
IS
    TYPE encounter_id_list IS TABLE OF diabetes.encounter_id%TYPE;
    l_encounter_ids encounter_id_list;
    l_eligible BOOLEAN;
    l_sql_count INTEGER :=0 ;
BEGIN
    SELECT encounter_id
    BULK COLLECT INTO l_encounter_ids
    FROM diabetes
    WHERE TRUNC(last_change_date) = p_last_change_date;

    FOR i IN 1..l_encounter_ids.COUNT LOOP
        check_eligibility (l_encounter_ids(i), p_time_in_hospital, l_eligible);
        IF l_eligible
        THEN
            UPDATE diabetes
            SET time_in_hospital = time_in_hospital + p_time_in_hospital
            WHERE encounter_id = l_encounter_ids(i);
            l_sql_count := l_sql_count+1;
            END IF;
            END LOOP;
    DBMS_OUTPUT.PUT_LINE( l_sql_count || ' rows updated'); 
    COMMIT;
END update_time_in_hospital;
/

CREATE OR REPLACE PROCEDURE check_eligibility
    (p_encounter_id IN diabetes.encounter_id%TYPE
    ,p_time_in_hospital IN diabetes.time_in_hospital%TYPE
    ,p_is_eligible OUT BOOLEAN
)
IS
    l_encounter_id NUMBER;
 BEGIN
 
    SELECT encounter_id
    INTO l_encounter_id
    FROM diabetes
    WHERE encounter_id = p_encounter_id
      AND time_in_hospital + p_time_in_hospital < 14;
    p_is_eligible := TRUE;
    EXCEPTION
        WHEN NO_DATA_FOUND then
        p_is_eligible := FALSE;
END;

---------------------------------------------------------------------------------------------------------------------------
SET SERVEROUT ON
DECLARE
t0 number := dbms_utility.get_time;
v_idx number := 1;
BEGIN
 update_time_in_hospital (p_last_change_date => '10-NOV-2023',p_time_in_hospital => 01);
  dbms_output.put_line('Tempo: '||((dbms_utility.get_time - t0) / 100) || ' segundos');
END;