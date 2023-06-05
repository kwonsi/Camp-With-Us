package team.project.camp.member.model.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import team.project.camp.member.model.service.NaverLoginService;
import team.project.camp.member.model.vo.Member;

@Slf4j
@Controller
@RequestMapping("/login")
public class NaverLoginController {

    @Autowired
    private NaverLoginService service;

    @GetMapping("/naverLoginSuccess")
    public String oauth( HttpServletRequest request,  HttpServletResponse response, HttpSession session) throws Exception {
       Map<String, String> userSession = new HashMap<>();
       Member loginMember = new Member();

       try {
          System.out.println("-------------------- oauth - start --------------------");

          loginMember = service.doAuth(request, response);

             if(loginMember.getMemberNickname() != null && !"".equals(loginMember.getMemberNickname())) {
                userSession.put("memberNickname", loginMember.getMemberNickname());
                userSession.put("memberTel", loginMember.getMemberTel());
	            userSession.put("memberEmail", loginMember.getMemberEmail());

	            session.setAttribute("loginMember", userSession);


             }else {
            	 return "redirect:/";
             }

          System.out.println("-------------------- oauth - end --------------------");

          return "redirect:/";
       } catch(Exception e){
          e.printStackTrace();
          throw e;
       }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {

    	session.invalidate();

    	log.info("로그아웃실행");

    	return "redirect:/";
    }
}
