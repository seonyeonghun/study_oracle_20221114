-- p.9 논리 조건 연산자
-- 1. 현재 NLS 세팅 확인
SELECT *
FROM v$nls_parameters;

-- &&, ||, ! : 프로그래밍 언어마다 조금씩 다름
-- AND, OR를 혼합하여 문장을 작성
[예제 2-16] 30번 부서의 급여가 10000 미만인 사원과 60번 부서의 급여가 5000 이상인 사원 정보를 조회하시오

SELECT  employee_id, last_name, salary, department_id
FROM    employees
WHERE   (department_id = 30 AND  salary < 10000)
OR      (department_id = 60 AND  salary >= 5000); -- 7rows


-- 60번 부서의 정보를 조회
SELECT *
FROM    departments
WHERE   department_id = 60;

-- AND, OR를 혼합하여 문장을 작성할때 가독성을 위해 ()를 붙여 주는것이 좋다.


2.3.5 BETWEEN (범위 조건 연산자)
-- BETWEEN 초기값 AND 마지막값 : 초기값 이상, 마지막값 이하 (=값이 포함됨)
-- WHERE 조건 >= 값 OR 조건 <= 값;

[예제2-18] 사번이 110 부터 120번까지의 사원 정보를 조회하시오
--사번이 110, 111, 112, ... 120에 해당하는 사원들의 정보를 조회한다.
SELECT  employee_id, first_name, department_id, phone_number
FROM    employees
WHERE   employee_id >= 110
AND      employee_id <= 120;  -- 논리 (조건) 연산자 사용

SELECT  employee_id, first_name, department_id, phone_number
FROM    employees
WHERE   employee_id BETWEEN 110 AND 120; -- BETWEEN 범위 조건 연산자 사용

SELECT *
FROM    employees;


[예제 2-19] 사번이 110에서 120인 사원중 급여가 5000 에서 10000 사이의 사원 정보를 조회하시오
SELECT  employee_id, first_name, salary, department_id, job_id
FROM    employees
WHERE   employee_id >= 110 AND employee_id <=120
AND     salary >= 5000  AND salary <= 10000;

[예제2-20]
SELECT  employee_id, first_name, salary, department_id, job_id
FROM    employees
WHERE   employee_id BETWEEN 110 AND 120   -- employee_id >= 110 AND employee_id <=120
AND     salary BETWEEN 5000 AND 10000;    -- salary >= 5000  AND salary <= 10000;

-------------
SELECT *
FROM employees; -- 전체 사원 107명, 사번이 100번 부터 1씩 증가해서 206번까지 존재 / 부서는 10~270번까지 27개 존재
-------------

[예제2-21] 사번이 110번 미만, 120번 초과인 사원들의 정보를 조회하시오
SELECT  employee_id, first_name, salary, department_id, job_id
FROM employees
WHERE   employee_id < 110
OR      employee_id > 120;

-- BETWEEN 초기값 AND 마지막값 : 해당 구간
-- WHERE 조건컬럼 NOT BETWEEN 초기값 AND 마지막값 : 해당 구간이 아닌 구간(1)
-- WHERE NOT 조건컬럼 BETWEEN 초기값 AND 마지막값 : 해당 구간이 아닌 구간(2)
SELECT  employee_id, first_name, salary, department_id, job_id
FROM    employees
--WHERE   employee_id NOT BETWEEN 110 AND 120;
WHERE   NOT employee_id BETWEEN 110 AND 120;















