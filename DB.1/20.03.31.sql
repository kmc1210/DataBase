-- DATE
CREATE TABLE type_test_05 (
    data DATE);
    
INSERT INTO type_test_05
VALUES ( sysdate );

INSERT INTO type_test_05
VALUES ('2020/11/21');

SELECT * FROM type_test_05;

-- 년도를 음수로 사용할 때에는 단독으로 사용 불가
INSERT INTO type_test_05
VALUES ( '-2020/11/21' );


--to_date 의 서식 s 는 날짜에 포함된 부호를 인식한다
INSERT INTO type_test_05
VALUES ( to_date ( '-2020/11/21', 'syyyy/mm/dd' ));

SELECT to_char(data, 'syyyy/mm/dd hh24:mi:ss') FROM type_test_05;




INSERT INTO type_test_05
VALUES ( to_date('94/7/9', 'yy/mm/dd'));
INSERT INTO type_test_05
VALUES ( to_date('94/7/9', 'rr/mm/dd'));

SELECT * FROM type_test_05;
SELECT to_char(data, 'yyyy/mm/dd') FROM type_test_05;


-- LONG
CREATE TABLE type_test_06 (
    data LONG
    );
    
    INSERT INTO type_test_06
    VALUES ('안녕하세요');
SELECT * FROM type_test_06;

    INSERT INTO type_test_06
    VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed et est et augue pretium consequat. Fusce a elit malesuada mauris bibendum malesuada. Aenean mattis, sem eu semper molestie, nisl nunc tincidunt metus, vel accumsan tellus dui a tortor. Ut tellus erat, iaculis id felis id, molestie ultricies leo. Pellentesque erat orci, egestas in erat eget, porttitor tristique risus. Nulla quis feugiat ante. Sed feugiat neque est, non mattis ipsum elementum in. Vivamus scelerisque nisi vel faucibus vulputate. Vestibulum euismod volutpat vehicula. Donec sed leo vitae nibh elementum pretium. Ut quam nunc, posuere eu viverra in, pharetra eget eros. Praesent at maximus nulla. Pellentesque ac fermentum mauris. Curabitur scelerisque massa quis justo varius, luctus posuere nunc vestibulum. Phasellus vehicula egestas ligula ut rutrum.

Pellentesque pulvinar odio in libero ultrices eleifend. Vestibulum aliquam, magna ut commodo lobortis, magna nibh pellentesque velit, in venenatis diam erat ac est. Proin fringilla lectus et pretium imperdiet. Quisque fringilla vulputate molestie. Proin at tempor dui. Phasellus tempus vulputate lacinia. Sed quis lectus massa. Praesent eleifend porttitor lectus a porttitor. Quisque pharetra ac est non feugiat.

Integer sagittis ultricies metus, a posuere magna ultricies et. Duis cursus dolor sapien. Nunc placerat semper arcu, sed ullamcorper turpis aliquam non. Aenean enim orci, iaculis at pharetra ut, aliquet non nulla. Donec vehicula nibh vel eros malesuada, a dignissim odio congue. Suspendisse sollicitudin, turpis ut euismod tincidunt, ligula felis vestibulum ex, a mattis risus justo et nulla. In aliquam semper augue, elementum dictum nibh feugiat sed. Sed tempus eros luctus sollicitudin elementum. Ut mattis pretium luctus. Morbi nec hendrerit mauris, non tempor eros. Mauris pretium, odio ac interdum eleifend, augue dolor elementum turpis, sed feugiat justo elit et nisl. Curabitur vel elementum ligula. Ut egestas cursus elit ut sodales. Praesent efficitur id ante in volutpat. Nullam justo enim, gravida vel nunc ac, imperdiet auctor nibh.

