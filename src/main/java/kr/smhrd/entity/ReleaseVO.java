package kr.smhrd.entity;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ReleaseVO {
	private int r_seq;         // 출고 순번
	private String prod_code;  // 제품 코드
	private String r_date;     // 출고 일자
	private int r_cnt;         // 출고 수량
	private int order_seq;     // 주문 순번
	private String emp_no;     // 출고 담당자  
	private String prod_rack;  // 제품 보관 장소
	private String name;       // 직원 이름

	// 기간 검색 기능
	private String start_r_date;     // 시작 일자
	private String end_r_date;     // 끝 일자
	
	private List<ReleaseVO> releaseVO;
}
