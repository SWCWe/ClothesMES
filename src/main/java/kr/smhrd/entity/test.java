package kr.smhrd.entity;

import org.springframework.beans.factory.annotation.Autowired;

import lombok.Data;

@Data
public class test {
	
	private String prod_code;
	// 제품이름

    private String prod_name;
	// 제품 생산 수량
	private int prod_cnt;
	// 제품 생산 날짜
	private String prod_m_date;
	// 제품 보관 장소
	private String prod_rack;
	
	public String getProd_code() {
		return prod_code;
	}
	public void setProd_code(String prod_code) {
		this.prod_code = prod_code;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public int getProd_cnt() {
		return prod_cnt;
	}
	public void setProd_cnt(int prod_cnt) {
		this.prod_cnt = prod_cnt;
	}
	public String getProd_rack() {
		return prod_rack;
	}
	public void setProd_rack(String prod_rack) {
		this.prod_rack = prod_rack;
	}
	public String getProd_m_date() {
		return prod_m_date;
	}
	public void setProd_m_date(String prod_m_date) {
		this.prod_m_date = prod_m_date;
	}
}
