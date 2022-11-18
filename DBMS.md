# DBMS 수업
## 참고 사이트
- [수업페이지](to2.kr/d8c)
- [W3Schools](https://www.w3schools.com/)
---

## 2022.11.10
- 데이터베이스 개요
- mariaDB 설치
    - root / 1234

- SQLyog 설치
- 데이터베이스 생성, 삭제, 선택

- article 테이블을 생성 했는데 insert 문이 오류가 발생
    - 에러 메세지를 보니 아스키코드같은 오류가 보여서 문자 타입을 변경
    ```sql 
    ALTER TABLE article
	COLLATE='utf8mb4_general_ci',
	CONVERT TO CHARSET utf8mb4;
    ```
- xampp mysql 설정
    - my.ini 실행
    - 다음 다섯줄 주석 해제
    ```ini
    nit-connect=\'SET NAMES utf8\'
    collation_server=utf8_unicode_ci
    character_set_server=utf8
    skip-character-set-client-handshake
    character_sets-dir="C:/xampp/mysql/share/charsets"
    ```
    - [client] [mysqldump] [mysql] 안에 한줄씩 추가
    ```ini
    default-character-set = utf8
    ```

## 2022.11.15
- RDBMS
- 스키마 ( 구조 )
- 행과 열의 용어
    - 행: ROW, tuple, record
    - 열: column, attribute, field

- DDL , DML, DCL
- 기본키, 후보키
- null 검색하기
    - IS NULL, IS NOT NULL
- alter
- not null 과 unique 를 같이 적용하면 primary key 가 된다. 

- 나중에 수정하려면 이상현상이 생길 수 있다. 데이터 모델링이 필요

- 2중 order by
    - order by 조건 1, 조건2  로 검색
    - order by 는 한번만 사용하고 (,) 로 구분한다.

## 2022.11.17
- 연산자
- between 사잇값 검색
- in 포함하는것 검색
```sql
select * from Products where Price between 20 and 50;
select * from Customers where Country in ('Brazil','Spain','France');
```

- 문자열 포함 검색
- LIKE
```sql
SELECT * FROM Customers WHERE CustomerName LIKE '%Store%';
SELECT * FROM Customers WHERE CustomerName NOT LIKE '%Store%';
```

- 숫자 함수
```sql
select ProductID,ProductName from Products where Price = (select max(Price) from  Products);
SELECT ROUND(AVG(Price), 2) AS avgPrice from Products;
```

- 날짜 함수
```sql
SELECT ADDDATE("2017-06-15", INTERVAL 2 YEAR);
SELECT DATEDIFF("2017-06-25", "2017-06-15");
SELECT * from Orders where OrderDate between  ADDDATE("1998-05-06", INTERVAL -100 DAY) and DATE("1998-05-06");
SELECT ADDDATE(NOW(), INTERVAL 6 MONTH);
```

## 2022.11.18
- select 문 작서 순서
    1. select 컬럼명 
    2. from 테이블명 
    3. where 조건식 
    4. group by 컬럼명 
    5. having 조건식 
    6. order by 컬럼명 desc
- select 문 동작 순서
    1. from (조회할 테이블)
    2. on (조인 조건)
    3. join (조인 테이블)
    4. where (검색조건)
    5. group by (그룹화)
    6. cube | rollup ()
    7. having (조건2)
    8. select (검색된 테이블 컬럼)
    9. distinct (중복허용)
    10. order by (정렬기준)
    11. top ()
- 조건식
```sql
select * , if(Price > 50,'비쌈', '저렴') from Products;

select *, case 
when Price >= 50 then '비쌈'
when Price >= 20 then '적정'
else '저렴' end AS '비싼가?'
from Products;
```
- 50보다 비싸면 비쌈 아니면 저렴으로 표시 
- 조건이 3개 이상인 경우? case when 으로 조건나열 순차적으로 대입하기때문에 중복되는 조건은 다시 작성할 필요가 없다. 

- 중복제거
    - distinct
```sql
select distinct Country from Customers;
select distinct CategoryID from Products order by CategoryID asc;
```
- group by having
    - 그룹화 한 테이블에서의 조건은 where가 아닌 having 을 사용한다.
    