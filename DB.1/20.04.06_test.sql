1.
COMMENT ON COLUMN EMPL.EID IS '사번';

COMMENT ON COLUMN EMPL.ENAME IS '사원명';

COMMENT ON COLUMN EMPL.ENO IS '주민번호';

COMMENT ON COLUMN EMPL.EMAIL IS '이메일';

COMMENT ON COLUMN EMPL.PHONE IS '전화번호';

COMMENT ON COLUMN EMPL.HIRE_DATE IS '입사일';

COMMENT ON COLUMN EMPL.JID IS '직급번호';

COMMENT ON COLUMN EMPL.SALARY IS '급여';

COMMENT ON COLUMN EMPL.BONUS_PCT IS '보너스포인트';

COMMENT ON COLUMN EMPL.MARRIAGE IS '결혼여부';

COMMENT ON COLUMN EMPL.MID IS '관리자사번';

COMMENT ON COLUMN EMPL.DID IS '부서번호';


CREATE TABLE EMPL (

EID CHAR(3),

ENAME VARCHAR2(20) CONSTRAINT NENAME NOT NULL,

ENO CHAR(14) CONSTRAINT NENO NOT NULL,

EMAIL VARCHAR2(25),

PHONE VARCHAR2(12),

HIRE_DATE DATE DEFAULT SYSDATE,

JID CHAR(2),

SALARY NUMBER,

BONUS_PCT NUMBER,

MARRIAGE CHAR(1) DEFAULT 'N',

MID CHAR(3),

DID CHAR(2),

CONSTRAINT PKEID PRIMARY KEY (EID),

CONSTRAINT UENO UNIQUE (ENO),

CONSTRAINT UEMAIL UNIQUE (EMAIL),

CONSTRAINT FKJID FOREIGN KEY (JID) REFERENCES JOB ON DELETE SET NULL,

CONSTRAINT CHK CHECK (MARRIAGE IN ('Y','N')),

CONSTRAINT FKMID FOREIGN KEY (MID) REFERENCES EMPL ON DELETE SET NULL,

CONSTRAINT FKDID FOREIGN KEY (DID) REFERENCES DEPARTMENT ON DELETE CASCADE

);


2.
두 테이블 모두 DEPTNO이라는 컬럼명이 같기 때문에 문제에서의 오라클 구문이 아닌 ANSI구문을 이용하여 USING을 사용하여 해결할 수도 있다. (이땐, 어떤 테이블의 DEPTNO 컬럼인지 지정할 필요가 없다.)

SELECT EMPNO, EMPNAME, DEPTNO, DEPTNAME

FROM EMPLOYEE

JOIN DEPARTMENT USING(DEPTNO);

3.
. 아래의 엔티티간에 관계를 설정하기 위해 아래와 같이 비식별 관계로 연결하였다.
이때 발생되는 문제점을 [원인]에 기술하고, 이를 해결하기 위한 방안 및 출결상태 테이블의 해결 구문을 [조치내용]에 작성하시오. (25점)

<업무 기술서>

다음은 회사 출결에 대한 업무이다.

회사에서 사원들의 출결 상태를 관리하기 위해 각 사원마다 사번, 이름, 성별, 주소, 전화번호, 주민등록번호를 기록하여 출결사항(출근, 지각, 외근, 퇴근)을 날짜별로 기록한다.

위의 업무기술서를 통해 다음과 같은 엔티티, 속성을 도출하였다.

<엔티티 도출>

사원 : 사번(pk), 이름, 성별, 주소, 주민등록번호

출결상태 : 출결사항, 날짜(pk)

NO1_3.png


수강생 답
(원인)	사원 테이블 PK (사번)와 비식별관계인 출결상태 테이블의 FK가 존재하지 않음 
답안첨삭	구현된 데이터저장소 설계에 대한 데이터 관계에 대한 프로시저의 문제점을 파악하여 기술하지 못하였다.
모범답안	문제와 같이 비식별관계로 연결하게 되면 날짜만 주식별자가 된다. 주식별자의 특성상 중복이 발생하면 안되므로 한 날짜에는 한 명의 출결사항만 기록하게 된다. 하지만 한 날짜에 여러명의 사원들의 출결사항을 등록해야되기 때문에 날짜라는 속성이 주식별자의 역할을 잃게되는 문제가 발생한다.
수강생 답
(조치내용)	출결상태 테이블에 
참조 무결성 원칙을 지키는 외래키(FK)를 만들기 위해 PK의 '사번'의 내용을 가지고 있는 '사번'을 만들어

FK를 설정해야함

답안첨삭	
구현된 데이터저장소 설계에 대한 데이터 관계에 대한 프로시저의 문제점을 해결하지 못하였다.

모범답안	
따라서 비식별관계가 아닌 식별관계로 연결하여 날짜와 사번을 함께 주식별자로 두어야 된다.

- 해결구문

PRIMARY KEY (날짜, 사번)


4.
4. 아래의 테이블의 값을 PRODUCT 테이블을 생성하는 구문을 [원인]에 기술하고, 테이블에 데이터를 삽입하는 명령문을 [조치내용]에 작성하시오. (10점)

테이블명 : PRODUCT

PNAME PRICE PSTATE PCOMMENT

(VARCHAR2(20)) (NUMBER) (CHAR(1)) (VARCHAR2(100))

갤럭시노트10 1950000 A 사전예약 시행중

MACBOOK AIR 1500000 B 맥북 프로보다 가볍게 사용할 수 있음

LG V7 780000 C 카메라 성능이 세계적으로 우수함

수강생 답
(원인)	CREATE TABLE PRODUCT(
PNAME VARCHAR2(20),
PRICE NUMBER,
PSTATE CHAR(1),
PCCOMMENT VARCHAR2(100)
);​


답안첨삭	
물리 데이터저장소 구조를 이해하고, 시나리오에 따라 정확하게 테이블을 최적화할 수 있다.

모범답안	
CREATE TABLE PRODUCT (

PNAME VARCHAR2(20),

PRICE NUMBER,

PSTATE CHAR(1),

PCOMMENT VARCHAR2(100)

);

수강생 답
(조치내용)	
INSERT INTO PRODUCT

VALUES('갤럭시노트10', 1950000, 'A', '사전예약 시행중');​



INSERT INTO PRODUCT

VALUES('MACBOOK AIR', 1500000, 'B', '맥북 프로보다 가볍게 사용할 수 있음');​



INSERT INTO PRODUCT

VALUES('LG V7', 780000, 'C', '카메라 성능이 세계적으로 우수함');​

답안첨삭	


물리 데이터저장소 구조를 이해하고, 테이블에 데이터를 기록하기 위한 구문을 정확하게 사용할 수 있다.

모범답안	
INSERT INTO PRODUCT('갤럭시노트10', 1950000, 'A', '사전예약 시행중');

INSERT INTO PRODUCT('MACBOOK AIR', 1500000, 'B', '맥북 프로보다 가볍게 사용할 수 있음');

INSERT INTO PRODUCT('LG V7', 780000, 'C', '카메라 성능이 세계적으로 우수함');
