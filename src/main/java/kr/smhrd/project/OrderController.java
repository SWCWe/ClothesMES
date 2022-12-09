package kr.smhrd.project;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.entity.OrderVO;
import kr.smhrd.entity.ProductVO;
import kr.smhrd.entity.ReleaseVO;
import kr.smhrd.mapper.OrderMapper;

@Controller
public class OrderController {
	@Autowired
	private OrderMapper orderMapper; // DB관련된 것은 mapper
	
	
	// 주문 정보 가져오기
	@RequestMapping("/order.do")
	public void order(Model model) {
		List<OrderVO> list = orderMapper.orderList();
		model.addAttribute("list", list);
		
	}
	 // 비동기로 주문정보 가져옴	
	@RequestMapping("/restorder.do")
	public @ResponseBody List<OrderVO> restOrder() {
	// 주문정보 가져오기
	List<OrderVO> Olist = orderMapper.orderList();
	
	return Olist;
}
	// 자동완성 아이디 검색
	@RequestMapping("/idSearch.do")
	public @ResponseBody List<OrderVO> searchOrder(String idSearch){
		
		System.out.println(idSearch);
		List<OrderVO> searchlist = orderMapper.idSearch(idSearch);
		
		return searchlist;
	}
	
	@RequestMapping("/searchOrder.do")
	public @ResponseBody List<OrderVO> searchOrder(OrderVO OrderVO) {
		String start_r_date = OrderVO.getStart_r_date();
		String end_r_date = OrderVO.getEnd_r_date();
		int order_seq = OrderVO.getOrder_seq();
		int od_status = OrderVO.getOd_status();
		System.out.println("시작 날짜: " + start_r_date);
		System.out.println("넘어온 데이터: " + OrderVO);
		System.out.println("주문 순번: " + order_seq);
		System.out.println("출고 상태: " + od_status);
	
		// 입력된 값들만 조건식 써주기
		String orderQuery = "";
		// 기간으로 조회하는 쿼리문
		if (start_r_date.isEmpty() == false && end_r_date.isEmpty() == false) { // 시작 날짜와 끝 날짜가 비어있지 않다면
			orderQuery += " and date(r.order_date) between '" + start_r_date + " 00:00:00' and '" + end_r_date + " 23:59:59' ";
		} else if (start_r_date.isEmpty() == false) {
			orderQuery += " and date(r.order_date) = '" + start_r_date + "' ";
		} else if (end_r_date.isEmpty() == false) {
			orderQuery += " and date(r.order_date) = '" + end_r_date + "' ";
		}
		
		
		if (od_status == 0) { // 출고 상태에 따라
			orderQuery += " and m.od_status = " + od_status;
		}else if (od_status == 1) {
			orderQuery += " and m.od_status = " + od_status;
		}else {
			orderQuery += " and m.od_status >= 0";
		}
		
		if (order_seq > 0) { // 주문순번이 비어있지 않다면
			orderQuery += " and m.order_seq = " + order_seq;
		}
		
		System.out.println(orderQuery);
		
		List<OrderVO> searchOrder = orderMapper.searchOrderList(orderQuery);
		return searchOrder;	
	}
	
	// 주문 상세 내역 페이지
	@RequestMapping("/orderDetail.do")
	public @ResponseBody List<OrderVO> orderDetail(int order_seq) {
		List<OrderVO> detailList = orderMapper.detailList(order_seq);
		System.out.println(detailList.get(0).getProd_code());
		return detailList;
	}
	
	// 주문 상태 업데이트
	@RequestMapping("/statusUpdate.do")
	public @ResponseBody int statusUpdate(int order_seq) {
		orderMapper.statusUpdate(order_seq);
		return order_seq;
	}
	
	// rack 위치 알림
	@RequestMapping("/findRack.do")
	public @ResponseBody List<String> findRack(int order_seq) {
		List<String> rackList = orderMapper.findRack(order_seq);
		return rackList;
	}
	
	@RequestMapping("/sendRack.do")
	public @ResponseBody void sendRack(OrderVO orderVO) {
		
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
