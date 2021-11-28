# Spring C조 포트폴리오
* spring framework 기반의 웹사이트 개발<br/>
* 2021.09.23~2021.10.31

<hr/>
## 개요<br/>

![개요](https://user-images.githubusercontent.com/73810338/143730939-33000fe9-2799-4383-88d5-c1e4e5fe5f24.png)

## skills
1. OS: Windows 10, Mac, Raspbian 
2. Framework:  Eclipse (Spring Tool Suite 3 Version: 3.9.17.RELEASE), 전자정부프레임, MyBatis
3. Database: MySQL, Heidi SQL, DBeaver
4. Language: Java, JavaScript, JSP, Jquery
5. Web Application Server: Apache Tomcat v9.0
6. Markup: CSS, HTML5, XML

## 주요 기능

1.사용자 관점<br/>
![주요기능](https://user-images.githubusercontent.com/73810338/143730709-ec4b164f-0b97-4abd-b73f-c19dddb9c98a.png)<br/>
2. 관리자 관점<br/>
![주요기능 관리자](https://user-images.githubusercontent.com/73810338/143730726-e6bc8e8f-7e5f-49aa-b813-61971154a453.png)<br/>

## DB 설계 
![image](https://user-images.githubusercontent.com/73810338/143730804-49377225-8118-486e-8de1-c1dacd916e68.png)

## SiteMap
![image](https://user-images.githubusercontent.com/73810338/143730810-967dde69-dc9d-4d8d-ba4e-e71c6aa22aa4.png)

## 화면 구현(주요 5가지 화면)
1. 메인화면 <br/>
![메인화면](https://user-images.githubusercontent.com/73810338/143730867-31939670-ef87-48e9-8644-888deb88023d.png)<br/>

2. 가맹점 찾기<br/>
![가맹점 찾기](https://user-images.githubusercontent.com/73810338/143730884-6f7d52be-d126-4ece-beeb-cb311cc7c787.png)<br/>

3. 가맹점 예약<br/>
![가맹점 예약](https://user-images.githubusercontent.com/73810338/143730889-8dd4b2f5-60a6-40a6-897a-6dfb8ca7ffe6.png)<br/>

4. 관리자 페이지<br/>
![관리자 페이지](https://user-images.githubusercontent.com/73810338/143730891-e5247e25-979d-46b9-bfdb-243365d78cd9.png)<br/>

5. 관리자 로그관리<br/>
![관리자 로그관리](https://user-images.githubusercontent.com/73810338/143730897-f8cac8e2-51d9-4e4b-8a1b-ae95bc820a09.png)<br/>

## Project Setup
1. 리포지토리와 일치하는 폴더를 워크스페이스로 설정합니다.
![setup01](https://user-images.githubusercontent.com/28214971/133531373-1f241b30-e7ac-4a0a-8ba1-98d302235574.png)
2. 기본 설정된 서버는 삭제합니다. - 1
![setup02](https://user-images.githubusercontent.com/28214971/133531586-5378cd10-96bb-41b5-9676-85113251a28d.png)
3. 기본 설정된 서버는 삭제합니다. - 2
![setup03](https://user-images.githubusercontent.com/28214971/133531588-24410bb2-3c78-4830-9ede-02f6dd3479f0.png)
4. 프로젝트를 임포트합니다. (Next 생략)
![setup04](https://user-images.githubusercontent.com/28214971/133531589-1c4f4545-2eae-443a-894a-8a58983e5123.png)
5. 웹프로젝트로 동작하도록 설정합니다 - 1
![setup05](https://user-images.githubusercontent.com/28214971/133531590-a68d311c-a6ab-452c-b8fd-14ced0b55278.png)
6. 웹프로젝트로 동작하도록 설정합니다 - 2
![setup06](https://user-images.githubusercontent.com/28214971/133531591-af3d80cc-ffc3-42f9-b3de-72d261097441.png)
7. 실행과 동시에 톰캣 서버를 설정합니다. - 1
![setup07](https://user-images.githubusercontent.com/28214971/133531592-2a79abc9-879e-48de-ae8d-438cc1ed441f.png)
8. 실행과 동시에 톰캣 서버를 설정합니다. - 2 (Next 생략)
![setup08](https://user-images.githubusercontent.com/28214971/133531593-61ca62f1-8178-47ee-99dd-e83be2c93d95.png)

## Coding-Convention
* 명명 규칙
  * Java 
    * 변수, 함수 : 카멜 케이스
    ```java
    private TestService testService;
    private String tableName;
    public String getTableName() { return tableName; }
    ```
    * 상수 : 대문자 스네이크 케이스
    ```java
    private final int MAX_COUNT = 10;
    ```
  * Database
    * 테이블, 뷰, 컬럼 : 소문자 스네이크 케이스
    ```
    table : free_board
    view : free_board_view
    column : no;
    column : member_no;
    ```
    * 컬럼의 접두어는 외부 테이블의 경우에만 사용하되, 줄여쓰지 않습니다.
    ```
    ex) table : board
    bno (X) -> no (O)
    board_no (X) -> no (O)
    mem_no (X) -> member_no (O)
    ```
## Encoding Type
  * UTF-8
