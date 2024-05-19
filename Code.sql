CREATE DATABASE ILIA;

CREATE TABLE IF NOT EXISTS ILIA.TEST (
    a Int32,
    b String,
    c Enum('enum1' = 1, 'enum2' = 2, 'enum3' = 3)
) 
Engine = Log();


INSERT INTO ILIA.TEST
SELECT
    toInt32(floor(randNormal(22, 2))) AS a,
    substring(upper(hex(reinterpretAsString(rand() % 256))), 1, 10) AS b,
    toEnum('a', 'b', 'c')[rand() % 3 + 1] AS c
FROM numbers(10000);

SELECT * FROM ILIA.TEST WHERE b LIKE '%abc%' AND a > 10;
