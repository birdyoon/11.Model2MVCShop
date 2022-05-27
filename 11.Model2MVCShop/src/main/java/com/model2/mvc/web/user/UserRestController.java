package com.model2.mvc.web.user;

import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;


//==> 회원관리 RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method 구현 않음
		
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
		
	@RequestMapping( value="json/getUser/{userId}", method=RequestMethod.GET )
	public User getUser( @PathVariable String userId ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		
		//Business Logic
		return userService.getUser(userId);
	}

	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public User login(	@RequestBody User user,
									HttpSession session ) throws Exception{
	
		System.out.println("/user/json/login : POST");
		//Business Logic
		System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		
		return dbUser;
	}
	
	// id 중복체크
	@RequestMapping( value="json/checkId", method=RequestMethod.POST )
	public int checkId( @RequestParam("userId") String userId) throws Exception{
		int cnt = userService.checkId(userId);
		return cnt;
	}
	
	
	@RequestMapping(value = "/checkEmailAjax")
	public Map<String, String> sendMail(@RequestBody Map<String, String> map, HttpSession session) {

		System.out.println("/checkEmail.do에 들어옴");
		System.out.println("입력받은 email의 값 : " + map.get("email"));

		int random = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
		System.out.println("random의 값 : " + random);

		String joinCode = String.valueOf(random);
		System.out.println("joinCode의 값 : " + joinCode);

		session.setAttribute("joinCode", joinCode);

		String subject = "회원가입 인증 코드 입니다.";
		StringBuilder stringBuilder = new StringBuilder();
		stringBuilder.append("안녕하세요. '식온'입니다.\r귀하의 인증 코드는  <" + joinCode + "> 입니다.");
		System.out.println(stringBuilder.toString());

		boolean finishSend = this.userService.send(subject, stringBuilder.toString(), "TongAdmin", map.get("email"));
		System.out.println("성공이냐 실패냐 : " + finishSend);

		map.put("joinCode", joinCode);

		System.out.println(map);

		return map;
	}

	
	
	
	
	
}