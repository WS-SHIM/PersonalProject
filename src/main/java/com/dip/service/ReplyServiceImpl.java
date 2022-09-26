package com.dip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dip.entity.ReplyVO;
import com.dip.mapper.ReplyMapper;

import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_= @Autowired)
	private ReplyMapper mapper;

	@Override
	public List<ReplyVO> replyList(int bno) {
		return mapper.replyList(bno);
	}

	@Override
	public void replyWrite(ReplyVO vo) {
		mapper.replyWrite(vo);
	}

	@Override
	public void replyModify(ReplyVO vo) {
		mapper.replyModify(vo);
	}

	@Override
	public void replyDelete(int rno) {
		mapper.replyDelete(rno);
	}

}
