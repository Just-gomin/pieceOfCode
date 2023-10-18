# UNION ALL

#SQLD #SQL #set-operator 

각 쿼리의 결과 집합의 합집합이다. 중복된 행도 그대로 출력된다.

```SQL
SELECT * FROM A
UNION ALL
SELECT * FROM B
```

\<Table A>

| NO  | NAME |
| --- | ---- |
| 1   | A    |
| 2   | B    |
| 3   | C    |
| 4   | D    |


\<Table B>

| NO  | NAME |
| --- | ---- |
| 1   | A    |
| 2   | C    |
| 3   | C    |
| 4   | B    |


\< A UNION ALL B>

| NO  | NAME |
| --- | ---- |
| 1   | A    |
| 2   | B    |
| 3   | C    |
| 4   | D    |
| 1   | A    |
| 2   | C    |
| 3   | C    |
| 4   | B    |
