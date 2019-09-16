package rat.blue.the;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class HomeController {
	
//	@RequestMapping(value = "/login")
//	public String home() {
//		return "login";
//	}
//	
	
	ListBean[] list = new ListBean[2];
	public HomeController() {
		list[0] = new ListBean(1, "조");
		list[1] = new ListBean(2, "아이쓰캡");
	}
	
	@RequestMapping("/")
	public String home(HttpServletRequest req) {
		req.setAttribute("list", list);
		return "board";
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest req) {
		String txt = req.getParameter("txt");
		int size = list.length;
		ListBean[] temp = new ListBean[size + 1];
		for(int i = 0; i < size; i ++) {
			temp[i] = list[i];
		}
		temp[size] = new ListBean(temp.length, txt);
		list = temp;
		return "redirect:/";
	}
	
	@RequestMapping("/update")
	public String update(HttpServletRequest req) {
		String index = req.getParameter("index");
		String txt = req.getParameter("txt");
		list[Integer.parseInt(index)].setTxt(txt);
		return "redirect:/";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest req) {
		int index = Integer.parseInt(req.getParameter("index"));
		int size = list.length;
		ListBean[] temp = new ListBean[size - 1];
		int tempIndex = 0;
		for(int i = 0; i < size; i ++) {
			if(index == i) continue;
			temp[tempIndex++] = list[i];
		}
		list = temp;
		return "redirect:/";
	}
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home() {
//		return "home";
//	}
//	
//	@RequestMapping(value = "/", method = RequestMethod.POST)
//	public String file(MultipartFile file) {
//		System.out.println(file.getOriginalFilename());
//		
//		try {
//			byte[] data =  file.getBytes(); //전송했던 파일 안의 내용물. 데이터가 꺼내짐
//			String path = "D:\\IDE\\workspace2\\20190905\\src\\main\\webapp\\resources\\upload";
//			File f = new File(path); //경로 넣기 <ㄱ
//			
//			
////			InputStream is = file.getInputStream();
////			InputStreamReader isr = new InputStreamReader(is);
////			BufferedReader br = new BufferedReader(isr);
////			StringBuilder sb = new StringBuilder();
////			String txt = "";
////			String result = "";
////			while((txt = br.readLine()) !=null) result += txt + "\n";
////			System.out.println(result);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return "home";
//	}
//	
//	
}
