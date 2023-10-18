# RTRIM

#SQLD #SQL #function 

- 입력: 문자열, \[특정 문자]
- 출력
	- 특정 문자를 명시하지 않은 경우: 문자열의 오른쪽 공백을 제거한 문자열
	- 특정 문자를 명시한 경우: 문자열을 오른쪽 부터 비교하며, 특정 문자와 비교해 특정 문자가 포함된 경우 제거 하고, 포함되지 않았다면 멈춘다
		- 특정 문자로 문자열이 주어진 경우, 그 문자열과 일치 하는게 아닌 개별 문자들의 포함 여부를 확인


- 예시1

```sql
SELECT RTRIM('abcdefg    ') FROM SAMPLE;
```

- 결과1

|     | RTRIM('abcdefg    ') |
| --- | ------- |
| 1   | abcdefg       |


- 예시2

```sql
SELECT RTRIM('abcdefg', 'abc') FROM SAMPLE;
```

- 결과2

|     | RTRIM('abcdefg', 'abc') |
| --- | ----------------------- |
| 1   | abcdefg                    |


- 예시3

```sql
SELECT RTRIM('abcdefg', 'efg') FROM SAMPLE;
```

- 결과3

|     | RTRIM('abcdefg', 'efg') |
| --- | ----------------------- |
| 1   | abcd                    |

