package com.dip.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dip.entity.BoardVO;
import com.dip.entity.Criteria;
import com.dip.entity.Like;
import com.dip.entity.PageMaker;
import com.dip.service.BoardService;
import com.dip.service.ReplyService;

import lombok.Setter;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Setter(onMethod_= @Autowired)
	private BoardService service;
	@Setter(onMethod_= @Autowired)
	private ReplyService replyService;
	
	
	// 게시물 전체조회 + 페이징
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", service.getList(cri));
		int total = service.count(cri);
		model.addAttribute("pageMaker", new PageMaker(cri, total));
	}
	
	
	// 게시물 작성화면
	@GetMapping("/register")
	public void register() {
		
	}
	
	// 게시물 등록
	@PostMapping("/register")
	public String register(BoardVO board) {
		service.register(board);
		return "redirect:/board/list";
	}
	
	// 게시물 상세조회, 게시물 수정화면
	@GetMapping({"/get", "/modify"})
	public void getRead(@RequestParam("bno") int bno, @RequestParam("memName") String memName, Model model, Criteria cri) {
		BoardVO board = service.read(bno);
		model.addAttribute("get", board);
	}
	
	// 게시물 수정
	@PostMapping("/modify")
	public String postModify(BoardVO board) {
		service.modify(board);
		return "redirect:/board/list";
	}
	
	// 게시물 삭제
	@GetMapping("/remove")
	public String remove(@RequestParam("bno") int bno) {
		service.remove(bno);
		return "/redirect:/board/list";
	}
	
}
