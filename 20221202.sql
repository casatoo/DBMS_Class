
DROP DATABASE b1;
CREATE DATABASE b1;
USE b1;

# 학생
DROP TABLE `student`;

CREATE TABLE `student`(
	stuno INT UNSIGNED, 
	sname VARCHAR(30),
	course_no INT UNSIGNED,
	course_name VARCHAR(30),
	course_pro VARCHAR(30),
	phone VARCHAR(30),
	PRIMARY KEY(stuno,course_no)
);

INSERT INTO `student` SET stuno = 1, 
sname = '홍길동',
course_no = '1',
course_name = '자바',
course_pro = '김자바',
phone = '010-1111-2222';

INSERT INTO `student` SET stuno = 2, 
sname = '이순신',
course_no = '2,3',
course_name = 'DB, 파이썬',
course_pro = '강DB, 장파이',
phone = '010-3333-4444';

INSERT INTO `student` SET stuno = 3, 
sname = '유관순',
course_no = '4',
course_name = '컴퓨터구조',
course_pro = '이구조',
phone = '010-5555-6666';


SELECT *
FROM student;

SELECT * FROM student;

/** 제 1 정규화 도메인이 원자값*/
DELETE FROM student;
INSERT INTO student (stuno,sname,course_no,course_name,course_pro,phone) VALUES
(1,'홍길동','1','자바','김자바','010-1111-2222'),
(2,'이순신','2','DB','강DB','010-3333-4444'),
(2,'이순신','3','파이썬','장파이','010-3333-4444'),
(3,'유관순','4','컴퓨터구조','이구조','010-5555-6666');
SELECT * FROM `student`;

/** 제 2 정규화 부분 함수종속 제거*/
DROP TABLE IF EXISTS `student`;
DROP TABLE IF EXISTS `course`;
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student`(
	stuno INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, 
	sname VARCHAR(30),
	phone VARCHAR(30)
);
CREATE TABLE `course`(
	course_no INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	course_name VARCHAR(30),
	course_pro VARCHAR(30)
);
CREATE TABLE `student_course`(
	stuno INT UNSIGNED,
	course_no INT UNSIGNED,
	PRIMARY KEY(stuno,course_no)
);
DELETE FROM student;
INSERT INTO student (sname,phone) VALUES
('홍길동','010-1111-2222'),
('이순신','010-3333-4444'),
('유관순','010-5555-6666');
DELETE FROM course;
INSERT INTO course (course_name,course_pro) VALUES
('자바','김자바'),
('DB','강DB'),
('파이썬','장파이'),
('컴퓨터구조','이구조');
DELETE FROM student_course;
INSERT INTO student_course (stuno,course_no) VALUES
(1,1),
(2,2),
(2,3),
(3,4);

SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM student_course;

/** 제 3 정규화 이행적함수종속 제거*/

DROP TABLE IF EXISTS `student`;
DROP TABLE IF EXISTS `course`;
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student`(
	stuno INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, 
	sname VARCHAR(30),
	phone VARCHAR(30)
);
CREATE TABLE `course`(
	course_no INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	course_name VARCHAR(30),
	pro_no INT UNSIGNED
);
CREATE TABLE `student_course`(
	stuno INT UNSIGNED,
	course_no INT UNSIGNED,
	PRIMARY KEY(stuno,course_no)
);
CREATE TABLE `professor`(
	pro_no INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	pro_name VARCHAR(30)
);

DELETE FROM student;
INSERT INTO student (sname,phone) VALUES
('홍길동','010-1111-2222'),
('이순신','010-3333-4444'),
('유관순','010-5555-6666');
DELETE FROM course;
INSERT INTO course (course_name,pro_no) VALUES
('자바',1),
('DB',2),
('파이썬',3),
('컴퓨터구조',4),
('R',3);
DELETE FROM student_course;
INSERT INTO student_course (stuno,course_no) VALUES
(1,1),
(2,2),
(2,3),
(3,4);
DELETE FROM professor;
INSERT INTO professor (pro_name) VALUES
('김자바'),
('강DB'),
('장파이'),
('이구조');

SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM student_course;
SELECT * FROM professor;

