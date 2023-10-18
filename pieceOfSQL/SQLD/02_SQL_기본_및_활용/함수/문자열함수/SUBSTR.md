# SUBSTR

#SQLD #SQL #function 

- 입력: 문자열, 시작점, \[길이]
	- 시작점: 1부터 시작. 인덱스가 아니다.
- 출력
	- 문자열의 원하는 부분만 잘라서 반환
	- 입력으로 길이가 주어지지 않은 경우, 문자열의 시작점부터 문자열의 끝까지 반환

```SQL
SELECT SUBSTR('abcdef', 2), SUBSTR('abcdef', 2, 5);
```

|     | SUBSTR('abcdef', 2) | SUBSTR('abcdef', 2, 5) |
| --- | ------------------- | ---------------------- |
| 1   | bcdef               | bcde                   |


