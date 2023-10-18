# 💡 SQL 연산자

## 📌 기본 SQL 연산자

|       연산자       | 의미                    | 예시                            |
|:------------------:|:----------------------- |:------------------------------- |
|  BETWEEN A AND B   | A와 B의 사이(A, B 포함) | `WHERE COL BETWEEN 1 AND 10`    |
| LIKE '비교 문자열' | 비교 문자열을 포함하는  | `WHERE email LIKE '@gmail.com'` |
|     IN (LIST)      | LIST 중 하나와 일치하는     | `WHERE col IN (1,2,3)`          |
|      IS NULL       | 해당 값이 NULL인  | `WHERE col IS NULL`             |

- `LIKE` 사용 시 `_` 또는 `%` 가 포함된 문자열을 검색하고자 할 때, `ESCAPE`를 지정해서 쿼리를 작성할 수 있다.

```SQL
SELECT *
FROM TABLE
WHERE COLUMN LIKE '%#%%' ESCAPE '#';
```

## 부정 SQL 연산자

|         연산자         | 의미                                      | 예시                                |
|:----------------------:|:----------------------------------------- |:----------------------------------- |
|  NOT BETWEEN A AND B   | A와 B의 사이에 존재하지 않는(A, B 미포함) | `WHERE COL NOT BETWEEN 1 AND 10`    |
| NOT LIKE '비교 문자열' | 비교 문자열을 포함하지 않는               | `WHERE email NOT LIKE '@gmail.com'` |
|     NOT IN (LIST)      | LIST 중 단 한개도 일치하지 않는           | `WHERE col NOT IN (1,2,3)`          |
|      IS NOT NULL       | 해당 값이 NULL 이 아닌                    | `WHERE col IS NOT NULL`             |
