# ADD_MONTHS

#SQLD #SQL #function

- 입력: 날짜 데이터, 특정 개월 수
- 출력: 날짜 데이터에 특정 개월 수를 더한 날짜를 반환
  - 날짜의 이전 달이나 다음 달에 기준 날짜의 일자가 존재하지 않는 경우, 해당 월의 마지막 일자가 반환

```SQL
SELECT ADD_MONTHS(SYSDATE, 4);
```

|     | column              |
| --- | ------------------- |
| 1   | 2024-01-20 00:00:00 |

## PostgreSQL

### Add Months

```SQL
SELECT CURRENT_DATE + INTERVAL '1 month' * 4;
```

|     | column              |
| --- | ------------------- |
| 1   | 2024-01-20 00:00:00 |
