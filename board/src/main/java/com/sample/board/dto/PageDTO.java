package com.sample.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageDTO {

    private int page; // 현재 페이지
    private int maxPage; // 전체 페이지
    private int startPage; // 시작 페이지
    private int endPage; // 마지막 페이지

}
