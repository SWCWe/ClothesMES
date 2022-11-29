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

	public List<String> rackList(String rack_seq);

	public List<ProductVO> searchProductList(String productQuery);

	public void deleteProduct(String prod_code);

	public void insertProduct(ProductVO productVO);
	
}
