<<<<<<< HEAD
select * from t_product;

select * from t_release;

select * from t_member;

select * from t_manufacture;

 insert into t_manufacture(prod_code, prod_m_date, m_cnt, emp_no)
        values ('A-B-025', NOW(), 20,
        		
        		
        		select distinct f.emp_no
        		from t_manufacture f, t_member m 
        		where f.emp_no = m.emp_no
        		
        		select distinct prod_code
        from t_manufacture 
        
        select distinct m.name
        from t_manufacture f, t_member m
        where f.emp_no = m.emp_no
=======

select * from t_product



select * from t_product 
where date(prod_m_date) between '2022-07-01 00:00:00' and '2022-11-02 23:59:59'

delete from t_product where prod_code = 'A-B-005'

INSERT INTO t_product (prod_code, prod_name, prod_cnt, prod_m_date, prod_rack)
		VALUES ('A-B-026', '뽀글이', '300',NOW(),'E6');
>>>>>>> refs/remotes/origin/yeji
