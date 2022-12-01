package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.ToString;


@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class ProductionVO {
	// 생산 순번
	private int m_seq;
	// 제품 코드
	private String prod_code;
	// 생산 일자
	private String prod_m_date;
	// 생산 수량
	private int m_cnt;
	// 제품 담당자 사원번호
	private String emp_no;
	// 제품 담당자 이름 (사원 번호 대신 이름을 활용하기 위해 추가)
	private String name;
	
	// 기간 검색 기능
	private String start_r_date;     // 시작 일자
	private String end_r_date;     // 끝 일자
	
}
