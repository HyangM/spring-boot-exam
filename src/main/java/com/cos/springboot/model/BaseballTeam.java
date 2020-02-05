package com.cos.springboot.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class BaseballTeam {
	private int id;
	private String teamname;
	private Timestamp createDate;
	
	@Builder
	public BaseballTeam(String teamname, Timestamp createDate) {
		this.teamname = teamname;
		this.createDate = createDate;
	}
	
	
}
