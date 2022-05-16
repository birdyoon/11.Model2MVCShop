package com.model2.mvc.web.kakao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.service.kakao.KakaoLoginService;
@Controller

public class KakaoController {

	@Autowired
	private KakaoLoginService kl;
	
	@RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
		
			System.out.println("#########" + code);
			String access_Token = kl.getAccessToken(code);
			
			HashMap<String, Object> userInfo = kl.getUserInfo(access_Token);
			System.out.println("###access_Token#### : " + access_Token);
			System.out.println("###nickname#### : " + userInfo.get("nickname"));
			System.out.println("###email#### : " + userInfo.get("email"));
			
			
			return "redirect:/main.jsp";
			
	//		 * 404�� ���� ���� �߿��Ѱ� #########�����ڵ� �� �� ����� �Ǵ����� �߿��ϹǷ� �ʹ� �Ű� �Ⱦ��ŵ� �˴ϴ�.
			
	    	}
}

