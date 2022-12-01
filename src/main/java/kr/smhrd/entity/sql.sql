
select * from t_product



select * from t_product 
where date(prod_m_date) between '2022-07-01 00:00:00' and '2022-11-02 23:59:59'

delete from t_product where prod_code = 'A-B-005'

INSERT INTO t_product (prod_code, prod_name, prod_cnt, prod_m_date, prod_rack)
		VALUES ('A-B-026', '뽀글이', '300',NOW(),'E6');
		
		 select m.od_seq, r.order_seq , m.prod_code, m.od_cnt, r.order_date, r.cus_id  
        from t_order r, t_order_detail m
        where m.order_seq  = r.order_seq
        
 select m.od_seq, r.order_seq , m.prod_code, m.od_cnt, r.order_date, r.cus_id  
        from t_order r, t_order_detail m
        where m.order_seq  = r.order_seq
        
select count(*) from t_member where emp_no = '138'

where emp_no='138' and pw='123'

select * from t_member


 INSERT INTO t_member (emp_no, pw, name, position, dept, emp_joindate)
		VALUES ('111', '111', '루키', '사원', '생산', NOW());