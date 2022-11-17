-- 2��. ������ ��ȸ ����
/*
DML : SELECT, INSERT, UPDATE, DELETE
DDL : CREATE, ALTER, DROP
DCL : GRANT, REVOKE, TRUNCATE
*/

-- 2.1 SELECT ���� (�⺻ : ���ϴ� ���̺��� Ư�� �÷��� ��ȸ�Ҷ�)
SELECT �÷�1, �÷�2
FROM    ���̺��;

SELECT employee_id, first_name, department_id
FROM    employees;

SELECT *
FROM    employees;

-- 2.2 SELECT ���� + ������(=���͸�) : Ư�� ���ǿ� �´� �����͸� ��ȸ
SELECT employee_id, first_name, department_id --SELECT ��
FROM    employees               -- FROM ��
WHERE   department_id = 100;    -- WHERE (����)��

-- �ڵ����� ���� : ���ϴ� ������ �� ���� �� CTRL+F7(=�ڵ� ������ ����)
-- TAB ���� ���!


-- 2.3.3 �� ������
-- ���� ��
-- ���� �� (p.7)

[����2-11] ���� King�� ����� ������ ��ȸ�Ͻÿ�
-- ����� ���� : ���, �̸�, ��, ��ȭ��ȣ, �̸���, �Ŵ���, �μ�, ���ʽ�,...
--        last_name �� King ���� ��!! (=����, ũ��, �۴�..)
SELECT  employee_id ���, last_name ��, department_id �μ�
FROM    employees
WHERE   last_name = 'King'; -- �빮�ڷ� �����ϴ� king
--WHERE   last_name = 'king'; -- �빮�ڷ� �����ϴ� king

-- ���ڿ� ���� : Ư�� ������ ���ڸ� ã�� ����
-- ex> ��ȭ��ȣ, �̸��� ==> 010-1234-5678  vs  emailID@domain.com
-- �� SQL�� ��,�ҹ��ڸ� �������� ������, ���� �����ʹ� ������!!
--          (��ɾ�)                   (���ڰ�)


[����2-12] �Ի����� 2004�� 1�� 1�� ������ ����� ����(=���, �̸�, �Ի���, �μ���ȣ, ��ȭ��ȣ)�� ��ȸ�Ͻÿ�
-- 2004�� 1�� 1�� ����, ó������ ~ 2003�� 12�� 31�� ����
-- ���� �� : �̻�, ����
SELECT *
FROM    employees
WHERE   hire_date < '01-JAN-04'; -- ��/��/��  vs  ��-��-��

-- ' ' : ���� ����ǥ�� 1) ���� ������ �� 2) �ð�/��¥ �����͸� ǥ���Ҷ� ���
-- " " : ū ����ǥ�� ??? �÷��� ��Ī(=Alias)�� ������ ��, ������ �ִ� �ܾ �����Ҷ� ex>annual + salary = "annual salary"

/* ������ �����ߴµ�, �� ������ ������??
ORA-01858: ���ڰ� �־�� �ϴ� ��ġ���� ���ڰ� �ƴ� ���ڰ� �߰ߵǾ����ϴ�.
01858. 00000 -  "a non-numeric character was found where a numeric was expected"
*Cause:    The input data to be converted using a date format model was
           incorrect.  The input data did not contain a number where a number was
           required by the format model.
*Action:   Fix the input data or the date format model to make sure the
           elements match in number and type.  Then retry the operation.
*/
-- ���� ��¥ ����ϱ�
SELECT SYSDATE
FROM dual;

-- 1) JAN ��� 01, ��/��/�� ����
SELECT  employee_id ���, last_name ��, department_id �μ�, hire_date �Ի���
FROM    employees
WHERE   hire_date < '04/01/01'; --14rows


