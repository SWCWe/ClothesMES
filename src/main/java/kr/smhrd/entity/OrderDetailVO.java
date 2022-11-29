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
public class OrderDetailVO {
	// 주문 상세내역 번호
	private int od_seq;
	// 주문 번호
	private int order_Seq;
	// 제품 코드
	private String prod_code;
	// 주문 수량
	private int od_cnt;
}
