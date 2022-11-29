package kr.smhrd.project;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.entity.ReleaseVO;
import kr.smhrd.mapper.ReleaseMapper;

@Controller
public class ReleaseController {
	
	@Inject // Autowired 대신 호환이 잘 되는 Inject를 쓰는 추세
	private ReleaseMapper mapper;

	// 페이지 로드할 때 DB에서 데이터 가져오기
	@RequestMapping("/release.do")
	public void release(Model model) {
		// 출고정보 가져오기
		List<ReleaseVO> list = mapper.releaseList();
		model.addAttribute("list", list);
		
		// 출고 담당자 이름 중복없이 가져오기
		List<String> nameList = mapper.releaseNameList();
		model.addAttribute("nameList", nameList);
		
		// 출고 제품 코드 중복없이 가져오기
		List<String> prod_codeList = mapper.releaseProd_codeList();
		model.addAttribute("prod_codeList", prod_codeList);
		
		// 주문 순번 중복없이 가져오기
		List<String> order_seqList = mapper.releaseOrder_seqList();
		model.addAttribute("order_seqList", order_seqList);
		
		// 주문, 주문 상세 테이블에 있는 제품 코드 중복없이 가져오기
		List<String> plusProd_codeList = mapper.releaseProd_codePlusList();
		model.addAttribute("plusProd_codeList", plusProd_codeList);
		
		// 주문, 주문 상세 테이블에 있는 주문 순번 중복없이 가져오기
		List<String> plusOrder_seqList = mapper.releasePlusOrder_seqList();
		model.addAttribute("plusOrder_seqList", plusOrder_seqList);
		
		// 주문, 주문 상세 테이블에 있는 제품 보관 장소 중복없이 가져오기
		List<String> plusProd_rackList = mapper.releasePlusProd_rackList();
		model.addAttribute("plusProd_rackList", plusProd_rackList);
		
	}

	
	
	
	
}
