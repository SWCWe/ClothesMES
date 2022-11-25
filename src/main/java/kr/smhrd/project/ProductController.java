package kr.smhrd.project;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.entity.ProductDAO;
import kr.smhrd.mapper.ProductMapper;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@Controller
@AllArgsConstructor
public class ProductController {
	@Inject
	private ProductMapper mapper;
	
	
	@RequestMapping("/product.do")
	public String product(Model model) {
		List<ProductDAO> list = mapper.product_list();
		model.addAttribute("list",list);
		return "product";
	}
}
