package kr.smhrd.project;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

import javax.inject.Inject;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.mapper.BoardMapper;
import lombok.AllArgsConstructor;
import lombok.Data;


@Data
@AllArgsConstructor
@Controller
public class BoardController extends HttpServlet {
	
	@Inject
	private BoardMapper mapper;
	
	
	@RequestMapping("/notice.do")
	public String notice() {
		return "notice";
	}
	
	
	@RequestMapping("/schedule.do")
	public String schedule() {
		return "schedule";
	}
	
	@RequestMapping("/notice_write.do")
	public String notice_write() {
		return "notice_write";
	}
	
	@RequestMapping("/notice_view.do")
	public String notice_view() {
		return "notice_view";
	}
	
	
	// 여기부터 손댐
	@RequestMapping("/input_product.do")
	public String input_product() {
		return "input_product";
	}
	
	@RequestMapping("/result_product.do")
	public void result(Model model) {
		
		System.out.println("들어몽");
		
		Scanner scanner;
		try {
			// ---------------------------------------------
			// (fileName 리스트에 txt.파일 이름 저장하기)
			int j = 2;
			String path = "C:\\Users\\aiSchool\\MachineLearning\\yolov5\\runs\\detect\\exp" + j + "\\labels"; 
			j++;
			File f = new File( path ); 
			File[] files = f.listFiles();
			// 파일 이름 들어있는 리스트
			ArrayList<String> fileName = new ArrayList<String>();
			// txt파일들의 옷 번호 들어있는 리스트
			ArrayList<String> txtName = new ArrayList<String>(); 
			// txt파일들의 정확도가 들어있는 리스트
			ArrayList<String> txtAcc = new ArrayList<String>(); 
			// 제품 코드 매칭 HashMap
			HashMap<String,String> map = new HashMap<>();
			
			int count = 0;
			for (int i = 0; i < files.length; i++) { 
				if ( files[i].isFile() ) { 
					count++; 
					fileName.add(files[i].getName());
					System.out.println( "파일 : " + files[i].getName() );
				} 
				else { 
					System.out.println( "디렉토리명 : " + files[i].getName() ); 
				} 
			}
			
			
			System.out.println("txt파일 개수 : " + count);
			
			// 특정 txt파일의 옷 번호와 정확도 저장하기 위한 절차
			for(int k = count - 1; k >= 0; k--) {
				
				scanner = new Scanner(new File("C:\\Users\\aiSchool\\MachineLearning\\yolov5\\runs\\detect\\exp2\\labels\\" + fileName.get(k)));
				
				while (scanner.hasNextLine()) {
					String str = scanner.nextLine();
					System.out.println(str);
					
					// 파일 공백 구분 코드
					// 제품 코드 명, 정확도 추출
					
					// HashMap
					map.put("0","A-B-001"); map.put("1","A-B-002"); map.put("2","A-B-003"); map.put("3","A-B-004"); map.put("4","A-B-005");
					map.put("5","A-B-006"); map.put("6","A-B-007"); map.put("7","A-B-008"); map.put("8","A-B-009"); map.put("9","A-B-010");
					map.put("10","A-B-011"); map.put("11","A-B-012"); map.put("12","A-B-013"); map.put("13","A-B-014"); map.put("14","A-B-015");
					map.put("15","A-B-016"); map.put("16","A-B-017"); map.put("17","A-B-018"); map.put("18","A-B-019"); map.put("19","A-B-020");
					map.put("20","A-B-021"); map.put("21","A-B-022"); map.put("22","A-B-023"); map.put("23","A-B-024"); map.put("24","A-B-025");
					
					String prod_num = str.split(" ")[0];
					String prod_code = map.get(prod_num);
					txtName.add(prod_code);
					String word2 = str.split(" ")[5];
					txtAcc.add(word2);
					System.out.println(prod_code);
					System.out.println(word2);
					
					mapper.put_product(prod_code);
					
				}
			
			}
			
			model.addAttribute("fileName", fileName);
			model.addAttribute("txtName", txtName);
			model.addAttribute("txtAcc", txtAcc);
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
}