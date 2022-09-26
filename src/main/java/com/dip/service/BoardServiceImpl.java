package com.dip.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dip.entity.BoardVO;
import com.dip.entity.Criteria;
import com.dip.entity.Like;
import com.dip.mapper.BoardMapper;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_= @Autowired)
	private BoardMapper mapper;
	
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		return mapper.getList(cri);
	}

	@Override
	public void register(BoardVO board) {
		mapper.insert(board);
	}

	@Override
	public BoardVO read(int bno) {
		return mapper.read(bno);
	}

	@Override
	public void modify(BoardVO board) {
		mapper.update(board);
	}

	@Override
	public void remove(int bno) {
		mapper.delete(bno);
	}

	@Override
	public int count(Criteria cri) {
		return mapper.count(cri);
	}




}
