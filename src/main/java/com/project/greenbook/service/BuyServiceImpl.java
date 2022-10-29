package com.project.greenbook.service;

import com.project.greenbook.dao.BuyDAO;
import com.project.greenbook.dto.BuyDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@Service
public class BuyServiceImpl implements BuyService{
    @Autowired
    private SqlSession sqlSession;

    @Override
    public ArrayList<BuyDTO> cart() {
        System.out.println("BuyServiceImpl.cart() start");

        BuyDAO dao = sqlSession.getMapper(BuyDAO.class); // getMapper() 메서드를 사용해서, 호출한 뒤에, 값을 dao에 대입
        ArrayList<BuyDTO> cart = dao.cart();

        System.out.println("BuyServiceImpl.cart() end");
        return cart;
    }

    @Override
    public void cartAdd(HashMap<String, String> param) {

        BuyDAO dao = sqlSession.getMapper(BuyDAO.class);
        dao.cartAdd(param);
    }

    @Override
    public void cartCountUpdate(HashMap<String, String> param) {
        BuyDAO dao = sqlSession.getMapper(BuyDAO.class);
        dao.cartCountUpdate(param);
    }

    @Override
    public void cancel(HashMap<String, String> param) {
        BuyDAO dao = sqlSession.getMapper(BuyDAO.class);
        dao.cancel(param);
    }
}
