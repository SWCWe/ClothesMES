package kr.smhrd.project;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.entity.OrderVO;
import kr.smhrd.entity.ReleaseVO;
import kr.smhrd.mapper.OrderMapper;

@Controller
public class OrderController {
	@Autowired
	private OrderMapper orderMapper; // DB관련된 것은 mapper
	
	@RequestMapping("/order.do")
	public void order(Model model) {
		List<OrderVO> list = orderMapper.orderList();
		model.addAttribute("list", list);
		System.out.println("완료2");
	}
	
	
	
	@RequestMapping("/searchOrder.do")
	public @ResponseBody List<OrderVO> searchOrder(OrderVO OrderVO) {
		String start_r_date = OrderVO.getStart_r_date();
		String end_r_date = OrderVO.getEnd_r_date();
		int order_seq = OrderVO.getOrder_seq();
		String prod_code = OrderVO.getProd_code();
		//String name = OrderVO.getsearch();
		
		
		
		// 입력된 값들만 조건식 써주기
		String orderQuery = "";
		// 기간으로 조회하는 쿼리문
		if (start_r_date.isEmpty() == false && end_r_date.isEmpty() == false) { // 시작 날짜와 끝 날짜가 비어있지 않다면
			orderQuery += "and date(r.order_date) between '" + start_r_date + " 00:00:00' and '" + end_r_date + " 23:59:59'";
		} else if (start_r_date.isEmpty() == false) {
			orderQuery += "and date(r.order_date) = '" + start_r_date + "'";
		} else if (end_r_date.isEmpty() == false) {
			orderQuery += "and date(r.order_date) = '" + end_r_date + "'";
		}
		
		
		if (prod_code != null) { // 제품코드가 비어있지 않다면
			orderQuery += "and r.prod_code = '" + prod_code + "'";
		}
		if (order_seq > 0) { // 주문순번이 비어있지 않다면
			orderQuery += "and r.order_seq = " + order_seq;
		}
		
		List<OrderVO> searchOrder = orderMapper.searchOrderList(orderQuery);
		return searchOrder;	
	}
	
// 주문 상세내역 페이지
//	@RequestMapping("/order_view.do")
//	public void order_view(int order_seq, Model model) {
//		// orderMapper.count(order_seq);
//		OrderDetailVO odvo = orderMapper.orderSelect(order_seq);
//		model.addAttribute("odvo", odvo);
//	}

	
//	// order.do 보여주기만 함.	
//	@RequestMapping("/order.do")
//	public String order() {
//		System.out.println("완료1");
//		return "order";
//	}
	
	
}
