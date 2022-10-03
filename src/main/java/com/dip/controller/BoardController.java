package com.dip.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dip.entity.BoardVO;
import com.dip.entity.BoardVO2;
import com.dip.entity.Criteria;
import com.dip.entity.Like;
import com.dip.entity.Member;
import com.dip.entity.PageMaker;
import com.dip.service.BoardService;
import com.dip.service.ReplyService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import lombok.Setter;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Setter(onMethod_= @Autowired)
	private BoardService service;
	@Setter(onMethod_= @Autowired)
	private ReplyService replyService;
	
	// 맛집공유 게시물 전체조회 + 페이징
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", service.getList(cri));
		int total = service.count(cri);
		model.addAttribute("pageMaker", new PageMaker(cri, total));
	}
	
	// 맛집추천 게시물 전체조회 + 페이징
	@GetMapping("/list2")
	public void list2(Criteria cri, Model model) {
		model.addAttribute("list", service.getList2(cri));
		int total = service.count2(cri);
		model.addAttribute("pageMaker", new PageMaker(cri, total));
	}
	
	
	// 맛집공유 게시물 작성화면
	@GetMapping("/register")
	public void register() {
		
	}
	
	// 맛집추천 게시물 작성화면
	@GetMapping("/register2")
	public void register2() {
		
	}
	
	// 맛집 공유 게시물 등록
	@PostMapping("/register")
	public String register(BoardVO board, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		String fileName=null; 
		MultipartFile uploadFile = board.getUploadFile(); 
		if(!uploadFile.isEmpty()) { 
		String originalFileName = uploadFile.getOriginalFilename(); 
		String ext = FilenameUtils.getExtension(originalFileName); //확장자 구하기 
		UUID uuid = UUID.randomUUID(); //UUID 구하기 
		fileName = uuid+"."+ext;
		uploadFile.transferTo(new File("C:\\eGovFrame-4.0.0\\workspace.edu\\TodayFood\\src\\main\\webapp\\resources\\upload\\" + fileName));
		} 
		board.setFileName(fileName);
		service.register(board);
		return "redirect:/board/list";
	}
	
	// 게시물 등록
	@PostMapping("/register2")
	public String register2(BoardVO2 board2, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		String fileName=null; 
		MultipartFile uploadFile = board2.getUploadFile(); 
		if(!uploadFile.isEmpty()) { 
		String originalFileName = uploadFile.getOriginalFilename(); 
		String ext = FilenameUtils.getExtension(originalFileName); //확장자 구하기 
		UUID uuid = UUID.randomUUID(); //UUID 구하기 
		fileName = uuid+"."+ext;
		uploadFile.transferTo(new File("C:\\eGovFrame-4.0.0\\workspace.edu\\TodayFood\\src\\main\\webapp\\resources\\upload\\" + fileName));
		} 
		board2.setFileName(fileName);
		service.register2(board2);
		return "redirect:/board/list2";
	}
	
	// 맛집 공유 게시물 상세조회, 게시물 수정화면
	@GetMapping({"/get", "/modify"})
	public void getRead(@RequestParam("bno") int bno, Model model, Criteria cri, HttpServletRequest httpRequest) throws Exception {
		BoardVO board = service.read(bno);
		model.addAttribute("get", board);
		String memName = ((Member) httpRequest.getSession().getAttribute("mvo")).getMemName();
		Like like = new Like();
		like.setBno(bno);
		like.setMemName(memName);
		int boardlike = service.getBoardLike(like);
		model.addAttribute("like", boardlike);
	}
	
	// 맛집 공유 게시물 상세조회, 게시물 수정화면
	@GetMapping({"/get2", "/modify2"})
	public void getRead2(@RequestParam("bno") int bno, Model model, Criteria cri, HttpServletRequest httpRequest) throws Exception {
		BoardVO2 board2 = service.read2(bno);
		model.addAttribute("get", board2);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/like", method = RequestMethod.POST, produces = "application/json")
	public int like(HttpServletRequest httpRequest) throws Exception {
		
		int like = Integer.parseInt(httpRequest.getParameter("like"));
		int bno = Integer.parseInt(httpRequest.getParameter("bno"));
        String memName = httpRequest.getParameter("memName");
        Like like1 = new Like();

        like1.setBno(bno);
        like1.setMemName(memName);

        if(like >= 1) {
            service.deleteBoardLike(like1);
            like=0;
        } else {
            service.insertBoardLike(like1);
            like=1;
        }

        return like;
		
	}
	
	
	
	// 맛집 공유 게시물 수정
	@PostMapping("/modify")
	public String postModify(BoardVO board) {
		service.modify(board);
		return "redirect:/board/list";
	}
	
	// 맛집 추천 게시물 수정
	@PostMapping("/modify2")
	public String postModify2(BoardVO2 board2) {
		service.modify2(board2);
		return "redirect:/board/list2";
	}
	
	// 맛집 공유 게시물 삭제
	@GetMapping("/remove")
	public String remove(@RequestParam("bno") int bno) {
		service.remove(bno);
		return "/redirect:/board/list";
	}
	
	// 맛집 추천 게시물 삭제
	@GetMapping("/remove2")
	public String remove2(@RequestParam("bno") int bno) {
		service.remove2(bno);
		return "/redirect:/board/list2";
	}

}
