package kr.smhrd.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import kr.smhrd.entity.ProductionVO;



@Mapper
public interface ProductionMapper {
	List<ProductionVO> prodList();
	
	List<String> Prod_codeList();
	List<String> NameList();
	
	void deleteprod(int m_seq);
	void insertmanufactureList(ProductionVO productionVO);
	
	List<ProductionVO> searchmanufactureList(String manufactureQuery);

	List<ProductionVO> manufactureChartData();
}