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
    

## 2022.11.22
- 모델링



- 지금있는 테이블
    - member
    - educationCourse id
    - article
        - 수정해야되는거
            - member랑 조인하거나 불러올때 쓰던거 컬럼 수정
            - 삭제시 status 값만 바꿔서 나중에 복원시킬 수 있도록 하는것.
            - 불러올때 status 값 고려해서 가져오도록 하는것.
    - board
    - reaction
    - comment
        - q&A 는 답변을 관리자 또는 교관만 작성할 수 있도록
    - attr
    - 교육과정에 member가 포함되어야 함. 테이블 하나더 생성
        - id,regdate,updatedate ,educationCourse id , member Id ,
    - 기상정보를 담을 수 있는 테이블 ( weather)
        - id
        - 날짜
        - 일출, 일몰
        - 강수량
        - 풍속
    - drone
        - id
        - 이름
        - 종
        - 등록번호
        - 신고일
        - 제작일
        - 소유자
        - 안전성검사날짜
        - 안전성검사만료일
        - 보험가입일
        - 보험종료일
    - 비행기록
        - id
        - memberId
        - 
        
- 아이디어
    - 이 음식 대전에서 이정도면 비싸다! 싸다!
    - 외식문화 발전과 함께 다양한 메뉴와 가격이 형성된 시장에서
    - 내가 먹는 이 음식 또는 먹으려는 음식이 다른 음식점의 가격
    - 평균가보다 얼마나 비싼지 또는 싼지 알려주는 앱
    - 같은 메뉴라면 추천 음식점도 알려주고
    - 