-- 직접 만들어서 JOIN 연산을 해보자

-- 무엇을 만들지 생각?! 서비스, 기능...
-- ======================== 모델링 =============================
-- 사원 vs 부서 <---> 업무로 파악 : ex> ERP 시스템 (사내 자원을 관리 시스템)
-- 엔터티 : 현실세계의 객체(사람, 물건,..) ==> 컴퓨터 세계 ===> TABLE
-- 애트리뷰트(=속성) : 이름, 사번, 급여 ...              ===> COLUMN
-- 사원은 부서에 포함된다 (관계)     vs    글      : (게시판에) 포함된다     vs   고객      : 구매한다\
                                       작성자   
-- 부서는 사원을 포함한다 (관계)     vs    게시판   :          포함한다     vs   상품      : 구매되어진다
-- 현실의 업무를 컴퓨터 상으로 옮기는 과정 <--> 모델링! [모델러, DBA]
--        시스템을 구동하는 프로그램을 제작, UI 작성 : 개발자

-- 글 엔터티 <--> POST 테이블을 작성
-- 한줄 게시판 : ex> 출석 게시판, 낙서 게시판....
CREATE TABLE POST (
    post_id NUMBER PRIMARY KEY,
    post_title VARCHAR2(30) NOT NULL,
    post_writer NUMBER NOT NULL,
    post_date DATE DEFAULT SYSDATE
);

-- 작성자 게시판 : 어느글을 누가 썼는지 상세한 정보를 담는..이름/이메일/전화번호
CREATE TABLE WRITER (
    writer_id NUMBER PRIMARY KEY,
    writer_name VARCHAR2(30) NOT NULL,
    writer_date DATE DEFAULT SYSDATE,
    writer_email VARCHAR2(50)
)
-- 외래키 제약조건(FK)
ALTER TABLE POST
ADD CONSTRAINT post_writer_fk FOREIGN KEY (post_writer) REFERENCES WRITER (writer_id);

-- 아무 작성자를 입력 가능  +  FK 제약조건 : writer에 없는 사용자가 post를 등록하지 못하게
-- 1. writer 정보를 입력
INSERT INTO WRITER
VALUES (1, '홍길동', SYSDATE, 'gildong@naver.com');
INSERT INTO WRITER
VALUES (2, '김길동', SYSDATE, 'gildong222222@naver.com');
INSERT INTO WRITER
VALUES (3, '박길동', SYSDATE, 'gildong333333@naver.com');

SELECT *
FROM    post;

-- 2. post 정보를 입력
INSERT INTO POST
VALUES (0001, '오라클 DBMS에 학습하기', 1, SYSDATE);
INSERT INTO POST
VALUES (0002, '혼자공부하는 JAVA 심화', 1, SYSDATE);
INSERT INTO POST
VALUES (0003, '1인 개발자의 공부법', 2, SYSDATE);

-- JOIN 조회
-- 오라클 조인
SELECT  p.post_id, p.post_title, p.post_date write_date,
        w.writer_name, w.writer_email
FROM    post p, writer w
WHERE   p.post_writer = w.writer_id;








