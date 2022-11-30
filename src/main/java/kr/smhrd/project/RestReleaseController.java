package kr.smhrd.project;

import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kr.smhrd.entity.ReleaseVO;
import kr.smhrd.mapper.ReleaseMapper;

@RestController // 비동기 통신 방식 전용 컨트롤러
public class RestReleaseController {

	@Inject
	private ReleaseMapper mapper;
	
	// 출고 정보 검색 기능
	@RequestMapping("/searchRelease.do")
	public List<ReleaseVO> searchRelease(ReleaseVO releaseVO) {
		String start_r_date = releaseVO.getStart_r_date();
		String end_r_date = releaseVO.getEnd_r_date();
		String name = releaseVO.getName();
		String prod_code = releaseVO.getProd_code();
		int order_seq = releaseVO.getOrder_seq();
		
		// 입력된 값들만 조건식 써주기
		String releaseQuery = "";
		// 기간으로 조회하는 쿼리문
		if (start_r_date.isEmpty() == false && end_r_date.isEmpty() == false) { // 시작 날짜와 끝 날짜가 비어있지 않다면
			releaseQuery += "and date(r.r_date) between '" + start_r_date + " 00:00:00' and '" + end_r_date + " 23:59:59'";
		} else if (start_r_date.isEmpty() == false) {
			releaseQuery += "and date(r.r_date) = '" + start_r_date + "'";
		} else if (end_r_date.isEmpty() == false) {
			releaseQuery += "and date(r.r_date) = '" + end_r_date + "'";
		}
		
		if (name != null) { // 이름이 비어있지 않다면
			releaseQuery += "and m.name = '" + name + "'";
		}
		if (prod_code != null) { // 제품코드가 비어있지 않다면
			releaseQuery += "and r.prod_code = '" + prod_code + "'";
		}
		if (order_seq > 0) { // 주문순번이 비어있지 않다면
			releaseQuery += "and r.order_seq = " + order_seq;
		}
		
		List<ReleaseVO> searchRelease = mapper.searchReleaseList(releaseQuery);
		return searchRelease;	
	}
	
	// 출고 정보 추가 기능
	@RequestMapping("/insertRelease.do")
	public void insertRelease(ReleaseVO releaseVO) {
		String r_date = releaseVO.getR_date();
		if (r_date.isEmpty()) { // 날짜가 비어있다면
			r_date = "sysdate()";
		} else {
			r_date = "'" + r_date + "'";
		}
		releaseVO.setR_date(r_date);
		
		// 이름이 비어있다면 로그인 한 사람 이름 입력
		
		mapper.insertReleaseList(releaseVO);
	}
	
	// 출고 정보 불러오기 기능(비동기)
	@RequestMapping("/loadRelease.do")
	public List<ReleaseVO> loadRelease() {
		List<ReleaseVO> loadRelease = mapper.releaseList();
		return loadRelease;
	}
	
	// 출고 정보 삭제 기능(비동기)
	@RequestMapping("/deleteRelease.do")
	public void deleteRelease(int r_seq) {
		mapper.deleteReleaseList(r_seq);
	}
	
	// 추가 폼에서 주문 순번에 따라 제품 코드 다르게 나오도록
	@RequestMapping("/prod_codeChange.do")
	public List<String> prod_codeChange(int order_seq) {
		List<String> prod_codeChange = mapper.prod_codeChangeList(order_seq);
		return prod_codeChange;
	}
	
	// 추가 폼에서 제품 코드에 따라 주문 순번이 다르게 나오도록
	@RequestMapping("/order_seqChange.do")
	public List<String> order_seqChange(String prod_code) {
		List<String> order_seqChange = mapper.order_seqChangeList(prod_code);
		return order_seqChange;
	}
	
	// 비동기로 차트에 필요한 데이터 가져오기
	@RequestMapping("/loadChartRelease.do")
	public String loadChartRelease() {
		List<ReleaseVO> loadChart = mapper.releaseChartData();

		Gson gson = new Gson(); // json으로 가공하기 위해 gson 객체 생성
		JsonArray jArray = new JsonArray(); // json 형태로 여러개의 데이터를 담기 위해 jsonarray 객체 생성
		
		Iterator<ReleaseVO> it = loadChart.iterator(); // list의 반복자를 얻어,,?
		while (it.hasNext()) {                         // 리스트에 담긴 하나하나의 VO가 갖는 prod_code와 cnt를 추출해
			ReleaseVO chartVO = it.next();
			JsonObject object = new JsonObject();
			String prod_code = chartVO.getProd_code(); // 각각의 변수에 임시로 넣어두었다가
			int r_cnt = chartVO.getR_cnt();
			
			object.addProperty("Code", prod_code);     // jsonobject에 addproperty 메소드를 통해 추가하고
			object.addProperty("Count", r_cnt);
			jArray.add(object);                        // 완성된 jsonobject를 jsonarray에 추가
		}
		
		String loadChartRelease = gson.toJson(jArray);
		return loadChartRelease;
	}
	
	// 상위 n개 데이터 가져오기
	@RequestMapping("/releaseTop.do")
	public String releaseTop() {
		List<ReleaseVO> loadChart = mapper.releaseTopData();

		Gson gson = new Gson(); // json으로 가공하기 위해 gson 객체 생성
		JsonArray jArray = new JsonArray(); // json 형태로 여러개의 데이터를 담기 위해 jsonarray 객체 생성
		
		Iterator<ReleaseVO> it = loadChart.iterator(); // list의 반복자를 얻어,,?
		while (it.hasNext()) {                         // 리스트에 담긴 하나하나의 VO가 갖는 prod_code와 cnt를 추출해
			ReleaseVO chartVO = it.next();
			JsonObject object = new JsonObject();
			String prod_code = chartVO.getProd_code(); // 각각의 변수에 임시로 넣어두었다가
			int r_cnt = chartVO.getR_cnt();
			
			object.addProperty("Code", prod_code);     // jsonobject에 addproperty 메소드를 통해 추가하고
			object.addProperty("Count", r_cnt);
			jArray.add(object);                        // 완성된 jsonobject를 jsonarray에 추가
		}
		
		String releaseTop = gson.toJson(jArray);
		return releaseTop;
	}
	
	// 하위 n개 데이터 가져오기
	@RequestMapping("/releaseBottom.do")
	public String releaseBottom() {
		List<ReleaseVO> loadChart = mapper.releaseBottomData();

		Gson gson = new Gson(); // json으로 가공하기 위해 gson 객체 생성
		JsonArray jArray = new JsonArray(); // json 형태로 여러개의 데이터를 담기 위해 jsonarray 객체 생성
		
		Iterator<ReleaseVO> it = loadChart.iterator(); // list의 반복자를 얻어,,?
		while (it.hasNext()) {                         // 리스트에 담긴 하나하나의 VO가 갖는 prod_code와 cnt를 추출해
			ReleaseVO chartVO = it.next();
			JsonObject object = new JsonObject();
			String prod_code = chartVO.getProd_code(); // 각각의 변수에 임시로 넣어두었다가
			int r_cnt = chartVO.getR_cnt();
			
			object.addProperty("Code", prod_code);     // jsonobject에 addproperty 메소드를 통해 추가하고
			object.addProperty("Count", r_cnt);
			jArray.add(object);                        // 완성된 jsonobject를 jsonarray에 추가
		}
		
		String releaseBottom = gson.toJson(jArray);
		return releaseBottom;
	}
	
}
