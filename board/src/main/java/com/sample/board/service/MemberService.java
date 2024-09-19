package com.sample.board.service;

import com.sample.board.dto.MemberDTO;
import com.sample.board.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberService {

    private final MemberRepository memberRepository;

    // 회원가입
    public int join(MemberDTO memberDTO) {
        return memberRepository.join(memberDTO);
    }

    // 로그인
    public boolean login(MemberDTO memberDTO) {
        MemberDTO member = memberRepository.login(memberDTO);

        if (member != null) {
            return true;
        } else {
            return false;
        }
    }

    // 회원목록
    public List<MemberDTO> findAll() {
        return memberRepository.findAll();
    }

    // 회원정보 조회
    public MemberDTO findById(Long id) {
        return memberRepository.findById(id);
    }

}
