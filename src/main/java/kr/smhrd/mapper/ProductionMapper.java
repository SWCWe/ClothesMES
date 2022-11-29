package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.entity.productionVO;

@Mapper
public interface ProductionMapper {

	public List<productionVO> productionList();
	
	public void productionInsert(productionVO vo);
}
