package com.sample.board.controller;

import com.sample.board.dto.CommentDTO;
import com.sample.board.service.CommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/comment")
public class CommentController {

    private final CommentService commentService;

    // 댓글 작성
    @PostMapping("/write")
    public @ResponseBody List<CommentDTO> write(@ModelAttribute CommentDTO commentDTO) {
        commentService.write(commentDTO);
        return commentService.findAll(commentDTO.getBoardId());
    }

}
