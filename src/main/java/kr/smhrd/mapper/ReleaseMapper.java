package kr.smhrd.mapper;

import java.util.List;

import kr.smhrd.entity.ReleaseVO;

public interface ReleaseMapper {

	List<ReleaseVO> releaseList();

	List<String> releaseNameList();

	List<String> releaseProd_codeList();

	List<String> releaseOrder_seqList();

	List<ReleaseVO> searchReleaseList(String releaseQuery);

	void insertReleaseList(ReleaseVO releaseVO);

	void deleteReleaseList(int r_seq);

	List<String> releaseProd_codePlusList();

	List<String> releasePlusOrder_seqList();

	List<String> releasePlusProd_rackList();

	List<String> prod_codeChangeList(int order_seq);

	List<String> order_seqChangeList(String prod_code);

}
