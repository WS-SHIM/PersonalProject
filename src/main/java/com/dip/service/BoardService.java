package com.dip.service;

import java.util.List;

import com.dip.entity.BoardVO;
import com.dip.entity.BoardVO2;
import com.dip.entity.Criteria;
import com.dip.entity.Like;

public interface BoardService {
	// 게시물 전체조회
	public List<BoardVO> getList(Criteria cri);
	public List<BoardVO2> getList2(Criteria cri);
	// 게시물 등록
	public void register(BoardVO board);
	public void register2(BoardVO2 board2);
	// 게시물 상세조회
	public BoardVO read(int bno);
	public BoardVO2 read2(int bno);
	// 게시물 수정
	public void modify(BoardVO board);
	public void modify2(BoardVO2 board2);
	// 게시물 삭제
	public void remove(int bno);
	public void remove2(int bno);
	// 총 게시물 갯수
	public int count(Criteria cri);
	public int count2(Criteria cri);
	
	
	public int getBoardLike(Like like);
	
	public void insertBoardLike(Like like);
	
	public void deleteBoardLike(Like like);
	
	public void updateBoardLike(int bno);
	
}
