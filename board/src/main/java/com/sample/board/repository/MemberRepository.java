package com.sample.board.repository;

import com.sample.board.dto.MemberDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class MemberRepository {

    private final SqlSessionTemplate sql;

    // 회원가입
    public int join(MemberDTO memberDTO) {
        return sql.insert("Member.join", memberDTO);
    }

    // 로그인
    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);
    }

    // 회원목록
    public List<MemberDTO> findAll() {
        return sql.selectList("Member.findAll");
    }

    // 회원정보 조회
    public MemberDTO findById(Long id) {
        return sql.selectOne("Member.findById", id);
    }

    // 회원정보 삭제
    public void delete(Long id) {
        sql.delete("Member.delete", id);
    }

    // 회원정보 수정
    public MemberDTO findByMemberEmail(String member) {
        return sql.selectOne("Member.findByMemberEmail", member);
    }

    public int update(MemberDTO memberDTO) {
        return sql.update("Member.update", memberDTO);
    }

}
