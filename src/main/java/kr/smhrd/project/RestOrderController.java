package kr.smhrd.project;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.smhrd.entity.OrderVO;
import kr.smhrd.mapper.OrderMapper;

@RestController
public class RestOrderController {

	@Inject
	private OrderMapper mapper;
	
	@RequestMapping("/restOrderList.do")
	public List<OrderVO> restOrderList() {
		List<OrderVO> list = mapper.orderList();
		return list;
	}
}
