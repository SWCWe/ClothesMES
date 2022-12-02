package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


import lombok.ToString;


@NoArgsConstructor // 기본 생성자
@AllArgsConstructor
@Data
@ToString
public class MemberVO {

	private String emp_no;               //아이디
	private String pw; 		            //비밀번호
	private String name;               //이름
	private String position;          //직책  
	private String dept;             //부서
	private String emp_joindate;    //가입 일자   
	private String emp_type;       //회원 유형
	
	
	
}
