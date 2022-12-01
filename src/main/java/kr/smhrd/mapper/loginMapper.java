package kr.smhrd.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.entity.MemberVO;

@Mapper
public interface loginMapper {

	int nameCheck(String emp_no);  //아이디 중복체크

	void joinRegister(MemberVO memberVO); // 회원가입

	

}
