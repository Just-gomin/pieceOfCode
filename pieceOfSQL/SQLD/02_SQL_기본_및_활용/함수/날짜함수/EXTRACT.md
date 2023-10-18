# EXTRACT

#SQLD #SQL #function

- 입력: 특정 단위 FROM 날짜 데이터
	- 특정 단위
	    - YEAR
	    - MONTH
	    - DAY
	    - HOUR
	    - MINUTE
	    - SECOND

- 출력: 날짜 데이터에서 특정 단위만을 반환

```SQL
SELECT EXTRACT(YEAR FROM SYSDATE);
```

|     | EXTRACT |
| --- | ------- |
| 1   | 2023    |
