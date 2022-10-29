package com.project.greenbook.controller;

import com.project.greenbook.dto.MemberDTO;
import com.project.greenbook.service.MemberService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;

@Controller
@Log4j
public class MemberController {
    @Autowired
    private MemberService memberService;

    @RequestMapping("/login")
    public String login() {

        return "member/login";
    }


    @RequestMapping("/logincheck")
    public String logincheck() {

        return "member/logincheck";
    }

    @RequestMapping("/loginCheck")
    public String loginCheck(@RequestParam HashMap<String, String> param, Model model) {

        ArrayList<MemberDTO> dtos = memberService.loginCheck(param);
        String pw = param.get("member_pwd");

        if (dtos.isEmpty()) {
            return "redirect:login";
        } else {
            if (pw.equals(dtos.get(0).getMember_pwd())) {
                model.addAttribute("member_id", param.get("member_id"));
                return "redirect:loginOk";

            }
            return "redirect:login";
        }
    }

    @RequestMapping("/loginOk")
    public String loginOk(@RequestParam HashMap<String, String> param, Model model) {
        model.addAttribute("member_id", param.get("member_id"));

        return "member/login_ok";
    }
    @RequestMapping("/logout")
    public ModelAndView logout(HttpSession session, ModelAndView mav) {
        memberService.logout(session);
        mav.setViewName("member/login");
        mav.addObject("message", "logout");
        return mav;
    }

    @RequestMapping("/signUp")
    public String signUp() {

        return "member/signup";
    }

    @RequestMapping("/signUpOk")
    public String signUpOk(@RequestParam HashMap<String, String> param, Model model) {
        memberService.signUp(param);

        return "redirect:login";
    }

    @RequestMapping("/mypage")
    public String myPage() {
        return "member/mypage";
    }

    //아이디 중복확인
    @RequestMapping(value = "/member/overlay",  method = RequestMethod.POST)
    public @ResponseBody HashMap<String, Object> overlay(Model model, @RequestParam String id) {
        log.info("고객이 입력한 아이디 : "+id);
        return memberService.overlay(id);
    }

    //이메일 중복확인
    @RequestMapping(value = "/member/emoverlay",  method = RequestMethod.POST)
    public @ResponseBody HashMap<String, Object> emoverlay( Model model, @RequestParam String email) {
        log.info("고객이 입력한 이메일 : "+ email);
        return memberService.emoverlay(email);
    }


}
