# WINDOWING

#SQLD #SQL #window-function

WINDOWING 절을 사용해 집계하려는 데이터의 범위를 지정할 수 있다.

`OVER` 절에서 `ORDER BY` 절 뒤에 범위를 명시하지 않은 경우, 
기본 값은 `RANGE UNBOUNDED PRECEDING`이 되어 첫 행부터 현재 행까지만을 범위로 사용한다.

## 기준

### ROWS

행 자체가 기준이 된다

### RANGE

행이 가지고 있는 데이터 값이 기준이 된다.

## 범위

### UNBOUNDED PRECEDING

위쪽 끝 행

### UNBOUNDED FOLLOWING

아래쪽 끝 행

### CURRENT ROW

현재 행

### n PRECEDING

현재 행에서 위로 n 만큼 이동

### n FOLLOWING

현재 행에서 아래로 n 만큼 이동

## 형식

```SQL
[RANGE/ROWS] BETWEEN [시작 범위] AND [종료 범위]
```

or

```SQL
[범위]
```
