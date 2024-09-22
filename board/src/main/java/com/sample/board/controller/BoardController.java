package com.sample.board.controller;

import com.sample.board.dto.BoardDTO;
import com.sample.board.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {

    private final BoardService boardService;

    // 게시글 작성
    @GetMapping("/write")
    public String writeForm() {
        return "/board/write";
    }

    @PostMapping("/write")
    public String write(@ModelAttribute BoardDTO boardDTO) {
        int board = boardService.write(boardDTO);

        if (board > 0) {
            return "redirect:/board/";
        } else {
            return "/board/write";
        }
    }

}
