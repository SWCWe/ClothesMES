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
	// 주문 번호
	private int order_seq;
	// 주문 일자
	private String order_date;
	// 고객 아이디
	@NonNull private String cus_id;
	
}
