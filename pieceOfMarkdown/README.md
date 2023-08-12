# Markdown 문법 템플릿

- 제가 사용하는 빈도수가 높은 문법들 위주로 정리되어 있기 때문에, 설명서 같은 것을 원하신 다면 해당 글은 추천 드리지 않습니다.

  > 설명서 같은 문법 정리를 원하신다면 [Markdown 문법](https://www.markdownguide.org/basic-syntax/)을 참고해 주세요.

- 아래 문법 중 대괄호([ ])로 작성된 부분은 사용자가 직접 필요에 맞게 입력 값을 줄 수 있는 부분입니다.

## 텍스트 스타일

### 볼드체

```markdown
**[내용]**
```

### 글씨 색상

```markdown
<[tag] style="color:[color];">[내용]<[/tag]>
```

#### 글씨 색상 예시

- <span style="color:red;">\<span style="color:red;">글씨 색상 예시 텍스트\</span></span>
- <span style="color:orange;">\<span style="color:orange;">글씨 색상 예시 텍스트\</span></span>
- <span style="color:yellow;">\<span style="color:yellow;">글씨 색상 예시 텍스트\</span></span>
- <span style="color:#e7fc26;">\<span style="color:#e7fc26;">글씨 색상 예시 텍스트\</span></span>
- <span style="color:#AAFF00;">\<span style="color:#AAFF00;">글씨 색상 예시 텍스트\</span></span>
- <span style="color:green;">\<span style="color:green;">글씨 색상 예시 텍스트\</span></span>
- <span style="color:blue;">\<span style="color:blue;">글씨 색상 예시 텍스트\</span></span>
- <span style="color:darkblue;">\<span style="color:darkblue;">글씨 색상 예시 텍스트\</span></span>
- <span style="color:purple;">\<span style="color:purple;">글씨 색상 예시 텍스트\</span></span>
- <span style="color:black;">\<span style="color:black;">글씨 색상 예시 텍스트\</span></span>
- <span style="color:grey;">\<span style="color:grey;">글씨 색상 예시 텍스트\</span></span>
- <span style="color:white; background-color:black;">\<span style="color:white; background-color:black;">글씨 색상 예시 텍스트\</span></span>

### 하이라이트

```markdown
<[tag] style="background-color:[color];">[내용]<[/tag]>
```

#### 주로 쓰는 하이라이팅 코드

> <[tag] style="background-color:#e7fc26;">[내용]<[/tag]>

#### 하이라이트 예시

- <span style="background-color:red;">\<span style="background-color:red;">하이라이트 예시 텍스트\</span></span>
- <span style="background-color:#db0202;">\<span style="background-color:#db0202;">하이라이트 예시 텍스트\</span></span>
- <span style="background-color:orange;">\<span style="background-color:orange;">하이라이트 예시 텍스트\</span></span>
- <span style="background-color:yellow;">\<span style="background-color:yellow;">하이라이트 예시 텍스트\</span></span>
- <span style="background-color:#e7fc26;">\<span style="background-color:#e7fc26;">하이라이트 예시 텍스트\</span></span>
- <span style="background-color:#AAFF00;">\<span style="background-color:#AAFF00;">하이라이트 예시 텍스트\</span></span>
- <span style="color:white; background-color:green;">\<span style="color:white; background-color:green;">하이라이트 예시 텍스트\</span></span>
- <span style="color:white; background-color:blue;">\<span style="color:white; background-color:blue;">하이라이트 예시 텍스트\</span></span>
- <span style="color:white; background-color:darkblue;">\<span style="color:white; background-color:darkblue;">하이라이트 예시 텍스트\</span></span>
- <span style="color:white; background-color:purple;">\<span style="color:white; background-color:purple;">하이라이트 예시 텍스트\</span></span>
- <span style="color:white; background-color:black;">\<span style="color:white; background-color:black;">하이라이트 예시 텍스트\</span></span>
- <span style="color:white; background-color:grey;">\<span style="color:white; background-color:grey;">하이라이트 예시 텍스트\</span></span>
- <span style="background-color:white;">\<span style="background-color:white;">하이라이트 예시 텍스트\</span></span>

### 텍스트 꾸밀 때 쓰는 tag&colors

- tag : p, span, code, ...
- color: red(빨강), #db0202(코드 빨강), orange(주황), yellow(노랑), #e7fc26(하이라이트 노랑), #AAFF00(하이라이트 초록), green(초록), blue(파랑), darkblue(남),purple(보라), black(검정), #d1cfcf(코드 회색), white(하양)

## 코드

### 인라인(in-line) 코드

| Markdown Syntax |         HTML          | Rendered Output |
| :-------------: | :-------------------: | :-------------: |
|    \`[내용]`    | \<code>[내용]\</code> |    `[내용]`     |

#### 주로 쓰는 인라인(in-line) 코드

> <code style="color:#db0202; background-color:#d1cfcf; padding:4px;">\<code style="color:#db0202; background-color:#d1cfcf; padding:4px;">[내용]\</code></code>

### 코드 블럭

#### Markdown

````markdown
```[language]
  [내용]
```
````

#### HTML

```html
<pre>
  <code>
    [내용]
  </code>
</pre>
```

## 링크

| Markdown Syntax  |             HTML             | Rendered Output |
| :--------------: | :--------------------------: | :-------------: |
| \[[내용]]([URL]) | \<a href="[URL]">[내용]\</a> | [[내용]]([URL]) |

## 이미지

|  Markdown Syntax   |               HTML               |
| :----------------: | :------------------------------: |
| \!\[[내용]]([URL]) | \<img src="[URL]" alt="[내용]"/> |
