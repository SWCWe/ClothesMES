package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import kr.smhrd.entity.OrderVO;

@Mapper
public interface OrderMapper {

	public List<OrderVO> orderList();

	// public void count(int order_seq);

	public OrderVO orderSelect(int order_seq);

	public List<OrderVO> searchOrderList(String orderQuery);

	public List<OrderVO> idSearch(String order);

	public List<OrderVO> detailList(int order_seq);

	public int statusUpdate(int order_seq);

	public List<String> findRack(int order_seq);

	public void releaseInsert(OrderVO orderVO);
	
	
}
