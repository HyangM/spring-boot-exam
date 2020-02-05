package com.cos.springboot.repository;

import java.util.List;

import com.cos.springboot.dto.BaseballTPDto;
import com.cos.springboot.model.BaseballPlayer;
import com.cos.springboot.model.BaseballTeam;

public interface BaseballRepository {
	// 팀 조회
	List<BaseballTeam> findTeamAll();
	// 선택한 팀의 선수 조회
	List<BaseballPlayer> findByTeam(int teamid);
	// 선택한 팀의 선수의 상세정보
	BaseballTPDto findByTP(int teamid, int userid);
}
