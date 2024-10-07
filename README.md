# spring-framework-board-sample
> Spring Framework Board Sample.

<br>

## Development Environment
<div style="display: inline-block">
    <img src="https://img.shields.io/badge/IntelliJ%20IDEA-000000?style=flat-square&logo=IntelliJIDEA&logoColor=white" />
    <img src="https://img.shields.io/badge/HTML-e34f26?style=flat-square&logo=HTML5&logoColor=white" />
    <img src="https://img.shields.io/badge/CSS-1572b6?style=flat-square&logo=CSS3&logoColor=white" />
    <img src="https://img.shields.io/badge/JavaScript-f7df1e?style=flat-square&logo=JavaScript&logoColor=white" />
    <img src="https://img.shields.io/badge/jQuery-0769ad?style=flat-square&logo=jQuery&logoColor=white" />
    <img src="https://img.shields.io/badge/Java-3a75b0?style=flat-square&logo=coffeescript&logoColor=white" />
    <img src="https://img.shields.io/badge/Spring-6db33f?style=flat-square&logo=Spring&logoColor=white" />
    <img src="https://img.shields.io/badge/Maven-c71a36?style=flat-square&logo=ApacheMaven&logoColor=white" />
    <img src="https://img.shields.io/badge/MySQL-4479a1?style=flat-square&logo=MySQL&logoColor=white" />
</div>

<br>

- IDE: IntelliJ IDEA
- Language: HTML5, CSS3, JavaScript, JAVA (JDK 11)
- Library: jQuery
- Framework: Spring, MyBatis
- Build: Maven
- DBMS: MySQL

<br>

## Main Function
- 회원(Member)
    - 로그인: /member/login
    - 로그아웃: /member/logout
    - 회원가입: /member/join
    - 회원목록: /member/
    - 회원정보 조회: /member/{id}
    - 회원정보 수정: /member/update
    - 회원정보 삭제: /member/delete/{id}

- 게시판(Board)
    - 게시글 작성: /board/write
    - 게시글 목록: /board/
    - 게시글 조회: /board/{id}
    - 게시글 수정: /board/update/{id}, /board/update
    - 게시글 삭제: /board/delete/{id}
    - 게시글 페이징: /board/paging

<br>

## Add Function
- 회원(Member)
    - 이메일 중복체크: /member/check-email

- 게시판(Board)
    - 댓글 작성: /comment/write
    - 댓글 목록: /board/{id}, /board/update

<br>

## Create MySQL Database
```SQL
create database spring_framework_board;
create user hoong@localhost identified by '8888';
grant all privileges on spring_framework_board.* to hoong@localhost;
```

<br>

## MySQL Database Table
```SQL
/* 회원 */
drop table if exists spring_framework_board.member;

create table spring_framework_board.member (
    id             bigint primary key not null auto_increment,
    memberEmail    varchar(30) unique null,
    memberPassword varchar(30) null,
    memberName     varchar(30) null,
    memberAge      int         null,
    memberMobile   varchar(30) null
);


/* 게시판 */
drop table if exists spring_framework_board.board;

create table spring_framework_board.board (
    id               bigint primary key not null auto_increment,
    boardWriter      varchar(30)            null,
    boardPassword    varchar(30)            null,
    boardTitle       varchar(50)            null,
    boardContents    varchar(500)           null,
    boardHits        int default 0          null,
    boardCreatedTime datetime default now() null
);


/* 댓글 */
drop table if exists spring_framework_board.comment;

create table spring_framework_board.comment (
    id                 bigint primary key not null auto_increment,
    commentWriter      varchar(30)            null,
    commentContents    varchar(300)           null,
    boardId            bigint                 null,
    commentCreatedTime datetime default now() null,
    constraint fk_comment foreign key (boardId) references board (id) on delete cascade
);
```
