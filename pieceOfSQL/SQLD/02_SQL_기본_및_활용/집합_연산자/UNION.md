# UNION

#SQLD #SQL #set-operator 

각 쿼리 결과의 합집합이다. 중복된 행은 한 개만 남기고 제외한다.

```SQL
SELECT * FROM A
UNION
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


\< A UNION B>

| NO  | NAME |
| --- | ---- |
| 1   | A    |
| 2   | B    |
| 3   | C    |
| 4   | D    |
| 2   | C    |
| 4   | B    |
