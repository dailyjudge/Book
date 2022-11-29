package com.book.main;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.book.account.Account;


public class SlideShow {
	
	public static void post(HttpServletRequest request) {

		
		// 인증키 :  9D94365668C72FEE72038FC3AF671C5CF7E548299872BFA5789AA93394BBEA58 
		// 요청 URL : http://book.interpark.com/api/newBook.api
		// 샘플 URL : http://book.interpark.com/api/newBook.api?key=9D94365668C72FEE72038FC3AF671C5CF7E548299872BFA5789AA93394BBEA58&categoryId=100
		
		HttpsURLConnection huc = null;
		try {
			String url = "https://book.interpark.com/api/newBook.api?key=9D94365668C72FEE72038FC3AF671C5CF7E548299872BFA5789AA93394BBEA58&categoryId=100&output=json&totalResults=10";
			
			URL u = new URL(url);
			huc = (HttpsURLConnection) u.openConnection();
			
			InputStream is = huc.getInputStream();
			InputStreamReader isr = new InputStreamReader(is, "utf-8");
			System.out.println("is : " + is);
			
			//json 파싱
			JSONParser jp = new JSONParser();
			JSONObject recommend = (JSONObject)jp.parse(isr);
			
			// 제목, 저자, 이미지url 
			Recommend b = null;
			JSONArray items = (JSONArray)recommend.get("item");
			if(items.size()>= 10) {
				for(int i=0; i<items.size(); i++) {
					JSONObject book = (JSONObject)items.get(i);
					b = new Recommend();
					String title = (String)book.get("title");
					String imgUrl= (String)book.get("coverLargeUrl");
					String author = (String)book.get("author");
					String link = (String)book.get("link");				
					
					b.setTitle(title);
					b.setUrlImg(imgUrl);
					b.setAuthor(author);
					b.setLink(link);
					
					request.setAttribute("recommends"+i, b);
					
				}
				
				System.out.println("post 함수 끝");
			}else {
				System.out.println("10개가 안올라옴");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
