package com.book.main;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


public class SlideShow {
	
	public static void post(HttpServletRequest request) {
		System.out.println("post 시작");
		// 추천도서 보여주는 곳임
		
		// 인증키 :  9D94365668C72FEE72038FC3AF671C5CF7E548299872BFA5789AA93394BBEA58 
		// 요청 URL : http://book.interpark.com/api/recommend.api
		// 샘플 URL : http://book.interpark.com/api/recommend.api?key=9D94365668C72FEE72038FC3AF671C5CF7E548299872BFA5789AA93394BBEA58&categoryId=100
		
		HttpsURLConnection huc = null;
		try {
			String url = "https://book.interpark.com/api/recommend.api?key=9D94365668C72FEE72038FC3AF671C5CF7E548299872BFA5789AA93394BBEA58&categoryId=100&output=json&totalResults=4";
			
			URL u = new URL(url);
			huc = (HttpsURLConnection) u.openConnection();
			
			InputStream is = huc.getInputStream();
			InputStreamReader isr = new InputStreamReader(is, "utf-8");
			System.out.println("is : " + is);
			
			
			//json 파싱
			JSONParser jp = new JSONParser();
			JSONObject recommend = (JSONObject)jp.parse(isr);
			
			System.out.println(recommend);
			

			// 제목, 저자, 이미지url 
			Recommend b = null;
			JSONArray items = (JSONArray)recommend.get("item");
			System.out.println(items.size());
			if(items.size()>= 4) {
				for(int i=0; i<items.size(); i++) {
					JSONObject book = (JSONObject)items.get(i);
					b = new Recommend();
					String title = (String)book.get("title");
					String imgUrl= (String)book.get("coverLargeUrl");
					String author = (String)book.get("author");
					String link = (String)book.get("link");				
//					System.out.println(title);
//					System.out.println(imgUrl);
//					System.out.println(author);
//					System.out.println(link);
					
					b.setTitle(title);
					b.setUrlImg(imgUrl);
					b.setAuthor(author);
					b.setLink(link);
					
					request.setAttribute("recommends"+i, b);
					
					System.out.println(b.getTitle());
				}
				
				System.out.println("post 함수 끝");
			}else {
				System.out.println("4개가 안올라옴");
			}
			
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
}
