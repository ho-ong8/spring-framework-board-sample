package com.sample.board.repository;

import com.sample.board.dto.BoardDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class BoardRepository {

    private final SqlSessionTemplate sql;

    // 게시글 작성
    public int write(BoardDTO boardDTO) {
        return sql.insert("Board.write", boardDTO);
    }

    // 게시글 목록
    public List<BoardDTO> findAll() {
        return sql.selectList("Board.findAll");
    }

    // 게시글 조회
    public BoardDTO findById(Long id) {
        return sql.selectOne("Board.findById", id);
    }

    public void updateHits(Long id) {
        sql.update("Board.updateHits", id);
    }

    // 게시글 삭제
    public void delete(Long id) {
        sql.delete("Board.delete", id);
    }

    // 게시글 수정
    public void update(BoardDTO boardDTO) {
        sql.update("Board.update", boardDTO);
    }

}
