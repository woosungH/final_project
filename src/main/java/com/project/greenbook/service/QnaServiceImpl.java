package com.project.greenbook.service;

import com.project.greenbook.dao.QnaDAO;
import com.project.greenbook.dto.QnaDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@Service("QnaService")
public class QnaServiceImpl implements QnaService {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public ArrayList<QnaDTO> list() {
        QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
        ArrayList<QnaDTO> list = dao.list();
        return list;
    }
    @Override
    public void write(HashMap<String, String> param) {

        QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
        dao.write(param);


    }
    @Override
    public QnaDTO contentView(HashMap<String, String> param) {

        QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
        QnaDTO dto = dao.contentView(param);

        return dto;
    }

    @Override
    public void modify(HashMap<String, String> param) {

        QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
        dao.modify(param);
    }

    @Override
    public void delete(HashMap<String, String> param) {

        QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
        dao.delete(param);

    }

    @Override
    public void upHit(HashMap<String, String> param) {

        QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
        dao.upHit(param);
    }
    @Override
    public int countBookInfo() {
        System.out.println("QnaServiceImpl.countBookInfo() start");

        QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
        int count = dao.countBookInfo();

        System.out.println("QnaServiceImpl.countBookInfo() end");
        return count;
    }

}