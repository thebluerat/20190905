package rat.blue.the;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;

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
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String file(MultipartFile file) {
		System.out.println(file.getOriginalFilename());
		
		try {
			byte[] data =  file.getBytes(); //전송했던 파일 안의 내용물. 데이터가 꺼내짐
			String path = "D:\\IDE\\workspace2\\20190905\\src\\main\\webapp\\resources\\upload";
			File f = new File(path); //경로 넣기 <ㄱ
			
			
//			InputStream is = file.getInputStream();
//			InputStreamReader isr = new InputStreamReader(is);
//			BufferedReader br = new BufferedReader(isr);
//			StringBuilder sb = new StringBuilder();
//			String txt = "";
//			String result = "";
//			while((txt = br.readLine()) !=null) result += txt + "\n";
//			System.out.println(result);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "home";
	}
	
	
}
