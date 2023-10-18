# SYSDATE

#SQLD #SQL #function

- 입력:
- 출력: 시스템의 현재 연, 월, 일, 시, 분, 초를 반환

```SQL
SELECT SYSDATE;
```

|     | SYSDATE                       |
| --- | ----------------------------- |
| 1   | 2023-09-20 19:14:33.433989+09 |

## PostgreSQL

### TIMESTAMP

```SQL
SELECT CURRENT_TIMESTAMP;
```

|     | SYSDATE                       |
| --- | ----------------------------- |
| 1   | 2023-09-20 19:14:33.433989+09 |

### DATE

```SQL
SELECT CURRENT_DATE;
```

|     | SYSDATE    |
| --- | ---------- |
| 1   | 2023-09-20 |

### TIME

```SQL
SELECT CURRENT_TIME;
```

|     | SYSDATE            |
| --- | ------------------ |
| 1   | 19:14:33.433989+09 |
