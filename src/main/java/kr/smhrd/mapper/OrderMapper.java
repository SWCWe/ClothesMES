package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.entity.OrderDetailVO;
import kr.smhrd.entity.OrderVO;

@Mapper
public interface OrderMapper {

	public List<OrderVO> orderList();

	// public void count(int order_seq);

	public OrderVO orderSelect(int order_seq);
	
	
}
