package com.dip.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dip.entity.ReplyVO;
import com.dip.service.ReplyService;

import lombok.Setter;

@RestController
@RequestMapping("/reply")
public class ReplyController {
	
	@Setter(onMethod_= @Autowired)
	private ReplyService replyService;
	
	
	// 댓글 작성
	@PostMapping("")
	public ResponseEntity<String> replyWrite(@RequestBody ReplyVO vo) {
		ResponseEntity<String> entity = null;
		 try {
            replyService.replyWrite(vo);
            entity = new ResponseEntity<String>("regSuccess", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
	}
	
	// 댓글 목록
    @GetMapping("/all/{bno}")
    public ResponseEntity<List<ReplyVO>> list(@PathVariable("bno") int bno) {
    	 ResponseEntity<List<ReplyVO>> entity = null;
    	 try {
             entity = new ResponseEntity<List<ReplyVO>>(replyService.replyList(bno), HttpStatus.OK);
         } catch (Exception e) {
             e.printStackTrace();
             entity = new ResponseEntity<List<ReplyVO>>(HttpStatus.BAD_REQUEST);
         }
         return entity;
    }
    
	
    // 댓글 수정
    @RequestMapping(value = "/{rno}", method = {RequestMethod.PUT, RequestMethod.PATCH})
    public ResponseEntity<String> replyModify(@PathVariable("rno") int rno, @RequestBody ReplyVO vo) {
        ResponseEntity<String> entity = null;
        try {
            vo.setRno(rno);
            replyService.replyModify(vo);
            entity = new ResponseEntity<String>("modSuccess", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }
    
    // 댓글 삭제
    @DeleteMapping("/{rno}")
    public ResponseEntity<String> replyDelete(@PathVariable("rno") int rno) {
        ResponseEntity<String> entity = null;
        try {
            replyService.replyDelete(rno);
            entity = new ResponseEntity<String>("delSuccess", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }
}