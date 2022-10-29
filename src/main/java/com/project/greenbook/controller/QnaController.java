package com.project.greenbook.controller;

import com.project.greenbook.dto.Paging;
import com.project.greenbook.dto.QnaDTO;
import com.project.greenbook.service.QnaServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.HashMap;

@Controller
public class QnaController {
    @Autowired
    private QnaServiceImpl service;

    @RequestMapping("/qna")
    public String list(@RequestParam HashMap<String,String>  param, Model model, @RequestParam(defaultValue = "1") int currentPage){
        ArrayList<QnaDTO> list =service.list();
        int total = service.countBookInfo();
        System.out.println("total = "+total);
        model.addAttribute("list2",new Paging(total,currentPage, 10, 5));
        model.addAttribute("list", list);
        return "qna/qna_list";
    }
    @RequestMapping("/write_view")
    public String write_view(Model model){
        return "qna/qna_write_view";
    }


    @RequestMapping("/write")
    public String write(@RequestParam HashMap<String, String> param) {
        System.out.println("write()");
        service.write(param);

        return "redirect:list";
    }

    @RequestMapping("/content_view")
    public String content_view(@RequestParam HashMap<String, String> param, Model model) {
        service.upHit(param);
        QnaDTO dto = service.contentView(param);
        model.addAttribute("content_view", dto);

        return "qna/qna_content_view";
    }

    @RequestMapping("/modify")
    public String modify(@RequestParam HashMap<String, String> param) {

        service.modify(param);

        return "redirect:list";
    }
    @RequestMapping("/delete")
    public String delete(@RequestParam HashMap<String, String> param) {

        service.delete(param);
        return "redirect:list";
    }

}
