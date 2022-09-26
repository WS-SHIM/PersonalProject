package com.dip.entity;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ReplyVO {
	private int rno;
	private int bno;
	private String writer;
	private String content;
	private Date regDate;
}
