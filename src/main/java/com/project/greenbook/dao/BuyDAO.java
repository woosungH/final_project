package com.project.greenbook.dao;

import com.project.greenbook.dto.BuyDTO;

import java.util.ArrayList;
import java.util.HashMap;

public interface BuyDAO {
    public ArrayList<BuyDTO> cart();
    public void cancel(HashMap<String, String> param);
    public void cartAdd(HashMap<String, String> param);
    public void cartCountUpdate(HashMap<String, String> param);
}
