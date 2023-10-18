#SQLD #database 

# NULL

존재하지 않음, 즉 값이 없음을 의미하는 예약어이다.

## NULL을 포함한 연산에 따른 결과

### 가로 연산

NULL을 포함한 연산은 NULL이 된다.

```SQL
SELECT COL1
FROM TABLE1
WHERE COL1 > 0;
```

### 세로 연산

다른 인스턴스의 데이터와 연산할 때는 NULL 값을 제외한다.

```sql
SELECT SUM(COL1)
FROM TABLE1
WHERE COL1 > 0;
```

