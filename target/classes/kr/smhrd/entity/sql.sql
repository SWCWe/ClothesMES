select * from t_product;

select * from t_release;

select * from t_member;

select * from t_manufacture;

 insert into t_manufacture(prod_code, prod_m_date, m_cnt, emp_no)
        values ('A-B-025', NOW(), 20,
        		
        		
        		select distinct f.emp_no
        		from t_manufacture f, t_member m 
        		where f.emp_no = m.emp_no