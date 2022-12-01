package kr.smhrd.project;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.smhrd.entity.ProductionVO;
import kr.smhrd.mapper.ProductionMapper;

@Controller
public class ProductionController {
	@Inject
	private ProductionMapper mapper;
	
	// 생산관리 페이지 DB에서 데이터 가져오기
	@RequestMapping("/production.do")
	public void prodList(Model model){
		
		// ProductionVO 에 있는 값들 리스트로 가져오기
		List<ProductionVO> list = mapper.prodList();
		model.addAttribute("list", list);
		
		// 생산 제품 코드 중복없이 가져오기
		// productionVO list로 생산제품 코드 가져오면 DB에 있는 제품코드 중복제거 안되고 전체로 나온다
		List<String> prod_codeList = mapper.Prod_codeList();
		model.addAttribute("prod_codeList", prod_codeList);
		
		// 생산 담당자 이름 중복없이 가져오기
		// productionVO list로 담당 사원 이름 가져오면 DB에 있는 사원 이름 중복제거 안되고 전체로 나온다
		List<String> nameList = mapper.NameList();
		model.addAttribute("nameList", nameList);		
		
	}
	
	// 생산 정보 불러오기 기능(비동기)
	@RequestMapping("/loadProd.do")
	@ResponseBody public List<ProductionVO> loadProd() {
		List<ProductionVO> loadProd = mapper.prodList();
		return loadProd;
	}
	
	// 생산 정보 추가 기능(비동기)
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
	
	// 생산순번을 이용하여 생산 정보 삭제 기능 (비동기)
	@RequestMapping("/deleteprod.do")
	@ResponseBody public void deleteprod(int m_seq) {
		mapper.deleteprod(m_seq);
	}
	
	// 생산 정보 검색 기능 (비동기)
	// (날짜, 제품 코드, 담당 사원) 을 이용하여 검색할수있도록
	@RequestMapping("/searchmanufacture.do")
	@ResponseBody public List<ProductionVO> searchmanufacture(ProductionVO productionVO) {
		String start_r_date = productionVO.getStart_r_date();
		String end_r_date = productionVO.getEnd_r_date();
		String prod_code = productionVO.getProd_code();
		String name = productionVO.getName();
		
		// 입력된 값들만 조건식 써주기
		String manufactureQuery = "";
		// 기간으로 조회하는 쿼리문
		// isEmpty() 는 value.length == 0; 을 return값으로 주고있다
		if (start_r_date.isEmpty() == false && end_r_date.isEmpty() == false) { // 시작 날짜와 끝 날짜가 비어있지 않다면
			manufactureQuery += "and date(f.prod_m_date) between '" + start_r_date + " 00:00:00' and '" + end_r_date + " 23:59:59'";
		} else if (start_r_date.isEmpty() == false) {
			manufactureQuery += "and date(f.prod_m_date) = '" + start_r_date + "'";
		} else if (end_r_date.isEmpty() == false) {
			manufactureQuery += "and date(f.prod_m_date) = '" + end_r_date + "'";
		}
		
		if (prod_code != null) { // 제품코드가 비어있지 않다면
			manufactureQuery += "and f.prod_code = '" + prod_code + "'";
		}
		if (name != null) { // 담당 사원 이 비어있지 않다면
			manufactureQuery += "and m.name = '" + name + "'";
		}
		
		List<ProductionVO> searchmanufacture = mapper.searchmanufactureList(manufactureQuery);
		return searchmanufacture;	
	}
	
}