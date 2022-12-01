package kr.smhrd.project;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.smhrd.entity.ProductVO;
import kr.smhrd.mapper.ProductMapper;

@RestController
public class RestProdController {

	@Inject
	private ProductMapper mapper;
	
	@RequestMapping("/list.do")
	public List<ProductVO> list(){
		List<ProductVO> list = mapper.productList();
		return list;
		
	}
}
