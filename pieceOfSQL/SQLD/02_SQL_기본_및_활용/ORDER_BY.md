# 💡 ORDER BY

`ORDER BY`는 [SELECT절_실행_순서](DML/SELECT절_실행_순서.md) 에서 마지막에 실행되며, SELECT한 데이터를 정렬할 수 있다.

`ORDER BY`를 따로 명시하지 않는다면, 임의의 순서대로 출력된다.

## 📌 문법

```SQL
ORDER BY Column1 [ASC | DESC] 
 [
  , Column2 [ASC | DESC]
  , Column3 [ASC | DESC]
  , ...
 ] 
```

## 📌 옵션

### 👉 ASC(Ascending)

오름차순 정렬 옵션이다. 옵션 생략시 기본 값이다.

### 👉 DESC(Descending)

내림차순 정렬 옵션이다.
