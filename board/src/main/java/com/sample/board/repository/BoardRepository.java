package com.sample.board.repository;

import com.sample.board.dto.BoardDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class BoardRepository {

    private final SqlSessionTemplate sql;

    // 게시글 작성
    public int write(BoardDTO boardDTO) {
        return sql.insert("Board.write", boardDTO);
    }

}
