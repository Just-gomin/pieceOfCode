# MINUS / EXCEPT

제일 상단에 위치한 쿼리 결과에서 아래의 쿼리 결과를 제거하고 출력한다.

```SQL
SELECT * FROM A
[MINUS / EXCEPT]
SELECT * FROM B;
```

- `SELECT * FROM A` 결과에서 `SELECT * FROM B` 의 결과를 뺀다.

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


\< A EXCEPT B>

| NO  | NAME |
| --- | ---- |
| 2   | B    |
| 4   | D    |
