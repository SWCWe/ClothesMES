package kr.smhrd.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.entity.ReleaseVO;
import kr.smhrd.mapper.ReleaseMapper;

@Controller
public class ReleaseController {
	
	@Autowired
	private ReleaseMapper mapper;

	// 페이지 로드할 때 DB에서 데이터 가져오기
	@RequestMapping("/release.do")
	public String release(Model model) {
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
		
		return "release";
	}
	
	// 출고 정보 검색 기능(비동기)
	@RequestMapping("/searchRelease.do")
	public @ResponseBody String searchRelease(Model model) {
	
		List<ReleaseVO> searchReleaseList = mapper.searchReleaseList(releaseQuery);
		return "searchRelease";
	}
	
	
	
	
}
