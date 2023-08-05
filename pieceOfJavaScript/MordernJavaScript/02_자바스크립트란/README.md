# 02. 자바스크립트란?

## 2.1 자바스크립트의 탄생 & 2.2 자바스크립트의 표준화

- 1995, [넷스케이프 커뮤니케이션즈(Netscape communications)](https://ko.wikipedia.org/wiki/%EB%84%B7%EC%8A%A4%EC%BC%80%EC%9D%B4%ED%94%84)의 [브렌던 아이크(Brenden Eich)](https://ko.wikipedia.org/wiki/%EB%B8%8C%EB%A0%8C%EB%8D%98_%EC%95%84%EC%9D%B4%ED%81%AC)에 의해 자바스크립트가 탄생했다.

  - 웹페이지의 보조적인 기능을 수행하기 위해 브라우저에서 동작하는 경량 프로그래밍 언어를 도입하기 위해 개발했다.

- 1993.06, [넷스케이프 내비게이터(넷스케이프 커뮤니케이션즈의 웹 브라우저)](https://ko.wikipedia.org/wiki/%EB%84%B7%EC%8A%A4%EC%BC%80%EC%9D%B4%ED%94%84_%EB%82%B4%EB%B9%84%EA%B2%8C%EC%9D%B4%ED%84%B0)에 ["모카(Mocha)"](<https://en.wikipedia.org/wiki/Mocha_(JavaScript_framework)>) 라는 이름으로 탑재

- 1993.09, "라이브스크립트(LiveScript)"로 변경

- 1993.12, "자바스크립트(JavaScript)"로 최종 명명.

- 1996, [마이크로소프트(Microsoft)](https://ko.wikipedia.org/wiki/%EB%A7%88%EC%9D%B4%ED%81%AC%EB%A1%9C%EC%86%8C%ED%94%84%ED%8A%B8)에서 만든 자바스크립트의 파생 버전인 ["JScript"](https://ko.wikipedia.org/wiki/J%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8) 탄생 및 [인터넷 익스플로러](https://ko.wikipedia.org/wiki/%EC%9D%B8%ED%84%B0%EB%84%B7_%EC%9D%B5%EC%8A%A4%ED%94%8C%EB%A1%9C%EB%9F%AC) 3.0에 탑재

  - 이 당시 자바스크립트와 J스크립트는 표준화 되지 못하고 적당히 호환되었다.
  - 넷스케이프 커뮤니케이션즈와 마이크로소프트는 서로의 브라우저의 점유율을 높이기 위해 자사 브라우저에서만 동작하는 기능을 경쟁적으로 추가하기 시작했다.
  - 브라우저에 따라 웹페이지가 정상적으로 동작하지 않는 [**크로스 브라우징**](https://en.wikipedia.org/wiki/Cross-browser_compatibility) 이슈가 발생하기 시작했다.
  - 자바스크립트의 파편화를 방지하고 모든 브라우저에서 정상 동작하는 표준화된 자바스크립트의 필요성 대두.

  </br>

- 1996.11, [ECMA 인터내셔널(컴퓨터 시스템의 표준을 관리하는 비영리 표준화 기구)](https://ko.wikipedia.org/wiki/Ecma_%EC%9D%B8%ED%84%B0%EB%82%B4%EC%85%94%EB%84%90)에 넷스케이프 커뮤니케이션즈는 자바스크립트의 표준화를 요청.

- 1996.07, [ECMA-262](https://www.ecma-international.org/publications-and-standards/standards/ecma-262/)라 불리는 표준화된 자바스크립트 초판(ECMAScript 1) 사양(specification)이 완성되었고, 상표권 문제로 [ECMAScript](https://ko.wikipedia.org/wiki/ECMA%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8)로 명명 되었다.

- 1998, ECMAScript 2(ES2) 공개. ISO/IEC 1626 국제 표준과 동일한 규격 적용

- 1999, ECMAScript 3(ES3) 공개. 정규 표현식, try...catch 적용

- 2009, ECMAScript 5(ES5) 공개. HTML5와 함께 등장.

- ECMAScript 4 는 버려짐

- 2015, ECMAScript 6(ECMAScript 2015, ES6) 공개. let & const 키워드, 화살표 함수, 클래스, 모듈 등 범용 프로그래밍 언어로서 갖춰야할 기능들을 대거 도입하는 큰변화가 있었다.

- 2016, ECMAScript 7(ECMAScript 2016, ES7) 공개.

- 2017, ECMAScript 8(ECMAScript 2017, ES8) 공개.

- 2018, ECMAScript 9(ECMAScript 2018, ES9) 공개.

- 2019, ECMAScript 10(ECMAScript 2019, ES10) 공개.

- 2020, ECMAScript 11(ECMAScript 2020, ES11) 공개.

- 2021, ECMAScript 12(ECMAScript 2021, ES12) 공개.

- 2022, ECMAScript 13(ECMAScript 2022, ES13) 공개.

## 2.3 자바스크립트 성장의 역사

### 2.3.1 Ajax

- 1999, [Ajax(Asynchronous JavaScript and XML)](https://ko.wikipedia.org/wiki/Ajax)가 [XMLHttpRequest](https://developer.mozilla.org/ko/docs/Web/API/XMLHttpRequest)라는 이름으로 등장

  > Ajax?
  >
  > - 자바스크립트를 이용해 서버와 브라우저가 비동기(Asynchronous) 방식으로 데이터를 교환할 수 있는 통신 기능
  > - 웹 페이지에서 변경할 필요가 없는 다시 렌더링을 진행하지 않고, 서버로 부터 필요한 데이터만 전송받아 변경해야 하는 부분만 한정적으로 렌더링하는 방식이 가능
  > - 웹 브라우저에서 빠른 성능과 부드러운 화면 전환이 가능해짐

  </br>

- 2005, [구글 맵스(Google Maps)](https://ko.wikipedia.org/wiki/%EA%B5%AC%EA%B8%80_%EC%A7%80%EB%8F%84)의 등장으로 웹 애플리케이션 프로그래밍 언어로서 자바스크립트의 가능성을 확인하는 계기 마련
