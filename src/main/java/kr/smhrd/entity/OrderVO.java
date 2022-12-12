package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
@RequiredArgsConstructor // @NonNull이 붙은 필드만 초기화하는 생성자.
@NoArgsConstructor // 기본 생성자
@AllArgsConstructor
@Data
@ToString
public class OrderVO {
	// 주문 상세 순번
	private int od_seq;
	// 주문 번호
	private int order_seq;
	// 주문 일자
	private String order_date;
	// 고객 아이디
	@NonNull private String cus_id;
	
	private String prod_code;
	
	// 주문 수량
	private int od_cnt;
	
	// 주소
	private String od_address;

	// 출고 상태
	private int od_status;

	
	// 기간 검색 기능
	private String start_r_date;  // 시작 일자
	private String end_r_date;    // 끝 일자
	
	// 한 주문에서 주문한 제품 개수
	private int all_cnt;
	
	// 제품 이름
	private String prod_name;
	
	// 제품 위치
	private String prod_rack;
		
	
}
  