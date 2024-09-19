package com.sample.board.repository;

import com.sample.board.dto.MemberDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

}
