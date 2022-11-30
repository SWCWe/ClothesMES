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
		String start_r_date = releaseVO.getStart_r_date();
		String end_r_date = releaseVO.getEnd_r_date();
		String name = releaseVO.getName();
		String prod_code = releaseVO.getProd_code();
		int order_seq = releaseVO.getOrder_seq();
		
		// 입력된 값들만 조건식 써주기
		String releaseQuery = "";
		// 기간으로 조회하는 쿼리문
		if (start_r_date.isEmpty() == false && end_r_date.isEmpty() == false) { // 시작 날짜와 끝 날짜가 비어있지 않다면
			releaseQuery += "and date(r.r_date) between '" + start_r_date + " 00:00:00' and '" + end_r_date + " 23:59:59'";
		} else if (start_r_date.isEmpty() == false) {
			releaseQuery += "and date(r.r_date) = '" + start_r_date + "'";
		} else if (end_r_date.isEmpty() == false) {
			releaseQuery += "and date(r.r_date) = '" + end_r_date + "'";
		}
		
		if (name != null) { // 이름이 비어있지 않다면
			releaseQuery += "and m.name = '" + name + "'";
		}
		if (prod_code != null) { // 제품코드가 비어있지 않다면
			releaseQuery += "and r.prod_code = '" + prod_code + "'";
		}
		if (order_seq > 0) { // 주문순번이 비어있지 않다면
			releaseQuery += "and r.order_seq = " + order_seq;
		}
		
		List<ReleaseVO> searchRelease = mapper.searchReleaseList(releaseQuery);
		return searchRelease;	
	}
	
	// 출고 정보 추가 기능
	@RequestMapping("/insertRelease.do")
	public void insertRelease(ReleaseVO releaseVO) {
		String r_date = releaseVO.getR_date();
		if (r_date.isEmpty()) { // 날짜가 비어있다면
			r_date = "sysdate()";
		} else {
			r_date = "'" + r_date + "'";
		}
		releaseVO.setR_date(r_date);
		
		// 이름이 비어있다면 로그인 한 사람 이름 입력
		
		mapper.insertReleaseList(releaseVO);
	}
	
	// 출고 정보 불러오기 기능(비동기)
	@RequestMapping("/loadRelease.do")
	public List<ReleaseVO> loadRelease() {
		List<ReleaseVO> loadRelease = mapper.releaseList();
		return loadRelease;
	}
	
	// 출고 정보 삭제 기능(비동기)
	@RequestMapping("/deleteRelease.do")
	public void deleteRelease(int r_seq) {
		mapper.deleteReleaseList(r_seq);
	}
	
	// 추가 폼에서 주문 순번에 따라 제품 코드 다르게 나오도록
	@RequestMapping("/prod_codeChange.do")
	public List<String> prod_codeChange(int order_seq) {
		List<String> prod_codeChange = mapper.prod_codeChangeList(order_seq);
		return prod_codeChange;
	}
	
	// 추가 폼에서 제품 코드에 따라 주문 순번이 다르게 나오도록
	@RequestMapping("/order_seqChange.do")
	public List<String> order_seqChange(String prod_code) {
		List<String> order_seqChange = mapper.order_seqChangeList(prod_code);
		return order_seqChange;
	}
	
}
