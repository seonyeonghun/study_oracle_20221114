-- NULL 처리 (p.15)
-- 값이 없는 상태, 미지의 값(=수학적 표현)
-- 그렇다고 0이라는 뜻은 아님.

-- 각 부서의 위치 정보를 가진 Locations 테이블을 사용하여 다음과 같이 데이터를 조회해보자

-- 1. locations 테이블의 구조
DESC locations;
/*
이름             널?       유형           
-------------- -------- ---------------------------- 
LOCATION_ID    NOT NULL NUMBER(4)    : 위치코드
STREET_ADDRESS          VARCHAR2(40) : (도로명) 주소
POSTAL_CODE             VARCHAR2(12) : 우편번호
CITY           NOT NULL VARCHAR2(30) : 도시이름
STATE_PROVINCE          VARCHAR2(25) : 주
COUNTRY_ID              CHAR(2)      : 국가코드
*/

-- 2. locations 데이터 조회
SELECT *
FROM    locations; -- postal_code, state_province에 NULL 존재

-- 3. employees 데이터 조회
SELECT *
FROM    employees; -- commission_pct, manager_id, department_id에 NULL 존재

[예제 2-37] locations 테이블에서 위치코드, 도로주소, 주를 조회하시오
SELECT location_id loc_id, street_address addr, state_province state
FROM    locations;

-- IS NULL  : 컬럼의 데이터가 NULL인 조건
-- IS NOT NULL : 컬럼의 데이터가 NULL 아닐때 조건

SELECT location_id loc_id, street_address addr, state_province state
FROM    locations
WHERE   state_province IS NULL; -- (o), 6 rows
--WHERE state_province = NULL; --(x)

SELECT location_id loc_id, street_address addr, state_province state
FROM    locations
WHERE   state_province IS NOT NULL; -- (o),  17 rows

-- 사원 테이블 employees 조회
-- 총 사원수 : 107 rows
-- 보너스가 없는 사람이 50명이나? 보너스 줄만한 중요 업무x, 부서가 힘이 없거나,..단순 업무...등등?
SELECT *
FROM    employees
WHERE   commission_pct IS NULL; -- 50 rows

-- 매니저가 필요없는 사람? 사장님
SELECT *
FROM    employees
WHERE   manager_id IS NULL; -- boss

-- 부서없이도 일하는 사람? 부서가 적거나, 회사에 필수적이지 않지만 꼭 필요한 사람.
SELECT *
FROM    employees
WHERE   department_id IS NULL; -- Kimberely Grant, 판매? 담당자


-- 2.4 데이터 정렬
-- ORDER BY 컬럼 [ASC | DESC] : 특정 컬럼을 오름차순(=Ascending) 또는 내림차순(=Descending)으로 정렬
-- 기본값은 ASC(작은수 --> 큰수 방향, 생략가능)
SELECT *
FROM    employees
WHERE   department_id IS NOT NULL
ORDER BY employee_id DESC; -- 사원코드를 ASC으로 정렬시킴

[예제2-40] 80번 부서의 사원정보중 이름을 기준으로 오름차순 정렬하시오
-- ASC : Ascending, 오름차순 (a~z)
-- DESC : Descending, 내림차순(z~a)
SELECT  employee_id emp_id, first_name fname, department_id dept_id
FROM    employees
WHERE   department_id = 80
--ORDER BY    first_name;
--ORDER BY    first_name ASC
--ORDER BY    first_name asc;
--ORDER BY    first_name desc;
ORDER BY    fname desc;

-- =================================================
-- ORDER BY 절에 Alias를 사용하여 정렬할 수 있다.
-- =================================================
[예제2-42] 60번 부서의 사원정보에 대해 년 급여(=연봉, annual salary)를 오름차순으로 정렬하시오
-- salary : 월급여  vs   annual salary : 연봉 (=실제 존재x) <--> salary * 12 "annual salary" (=Alias)
SELECT employee_id, first_name, job_id, hire_date, salary * 12 annual_salary, department_id
FROM    employees
WHERE   department_id = 60
ORDER BY annual_salary; -- 기본 ASC

-- =================================================
-- ORDER BY 절에 (결과)컬럼의 위치를 사용하여 정렬할 수 있다.
-- =================================================
SELECT employee_id, first_name, job_id, hire_date, salary * 12 annual_salary, department_id
FROM    employees
WHERE   department_id = 60
ORDER BY 5; -- 기본 ASC

[예제2-43] 사원테이블에서 부서는 오름차순, 월 급여는 내림차순으로 정렬 하시오
SELECT  employee_id, last_name, salary mon_sal, department_id dept_id
FROM    employees
--ORDER BY    department_id ASC, salary DESC; -- 컬럼이름
--ORDER BY    dept_id ASC, mon_sal DESC; -- 컬럼의 Alias
ORDER BY    4, 3 DESC; -- 컬럼의 번호

-- F10 : 여러 테이블을 이용해 JOIN 연산할때 시간소요, 복잡도 등을 오라클엔진이 어떻게 처리하는지 들여다보는 단축키






