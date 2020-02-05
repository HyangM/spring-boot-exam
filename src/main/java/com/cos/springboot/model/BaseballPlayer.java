package com.cos.springboot.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class BaseballPlayer {
	private int id;
	private String name;
	private int teamid;
	private Timestamp createDate;
	
	@Builder
	public BaseballPlayer(String name, int teamid, Timestamp createDate) {
		this.name = name;
		this.teamid = teamid;
		this.createDate = createDate;
	}	
}
