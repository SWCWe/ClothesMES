package kr.smhrd.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.Data;


@Data
@AllArgsConstructor
@Controller
public class BoardController {
	
	@RequestMapping("/index.do")
	public String boardList() {
		return "index";
	}
	
	@RequestMapping("/management.do")
	public String management() {
		return "management";
	}
	
	@RequestMapping("/notice.do")
	public String notice() {
		return "notice";
	}
	
	
	@RequestMapping("/user.do")
	public String user() {
		return "user";
	}
	
	@RequestMapping("/schedule.do")
	public String schedule() {
		return "schedule";
	}
	
	@RequestMapping("/notice_write.do")
	public String notice_write() {
		return "notice_write";
	}
	
	@RequestMapping("/notice_view.do")
	public String notice_view() {
		return "notice_view";
	}
	
	@RequestMapping("/login.do")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/order.do")
	public String order() {
		return "order";
	}
	
	@RequestMapping("/order_view.do")
	public String order_view() {
		return "order_view";
	}
	
	@RequestMapping("/join.do")
	public String join() {
		return "join";
	}
	
}