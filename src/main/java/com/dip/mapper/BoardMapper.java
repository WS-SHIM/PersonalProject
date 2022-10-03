package com.dip.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dip.entity.BoardVO;
import com.dip.entity.BoardVO2;
import com.dip.entity.Criteria;
import com.dip.entity.Like;

@Mapper
public interface BoardMapper {
	
	public List<BoardVO> getList(Criteria cri);
	
	public List<BoardVO2> getList2(Criteria cri);
	
	public void insert(BoardVO board);
	
	public void insert2(BoardVO2 board2);
	
	public BoardVO read(int bno);
	
	public BoardVO2 read2(int bno);
	
	public void update(BoardVO board);
	
	public void update2(BoardVO2 board2);
	
	public void delete(int bno);
	
	public void delete2(int bno);
	
	public int count(Criteria cri);
	
	public int count2(Criteria cri);
	
	public int getBoardLike(Like like);
	
	public void insertBoardLike(Like like);
	
	public void deleteBoardLike(Like like);
	
	public void updateBoardLike(int bno);
	
}
