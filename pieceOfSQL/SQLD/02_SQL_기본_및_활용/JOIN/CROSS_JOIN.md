# CROSS JOIN

#SQLD #SQL #join 

조합할 수 있는 모든 경우를 출력하는 [JOIN](JOIN.md)이 되는 방식이다. 별도의 조인 조건이 없는 경우에도 실행된다.

- Cartesian Product라고도 한다.

## 문법

- Table A

| NAME | AGE | GENDER |
|:----:|:---:|:------:|
|  A   | 22  |  MALE  |
|  B   | 22  | FEMALE |

- Table B

| NAME |  CODE  | DESCRIPTION |
|:----:|:------:|:-----------:|
|  C   | CODE-C |  PRODUCT C  |
|  D   | CODE-D |  PRODUCT D  |


```SQL
SELECT *
FROM A CROSS JOIN B;
```

```SQL
SELECT *
FROM A, B;
```

- Result

| NAME | AGE | GENDER | B.NAME | B.CODE | B.DESCRIPTION |
|:----:|:---:|:------:|:------:|:------:|:-------------:|
|  A   | 22  |  MALE  |   C    | CODE-C |   PRODUCT C   |
|  A   | 22  |  MALE  |   D    | CODE-D |   PRODUCT D   |
|  B   | 22  | FEMALE |   C    | CODE-C |   PRODUCT C   |
|  B   | 22  | FEMALE |   D    | CODE-D |   PRODUCT D   |
