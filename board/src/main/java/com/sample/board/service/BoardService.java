package com.sample.board.service;

import com.sample.board.dto.BoardDTO;
import com.sample.board.dto.PageDTO;
import com.sample.board.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class BoardService {

    private final BoardRepository boardRepository;

    // 게시글 작성
    public int write(BoardDTO boardDTO) {
        return boardRepository.write(boardDTO);
    }

    // 게시글 목록
    public List<BoardDTO> findAll() {
        return boardRepository.findAll();
    }

    // 게시글 조회
    public BoardDTO findById(Long id) {
        return boardRepository.findById(id);
    }

    public void updateHits(Long id) {
        boardRepository.updateHits(id);
    }

    // 게시글 삭제
    public void delete(Long id) {
        boardRepository.delete(id);
    }

    // 게시글 수정
    public void update(BoardDTO boardDTO) {
        boardRepository.update(boardDTO);
    }

    // 게시글 페이징
    int pageCntLimit = 3; // 페이지 게시글 수 제한
    int pageNumLimit = 3; // 페이지 번호 수 제한

    public List<BoardDTO> paging(int page) {
        int pageStart = (page - 1) * pageCntLimit;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pageStart);
        pagingParam.put("limit", pageCntLimit);
        return boardRepository.paging(pagingParam);
    }

    public PageDTO pagingParam(int page) {
        // 전체 게시글 수 조회
        int count = boardRepository.count();
        // 전체 페이지 계산 (10 / 3 = 3.33333 => 4)
        int maxPage = (int) (Math.ceil((double) count / pageCntLimit));
        // 시작 페이지 계산 (1, 4, 7, 10, ...)
        int startPage = (((int) (Math.ceil((double) page / pageNumLimit))) - 1) * pageNumLimit + 1;
        // 마지막 페이지 계산 (3, 6, 9, 12, ...)
        int endPage = startPage + pageNumLimit - 1;

        if (endPage > maxPage) {
            endPage = maxPage;
        }

        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setStartPage(startPage);
        pageDTO.setEndPage(endPage);
        return pageDTO;
    }

}
