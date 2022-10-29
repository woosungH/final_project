package com.project.greenbook.service;

import com.project.greenbook.dto.MemberDTO;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;

public interface MemberService {
    public ArrayList<MemberDTO> loginCheck(HashMap<String, String> param);
    public void logout(HttpSession session);
    public void signUp(HashMap<String, String> param);
    public void signIn(HashMap<String, String> param);

    public HashMap<String, Object> overlay(String id);

    public HashMap<String, Object> emoverlay(String email);
}
