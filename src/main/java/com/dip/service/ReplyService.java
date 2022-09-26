package com.dip.service;

import java.util.List;

import com.dip.entity.ReplyVO;

public interface ReplyService {
	
		// 댓글 조회
		public List<ReplyVO> replyList(int bno);
		
		// 댓글 조회
		public void replyWrite(ReplyVO vo);

		// 댓글 수정
		public void replyModify(ReplyVO vo);

		// 댓글 삭제
		public void replyDelete(int rno);
		
}
