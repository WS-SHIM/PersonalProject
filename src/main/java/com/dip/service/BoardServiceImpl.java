package com.dip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dip.entity.BoardVO;
import com.dip.entity.BoardVO2;
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

	@Override
	public int getBoardLike(Like like) {
		return mapper.getBoardLike(like);
	}

	@Override
	public void insertBoardLike(Like like) {
		mapper.insertBoardLike(like);
		mapper.updateBoardLike(like.getBno());
	}

	@Override
	public void deleteBoardLike(Like like) {
		mapper.deleteBoardLike(like);
		mapper.updateBoardLike(like.getBno());
	}

	@Override
	public void updateBoardLike(int bno) {
		mapper.updateBoardLike(bno);
	}

	@Override
	public List<BoardVO2> getList2(Criteria cri) {
		return mapper.getList2(cri);
	}

	@Override
	public void register2(BoardVO2 board2) {
		mapper.insert2(board2);
	}

	@Override
	public BoardVO2 read2(int bno) {
		return mapper.read2(bno);
	}

	@Override
	public void modify2(BoardVO2 board2) {
		mapper.update2(board2);
	}

	@Override
	public void remove2(int bno) {
		mapper.delete2(bno);
	}

	@Override
	public int count2(Criteria cri) {
		return mapper.count2(cri);
	}




}
