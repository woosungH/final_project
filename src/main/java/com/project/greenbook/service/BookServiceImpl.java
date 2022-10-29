package com.project.greenbook.service;

import com.project.greenbook.dao.BookDAO;
import com.project.greenbook.dto.BookImgDTO;
import com.project.greenbook.dto.BookInfoDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List bookId1() {
        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        List bookId = dao.bookId1();
        return bookId;
    }

    @Override
    public List bookId2() {
        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        List bookId = dao.bookId2();
        return bookId;
    }

    @Override
    public List bookId3() {
        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        List bookId = dao.bookId3();
        return bookId;
    }

    @Override
    public List bookId4() {
        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        List bookId = dao.bookId4();
        return bookId;
    }

    @Override
    public List bookId5() {
        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        List bookId = dao.bookId5();
        return bookId;
    }

    @Override
    public int bookCount(HashMap<String, String> param) {
        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        int count = dao.bookCount(param);
        return count;
    }

    /* 게시물 목록 + 페이징 */
    @Override
    public List bookList(HashMap<String, String> param) {
        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        List bookList = dao.bookList(param);
        return bookList;
    }

    @Override
    public List bookImg(HashMap<String, String> param) {
        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        List bookImg = dao.bookImg(param);
        return bookImg;
    }

    @Override
    public void register(MultipartFile uploadFile, HttpServletRequest request, HashMap<String, String> param) {
        System.out.println("BookServiceImpl.register() start");

        System.out.println(param.get("title"));

        UUID uuid = UUID.randomUUID();

        System.out.println("@@@@@@@@@여기1");

        String fileName = uploadFile.getOriginalFilename();
        String filePath = request.getSession().getServletContext().getRealPath("/resources/upload/");
        String storedFileName = uuid + "_" + fileName;
        String thumbNailName = "s_"+storedFileName;


        System.out.println("@#@#@#@#@#@ 여기222");
        System.out.println("fileName"+fileName);
        System.out.println("storedFileName"+storedFileName);

        param.put("originFileName",fileName);
        param.put("storedFileName", storedFileName);
        param.put("storedThumbnail",thumbNailName);
        param.put("fileSize", String.valueOf(uploadFile.getSize()));

        try{
            File saveFile = new File(filePath + storedFileName);
            System.out.println(saveFile.getName());
            uploadFile.transferTo(saveFile);
            System.out.println("이미지 파일 저장 완료");

            File thumbNailFile = new File(filePath +"s_"+ storedFileName);
            BufferedImage bo_img = ImageIO.read(saveFile);

            int width = 200;
            int height = 300;

            BufferedImage btImg = new BufferedImage(width,height,BufferedImage.TYPE_3BYTE_BGR);
            Graphics2D graphic = btImg.createGraphics();
            graphic.drawImage(bo_img,0,0, width,height,null);
            ImageIO.write(btImg,"jpg", thumbNailFile);

            BookDAO dao = sqlSession.getMapper(BookDAO.class);

            dao.register(param);
            param.put("bookId",String.valueOf(dao.getMaxId()));
            dao.registerImg(param);

        }catch (Exception e){

            e.printStackTrace();
        }

        System.out.println("BookServiceImpl.register() end");
    }

    @Override
    public void receiving(HashMap<String, String> param) {
        System.out.println("BookServiceImpl.receiving() start");

        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        dao.receiving();

        System.out.println("BookServiceImpl.receiving() end");
    }

    @Override
    public ArrayList<BookInfoDTO> bookInfoList(HashMap<String, String> param) {
        System.out.println("BookServiceImpl.bookInfoList() start");

        String searchOption = param.get("searchOption");
        String searchText = param.get("searchText");

        if(searchOption == null){
            searchOption = "book_id";
        }
        if(searchText == null){
            searchText = "";
        }
        searchText = "%"+searchText+"%";

        if(searchOption.equals("bookTitle")){
            searchOption = "book_title";
        } else{
            searchOption = "book_id";
        }

        System.out.println("searchOption = "+searchOption);
        System.out.println("searchText = "+searchText);

        param.put("searchOption",searchOption);
        param.put("searchText",searchText);

        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        ArrayList<BookInfoDTO> bookInfoList = dao.bookInfoList(param);

        System.out.println("BookServiceImpl.bookInfoList() end");
        return bookInfoList;
    }

    @Override
    public int countBookInfo() {
        System.out.println("BookServiceImpl.countBookInfo() start");

        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        int count = dao.countBookInfo();

        System.out.println("BookServiceImpl.countBookInfo() end");
        return count;
    }

    @Override
    public ArrayList<BookImgDTO> bookImgList(HashMap<String, String> param) {
        System.out.println("BookServiceImpl.bookImgList() start");

        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        ArrayList<BookImgDTO> daos = dao.bookImgList(param);

        System.out.println("BookServiceImpl.bookImgList() end");
        return daos;
    }

    @Override
    public BookImgDTO contentImg(String bookId) {
        System.out.println("BookServiceImpl.bookImgList() start");

        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        BookImgDTO bto = dao.contentImg(bookId);

        System.out.println("BookServiceImpl.bookImgList() end");
        return bto;
    }

    @Override
    public BookInfoDTO contentInfo(String bookId) {
        System.out.println("BookServiceImpl.bookImgList() start");

        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        BookInfoDTO bto = dao.contentInfo(bookId);

        System.out.println("BookServiceImpl.bookImgList() end");
        return bto;
    }

    @Override
    public void updateInfo(HashMap<String, String> param) {
        System.out.println("BookServiceImpl.updateInfo() start");

        BookDAO dao = sqlSession.getMapper(BookDAO.class);
        dao.updateInfo(param);

        System.out.println("BookServiceImpl.updateInfo() end");
    }

    @Override
    public void updateImg(MultipartFile uploadFile, HttpServletRequest request, HashMap<String, String> param) {
        System.out.println("BookServiceImpl.updateImg() start");

        System.out.println(param.get("title"));

        UUID uuid = UUID.randomUUID();

        System.out.println("@@@@@@@@@여기1");

        String fileName = uploadFile.getOriginalFilename();
        String filePath = request.getSession().getServletContext().getRealPath("/resources/upload/");
        String storedFileName = uuid + "_" + fileName;
        String thumbNailName = "s_"+storedFileName;


        System.out.println("@#@#@#@#@#@ 여기222");
        System.out.println("fileName"+fileName);
        System.out.println("storedFileName"+storedFileName);

        param.put("originFileName",fileName);
        param.put("storedFileName", storedFileName);
        param.put("storedThumbnail",thumbNailName);
        param.put("fileSize", String.valueOf(uploadFile.getSize()));

        try{
            File saveFile = new File(filePath + storedFileName);
            System.out.println(saveFile.getName());
            uploadFile.transferTo(saveFile);
            System.out.println("이미지 파일 저장 완료");

            File thumbNailFile = new File(filePath +"s_"+ storedFileName);
            BufferedImage bo_img = ImageIO.read(saveFile);

            int width = 200;
            int height = 300;

            BufferedImage btImg = new BufferedImage(width,height,BufferedImage.TYPE_3BYTE_BGR);
            Graphics2D graphic = btImg.createGraphics();
            graphic.drawImage(bo_img,0,0, width,height,null);
            ImageIO.write(btImg,"jpg", thumbNailFile);

            BookDAO dao = sqlSession.getMapper(BookDAO.class);

            dao.register(param);
            param.put("bookId",String.valueOf(dao.getMaxId()));
            dao.registerImg(param);

        }catch (Exception e){

            e.printStackTrace();
        }

        System.out.println("BookServiceImpl.updateImg() end");
    }


}
