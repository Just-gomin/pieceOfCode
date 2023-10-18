# INTERSECT

#SQLD #SQL #set-operator 

각 쿼리에서 공통된 부분만 중복을 제거하여 반환한다.

```SQL
SELECT * FROM A
INTERCTECT
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


\< A INTERSECT B>

| NO  | NAME |
| --- | ---- |
| 1   | A    |
| 3   | C    |
