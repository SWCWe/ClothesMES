
select * from t_product



select * from t_product 
where date(prod_m_date) between '2022-07-01 00:00:00' and '2022-11-02 23:59:59'

delete from t_product where prod_code = 'A-B-005'

INSERT INTO t_product (prod_code, prod_name, prod_cnt, prod_m_date, prod_rack)
		VALUES ('A-B-026', '뽀글이', '300',NOW(),'E6');
		
delete from t_release where r_seq=76