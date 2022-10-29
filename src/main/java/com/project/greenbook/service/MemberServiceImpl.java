package com.project.greenbook.service;

import com.project.greenbook.dao.MemberDAO;
import com.project.greenbook.dto.MemberDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;

@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    private SqlSession sqlSession;


    @Override
    public ArrayList<MemberDTO> loginCheck(HashMap<String, String> param) {
        MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
        ArrayList<MemberDTO> dtos = dao.loginCheck(param);

        return dtos;
    }

    @Override
    public void logout(HttpSession session) {
        session.invalidate(); // 세션 초기화
    }

    @Override
    public void signUp(HashMap<String, String> param) {
        MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
        dao.signUp(param);
    }

    @Override
    public void signIn(HashMap<String, String> param) {
        MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
        dao.signIn(param);
    }

    // 아이디 중복 검사
    @Override
    public HashMap<String, Object> overlay(String id) {
        MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
        HashMap<String, Object> map = new HashMap<String, Object>();
        int use = dao.overlay(id);
        map.put("use", use); //아이디가 존재하면 1, 없으면 0
        return map;
    }

    // 이메일 중복 검사
    @Override
    public HashMap<String, Object> emoverlay(String email)  {
        MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
        HashMap<String, Object> map = new HashMap<String, Object>();
        int use2 = dao.emoverlay(email);
        map.put("use2", use2); //이메일이 존재하면 1, 없으면 0
        return map;
    }
}