Nunc varius consectetur nisi sit amet porttitor. Donec arcu velit, pretium vel consequat eu, pharetra vitae neque. Nunc in elementum mi, sit amet sagittis quam. In ut laoreet lacus. Maecenas feugiat orci id quam placerat faucibus. Nunc tempus at mi ut vehicula. Ut condimentum, augue at ultricies luctus, lorem nunc eleifend ex, eu aliquam sem nunc sed lacus. Maecenas ac nulla sed nisi commodo finibus. Etiam semper, ex nec fermentum iaculis, lorem nunc elementum turpis, ut fermentum orci elit eu ante. Phasellus interdum, lacus id ullamcorper efficitur, diam neque viverra erat, vel finibus augue purus nec dui. Phasellus sed justo pellentesque, laoreet ante ultricies, posuere nisi. Proin sagittis, sem ac elementum blandit, justo libero vehicula nisi, id convallis diam nulla et lacus. Duis sollicitudin vel orci nec imperdiet. Aenean augue felis, dignissim accumsan pharetra eget, tristique nec nunc. Vestibulum nec nulla in velit sagittis mattis.

Mauris sit amet euismod erat. Sed tincidunt dapibus nisl quis eleifend. Quisque mollis commodo purus in porttitor. Duis faucibus sapien sem. In nisi urna, suscipit ac velit ac, tempor sodales mauris. Cras quis pharetra justo. Proin ac eros auctor magna tristique vulputate eget sit amet erat. Suspendisse facilisis posuere arcu, in vulputate est congue at. Vivamus viverra est vel magna dapibus, sed sagittis nunc luctus. Praesent consequat, mauris nec dignissim aliquam, mi sapien gravida leo, quis laoreet metus sem ac nisl. Morbi nec porttitor ante. Nam cursus porta risus, sit amet hendrerit risus volutpat sed. Pellentesque vestibulum, turpis eu porttitor ultricies, tortor turpis malesuada lectus, vitae facilisis nulla lacus eu lacus. Donec tincidunt, neque eu dapibus tincidunt, mi orci vulputate magna, et condimentum elit arcu a libero.');


INSERT INTO type_test_06
VALUES('이름을 하나에 시와 다하지 멀리 별빛이 풀이 가난한 거외다. 너무나 시와 많은 내 버리었습니다. 덮어 사랑과 별 이런 이네들은 남은 있습니다. 그러나 별 아직 까닭이요, 아이들의 어머니 별에도 차 강아지, 봅니다. 별 봄이 사랑과 것은 버리었습니다. 이제 그리고 묻힌 소학교 별 봅니다. 별에도 이름을 무덤 우는 하나에 멀리 별 있습니다. 흙으로 어머니, 남은 오는 가득 별 릴케 피어나듯이 봅니다. 책상을 흙으로 파란 무엇인지 거외다. 내린 것은 위에 오면 이름을 파란 듯합니다.

이런 시인의 그리워 하나 새겨지는 나의 까닭입니다. 나의 라이너 하나에 시와 비둘기, 덮어 나는 강아지, 듯합니다. 했던 너무나 별빛이 내 이름과, 듯합니다. 별을 무덤 지나가는 이름자 아스라히 마디씩 옥 봅니다. 어머니 다 무엇인지 지나가는 이름자를 봅니다. 별 어머니 멀리 듯합니다. 언덕 내 된 무덤 쓸쓸함과 별 다 이웃 듯합니다. 동경과 시인의 내린 파란 멀리 있습니다. 추억과 어머님, 무엇인지 했던 계십니다. 잠, 라이너 시와 계십니다. 오는 소녀들의 쓸쓸함과 별 책상을 잔디가 까닭입니다.

불러 노루, 가난한 마디씩 파란 하나에 밤이 다하지 버리었습니다. 토끼, 무덤 언덕 위에도 버리었습니다. 까닭이요, 없이 너무나 듯합니다. 별이 이네들은 어머니, 아이들의 다 많은 아스라히 이름과, 까닭이요, 봅니다. 이름자를 이름을 계집애들의 쉬이 버리었습니다. 토끼, 별이 어머님, 듯합니다. 자랑처럼 이런 프랑시스 옥 시인의 이웃 부끄러운 까닭입니다. 추억과 잠, 까닭이요, 아름다운 시와 헤일 벌써 프랑시스 거외다. 내 덮어 남은 별 봅니다. 이름자를 이런 풀이 같이 가득 봅니다. 했던 애기 언덕 다 너무나 다 이름을 부끄러운 봅니다.'
);

