package com.sample.board.repository;

import com.sample.board.dto.CommentDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class CommentRepository {

    private final SqlSessionTemplate sql;

    // 댓글 작성
    public void write(CommentDTO commentDTO) {
        sql.insert("Comment.write", commentDTO);
    }

    // 댓글 목록
    public List<CommentDTO> findAll(Long boardId) {
        return sql.selectList("Comment.findAll", boardId);
    }

}
