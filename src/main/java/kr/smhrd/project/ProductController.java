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
    	public void product(Model model) {
		// 출고정보 가져오기
		List<ProductVO> Plist = mapper.productList();
		model.addAttribute("list", Plist);
	}
    // 비동기로 제품정보 가져옴	
    	@RequestMapping("/restProduct.do")
    	public @ResponseBody List<ProductVO> product() {
		// 출고정보 가져오기
		List<ProductVO> Rlist = mapper.productList();
		
		return Rlist;
	}
    	
    	
		@RequestMapping("/PsearchList.do")
		public @ResponseBody List<ProductVO> PsearchList(String search){
			
			System.out.println(search);
			List<ProductVO> list = mapper.PsearchList(search);
			
			return list;
		}
		// 추가 폼에서 주문 순번에 따라 제품 코드 다르게 나오도록
		@RequestMapping("/rackList.do")
		public List<String> prod_codeChange(String rack_seq) {
			List<String> rack_Change = mapper.rackList(rack_seq);
			return rack_Change;
		}
		// 출고 정보 검색 기능
		@RequestMapping("/ProductRelease.do")
		public @ResponseBody List<ProductVO> searchRelease(ProductVO ProductVO) {
			String start_r_date = ProductVO.getStart_r_date();
			String end_r_date = ProductVO.getEnd_r_date();
			String prod_name = ProductVO.getProd_name();
			String prod_code = ProductVO.getProd_code();
			String prod_rack = ProductVO.getProd_rack();
			
			// 입력된 값들만 조건식 써주기
			String productQuery = "";
			// 기간으로 조회하는 쿼리문
			if (start_r_date.isEmpty() == false && end_r_date.isEmpty() == false) { // 시작 날짜와 끝 날짜가 비어있지 않다면
				productQuery += " and date(prod_m_date) between '" + start_r_date + " 00:00:00' and '" + end_r_date + " 23:59:59'";
			} else if (start_r_date.isEmpty() == false) {
				productQuery += " and date(prod_m_date)  = '" + start_r_date + "'";
			} else if (end_r_date.isEmpty() == false) {
				productQuery += " and date(prod_m_date)  = '" + end_r_date + "'";
			}
			
			if (prod_name != null) { // 이름이 비어있지 않다면
				productQuery += "and prod_name = '" + prod_name + "'";
			}
			if (prod_code != null) { // 제품코드가 비어있지 않다면p
				productQuery += "and prod_code = '" + prod_code + "'";
			}
			if (prod_rack != null) { // 주문순번이 비어있지 않다면
				productQuery += "and prod_rack = '" + prod_rack +"'";
			}
			System.out.println("@@@@@@:"+productQuery);
			List<ProductVO> searchProduct = mapper.searchProductList(productQuery);
			return searchProduct;	
		}		
		
		
		@RequestMapping("/insertProduct.do")
		public @ResponseBody void insertProduct(ProductVO ProductVO) {
			String m_date = ProductVO.getProd_m_date();
			if (m_date.isEmpty()) { // 날짜가 비어있다면
				m_date = "sysdate()";
			} else {
				m_date = "'" + m_date + "'";
			}
     		ProductVO.setProd_m_date(m_date);
			mapper.insertProduct(ProductVO);
		}
		

		
		// 출고 정보 삭제 기능(비동기)
		@RequestMapping("/deleteProduct.do")
		public @ResponseBody void deleteProduct(String prod_code) {
			mapper.deleteProduct(prod_code);
		}
		
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
