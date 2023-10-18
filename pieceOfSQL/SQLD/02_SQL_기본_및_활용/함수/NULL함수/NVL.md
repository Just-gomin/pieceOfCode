# NVL

#SQLD #SQL #function 

- 입력: 인수1, 인수2
- 출력
	- 인수1의 값이 NULL인 경우: 인수2 반환
	- 인수1의 값이 NULL이 아닌 경우: 인수1 반환

```SQL
SELECT NVL(NULL, 0), NVL(1, 0);
```

|     | NVL(NULL, 0) | NVL(1,0) |
| --- | ------------ | -------- |
| 1   | 0            | 1        |

## PostgreSQL: COALESCE
