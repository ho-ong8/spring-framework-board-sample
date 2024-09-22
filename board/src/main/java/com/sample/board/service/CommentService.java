package com.sample.board.service;

import com.sample.board.dto.CommentDTO;
import com.sample.board.repository.CommentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CommentService {

    private final CommentRepository commentRepository;

    // 댓글 작성
    public void write(CommentDTO commentDTO) {
        commentRepository.write(commentDTO);
    }

    // 댓글 목록
    public List<CommentDTO> findAll(Long boardId) {
        return commentRepository.findAll(boardId);
    }

}
