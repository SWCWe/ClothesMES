package kr.smhrd.project;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import com.mysql.cj.Session;

import com.google.gson.reflect.TypeToken;


import kr.smhrd.entity.ConnectList;
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
	
	// 출고 테이블에 삽입할 데이터 가져오기
	@RequestMapping("/releaseInsertList.do")
	public @ResponseBody String releaseInsertList(int order_seq) {
		System.out.println("releaseInsertList " + order_seq);
		List<OrderVO> releaseInsertList = orderMapper.detailList(order_seq);
		
		// JSON으로 변환
		Gson gson = new Gson();
		JsonArray jArray = new JsonArray();
		
		Iterator<OrderVO> it = releaseInsertList.iterator(); // list의 반복자를 얻어,,?
		while (it.hasNext()) {                         // 리스트에 담긴 하나하나의 VO가 갖는 prod_code와 cnt를 추출해
			OrderVO orderVO = it.next();
			JsonObject object = new JsonObject();
			String prod_code = orderVO.getProd_code(); // 각각의 변수에 임시로 넣어두었다가
			int od_cnt = orderVO.getOd_cnt();
			int seq = orderVO.getOrder_seq();
			
			object.addProperty("prod_code", prod_code);     // jsonobject에 addproperty 메소드를 통해 추가하고
			object.addProperty("od_cnt", od_cnt);
			object.addProperty("order_seq", seq);			
			jArray.add(object);                        // 완성된 jsonobject를 jsonarray에 추가
		}
		
		String list = gson.toJson(jArray);
		return list;
	}
	
	// 출고 테이블에 데이터 삽입
	@RequestMapping(value = "/releaseInsert.do", method = RequestMethod.POST)
	public @ResponseBody int releaseInsert(@RequestParam String data) {
		// GSON을 이용해 다시 바꾸기
		Gson gson = new Gson();
		List<OrderVO> list = gson.fromJson(data.toString(), new TypeToken<ArrayList<OrderVO>>(){}.getType());
		System.out.println(list);
		
		// 데이터를 하나씩 꺼내서 삽입
		for (int i = 0; i < list.size(); i++) {
			orderMapper.releaseInsert(list.get(i));			
		}
		int order_seq = list.get(0).getOrder_seq();
		return order_seq;
	}
	
	// rack 위치 알림
	@RequestMapping("/findRack.do")
	public @ResponseBody List<String> findRack(int order_seq, HttpSession session) {
		List<String> rackList = orderMapper.findRack(order_seq);
		
		
		session.setAttribute("racks",rackList);
		
		System.out.println(rackList);
		
		return rackList;
	}
//	
//	@RequestMapping("/sendRack.do")
//	public @ResponseBody void sendRack(List<String> rack, Model model) {
//		
//	
//	
//	}
	

	
	@RequestMapping("/rack.do")
	public String rack1() {
		return "rack";
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
