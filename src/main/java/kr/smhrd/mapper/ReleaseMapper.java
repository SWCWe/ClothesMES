package kr.smhrd.mapper;

import java.util.List;

import kr.smhrd.entity.ReleaseVO;

public interface ReleaseMapper {

	List<ReleaseVO> releaseList();

	List<String> releaseNameList();

	List<String> releaseProd_codeList();

	List<String> releaseOrder_seqList();

	List<ReleaseVO> searchReleaseList(String releaseQuery);

}
