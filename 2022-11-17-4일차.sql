-- 2장. 데이터 조회 구문
/*
DML : SELECT, INSERT, UPDATE, DELETE
DDL : CREATE, ALTER, DROP
DCL : GRANT, REVOKE, TRUNCATE
*/

-- 2.1 SELECT 구문 (기본 : 원하는 테이블의 특정 컬럼을 조회할때)
SELECT 컬럼1, 컬럼2
FROM    테이블명;

SELECT employee_id, first_name, department_id
FROM    employees;

SELECT *
FROM    employees;

-- 2.2 SELECT 구문 + 조건절(=필터링) : 특정 조건에 맞는 데이터만 조회
SELECT employee_id, first_name, department_id --SELECT 절
FROM    employees               -- FROM 절
WHERE   department_id = 100;    -- WHERE (조건)절

-- 자동서식 적용 : 원하는 쿼리를 블럭 씌운 후 CTRL+F7(=자동 서식이 적용)
-- TAB 자주 사용!


-- 2.3.3 비교 연산자
-- 숫자 비교
-- 문자 비교 (p.7)

[예제2-11] 성이 King인 사원의 정보를 조회하시오
-- 사원의 정보 : 사번, 이름, 성, 전화번호, 이메일, 매니저, 부서, 보너스,...
--        last_name 이 King 인지 비교!! (=같다, 크다, 작다..)
SELECT  employee_id 사번, last_name 성, department_id 부서
FROM    employees
WHERE   last_name = 'King'; -- 대문자로 시작하는 king
--WHERE   last_name = 'king'; -- 대문자로 시작하는 king

-- 문자열 패턴 : 특정 조건의 문자를 찾는 과정
-- ex> 전화번호, 이메일 ==> 010-1234-5678  vs  emailID@domain.com
-- ※ SQL은 대,소문자를 구분하지 않으나, 문자 데이터는 구분함!!
--          (명령어)                   (문자값)


[예제2-12] 입사일이 2004년 1월 1일 이전인 사원의 정보(=사번, 이름, 입사일, 부서번호, 전화번호)를 조회하시오
-- 2004년 1월 1일 이전, 처음부터 ~ 2003년 12월 31일 까지
-- 범위 비교 : 이상, 이하
SELECT *
FROM    employees
WHERE   hire_date < '01-JAN-04'; -- 년/월/일  vs  일-월-년

-- ' ' : 작은 따옴표는 1) 문자 데이터 와 2) 시간/날짜 데이터를 표기할때 사용
-- " " : 큰 따옴표는 ??? 컬럼의 별칭(=Alias)을 지정할 때, 공백이 있는 단어를 조합할때 ex>annual + salary = "annual salary"

/* 교재대로 실행했는데, 왜 오류가 나는지??
ORA-01858: 숫자가 있어야 하는 위치에서 숫자가 아닌 문자가 발견되었습니다.
01858. 00000 -  "a non-numeric character was found where a numeric was expected"
*Cause:    The input data to be converted using a date format model was
           incorrect.  The input data did not contain a number where a number was
           required by the format model.
*Action:   Fix the input data or the date format model to make sure the
           elements match in number and type.  Then retry the operation.
*/
-- 오늘 날짜 출력하기
SELECT SYSDATE
FROM dual;

-- 1) JAN 대신 01, 년/월/일 순서
SELECT  employee_id 사번, last_name 성, department_id 부서, hire_date 입사일
FROM    employees
WHERE   hire_date < '04/01/01'; --14rows


