package com.project.greenbook.service;

import com.project.greenbook.dto.BookDTO;
import com.project.greenbook.dto.BookImgDTO;
import com.project.greenbook.dto.BookInfoDTO;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface BookService {

    public List bookId1();
    public List bookId2();
    public List bookId3();
    public List bookId4();
    public List bookId5();
    public int bookCount(HashMap<String, String> param);
    public List bookList(HashMap<String, String> param);
    public List bookImg(HashMap<String, String> param);
    public void register(MultipartFile uploadFile, HttpServletRequest request, HashMap<String, String> param);
    public void receiving(HashMap<String,String> param);
    public ArrayList<BookInfoDTO> bookInfoList(HashMap<String,String> param);
    public int countBookInfo();
    public ArrayList<BookImgDTO> bookImgList(HashMap<String,String> param);
    public BookImgDTO contentImg(String bookId);
    public BookInfoDTO contentInfo(String bookId);
    public void updateInfo(HashMap<String, String> param);
    public void updateImg(MultipartFile uploadFile, HttpServletRequest request, HashMap<String, String> param);
}
