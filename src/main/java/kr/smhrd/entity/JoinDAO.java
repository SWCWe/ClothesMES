package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString
public class JoinDAO {
	//회원 아이디
	public String emp_no;
	
	//회원 비밀번호
	public String pw;
	
	//회원 이름
	public String name;
	
	//사원
	public String position;
	
	//부서
	public String dept;
	
	//가입날짜
	public String emp_joindate;
	
	//회원유형
	public String emp_type;
	
}
