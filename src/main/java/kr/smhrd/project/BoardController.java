package kr.smhrd.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.Data;


@Data
@AllArgsConstructor
@Controller
public class BoardController {
	
	
	
	
	@RequestMapping("/notice.do")
	public String notice() {
		return "notice";
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
	

	@RequestMapping("/TestRegister.do")
	public String notice1() {
		return "TestRegister";
	}
	
	
}