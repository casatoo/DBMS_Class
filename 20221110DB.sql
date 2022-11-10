USE mysql;
SELECT * FROM `user`;

# 글 입력이 안되서 수정
ALTER TABLE article
	COLLATE='utf8mb4_general_ci',
	CONVERT TO CHARSET utf8mb4;
	
ALTER TABLE `member`
	COLLATE='utf8mb4_general_ci',
	CONVERT TO CHARSET utf8mb4;

# 전체 데이터베이스 리스팅
SHOW DATABASES;
# `mysql` 데이터 베이스 선택
USE mysql;
# 테이블 리스팅
SHOW TABLES;
# `db` 테이블의 구조 확인
DESC db; 
# 기존에 `board` 데이터베이스가 존재 한다면 삭제
DROP DATABASE  IF EXISTS `board`;
# 새 데이터베이스(`board`) 생성
CREATE DATABASE `board`;
# 데이터베이스 추가 되었는지 확인
SHOW DATABASES;
# `board` 데이터 베이스 선택
USE `board`;
SELECT DATABASE();
# 테이블 확인
SHOW TABLES;

# 게시물 테이블(`article`)을 만듭니다.
DROP TABLE IF EXISTS article;
CREATE TABLE article (
id INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
regDate DATETIME NOT NULL,
title VARCHAR(100) NOT NULL,
`body` TEXT(500) NOT NULL
);
# 잘 추가되었는지 확인
DESC article;
# 제목은 '제목1', 내용은 '내용1'인 데이터 하나 추가 

INSERT INTO article 
SET
regDate = NOW(),
title = '제목1',
`body` = '내용1';

INSERT INTO article (regDate,title,`body`) VALUES
(NOW(),'제목2','내용2'),
(NOW(),'제목3','내용3'),
(NOW(),'제목4','내용4'),
(NOW(),'제목5','내용5'),
(NOW(),'제목6','내용6');
# 제목 조회
SELECT title FROM article;
# 내용 조회
SELECT `body` FROM article;
# 제목, 내용 칼럼 데이터 조회
SELECT title,`body` FROM article;
# 내용, 제목 칼럼 데이터 조회
SELECT `body`,title FROM article;
# 모든 데이터 조회
SELECT * FROM article;
# 역순 조회
SELECT * FROM article ORDER BY id DESC;
# member 테이블 생성
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
id INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
regDate DATETIME NOT NULL,
loginId VARCHAR(100) NOT NULL,
loginPw VARCHAR(100) NOT NULL,
`name` VARCHAR(10) NOT NULL,
age INT(10) NOT NULL
);
DESC `member`;
# 멤버 데이터 생성
INSERT INTO `member` (regDate,loginId,loginPw,`name`,age) VALUES
(NOW(),'id1','pw1','홍길동',23),
(NOW(),'id2','pw2','김철수',24),
(NOW(),'id3','pw3','김영희',25),
(NOW(),'id4','pw4','아무개',26),
(NOW(),'id5','pw5','로버트',27);

SELECT * FROM `member`;

# 제목1, 내용1 데이터 추가
INSERT INTO article SET
regDate = NOW(),
title = '제목1',
`body` = '내용1';

# 제목2, 내용2 데이터 추가
INSERT INTO article SET
regDate = NOW(),
title = '제목2',
`body` = '내용2';
# 데이터 조회
SELECT * FROM article;
# 제목 데이터 aaa로 수정(모두 수정됨..)
UPDATE article SET 
title = 'aaa';
# `body`가 내용2인 것만 조회
SELECT * FROM article 
WHERE `body` = '내용2';
# 내용2만 새로운내용2 로 수정
UPDATE article SET 
`body` = '새로운내용2' 
WHERE `body` = '내용2';
# 데이터 조회
SELECT * FROM article;
# 데이터 삭제 (모든 데이터가 삭제...)
DELETE FROM article;
# 다시 

# 제목1, 내용1 데이터 추가
INSERT INTO article SET
regDate = NOW(),
title = '제목1',
`body` = '내용1';
# 제목2, 내용2 데이터 추가
INSERT INTO article SET
regDate = NOW(),
title = '제목2',
`body` = '내용2';
# 제목이 제목1인 것만 삭제
DELETE FROM article
WHERE title='제목1';