-- CLODB
CREATE TABLE type_test_07 (
    data CLOB);
    
   INSERT INTO type_test_07
    VALUES ( 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ut malesuada dolor, ut pellentesque massa. Aliquam arcu odio, blandit in rhoncus ut, eleifend a nulla. Donec volutpat neque quis ipsum rutrum ultrices. Curabitur porttitor lacus dolor, sit amet aliquet risus pellentesque non. Phasellus pulvinar varius ultricies. Donec vel malesuada neque, sit amet ultricies turpis. Nam egestas convallis porttitor. Cras justo purus, faucibus ac posuere at, pellentesque non orci. Nunc maximus diam velit, et feugiat libero finibus at. Aenean nec placerat libero, ut commodo eros. Nam in quam ut quam varius mattis. Morbi egestas placerat erat, at vestibulum erat consectetur vitae. Duis ut urna vitae elit aliquam aliquam. Donec non faucibus nulla.

Aliquam non massa vel enim congue egestas ac id nibh. Sed venenatis iaculis neque, id faucibus ante pharetra et. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur bibendum massa quis consequat bibendum. Ut egestas leo a diam ornare, sed auctor elit pellentesque. Mauris euismod diam ut congue imperdiet. Duis sed varius tortor.

Morbi eu felis eu ligula rutrum ornare. Nullam dolor nisi, mattis condimentum ex vel, finibus placerat elit. Pellentesque nec diam sed est rhoncus maximus eget vel dolor. Nulla sed ipsum vel leo pharetra scelerisque. In malesuada vestibulum magna in luctus. Vivamus ac felis vel mi iaculis hendrerit eget at eros. Nullam nec odio lacinia, mattis tellus eget, laoreet ex.

Suspendisse et nulla sed justo feugiat pretium elementum id orci. Donec et rutrum erat, sed dignissim magna. Suspendisse a blandit lectus, a vulputate augue. Quisque et justo porttitor, blandit dui nec, tincidunt orci. Vestibulum consectetur augue magna, at gravida elit pellentesque ut. Sed ac ex et magna elementum mollis. Nullam dictum laoreet molestie. Morbi convallis laoreet porttitor. Curabitur finibus semper fermentum. Vestibulum consequat eros eu aliquam volutpat. Nulla facilisi. Curabitur porttitor interdum nibh sed fringilla. Ut nec tincidunt elit, id feugiat dui. Donec ipsum purus, gravida vel consectetur vitae, imperdiet ac felis.

Etiam at orci posuere, bibendum lacus in, tristique est. Etiam ante metus, aliquam nec erat quis, mattis tincidunt tortor. Maecenas ac eros lobortis, dignissim mi sed, tempor eros. Quisque et interdum eros, sit amet imperdiet nisi. Donec in viverra ante. Donec laoreet velit ac ipsum molestie condimentum. Maecenas ornare aliquet mattis. Etiam consectetur vitae metus sit amet ullamcorper. Ut in lacus molestie, commodo enim a, consequat augue.' );   
    
    INSERT INTO type_test_07
    VALUES ( '것은 오면 가슴속에 오는 속의 까닭입니다. 어머니, 나는 시와 하나에 이네들은 사랑과 내일 까닭입니다. 하나에 패, 풀이 자랑처럼 내 까닭입니다. 비둘기, 별 그리고 멀듯이, 라이너 사람들의 지나고 계십니다. 위에도 별 가을로 이런 자랑처럼 나는 있습니다. 하나에 어머니 딴은 너무나 무엇인지 속의 버리었습니다. 별 그러나 너무나 하나에 아무 이웃 계집애들의 쓸쓸함과 듯합니다. 별에도 새워 그리워 써 위에 있습니다. 내 불러 북간도에 이제 계절이 계십니다.

이름과, 하나에 너무나 아무 패, 까닭이요, 어머니, 계십니다. 나의 내린 하나에 패, 노루, 프랑시스 별이 때 시인의 봅니다. 하나에 멀듯이, 새겨지는 말 하나에 언덕 애기 까닭입니다. 나의 청춘이 때 못 나의 다하지 이국 듯합니다. 계절이 아스라히 가득 까닭입니다. 흙으로 무덤 이웃 이름을 하나 무엇인지 가난한 까닭입니다. 밤이 별들을 별 나는 한 차 거외다. 이름을 별 책상을 밤이 벌레는 프랑시스 흙으로 헤일 듯합니다. 다 무엇인지 밤을 않은 어머님, 하나에 버리었습니다. 무성할 아름다운 노새, 별 책상을 계집애들의 그리워 까닭입니다. 가을 멀리 나는 시인의 하늘에는 마디씩 버리었습니다.

이름을 이름자를 풀이 이웃 별 봅니다. 비둘기, 아스라히 불러 까닭입니다. 잔디가 아름다운 멀듯이, 밤을 하늘에는 어머니 하나에 별을 있습니다. 헤일 부끄러운 나의 버리었습니다. 남은 아름다운 별을 까닭이요, 당신은 멀듯이, 가득 이 계십니다. 그리고 아이들의 나는 불러 하나 많은 책상을 봅니다. 덮어 나의 하늘에는 별 새겨지는 써 듯합니다. 내 피어나듯이 오는 사람들의 있습니다. 이국 이름자를 내린 있습니다. 별을 하나에 까닭이요, 없이 나는 거외다. 쓸쓸함과 가득 헤는 계집애들의 봄이 무덤 덮어 버리었습니다.

어머님, 멀리 슬퍼하는 이름을 겨울이 쓸쓸함과 계십니다. 나의 별에도 딴은 라이너 당신은 묻힌 봅니다. 이름자 내 무엇인지 없이 봅니다. 하늘에는 어머니 아침이 차 이제 별 마디씩 비둘기, 봅니다. 사랑과 경, 시와 둘 별을 이국 봄이 당신은 까닭입니다. 소학교 언덕 잠, 계십니다. 새워 오면 없이 봅니다. 아름다운 밤을 흙으로 거외다. 시인의 속의 이름과, 까닭이요, 써 이네들은 어머니, 지나가는 거외다.

릴케 별들을 벌써 이름을 했던 내 시인의 버리었습니다. 내 잔디가 이네들은 별 북간도에 있습니다. 가을로 딴은 새워 가을 어머니, 이름자를 부끄러운 토끼, 봅니다. 추억과 아침이 어머님, 거외다. 나는 써 풀이 내 까닭입니다. 헤는 당신은 시인의 딴은 못 노새, 프랑시스 겨울이 피어나듯이 봅니다. 불러 지나가는 묻힌 마리아 자랑처럼 어머님, 봅니다. 밤이 겨울이 아무 한 까닭이요, 있습니다. 잔디가 옥 벌레는 슬퍼하는 강아지, 흙으로 하나 오면 오는 계십니다. 별 파란 강아지, 있습니다. 밤을 아무 하나에 이웃 멀리 같이 봅니다.' );
    
    SELECT  * FROM type_test_07;
    
    
-- CLOB 데이터 전체 조회
SELECT DBMS_LOB.SUBSTR( data, length(data), 1 )
FROM type_test_07;


CREATE TABLE type_test_08 (
    data VARCHAR(3));
    
    
    
-- 제약사항


-- NOT NULL
CREATE TABLE cons_01 (
    data VARCHAR2 (10) NOT NULL);

-- 테이블 정보 조회    
DESC cons_01;

-- 제약조건 자료사전
SELECT * FROM user_constraints
WHERE table_name = upper('cons_01');

-- 제약조건이 부여된 컬럼 정보 자료사전
SELECT * FROM user_cons_columns
WHERE table_name = upper('cons_01');

INSERT INTO cons_01
VALUES ( null );

-- 테이블 정보 자료사전에는 제약사항이 나오지 않는다
-- 테이블 정보 자료사전
SELECT * FROM tab;
-- 테이블 정보 자료사전 (상세)
SELECT * FROM tabs;


-- DB의 모든 테이블 정보 자료사전
SELECT * FROM all_tables;




-- NOT NULL 제약조건에 이름 붙여서 설정하기
CREATE TABLE cons_02 (
    data VARCHAR2 (10) CONSTRAINT cons_02_nn NOT NULL);
    
    SELECT * FROM user_constraints
    WHERE table_name = upper('cons_02');
    
    
 -- 제약조건 없이 테이블 생성
CREATE TABLE cons_03 (
    data VARCHAR(10) );
    
    
 -- NOT NULL 제약조건은 컬럼의 데이터타입에 결합되어있다
 -- NOT NULL 제약조건을 반영할 때에는 데이터타입을 변경해야한다
 ALTER TABLE cons_03
 MODIFY data NOT NULL;
 
 
 DESC cons_03;
 
 SELECT * FROM user_constraints
 WHERE table_name = upper('cons_03');
 
 
 
 -- 제약조건 추가  - UNIQUE
 ALTER TABLE cons_03
 ADD CONSTRAINT cons_03_uk UNIQUE ( data );
 
 
 INSERT INTO cons_03 VALUES ( null );
 INSERT INTO cons_03 VALUES ( 'A' );
 INSERT INTO cons_03 VALUES ( 'A' );
 INSERT INTO cons_03 VALUES ( 'B' );
 INSERT INTO cons_03 VALUES ( 'C' );
 SELECT * FROM cons_03;


    CREATE TABLE cons_04 (
    data VARCHAR2(10) CONSTRAINT cons_uk UNIQUE );
    
    CREATE TABLE cons_05 (
    data VARCHAR2(10), CONSTRAINT con05_uk UNIQUE (data) );
    
    SELECT * FROM user_constraints
    WHERE table_name = upper('cons_05');
    
    
    CREATE TABLE cons_06 (
--    data NUMBER CHECK ( data>=1 AND data <= 100 ) );
        data NUMBER CHECK( data BETWEEN 1 AND 100));
     
     INSERT INTO cons_06 VALUES (30);
     INSERT INTO cons_06 VALUES (200);
     
        
     SELECT * FROM user_constraints
     WHERE table_name = upper('cons_06');
     
     
     DESC cons_01;
     DESC cons_06;
     
     SELECT * FROM user_cons_columns
     WHERE constraint_name = upper('SYS_C007073');
     
     CREATE TABLE cons_07(
     data NUMBER);
    
        ALTER TABLE cons_07
--        ADD CONSTRAINT cons_07_ch CHECK (data IN (1000,2000,3000,4000));
        MODIFY data CHECK(data IN (1000,2000,3000,4000));
        INSERT INTO cons_07 VALUES (5000);
        DELETE CONS_07;
        SELECT * FROM cons_07;
--     ALTER TABLE cons_03
-- ADD CONSTRAINT cons_03_uk UNIQUE ( data );
     -- cons_07 테이블 생성
     -- 칼럼 ; data NUMBER
     
     -- ALTER TABLE 구문을 이용하여 data에
     -- 제약사항 CHECK 추가하기
     -- 1000, 2000, 3000, 4000 만 입력 가능하도록 만들기!
     
     
     
     
     
     -- DEFAULT
     
     CREATE TABLE cons_08(
     data1 NUMBER DEFAULT 10,
     data2 DATE,
     data3 VARCHAR2(10));
     
     -- 제약사항 자료사전에 DEFAULT 설정은 나오지 않음
     SELECT * FROM user_constraints
     WHERE table_name = upper('cons_08');
     
     
     -- 테이블 컬럼 상세 정보 자료사전
     SELECT * FROM user_tab_columns
     WHERE table_name = upper('cons_08');
     
     
     ALTER TABLE cons_08
     MODIFY data2 DEFAULT sysdate;
    
     ALTER TABLE cons_08
     MODIFY data3 DEFAULT 'HI' NOT NULL;
    
    -- 명시적으로 null을 INSERT하면 DEFAULT가 동작하지 않음
    INSERT INTO cons_08
    VALUES ( null, null, 'AA' );
    SELECT * FROM cons_08;
    
    
    INSERT INTO cons_08 (data1)
    VALUES ( 6666);
    
    -- DEFAULT 주의사항
    INSERT INTO cons_08; --안됨
    INSERT INTO cons_08 VALUES (); -- 안됨, 데이터 있어야함
    -- 모든 컬럼의 DEFAULT를 한번에 동작되게 하는 방법은 없다
    
    -- PRIMARY KEY
    CREATE TABLE CONS_09 (
        no NUMBER CONSTRAINT cons_09_pk PRIMARY KEY,
        data VARCHAR2(20) NOT NULL );
    --------------------------------------------------
    CREATE TABLE cons_10(
        no NUMBER PRIMARY KEY,
        data VARCHAR2(20) NOT NULL );    
    --------------------------------------------------
    CREATE TABLE cons_11(
        no NUMBER, 
        data VARCHAR2(20) NOT NULL,
        CONSTRAINT cons_11_pk PRIMARY KEY (no ));
    
    --------------------------------------------------
    CREATE TABLE cons_12(
        no NUMBER,
        data VARCHAR2(20) NOT NULL );    
        
    ALTER TABLE cons_12
    ADD CONSTRAINT cons_12_pk PRIMARY KEY (no);
    
    
    CREATE TABLE cons_13 (
        trade_date DATE,
        trade_no NUMBER
        CONSTRAINT cons_13_pk
        PRIMARY KEY (trade_date, trade_no));
        
        
    ALTER TABLE cons_13
    ADD CONSTRAINT cons_13_pk 
        PRIMARY KEY ( trade_date, trade_no );
        
        
    
    -- FOREIGN KEY
    
    -- PRIMARY KEY 확인
    SELECT * FROM user_constraints
    WHERE table_name = upper('cons_12');
    
    
    -- PRIMARY KEY  적용된 컬럼 확인
    SELECT * FROM user_cons_columns
    WHERE table_name = upper('cons_12');
    
    CREATE TABLE cons_14(
        num NUMBER,
        data VARCHAR2 (50),
        CONSTRAINT cons_14_fk
            FOREIGN KEY ( num ) -- 자기 테이블의 FK
            REFERENCES cons_12 ( no) ); -- 참조 테이블의 PK
            
    CREATE TABLE cons_15(
         num NUMBER,
        data VARCHAR2 (50));
        
        
    ALTER TABLE cons_15
    ADD CONSTRAINT cons_15_fk
            FOREIGN KEY ( num ) -- 자기 테이블의 FK
            REFERENCES cons_12 ( no); -- 참조 테이블의 PK
--            ON DELETE CASCADE;  -> PK 가 삭제되며 자동으로 같이 삭제됨
--            ON DELETE SET NULL; -> PK 가 삭제되면 자동으로 NULL로 변경됨            

 SELECT * FROM emp;
 SELECT * FROM dept;
 DELETE dept;
 UPDATE emp
 SET deptno = null;
 DELETE emp;
 ROLLBACK;
 
 
 create TABLE emp_test
 AS SELECT rownum no, E.* From emp E;
 
