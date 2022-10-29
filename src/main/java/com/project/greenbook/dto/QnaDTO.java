package com.project.greenbook.dto;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
public class QnaDTO {
    private int qna_id ;
    private String qna_name ;
    private String qna_title ;
    private String qna_content ;
    private Timestamp qna_date ;
    private int qna_hit;

    public QnaDTO(){}

    public QnaDTO(int qna_id, String qna_name, String qna_title, String qna_content, Timestamp qna_date, int qna_hit) {
        this.qna_id = qna_id;
        this.qna_name = qna_name;
        this.qna_title = qna_title;
        this.qna_content = qna_content;
        this.qna_date = qna_date;
        this.qna_hit = qna_hit;
    }
}
