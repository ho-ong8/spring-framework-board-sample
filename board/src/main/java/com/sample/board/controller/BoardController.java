package com.sample.board.controller;

import com.sample.board.dto.BoardDTO;
import com.sample.board.dto.CommentDTO;
import com.sample.board.dto.PageDTO;
import com.sample.board.service.BoardService;
import com.sample.board.service.CommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {

    private final BoardService boardService;
    private final CommentService commentService;

    // 게시글 작성
    @GetMapping("/write")
    public String writeForm() {
        return "/board/write";
    }

    @PostMapping("/write")
    public String write(@ModelAttribute BoardDTO boardDTO) {
        int board = boardService.write(boardDTO);

        if (board > 0) {
            return "redirect:/board/paging";
        } else {
            return "/board/write";
        }
    }

    // 게시글 목록
    @GetMapping("/")
    public String findAll(Model model) {
        List<BoardDTO> boardDTOList = boardService.findAll();
        model.addAttribute("boardList", boardDTOList);
        return "/board/list";
    }

    // 게시글 조회
    @GetMapping
    public String findById(@RequestParam("id") Long id,
                           @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                           Model model) {
        boardService.updateHits(id);
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        model.addAttribute("page", page);

        // 댓글 목록
        List<CommentDTO> commentDTOList = commentService.findAll(id);
        model.addAttribute("commentList", commentDTOList);
        return "/board/detail";
    }

    // 게시글 삭제
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        boardService.delete(id);
        return "redirect:/board/paging";
    }

    // 게시글 수정
    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        return "/board/update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO, Model model) {
        boardService.update(boardDTO);
        BoardDTO board = boardService.findById(boardDTO.getId());
        model.addAttribute("board", board);
        return "/board/detail";
    }

    // 게시글 페이징
    @GetMapping("/paging")
    public String paging(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                         Model model) {
        List<BoardDTO> boardDTOList = boardService.paging(page);
        PageDTO pageDTO = boardService.pagingParam(page);
        model.addAttribute("boardList", boardDTOList);
        model.addAttribute("paging", pageDTO);
        return "/board/paging";
    }

}
