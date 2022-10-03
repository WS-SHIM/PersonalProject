package com.dip.entity;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class BoardVO2 {
	private Long bno;
	private String title;
	private String menu;
	private String address;
	private String tel;
	private String time;
	private String fileName;
	private MultipartFile uploadFile;
}
