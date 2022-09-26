package com.dip.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// 페이징 처리를 위해 사용될 객체로 페이지번호, 페이지당 출력할 게시글 수를 관리
@ToString
@Getter
public class Criteria {
	
	private int pageNum;  // 현재 페이지 번호
	private int amount;  // 한 페이지당 보여줄 게시글 갯수
	private int skip;  // 스킵 할 게시물수( (pageNum-1) * amount) )
	private String keyword; // 검색키워드
	private String type; // 검색타입
	private String[] typeArr; // 검색타입배열
	
	// 최초 default 생성자로 기본객채 생성시 초기값 지정
	public Criteria() {
		this(1,10);
		this.skip = 0;
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip = (pageNum-1) * amount;
	}

	public void setPageNum(int pageNum) {
		this.skip = (pageNum-1) * this.amount;
		this.pageNum = pageNum;
	}

	public void setAmount(int amount) {
		this.skip = (pageNum-1) * this.amount;
		this.amount = amount;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void setType(String type) {
		this.type = type;
		this.typeArr = type.split("");
	}

	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr;
	}


	
	
	
}
