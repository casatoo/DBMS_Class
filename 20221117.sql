# Products 테이블에서 ProductId와 SupplieId와 CategoryId를 더한 새로운 값으로 새로운 컬럼을 만들고 이름을 NewId로 정하기
select * from Products;
select * ,(ProductID + SupplierID + CategoryID) AS NewId from Products;

# Products 테이블에서 Price가 20 이상이고 50 이하인 행만 조회
select * from Products where Price >= 20 and Price <=50;

# Products 테이블에서 Price가 20 미만이거나 50 초과인 행만 조회
select * from Products where Price <= 20 and Price >=50;

# Customers에서 country가 Brazil, Spain, France 고객 조회
select * from Customers where Country in ('Brazil','Spain','France');

# Customers 테이블에서 CustomerName이 Co로 끝나는 행만 조회
select * from Customers;
select * from Customers where CustomerName like '%Co';
select * from Customers where CustomerName like 'Co%';

# Customers 테이블에서 Country가 A로 시작하는 결과만 조회
select * from Customers where Country like 'A%';

# Products 테이블에서 ProductName이 C로 시작하고 e로 끝나는 행만 조회
select * from Products where ProductName Like 'C%''%e';

# Employees 테이블에서 FirstName이 A로 시작하지 않는 행만 조회
select * from Employees where FirstName not like 'A%';

# 상품중 가장 비싼 상품의 상품번호와 상품명
select * from Products;
select ProductID,ProductName from Products where Price = (select max(Price) from  Products);

# 전체 상품의 평균 가격을 소수점 2자리까지 반올림해서 보여주세요.
SELECT ROUND(AVG(Price), 2) AS avgPrice from Products;

# CONCAT -> 문자열 붙이기
SELECT CONCAT("hi ", "my name is ", "cha!") AS greeting;

# REPLACE -> 문자열 치환
SELECT REPLACE("SQL Tutorial", "SQL", "HTML");

# SUBSTRING -> 문자열 자르기
SELECT SUBSTRING("SQL Tutorial", 5, 8) AS ExtractString;
SELECT SUBSTRING("CHA TAEJIN", 5, 6) AS ExtractString;
SELECT SUBSTRING_INDEX("www.w3schools.com", ".", 3);

# 날짜 계산
SELECT ADDDATE("2017-06-15", INTERVAL 2 YEAR);

# 날짜 차이
SELECT DATEDIFF("2017-06-25", "2017-06-15");

# 현재 날짜 
SELECT NOW()

# 현재로부터 100일 전까지의 주문 목록
select * from Orders;
SELECT * from Orders where OrderDate between  ADDDATE("1998-05-06", INTERVAL -100 DAY) and DATE("1998-05-06");

# 현재로 부터 6개월 뒤는 정확히 몇년 몇월 몇일입니까?
SELECT ADDDATE(NOW(), INTERVAL 6 MONTH);
