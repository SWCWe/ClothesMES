package kr.smhrd.project;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.entity.productionVO;
import kr.smhrd.mapper.ProductionMapper;

@Controller 
public class ProductionController {

	@Autowired
	private ProductionMapper mapper;
	
	
	@RequestMapping("/production.do")
	public String productionList(Model model){
		List<productionVO> list = mapper.productionList();

		model.addAttribute("list", list);
		
		return "Production";
	}
	
	@RequestMapping("/production.do")
	public String productionInsert(productionVO vo){
		
		mapper.productionInsert(vo);		
		
		return "redirect:/production.do";
	}
	

}
