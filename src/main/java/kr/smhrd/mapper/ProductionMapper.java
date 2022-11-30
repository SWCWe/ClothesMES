package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.entity.ReleaseVO;
import kr.smhrd.entity.ProductionVO;

@Mapper
public interface ProductionMapper {

	List<ProductionVO> prodList();
	
	void deleteprod(int m_seq);

	void insertmanufactureList(ProductionVO productionVO);
	
	List<ProductionVO> searchmanufactureList(String releaseQuery);


}
