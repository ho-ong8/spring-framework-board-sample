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
        System.out.println("memberDTO = " + memberDTO);
        return sql.insert("Member.join", memberDTO);
    }

}
