DROP DATABASE mall;

CREATE DATABASE mall;

USE mall;

CREATE TABLE t_shopping(
id INT(5) PRIMARY KEY AUTO_INCREMENT,
userId CHAR(30) NOT NULL,
userPw CHAR(30) NOT NULL,
userName CHAR(30) NOT NULL,
address CHAR(50) NOT NULL,
pname CHAR(50) NOT NULL,
price INT(5) NOT NULL
);

   ALTER TABLE t_shopping
	COLLATE='utf8mb4_general_ci',
	CONVERT TO CHARSET utf8mb4;

INSERT INTO t_shopping 
SET userId = 'user1',
userPw = 'pass1',
userName = '손흥민',
address = '런던',
pname = '운동화',
price = 1000000;

INSERT INTO t_shopping 
SET userId = 'user2',
userPw = 'pass2',
userName = '설현',
address = '서울',
pname = '코트',
price = 100000;

INSERT INTO t_shopping 
SET userId = 'user3',
userPw = 'pass3',
userName = '원빈',
address = '대전',
pname = '반바지',
price = 30000;

INSERT INTO t_shopping 
SET userId = 'user4',
userPw = 'pass4',
userName = '송혜교',
address = '대구',
pname = '스커트',
price = 15000;

INSERT INTO t_shopping 
SET userId = 'user5',
userPw = 'pass5',
userName = '소지섭',
address = '부산',
pname = '코트',
price = 100000;

INSERT INTO t_shopping 
SET userId = 'user6',
userPw = 'pass6',
userName = '김지원',
address = '울산',
pname = '티셔츠',
price = 9000;

INSERT INTO t_shopping 
SET userId = 'user6',
userPw = 'pass6',
userName = '김지원',
address = '울산',
pname = '운동화',
price = 200000;

INSERT INTO t_shopping 
SET userId = 'user1',
userPw = 'pass1',
userName = '손흥민',
address = '런던',
pname = '코트',
price = 100000;

INSERT INTO t_shopping 
SET userId = 'user4',
userPw = 'pass4',
userName = '송혜교',
address = '울산',
pname = '스커트',
price = 15000;

INSERT INTO t_shopping 
SET userId = 'user1',
userPw = 'pass1',
userName = '손흥민',
address = '런던',
pname = '운동화',
price = 1000000;

INSERT INTO t_shopping 
SET userId = 'user5',
userPw = 'pass5',
userName = '소지섭',
address = '부산',
pname = '모자',
price = 30000;


# 1. 손흥민의 주문 개수는? ???
SELECT * FROM t_shopping; 
SELECT COUNT(*) FROM t_shopping WHERE userName = '손흥민';

# 2. 손흥민이 산 상품은? ???
SELECT pname FROM t_shopping WHERE userName = '손흥민';


# 3. 스커트를 산 사람은? ???
SELECT DISTINCT userName FROM t_shopping WHERE pname = '스커트';


# 4. 가장 많이 주문한 사람의 아이디와 이름, 주문개수는? ???
SELECT userId, userName, COUNT(*) AS '주문개수'  FROM t_shopping GROUP BY userId ORDER BY 주문개수 DESC LIMIT 1;

# 5. 소지섭이 사용한 총 금액은? ???

SELECT userName, SUM(price)AS'총금액' FROM t_shopping GROUP BY userId HAVING userName = '소지섭';


DROP DATABASE mall;

CREATE DATABASE mall;

USE mall;

CREATE TABLE t_order(
id INT(5) PRIMARY KEY AUTO_INCREMENT,
userNo INT(5) NOT NULL,
productNo INT(5) NOT NULL
);
   ALTER TABLE t_order
	COLLATE='utf8mb4_general_ci',
	CONVERT TO CHARSET utf8mb4;

CREATE TABLE t_user(
id INT(5) PRIMARY KEY AUTO_INCREMENT,
userId CHAR(200) NOT NULL,
userPw CHAR(200) NOT NULL,
userName CHAR(50) NOT NULL,
addr CHAR(200) NOT NULL
);
   ALTER TABLE t_user
	COLLATE='utf8mb4_general_ci',
	CONVERT TO CHARSET utf8mb4;

