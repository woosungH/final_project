package com.project.greenbook.service;

import com.project.greenbook.dto.QnaDTO;
import java.util.ArrayList;
import java.util.HashMap;

public interface QnaService {
    public ArrayList<QnaDTO> list();
    public  void  write(HashMap<String, String> param);
    public QnaDTO contentView(HashMap<String, String> param);
    public void modify(HashMap<String, String> param);
    public void delete(HashMap<String, String> param);
    public void upHit(HashMap<String, String> param);
    public int countBookInfo();

}
