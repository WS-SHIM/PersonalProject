package com.dip.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dip.entity.ReplyVO;

@Mapper
public interface ReplyMapper {
	
	// 댓글 조회
	public List<ReplyVO> replyList(int bno);
	
	// 댓글 등록
	public void replyWrite(ReplyVO vo);

	// 댓글 수정
	public void replyModify(ReplyVO vo);

	// 댓글 삭제
	public void replyDelete(int rno);
	
}
