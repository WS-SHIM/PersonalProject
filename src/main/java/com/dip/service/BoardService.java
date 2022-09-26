package com.dip.service;

import java.util.List;

import com.dip.entity.BoardVO;
import com.dip.entity.Criteria;
import com.dip.entity.Like;

public interface BoardService {
	// 게시물 전체조회
	public List<BoardVO> getList(Criteria cri);
	// 게시물 등록
	public void register(BoardVO board);
	// 게시물 상세조회
	public BoardVO read(int bno);
	// 게시물 수정
	public void modify(BoardVO board);
	// 게시물 삭제
	public void remove(int bno);
	// 총 게시물 갯수
	public int count(Criteria cri);
	
}
