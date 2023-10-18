# NATURAL JOIN

#SQLD #SQL #join 

같은 이름을 가진 컬럼들이 모두 동일한 데이터를 가지고 있을 경우 [JOIN](JOIN.md)이 되는 방식이다.

## 문법

- Table A

| NAME | AGE | GENDER |
|:----:|:---:|:------:|
|  A   | 22  |  MALE  |
|  B   | 22  | FEMALE |

- Table B

| NAME | AGE | GENDER |
|:----:|:---:|:------:|
|  A   | 22  |  MALE  |
|  B   | 23  |  MALE  |
|  D   | 21  | FEMALE |

```SQL
SELECT *
FROM A NATURAL JOIN B;
```

- Result

| NAME | AGE | GENDER |
|:----:|:---:|:------:|
|  A   | 22  |  MALE  |
