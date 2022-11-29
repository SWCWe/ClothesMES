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
		@RequestMapping("/PsearchList.do")
		public @ResponseBody List<ProductVO> PsearchList(String search){
			
			System.out.println(search);
			List<ProductVO> list = mapper.PsearchList(search);
			
			return list;
		// 제품이름 이름 중복없이 가져오기
//		List<String> PnameList = mapper.productNameList();
//		model.addAttribute("PnameList", PnameList);
//		
//		// 출고 제품 코드 중복없이 가져오기
//		List<String> PcodeList = mapper.product_codeList();
//		model.addAttribute("PcodeList", PcodeList);
//		
//		// 주문 순번 중복없이 가져오기
//		List<String> LseqList = mapper.lack_seqList();
//		model.addAttribute("LseqList", LseqList);
	}
}
