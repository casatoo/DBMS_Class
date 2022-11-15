# board DB 선택
USE board;
# article 테이블 생성
DROP TABLE IF EXISTS article;
CREATE TABLE article (
id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(100) NOT NULL,
`body` TEXT(500) NOT NULL
);
# 문자셋
ALTER TABLE article
	COLLATE='utf8mb4_general_ci',
	CONVERT TO CHARSET utf8mb4;
# 게시물 조회
SELECT * FROM article;
# article 테이블 데이터 삭제
DELETE FROM article;
# 제목3, 내용3 데이터 두개 추가
INSERT INTO article (title,`body`) VALUES
('제목3','내용3'),
('제목3','내용3');
# 제목3인 게시물 중 두번째 것만 제목을 새제목3으로 수정 (게시물 구분 안됨)

# 테이블 구조 확인
DESC article;
# 테이블 구조 수정 - 칼럼 추가(ADD), 기존 칼럼 삭제(DROP), 기존 칼럼 내용 변경(MODIFY)
# 식별용 데이터를 저장할 id 컬럼 추가
ALTER TABLE article ADD id INT(12);
# 데이터 조회(새로 생긴 id 칼럼의 값은 NULL)
SELECT * FROM article;
# 기존 데이터 중 1개만 id를 2로 변경
UPDATE article
SET id = 2
LIMIT 1;
# 데이터 조회
SELECT * FROM article;
# 2번 게시물만 조회
SELECT * FROM article WHERE id = 2;
# 2번 게시물이 아닌 게시물 조회 (안나옴.. 값이 null인 것은 필터 대상이 안됨)
SELECT * FROM article WHERE id != 2;
# NULL인 데이터를 필터 검색
SELECT * FROM article WHERE id IS NOT NULL; # 널이 아닌것
SELECT * FROM article WHERE id IS NULL; # 널인것
# id가 null인 행 찾아서 id값을 1로 수정.
UPDATE article
SET id = 1
WHERE id IS NULL;
# 데이터 조회
SELECT * FROM article;
# id가 2, 제목은 제목4, 내용은 내용4인  게시물데이터 추가 (id 2인 값이 존재하지만 중복등록 됨.)
INSERT INTO article
SET id = 2,
title = '제목4',
`body` = '제목4';
# 데이터 조회
SELECT * FROM article;
# id 컬럼에 unique, not null 제약 걸기(이미 중복되는 데이터가 있기 때문에 제약이 걸리지 않음)
# 2번 게시물, 데이터 삭제 => DELETE
DELETE FROM article WHERE id =2;

# 다시 id 컬럼에 unique, not null 제약 걸기
ALTER TABLE article 
MODIFY id 
INT(12) UNIQUE NOT NULL;
# 구조 확인
DESC article;
# id 없이 게시물 하나 추가. 제목1, 내용1 (id가 not null이라 0으로 바뀌어서 들어감)
INSERT INTO article
SET title = '제목1',
`body` = '내용1';
# id 없이 게시물 하나 추가. 제목2, 내용2 (0이 이미 존재하므로 등록이 안됨)

# id 컬럼에 자동증가제약 추가
ALTER TABLE article 
MODIFY id 
INT(12) UNIQUE NOT NULL AUTO_INCREMENT;
# 구조 확인
DESC article;
# id 없이 게시물 하나 추가. 제목1, 내용1
INSERT INTO article
SET title = '제목1',
`body` = '내용1';
# id 없이 게시물 하나 추가. 제목2, 내용2
INSERT INTO article
SET title = '제목2',
`body` = '내용2';
# 데이터 확인
SELECT * FROM article;

# 상품 테이블에서 가격으로 오름차순
# select * from Products order by Price;
# 상품 테이블에서 가격으로 오름차순으로 하되, 만일 똑같은 가격이 있으면 번호순으로 내림차순해라.
# select * from Products order by Price asc, ProductID desc;
# OrderDetail(주문상세)테이블에서 주문번호(orderid) 순으로 오름차순, 주문번호가 똑같으면 주문수량(quantity)으로 내림차순
# select * from OrderDetails order by OrderID asc, Quantity desc;


