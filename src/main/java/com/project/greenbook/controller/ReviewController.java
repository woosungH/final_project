package com.project.greenbook.controller;

import com.project.greenbook.dto.ReviewDTO;
import com.project.greenbook.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Controller
public class ReviewController {
    @Autowired
    private ReviewService service;

    @RequestMapping("/review")   //리스트
    public String review(Model model) {
        ArrayList<ReviewDTO> review = service.review();
        model.addAttribute("review", review);

        int review_count = (int)service.review_count();
        double review_sum = (double)service.review_sum();
        double avg1 = review_sum/review_count;
        double avg = Math.round(avg1*10)/10.0;
        model.addAttribute("review_count",review_count);
        model.addAttribute("avg", avg);

        return "review";
    }

    @RequestMapping("/review_write") // 작성
    public String review_write(@RequestParam HashMap<String, String> param) {
        service.review_write(param);
        return "redirect:review";
    }

   /* @RequestMapping("/writeResult")
    public String writeResult(@RequestParam HashMap<String, String> param) {
        System.out.println("writeResult()");
        service.write(param);

        return "redirect:review";
    }*/
}

