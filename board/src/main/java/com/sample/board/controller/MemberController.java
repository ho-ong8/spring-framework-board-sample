package com.sample.board.controller;

import com.sample.board.dto.MemberDTO;
import com.sample.board.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {

    private final MemberService memberService;

    // 회원가입
    @GetMapping("/join")
    public String joinForm() {
        return "/member/join";
    }

    @PostMapping("/join")
    public String join(@ModelAttribute MemberDTO memberDTO) {
        int member = memberService.join(memberDTO);

        if (member > 0) {
            return "/member/login";
        } else {
            return "/member/join";
        }
    }

    // 로그인
    @GetMapping("/login")
    public String loginForm() {
        return "/member/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
        boolean member = memberService.login(memberDTO);

        if (member) {
            session.setAttribute("member", memberDTO.getMemberEmail());
            return "main";
        } else {
            return "index";
        }
    }

    // 로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "index";
    }

    // 회원목록
    @GetMapping("/")
    public String findAll(Model model) {
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "/member/list";
    }

    // 회원정보 조회
    @GetMapping
    public String findById(@RequestParam("id") Long id, Model model) {
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        return "/member/detail";
    }

}
