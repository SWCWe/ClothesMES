
select * from t_product
delete from t_manufacture where emp_no=230
delete from t_member where emp_no=727

insert into t_member

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

delete * from t_order_detail

select count(*),emp_no,pw from t_member 
       where emp_no ='111' and pw = '111'

 INSERT INTO t_member (emp_no, pw, name, position, dept, emp_joindate)
		VALUES ('111', '111', '루키', '사원', '생산', NOW());

select m.order_seq, count(m.prod_code) all_cnt, r.order_date, r.cus_id, sum(m.od_status) od_status
        from t_order r, t_order_detail m
        where m.order_seq  = r.order_seq
        and od_status >= 0
        group by m.order_seq
        
        