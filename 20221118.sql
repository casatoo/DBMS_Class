# 50보다 크면 비쌈 아니면 저렴
select * , if(Price > 50,'비쌈', '저렴') from Products;

# 조건이 3개 이상인 경우?
select *, case 
when Price >= 50 then '비쌈'
when Price >= 20 then '적정'
else '저렴' end AS '비싼가?'
from Products;

# 고객의 고객번호가 짝수이면 짝수 고객, 홀수이면 홀수 고객 구분
select * ,if( ProductID % 2 = 0 , '짝수','홀수')AS '홀짝' from Products;

select distinct Country from Customers;
select distinct CategoryID from Products order by CategoryID asc;

# Customers 테이블에서 국가별 고객 수 현황 
select Country AS '국가' ,count(*)AS '고객수' from Customers group by Country;
# OrderDetails 테이블에서 상품별 주문 수량  // 나와야 하는거 상품id 수량
select ProductID AS '상품번호', count(*) AS '주문수량' from OrderDetails group by ProductID order by ProductID asc;
# Order 테이블에서 연도별 주문 건수 // 나와야 하는것 연도, 건수
select DATE_FORMAT(OrderDate, "%Y") AS '년도', count(*)AS '주문건수' from Orders group by DATE_FORMAT(OrderDate, "%Y") having count(*) < 200;

DROP DATABASE IF EXISTS scott;

CREATE DATABASE scott;

USE scott;

CREATE TABLE DEPT ( # 부서
    DEPTNO DECIMAL(2), # 부서번호
    DNAME VARCHAR(14), # 부서이름
    LOC VARCHAR(13),	# 부서위치
    CONSTRAINT PK_DEPT PRIMARY KEY (DEPTNO) 
);
CREATE TABLE EMP ( # 사원
    EMPNO DECIMAL(4), # 사원번호
    ENAME VARCHAR(10), # 사원이름
    JOB VARCHAR(9), # 직책
    MGR DECIMAL(4), # 상사번호
    HIREDATE DATE, # 입사일
    SAL DECIMAL(7,2), # 급여
    COMM DECIMAL(7,2), # 커미션
    DEPTNO DECIMAL(2), # 부서번호
    CONSTRAINT PK_EMP PRIMARY KEY (EMPNO),
    CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
);
CREATE TABLE SALGRADE (  
    GRADE TINYINT, # 급여 등급
    LOSAL SMALLINT, # 해당 등급의 최저라인
    HISAL SMALLINT  # 해당 등급의 최고라인
);
INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,STR_TO_DATE('17-12-1980','%d-%m-%Y'),800,NULL,20);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,STR_TO_DATE('20-2-1981','%d-%m-%Y'),1600,300,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,STR_TO_DATE('22-2-1981','%d-%m-%Y'),1250,500,30);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,STR_TO_DATE('2-4-1981','%d-%m-%Y'),2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,STR_TO_DATE('28-9-1981','%d-%m-%Y'),1250,1400,30);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,STR_TO_DATE('1-5-1981','%d-%m-%Y'),2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,STR_TO_DATE('9-6-1981','%d-%m-%Y'),2450,NULL,10);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,STR_TO_DATE('13-7-1987','%d-%m-%Y')-85,3000,NULL,20);
INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,STR_TO_DATE('17-11-1981','%d-%m-%Y'),5000,NULL,10);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,STR_TO_DATE('8-9-1981','%d-%m-%Y'),1500,0,30);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,STR_TO_DATE('13-7-1987', '%d-%m-%Y'),1100,NULL,20);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,STR_TO_DATE('3-12-1981','%d-%m-%Y'),950,NULL,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,STR_TO_DATE('3-12-1981','%d-%m-%Y'),3000,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,STR_TO_DATE('23-1-1982','%d-%m-%Y'),1300,NULL,10);
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

SELECT * FROM DEPT;
SELECT * FROM EMP;
SELECT * FROM SALGRADE;

#1. 사원 테이블의 모든 레코드를 조회하시오.
SELECT * FROM EMP;

#2. 사원명과 입사일을 조회하시오.
SELECT ENAME AS '사원명', HIREDATE AS '입사일' FROM EMP;

#3. 사원번호와 이름을 조회하시오.
SELECT EMPNO AS '사원번호' , ENAME AS '사원명' FROM EMP;

#4. 사원테이블에 있는 직책의 목록을 조회하시오. (hint : distinct, group by)
SELECT JOB AS'직책' FROM EMP GROUP BY JOB;

#5. 총 사원수를 구하시오. (hint : count)
SELECT COUNT(*) AS '총 사원수' FROM EMP;

#6. 부서번호가 10인 사원을 조회하시오.
SELECT * FROM EMP WHERE DEPTNO = 10;

