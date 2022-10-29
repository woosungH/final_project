package com.project.greenbook.dao;

import com.project.greenbook.dto.BookDTO;
import com.project.greenbook.dto.BookImgDTO;
import com.project.greenbook.dto.BookInfoDTO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface BookDAO {

    public List bookId1();
    public List bookId2();
    public List bookId3();
    public List bookId4();
    public List bookId5();
    public int bookCount(HashMap<String, String> param);
    public List bookList(HashMap<String, String> param);
    public List bookImg(HashMap<String, String> param);
    public BookDTO contentView(HashMap<String, String> param);
    public void register(HashMap<String, String> param);
    public void registerImg(HashMap<String, String> param);
    public int getMaxId();
    public void receiving();
    public ArrayList<BookInfoDTO> bookInfoList(HashMap<String,String> param);
    public int countBookInfo();
    public ArrayList<BookImgDTO> bookImgList(HashMap<String, String> param);
    public BookImgDTO contentImg(String bookId);
    public BookInfoDTO contentInfo(String bookId);
    public void updateInfo(HashMap<String, String> param);
    public void updateImg(HashMap<String, String> param);
}
