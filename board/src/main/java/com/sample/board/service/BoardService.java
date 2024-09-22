package com.sample.board.service;

import com.sample.board.dto.BoardDTO;
import com.sample.board.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class BoardService {

    private final BoardRepository boardRepository;

    // 게시글 작성
    public int write(BoardDTO boardDTO) {
        return boardRepository.write(boardDTO);
    }

}
