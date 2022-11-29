package kr.smhrd.mapper;

import java.util.List;


import kr.smhrd.entity.ProductVO;


public interface ProductMapper {


<<<<<<< HEAD

	public void prodInsert(ProductDAO proddao);
=======
	public List<ProductVO> productList();
>>>>>>> refs/remotes/origin/jin

//	List<String> productNameList();
//
//	List<String> product_codeList();
//
//	List<String> lack_seqList();
	public List<ProductVO> PsearchList(String search);
	
}
