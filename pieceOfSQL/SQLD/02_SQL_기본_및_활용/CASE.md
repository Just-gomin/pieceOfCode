# 💡 CASE

"~이면 ~이고,~이면 ~이다" 형식의 구문.

`WHEN` 뒤에 조건을 명시하고, 해당 조건을 만족할 때 반환할 값을 `THEN` 뒤에 명시한다.

```SQL
CASE WHEN SUBWAY_LINE='1' THEN 'BLUE'
  WHEN SUBWAY_LINE='2' THEN 'GREEN'
  WHEN SUBWAY_LINE='3' THEN 'ORANGE'
  [ELSE 'GRAY']
```

## 📌 ORACLE: DECODE

```SQL
DECODE (SUBWAY_LINE, '1', 'BLUE', '2', 'GREEN', '3', 'ORANGE'[, 'GRAY'])
```
