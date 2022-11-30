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
	
	
	// 여기부터 손댐
	@RequestMapping("/input_product.do")
	public String input_product() {
		return "input_product";
	}
	
	@RequestMapping("/result_product.do")
	public String result_product() {
		System.out.println("넘어오는거 확인");
		//vString productCode = request.getParameter("num");
		//vSystem.out.println(request.getParameter("num"));
		return "result_product";
	}
	
}