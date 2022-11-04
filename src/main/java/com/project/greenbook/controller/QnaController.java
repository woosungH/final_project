package com.project.greenbook.controller;

import com.project.greenbook.dto.MemberDTO;
import com.project.greenbook.dto.Paging;
import com.project.greenbook.dto.QnaDto;
import com.project.greenbook.service.MemberServiceImpl;
import com.project.greenbook.service.QnaServiceImpl;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.print.Pageable;
import java.util.ArrayList;
import java.util.HashMap;

@Controller
public class QnaController {
    @Autowired
    private QnaServiceImpl service;
    @Autowired
    private MemberServiceImpl memberService;

    @RequestMapping("/list")
    public String list(@RequestParam HashMap<String,String>  param, Model model, @RequestParam(defaultValue = "1") int currentPage, @RequestParam(defaultValue = "qna_title") String searchOption){

        param.put("searchOption",searchOption);
        int startPage = (currentPage-1)*5;
        param.put("startPage", String.valueOf(startPage));
        ArrayList<QnaDto> list =service.qnaList(param);
        int total = service.countQna(param);

        model.addAttribute("list", list);
        model.addAttribute("list2",new Paging(total,currentPage, 5, 5));


        return "qna/list";
    }
    @RequestMapping("/write_view")
    public String write_view(HttpServletRequest request,@RequestParam HashMap<String,String> param, Model model){
        HttpSession session = request.getSession();
        String member_id = (String) session.getAttribute("member_id");
        param.put("member_id",member_id);
        ArrayList<MemberDTO> member = memberService.loginCheck(param);
        model.addAttribute("member",member);
        return "qna/write_view";
    }


    @RequestMapping("/write")
    public String write(@RequestParam HashMap<String, String> param) {
        System.out.println("write()");
        service.write(param);

        return "redirect:/list";
    }

    @RequestMapping("/content_view")
    public String content_view(@RequestParam HashMap<String, String> param, Model model) {
        service.upHit(param);
        QnaDto dto = service.contentView(param);
        model.addAttribute("content_view", dto);

        return "qna/content_view";
    }
    @RequestMapping("/modify_view")
    public String modify_view(@RequestParam HashMap<String, String> param, Model model) {
        service.upHit(param);
        QnaDto dto = service.modifyView(param);
        model.addAttribute("content_view", dto);

        return "qna/modify_view";
    }
    @RequestMapping("/reply_view")
    public String reply_view(@RequestParam HashMap<String, String> param, Model model) {
        service.upHit(param);
        QnaDto dto = service.replyView(param);
        model.addAttribute("content_view", dto);

        return "qna/reply_view";
    }

    @RequestMapping("/modify")
    public String modify(@RequestParam HashMap<String, String> param) {

        service.modify(param);

        return "redirect:/list";
    }
    @RequestMapping("/delete")
    public String delete(@RequestParam HashMap<String, String> param) {

        service.delete(param);
        return "redirect:/list";
    }


}
