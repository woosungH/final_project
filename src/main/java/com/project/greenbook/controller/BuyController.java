package com.project.greenbook.controller;

import com.project.greenbook.dto.BuyDTO;
import com.project.greenbook.service.BuyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;

@Controller
public class BuyController {
    @Autowired
    private BuyService service;

    @RequestMapping("/order")
    public String index(Model model) {

        ArrayList<BuyDTO> cart = service.cart();
        model.addAttribute("cart", cart);

        return "/buy/order";
    }

    @RequestMapping("/cart")
    public String cart(Model model) {
        System.out.println("BuyController.cart() start");
        ArrayList<BuyDTO> cart = service.cart();
        model.addAttribute("cart", cart);
        System.out.println("BuyController.cart() end");
        return "/buy/cart";
    }

    @RequestMapping("/cartAdd")
    public String cartAdd(@RequestParam HashMap<String, String> param){
        System.out.println("cart add@@@@@@@@@@@@");
        service.cartAdd(param);
        System.out.println("cart add_end@@@@@@@@@@@@");
        return "redirect:cart";
    }

    @RequestMapping("/cartCountUpdate")
    public String cartCountUpdate(@RequestParam HashMap<String, String> param, Model model) {
        System.out.println("수정시자ㅏ아ㅏ아아아아ㅏ아ㅏ악");
        service.cartCountUpdate(param);
        System.out.println("수정끄으으으ㅡ으으으으으읕");
        return "redirect:cart";
    }


    @RequestMapping("/cancel")
    public String cancel(@RequestParam HashMap<String, String> param, Model model) {
        System.out.println("@@@cancel");
        service.cancel(param);

        return "redirect:cart";
    }

    @RequestMapping("/kakaoPay")
    public String kakaoPay(HttpServletRequest req,Model model) {
        String addr = req.getParameter("addr1")+req.getParameter("addr2");
        model.addAttribute("addr",addr);

        return "/buy/kakaoPay";
    }

    @RequestMapping("/buy_ok")
    public String buy_ok() {
        return "/buy/buy_ok";
    }
}
