package com.dip.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dip.entity.BoardVO;
import com.dip.entity.Criteria;
import com.dip.entity.Like;

@Mapper
public interface BoardMapper {
	
	public List<BoardVO> getList(Criteria cri);
	
	public void insert(BoardVO board);
	
	public BoardVO read(int bno);
	
	public void update(BoardVO board);
	
	public void delete(int bno);
	
	public int count(Criteria cri);
	
}
