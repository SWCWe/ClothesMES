package kr.smhrd.project;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class MemberController {

	
	@RequestMapping("/user.do")
	public String user() {
		return "user";
	}
	
	@RequestMapping("/login.do")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/join.do")
	public String join() {
		return "join";
	}
	
	
}