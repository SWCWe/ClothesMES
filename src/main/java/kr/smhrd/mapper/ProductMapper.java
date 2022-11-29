package kr.smhrd.mapper;

import java.util.List;

import kr.smhrd.entity.ProductDAO;

public interface ProductMapper {

	public List<ProductDAO> product_list();


	public void prodInsert(ProductDAO proddao);

	
}
