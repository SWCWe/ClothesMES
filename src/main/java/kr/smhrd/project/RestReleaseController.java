package kr.smhrd.project;

import java.util.List;

import javax.inject.Inject;

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
		
		// 입력된 값들만 조건식 써주기
		String releaseQuery = "";
		if (r_date.isEmpty() == false) { // 날짜가 비어있지 않다면
			releaseQuery += "and date(r.r_date) = '" + r_date + "'";
		}
		if (name != null) {
			releaseQuery += "and m.name = '" + name + "'";
		}
		if (prod_code != null) {
			releaseQuery += "and r.prod_code = '" + prod_code + "'";
		}
		if (order_seq > 0) {
			releaseQuery += "and r.order_seq = " + order_seq;
		}
		
		System.out.println("쿼리" + releaseQuery);
		
		List<ReleaseVO> searchRelease = mapper.searchReleaseList(releaseQuery);
		return searchRelease;	
	}
	
	// 출고 정보 추가 기능
	@RequestMapping("/insertRelease.do")
	public List<ReleaseVO> insertRelease(ReleaseVO releaseVO) {
		
		List<ReleaseVO> insertRelease = mapper.insertReleaseList(releaseVO);
		return insertRelease;
	}
	
	// 출고 정보 불러오기 기능(비동기)
	@RequestMapping("/loadRelease.do")
	public List<ReleaseVO> loadRelease() {
		List<ReleaseVO> loadRelease = mapper.releaseList();
		return loadRelease;
	}
	
}
