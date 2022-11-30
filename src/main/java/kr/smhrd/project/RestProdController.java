package kr.smhrd.project;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseBody; 


import kr.smhrd.entity.ProductDAO;
import kr.smhrd.mapper.ProductMapper;

@RestController
public class RestProdController {

	@Inject
	private ProductMapper mapper;
	
	@RequestMapping("/list.do")
	public List<ProductDAO> list(){
		List<ProductDAO> list = mapper.product_list();
		return list;
		
	}
}
