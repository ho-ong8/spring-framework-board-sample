package com.sample.board.service;

import com.sample.board.dto.BoardDTO;
import com.sample.board.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

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

}
