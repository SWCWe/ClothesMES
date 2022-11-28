package kr.smhrd.project;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.entity.OrderDetailVO;
import kr.smhrd.entity.OrderVO;
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
