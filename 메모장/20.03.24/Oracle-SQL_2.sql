+ 데이터 연결 연산자, ||

  - 두 개의 데이터를 하나의 문자열로 연결하여 표현하는 연산자
  
  - 문자 || 문자
  - 문자 || 숫자
  - 문자 || 날짜
  
  - 오라클 SQL 에서 문자열을 ''로 감싸서 표현한다.
  
  
+ 오라클 11g R2 Function Documentation  ( 레퍼런스, Reference;

  - https://docs.oracle.com/cd/E11882_01/server.112/e41084/functions.htm

  - 구글에서 '오라클 11g R2 functions' 검색하면 나옴
  
+ 오라클 내장 함수, SQL Functions

  - 오라클 DB에 포함된 Built-in 함수들
  
  - 오라클 SQL API Functions
  
  - 단일 행 함수, Single Row Functions
      테이블을 조회할 때 조회되는 모든 행에 각각 수행 결과가 반영되는 함수
      
      
  - 그룹 함수, Group Finctions ( 복수 행 함수 )
  
      행들의 조회결과를 하나의 결과로 반영하는 함수
      
+ DUAL 테이블

  - SYS 계정(DB관리자계정)이 소유하는 테이블 ( owner가 sys 계정)
  
  - 오라클에서 제공하는 테스트용 테이블 (dummy)
  
  - 연산의 결과나 함수의 결과, 가상컬럼 등을 확인할 때 사용한다.
  
  - SQL Function을 테스트해보기 좋다
  
  - 하나의 행으로 결과가 출력된다
  
         SQL
         
+ 단일 행 함수
  
  - 숫자 함수, Numeric Function
      숫자를 매개변수로 받아서 숫자로 반환한다
      
      Java의 Math클래스와 비슷한 역할
      
  - 문자 함수, Character Function
      문자를 매개변수로 사용하는 함수
      
      1. 반환값이 문자인 함수
      2. 반환값이 숫자인 함수
      
  - 날짜 함수, Datetime Function
      날짜를 매개변수로 사용하는 함수
      
      ** sysdate
       현재 날짜시간을 반환하는 함수
       
       매개변수 없이 사용한다
       () 괄호도 사용하지 않음
       
       
  - 변환 함수, Conversion Function
      숫자, 문자, 날짜 데이터들을 서로 형변환하는 함수
      
       to_number : NUMBER포맷(서식)을 가진 VARCHAR2 -> NUMBER
       
       to_char : NUMBER, DATE -> 원하는 포맷(서식)의 VARCHAR2
       
       to_date : DATE포맷(서식)을 가진 VARCHAR2 -> DATE
  
  
                to_char                  to_date
         숫자   -------->      문자     ----------->   날짜
       (NUMBER) <-------   (VARCHAR2) <-----------  (DATE)
               to_numver                 to_char  
  
  + to_char(number)
  
    - NUMBER -> VARCHAR2 변환
    
    - to_char(number)
    - to_char(number, 숫자서식문자)
    
  + 숫자 서식 문자
  
    - 0 : 숫자가 들어갈 자리를 확보한다, 남는자리는 0 (숫자0)으로 LPAD한다
    - 9 : 숫자가 들어갈 자리를 확보한다, 남는자리는 ' ' (빈칸)으로 LPAD한다
    
    - . : 소수점 구분 문자 추가 (정수부, 소수부)
    - , : 자릿수 구분 문자 추가
    
    - L : 세계 통화기호 추가 ( 설정된 통화를 따라감, 한국 : ￦, LOCALE)
    - $ : 통화기호 $ 추가
    
   + to_char(datetime)
    
    - DATE -> VANCHAR2
    
    - to_char(datetime)
    - to_char(datetime, 날짜형식지정문자)
    
  + 날짜 형식 지정 문자
  
    - SCC : 세기
    
    - YEAR, year, Year : 영문 년도
    
    - YYYY, YY, YYY, Y : 숫자 년도, Y의 개수는 년도를 표현하는 자릿 수
    
    - MM : 숫자 월
    - MONTH, MON : 문자 월
    
    - Q : 쿼터, 분기
    
    - DD : 월 기준 날짜
    - D : 주 기준 날짜(일요일부터 1, 토요일까지 7)
    - DDD :  년 기준 날짜 
    
    - DAY : 요일
    - DY : 요일 약자
    
    - HH : 12시간 표기법 시간
    - HH12 : 12시간 표기법 시간
    - HH24 : 24시간 표기법 시간
    
    - MI : 분
    
    - SS : 초
    
    - FF : 밀리초
    
    - AM, PM, A.M. , P.M. : 오전/오후
  
  + 오라클 날짜 대표 자료형
  
    - DATE : 초단위까지 표현 가능
    
    - TIMESTAMP : 밀리초단위까지 표현 가능
    
  + 현재 시간 함수
   
    - sysdate : DATE타입으로 표현한 현재 시간
    
    - systimestamp : TIMESTAMP타입으로 표현한 현재 시간
    
  ** 날짜 서식 중 'FF' (밀리초) 를 사용하려면 TIMESTAMP 타입이어야 한다
  
  
