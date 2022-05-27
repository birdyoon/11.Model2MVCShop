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


//==> ȸ������ RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method ���� ����
		
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
	
	// id �ߺ�üũ
	@RequestMapping( value="json/checkId", method=RequestMethod.POST )
	public int checkId( @RequestParam("userId") String userId) throws Exception{
		int cnt = userService.checkId(userId);
		return cnt;
	}
	
	
	@RequestMapping(value = "/checkEmailAjax")
	public Map<String, String> sendMail(@RequestBody Map<String, String> map, HttpSession session) {

		System.out.println("/checkEmail.do�� ����");
		System.out.println("�Է¹��� email�� �� : " + map.get("email"));

		int random = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
		System.out.println("random�� �� : " + random);

		String joinCode = String.valueOf(random);
		System.out.println("joinCode�� �� : " + joinCode);

		session.setAttribute("joinCode", joinCode);

		String subject = "ȸ������ ���� �ڵ� �Դϴ�.";
		StringBuilder stringBuilder = new StringBuilder();
		stringBuilder.append("�ȳ��ϼ���. '�Ŀ�'�Դϴ�.\r������ ���� �ڵ��  <" + joinCode + "> �Դϴ�.");
		System.out.println(stringBuilder.toString());

		boolean finishSend = this.userService.send(subject, stringBuilder.toString(), "TongAdmin", map.get("email"));
		System.out.println("�����̳� ���г� : " + finishSend);

		map.put("joinCode", joinCode);

		System.out.println(map);

		return map;
	}

	
	
	
	
	
}