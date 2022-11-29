package kr.smhrd.project;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;



import kr.smhrd.entity.ProductVO;
import kr.smhrd.mapper.ProductMapper;



@Controller
public class ProductController {
	@Inject
	private ProductMapper mapper;
	
	
	@RequestMapping("/product.do")
	public void release(Model model) {
		// 출고정보 가져오기
		List<ProductVO> Plist = mapper.productList();
		model.addAttribute("list", Plist);
	}
	
	@RequestMapping("/prodDel.do")
	public String prodDel(String prod_code) {
		return "";
	}
}
