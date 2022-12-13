package kr.smhrd.project;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.entity.MemberVO;
import kr.smhrd.mapper.loginMapper;

@Controller
public class loginController {

	@Inject
	private loginMapper mapper;
		
	
	// 아이디 중복체크
	@RequestMapping("/nameCheck.do")
	public @ResponseBody int nameCheck(String emp_no) {
		int check = mapper.nameCheck(emp_no);
		
		return check;
	}	
		
	//회원가입
	@RequestMapping("/joinRegister.do")
	public @ResponseBody void joinRegister(MemberVO MemberVO) {
		mapper.joinRegister(MemberVO);
	}
	
	
//	@RequestMapping("/loginCheck.do")
//	public @ResponseBody void loginCheck(MemberVO MemberVO) {
//		
//		
//		mapper.loginCheck(MemberVO);
//		
//		
//	}
//	
	
	
	
	@RequestMapping("/loginCheck.do")
	public String loginCheck(MemberVO vo, HttpSession session) {
		
		MemberVO mvo = mapper.loginCheck(vo);
		session.setAttribute("vo", mvo);
		
		return "redirect:/production.do";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
	
		session.removeAttribute("vo");
		
		
		return "login";
	}
	
	
	
	}///////
	

