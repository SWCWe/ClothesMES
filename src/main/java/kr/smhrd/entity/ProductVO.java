package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ProductVO {

	
	private String prod_code;  // 제품 코드
	private String prod_name;  // 제품 이름
	private int prod_cnt;      // 제품 수량	
	private String prod_m_date;     //제조 일자 
	private String prod_rack;  // 제품 보관 장소
	
}
