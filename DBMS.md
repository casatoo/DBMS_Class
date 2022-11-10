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
- 
