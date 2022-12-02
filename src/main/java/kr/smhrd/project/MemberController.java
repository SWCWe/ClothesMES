package kr.smhrd.project;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.entity.JoinDAO;
import kr.smhrd.mapper.MemberMapper;



@Controller
public class MemberController {

	@Inject
	private MemberMapper mapper;
	
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
	
	
	@RequestMapping(value="join", method=RequestMethod.GET)
	public void loginGET() throws Exception {
		mapper.info("login() 진입");
	}
	
	@RequestMapping(value="/joinInsert.do", method = RequestMethod.POST)
	public String joinInsert(JoinDAO join) {
		System.out.println(join.toString());
		mapper.joinInsert(join);
		return "redirect:/login.do";
	}
	

	
}