#7. 월급여가 2500이상 되는 사원을 조회하시오.
SELECT * FROM EMP WHERE SAL >=2500;

#8. 이름이 'KING'인 사원을 조회하시오.
SELECT * FROM EMP WHERE ENAME LIKE 'KING';

#9. 사원들 중 이름이 S로 시작하는 사원의 사원번호와 이름을 조회하시오. (hint : like)
SELECT * FROM EMP WHERE ENAME LIKE 'S%';

#10. 사원 이름에 T가 포함된 사원의 사원번호와 이름을 조회하시오. (hint : like)
SELECT * FROM EMP WHERE ENAME LIKE '%T%';

#11. 커미션이 300, 500, 1400 인 사원의 사번,이름,커미션을 조회하시오. (hint : OR, in )
SELECT EMPNO '사번' , ENAME '이름', COMM '커미션' FROM EMP WHERE COMM = 300 OR COMM = 500 OR COMM = 1400;
SELECT EMPNO '사번' , ENAME '이름', COMM '커미션' FROM EMP WHERE COMM IN(300,500,1400);
#12. 월급여가 1200 에서 3500 사이의 사원의 사번,이름,월급여를 조회하시오. (hint : AND, between)
SELECT EMPNO '사번' , ENAME '이름',SAL '월급여' FROM EMP WHERE SAL BETWEEN 1200 AND 3500;

#13. 직급이 매니저이고 부서번호가 30번인 사원의 이름,사번,직급,부서번호를 조회하시오. 
SELECT ENAME '이름',EMPNO '사번' , JOB '직급' , DEPTNO '부서번호' FROM EMP WHERE JOB = 'MANAGER' AND DEPTNO = 30;

#14. 부서번호가 30인 아닌 사원의 사번,이름,부서번호를 조회하시오. (not)
SELECT EMPNO '사번' , ENAME '이름', DEPTNO '부서번호' FROM EMP WHERE DEPTNO != 30;

#15. 커미션이 300, 500, 1400 이 모두 아닌 사원의 사번,이름,커미션을 조회하시오. (hint : not in)
SELECT EMPNO '사번' , ENAME '이름', COMM '커미션' FROM EMP WHERE COMM NOT IN(300,500,1400) OR COMM IS NULL;

#16. 이름에 S가 포함되지 않는 사원의 사번,이름을 조회하시오. (hint : not like)
SELECT EMPNO '사번' , ENAME '이름' FROM EMP WHERE ENAME NOT LIKE '%S%';

#17. 급여가 1200보다 미만이거나 3700 초과하는 사원의 사번,이름,월급여를 조회하시오. (hint : not, between)
SELECT EMPNO '사번' , ENAME '이름',SAL '월급여' FROM EMP WHERE SAL NOT BETWEEN 1200 AND 3700;

#18. 직속상사가 NULL 인 사원의 이름과 직급을 조회하시오. (hint : is null, is not null)
SELECT ENAME '이름', JOB '직급' FROM EMP WHERE MGR IS NULL;

#19. 부서별 평균월급여를 구하는 쿼리 (hint : group by, avg())
SELECT DEPTNO '부서', AVG(SAL)'평균급여' FROM EMP GROUP BY DEPTNO;

#20. 부서별 전체 사원수와 커미션을 받는 사원들의 수를 구하는 쿼리 (hint : group by, count()) 
SELECT DEPTNO '부서' ,COUNT(*)'부서별 사원수' ,COUNT(IF(COMM = 0,NULL,COMM)) '커미션 받는 사원' FROM EMP GROUP BY DEPTNO ;
SELECT DEPTNO '부서' ,COUNT(*)'커미션 받는 사원' FROM EMP WHERE COMM IS NOT NULL AND COMM != 0 GROUP BY DEPTNO ;
SELECT IF(COMM = 0,NULL,COMM) FROM EMP ;

#21. 부서별 최대 급여와 최소 급여를 구하는 쿼리 (hint : group by, min(), max())
SELECT MAX(SAL)'최대급여',MIN(SAL)'최소급여' FROM EMP GROUP BY DEPTNO;

#22. 부서별로 급여 평균 (단, 부서별 급여 평균이 2000 이상만) (hint : group by, having)
SELECT DEPTNO '부서', AVG(SAL)'평균급여'FROM EMP GROUP BY DEPTNO HAVING AVG(SAL)>=2000;

#23. 월급여가 1000 이상인 사원만을 대상으로 부서별로 월급여 평균을 구하라. 단, 평균값이 2000 이상인 레코드만 구하라. (hint : group by, having)
SELECT DEPTNO '부서', AVG(SAL)'평균급여' FROM EMP WHERE SAL >= 1000 GROUP BY DEPTNO HAVING  AVG(SAL)>=2000;

