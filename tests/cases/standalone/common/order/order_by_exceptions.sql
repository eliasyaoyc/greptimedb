CREATE TABLE test (a BIGINT TIME INDEX, b INTEGER);

INSERT INTO test VALUES (11, 22), (12, 21), (13, 22);

SELECT a FROM test ORDER BY 2;

-- Not work in greptimedb
SELECT a FROM test ORDER BY 'hello', a;

-- Ambiguous reference in union alias, give and error in duckdb, but works in greptimedb
SELECT a AS k, b FROM test UNION SELECT a, b AS k FROM test ORDER BY k;

SELECT a AS k, b FROM test UNION SELECT a AS k, b FROM test ORDER BY k;

SELECT a % 2, b FROM test UNION SELECT b, a % 2 AS k ORDER BY a % 2;

-- Works duckdb, but not work in greptimedb
SELECT a % 2, b FROM test UNION SELECT a % 2 AS k, b FROM test ORDER BY a % 2;

SELECT a % 2, b FROM test UNION SELECT a % 2 AS k, b FROM test ORDER BY 3;

SELECT a % 2, b FROM test UNION SELECT a % 2 AS k, b FROM test ORDER BY -1;

SELECT a % 2, b FROM test UNION SELECT a % 2 AS k FROM test ORDER BY -1;

DROP TABLE test;
