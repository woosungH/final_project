package com.project.greenbook.dao;

import com.project.greenbook.dto.ReviewDTO;

import java.util.ArrayList;
import java.util.HashMap;

public interface ReviewDAO {
    public ArrayList<ReviewDTO> review();
    public void review_write (HashMap<String, String> param);
    public void delete(HashMap<String, String> param);
    public int review_count();
    public int review_sum();
}
