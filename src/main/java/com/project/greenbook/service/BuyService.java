package com.project.greenbook.service;

import com.project.greenbook.dto.BuyDTO;

import java.util.ArrayList;
import java.util.HashMap;

public interface BuyService {
    public ArrayList<BuyDTO> cart();
    public void cartAdd(HashMap<String, String> param);
    public void cartCountUpdate(HashMap<String, String> param);
    public void cancel(HashMap<String, String> param);
}
