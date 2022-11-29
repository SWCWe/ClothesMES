package kr.smhrd.mapper;

import kr.smhrd.entity.JoinDAO;

public interface MemberMapper {
	public void joinInsert(JoinDAO join);

	public void info(String string);

}
