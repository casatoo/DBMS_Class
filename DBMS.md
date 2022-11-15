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