CREATE TABLE t_product(
id INT(5) PRIMARY KEY AUTO_INCREMENT,
pname CHAR(100) NOT NULL,
price INT(10) NOT NULL
);
   ALTER TABLE t_product
	COLLATE='utf8mb4_general_ci',
	CONVERT TO CHARSET utf8mb4;


INSERT INTO t_product
SET pname = '운동화',
price = 1000000;

INSERT INTO t_product
SET pname = '코트',
price = 100000;

INSERT INTO t_product
SET pname = '반바지',
price = 30000;

INSERT INTO t_product
SET pname = '스커트',
price = 15000;

INSERT INTO t_product
SET pname = '코트',
price = 100000;

INSERT INTO t_product
SET pname = '티셔츠',
price = 9000;

INSERT INTO t_product
SET pname = '운동화',
price = 200000;

INSERT INTO t_product
SET pname = '모자',
price = 30000;



INSERT INTO t_user
SET userId = 'user1',
userPw = 'pass1',
userName = '손흥민',
addr = '런던';

INSERT INTO t_user
SET userId = 'user2',
userPw = 'pass2',
userName = '설현',
addr = '서울';

INSERT INTO t_user
SET userId = 'user3',
userPw = 'pass3',
userName = '원빈',
addr = '대전';

INSERT INTO t_user
SET userId = 'user4',
userPw = 'pass4',
userName = '송혜교',
addr = '대구';

INSERT INTO t_user
SET userId = 'user5',
userPw = 'pass5',
userName = '소지섭',
addr = '부산';

INSERT INTO t_user
SET userId = 'user6',
userPw = 'pass6',
userName = '김지원',
addr = '울산';


INSERT INTO t_order
SET userNo = 1,
productNo = 1;

INSERT INTO t_order
SET userNo = 2,
productNo = 2;

INSERT INTO t_order
SET userNo = 3,
productNo = 3;

INSERT INTO t_order
SET userNo = 4,
productNo = 4;

INSERT INTO t_order
SET userNo = 5,
productNo = 5;

INSERT INTO t_order
SET userNo = 6,
productNo = 6;

INSERT INTO t_order
SET userNo = 6,
productNo = 7;

INSERT INTO t_order
SET userNo = 1,
productNo = 5;

INSERT INTO t_order
SET userNo = 4,
productNo = 4;

INSERT INTO t_order
SET userNo = 1,
productNo = 1;

INSERT INTO t_order
SET userNo = 5,
productNo = 8;



SELECT * FROM t_order;
SELECT * FROM t_user;
SELECT * FROM t_product;

# 1. 손흥민의 주문 개수는? ???
SELECT COUNT(*) 
AS '손흥민의 주문 개수' 
FROM t_user U 
JOIN t_order O 
ON U.id = O.userNo 
WHERE U.userName = '손흥민';

# 2. 손흥민이 산 상품은? ???
SELECT P.pname AS '손흥민이 산 상품'
FROM t_product P 
INNER JOIN 
(SELECT O.* 
FROM t_user U 
INNER JOIN t_order O 
ON U.id = O.userNo 
WHERE U.userName = '손흥민') A 
ON P.id = A.productNo;

# 3. 스커트를 산 사람은? ???
SELECT DISTINCT U.userName 
FROM t_user U 
INNER JOIN 
(
SELECT O.* 
FROM t_order O 
JOIN  t_product P 
ON O.productNo = P.id 
WHERE pname = '스커트') A 
ON A.userNo = U.id;

# 4. 가장 많이 주문한 사람의 아이디와 이름, 주문개수는? ???
SELECT U.userId , U.userName, A.주문개수 
FROM t_user U 
INNER JOIN (
SELECT userNo ,COUNT(*) '주문개수' 
FROM t_order 
GROUP BY userNo) A 
ON A.userNo = U.id 
ORDER BY '주문개수' ASC 
LIMIT 1;


# 5. 소지섭이 사용한 총 금액은? ???
SELECT SUM(P.price) '총금액'
FROM t_product P 
INNER JOIN 
(SELECT O.* 
FROM t_user U 
INNER JOIN t_order O 
ON U.id = O.userNo 
WHERE U.userName = '소지섭') A 
ON P.id = A.productNo;