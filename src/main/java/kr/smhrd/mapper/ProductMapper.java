package kr.smhrd.mapper;

import java.util.List;


import kr.smhrd.entity.ProductVO;


public interface ProductMapper {




	
	public List<ProductVO> productList();

//	List<String> productNameList();
//
//	List<String> product_codeList();
//
//	List<String> lack_seqList();
	public List<ProductVO> PsearchList(String search);
	
}
