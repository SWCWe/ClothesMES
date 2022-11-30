package kr.smhrd.project;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.entity.ProductionVO;
import kr.smhrd.entity.ReleaseVO;
import kr.smhrd.mapper.ProductionMapper;

@Controller
public class ProductionController {

	@Inject
	private ProductionMapper mapper;
	
	// 생산관리 페이지 DB에서 데이터 가져오기
	@RequestMapping("/production.do")
	public void prodList(Model model){
		List<ProductionVO> list = mapper.prodList();
		
		model.addAttribute("list", list);
	}
	
	// 생산 정보 불러오기 기능(비동기)
	@RequestMapping("/loadProd.do")
	@ResponseBody public List<ProductionVO> loadProd() {
		List<ProductionVO> loadProd = mapper.prodList();
		return loadProd;
	}
	
	// 생산 정보 추가 기능
	@RequestMapping("/insertmanufacture.do")
	@ResponseBody public void insertmanufacture(ProductionVO productionVO) {
			String m_date = productionVO.getProd_m_date();
			if (m_date.isEmpty()) { // 날짜가 비어있다면
				m_date = "sysdate()";
			} else {
				m_date = "'" + m_date + "'";
			}
			productionVO.setProd_m_date(m_date);
			mapper.insertmanufactureList(productionVO);
		}
	
	
	@RequestMapping("/deleteprod.do")
	@ResponseBody public void deleteprod(int m_seq) {
		mapper.deleteprod(m_seq);
	}
	
	// 출고 정보 검색 기능
	@RequestMapping("/searchmanufacture.do")
	@ResponseBody public List<ProductionVO> searchmanufacture(ProductionVO productionVO) {
		String start_r_date = productionVO.getStart_r_date();
		String end_r_date = productionVO.getEnd_r_date();
		String prod_code = productionVO.getProd_code();
		int m_seq = productionVO.getM_seq();
		
		// 입력된 값들만 조건식 써주기
		String releaseQuery = "";
		// 기간으로 조회하는 쿼리문
		if (start_r_date.isEmpty() == false && end_r_date.isEmpty() == false) { // 시작 날짜와 끝 날짜가 비어있지 않다면
			releaseQuery += "and date(f.prod_m_date) between '" + start_r_date + " 00:00:00' and '" + end_r_date + " 23:59:59'";
		} else if (start_r_date.isEmpty() == false) {
			releaseQuery += "and date(f.prod_m_date) = '" + start_r_date + "'";
		} else if (end_r_date.isEmpty() == false) {
			releaseQuery += "and date(f.prod_m_date) = '" + end_r_date + "'";
		}
		
		if (prod_code != null) { // 제품코드가 비어있지 않다면
			releaseQuery += "and f.prod_code = '" + prod_code + "'";
		}
		if (m_seq > 0) { // 생산 순번 이 비어있지 않다면
			releaseQuery += "and f.m_seq = " + m_seq;
		}
		
		List<ProductionVO> searchmanufacture = mapper.searchmanufactureList(releaseQuery);
		return searchmanufacture;	
	}
	


}
