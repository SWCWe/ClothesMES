package kr.smhrd.project;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ManagementController {

	

	
	@RequestMapping("/index.do")
	public String boardList() {
		return "index";
	}
	
	
	@RequestMapping("/management.do")
	public String management() {
		return "management";
	}
	
	@RequestMapping("/order.do")
	public String order() {
		return "order";
	}
	
	@RequestMapping("/order_view.do")
	public String order_view() {
		return "order_view";
	}
		
	
}
