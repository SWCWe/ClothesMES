package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@Data
@NoArgsConstructor
@ToString
public class ProductDAO {

	private String prod_code;
	
	private String prod_name;
	
	private int prod_cnt;
	
	private String prod_m_date;
	
	private String prod_rack;

}
