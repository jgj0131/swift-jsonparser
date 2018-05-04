## JSONParser의 이해하기

1. JSON이란?

풀 네임 : JavaScript Object Notation

배경 :

서로 다른 언어들 간의 데이터를 주고 받는 경우가 필요함, 언어마다 가지고 있는 형식이 존재하고 형식을 기술하는 방식이 다름. 따라서 서로간의 데이타교환하기 위한 룰이 필요함

JSON :

경량의 데이타를 주고 받는 형식
JavaScript에서 숫자와 배열등의 차용해서 다른언어에서도 사용 할 수 있게 한 txt형식

2. 왜 Json과 XML을 주로 사용하는가?

서로간의 데이타를 주고 받는 방법은 txt파일 같은 것도 가능하나 txt파일은 규칙성이 없어 구분하기가 쉽지가 않다 그래서 규칙성을 가지고 있는 xml과 json을 사용하게 되었다.

ex ) Swift의 Array타입을 php의 Array로 받고 싶은 경우

    (1) 서로의 타입은 배열이지만 이루고 있는 구성이 달라서 서로 맞지가 않음
    (2) 서로 간의 배열임을 구별하는 규칙이 필요
    (3) json -> [ ]를 사용하여 배열 형태로 넘겨주면 서로 간의 배열을 확인하고 배열 형태로 저장?

3. xml말고 json을 주로 사용하는 이유

xml의 사용 법
```
xml의 경우 태그를 가지고 값을 구분  

(1) xml이라는 형식의 테이타로 구분
(2) xml 형식(태크)를 사용하여 값을 구분하기 때문에 서로 간의 데이터 교환이 가능

<catalog>
  <book id="bk01">
    <author>Gambardella, Mathew</author>
  </book>
  <book id="bk02">
    <author>Ralls, Kim</author>
  </book>
</catalog>

```

xml의 문제점

```
(1) 쉽게 무거워 진다 (많은 데이타가 필요: book1과 book2안에 author가 중복해서 들어감)
(2) 배열을 표현하기 위해서는 따로 작업이 필요(각각의 언어에서 배열로 만드는 작업이 필요)
```


추가 사항

```
jk : JSON은 타입이 5가지 뿐이지만… XML은 이론상으로 더 많은 타입과 타입 규칙으로 확장할 수 있다는 장점이 있습니다. 물론 값을 표현하기 위해서 tag를 더 많이 해야해서 오버해드가 발생합니다.
```

JSON의 타입 : oavsn -> 오아브스엔 -> object, Array, value, string, number

- 공부사항

## 1. Lexer

1. 값을 token형태로 변환하는 작업 (에러가 잘 발생하지 않음)
```
- 에러가 잘 생기지 않는 이유는 단지 lexer는 값을 파서가 인식 할 수 있는 token을 형태로 만드는 작업이기 떄문에 값이 유효한지는 판단 하지 않음
```

## 2. parser

```
- token의 값이 유효한지 판단하는 역할
- 값이 모델에 담기는 형태를 만들어 주는 역할은 아님 (단순한 array or dictionary형태가 되어함)
```

## if - guard 
사용 기준
```
if문

1. 단순한 조건을 확이하고 조건이 맞지 않아도 아래 다음 문구가 실행

guard

1. 조건이 검사가 다음 영향이 있어 에러를 던져 주어야 하는경우

```

