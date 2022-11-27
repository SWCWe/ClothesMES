package kr.smhrd.project;

import java.util.List;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.smhrd.entity.ReleaseVO;
import kr.smhrd.mapper.ReleaseMapper;

@RestController // 비동기 통신 방식 전용 컨트롤러
public class RestReleaseController {

	@Inject
	private ReleaseMapper mapper;
	
	// 출고 정보 검색 기능
	@RequestMapping("/searchRelease.do")
	public List<ReleaseVO> searchRelease(ReleaseVO releaseVO) {
		String r_date = releaseVO.getR_date();
		String name = releaseVO.getName();
		String prod_code = releaseVO.getProd_code();
		int order_seq = releaseVO.getOrder_seq();
		
		String releaseQuery = "";
		if (r_date != null) {
			releaseQuery += "and r.r_date = " + r_date;
		}
		if (name != null) {
			releaseQuery += "and m.name = " + name;
		}
		if (prod_code != null) {
			releaseQuery += "and r.prod_code = " + prod_code;
		}
		if (order_seq > 0) {
			releaseQuery += "and r.order_seq = " + order_seq;
		}
		
		List<ReleaseVO> searchReleaseList = mapper.searchReleaseList(releaseQuery);
		return searchReleaseList;	
	}
	
	@RequestMapping("/searchReleaseList.do")
	public List<ReleaseVO> searchReleaseList() {
		List<ReleaseVO> searchReleaseList = mapper.releaseList();
		return searchReleaseList;
	}

	
}
