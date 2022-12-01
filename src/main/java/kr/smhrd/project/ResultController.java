package kr.smhrd.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Controller
public class ResultController {
	
	@RequestMapping("/prod_result.do")
	public String prod_result() {
		return "prod_result";
	}
}
