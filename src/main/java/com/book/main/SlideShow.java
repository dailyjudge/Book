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
		// 신간도서 보여주는 곳임
		
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
//					System.out.println(title);
//					System.out.println(imgUrl);
//					System.out.println(author);
//					System.out.println(link);
					
					b.setTitle(title);
					b.setUrlImg(imgUrl);
					b.setAuthor(author);
					b.setLink(link);
					
					request.setAttribute("recommends"+i, b);
					
				}
			}else {
				System.out.println("10개가 안올라옴");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void afterLogin(HttpServletRequest request) {
		// 로그인 후에 보여주는 슬라이드 쇼는 알라딘 api
		
		// api key : ttbanswhd432059001
		// api url : https://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbanswhd432059001&QueryType=ItemNewAll&MaxResults=10&start=1&SearchTarget=Book&output=xml&Version=20131101&CategoryId=
		// 로맨스 소설 : 50935
		// 추리 소설 : 50926
		
		HttpSession hs = request.getSession();
		Account a = (Account) hs.getAttribute("accountInfo");
		String likes = a.getB_likes();
		System.out.println(likes);
		
		HttpsURLConnection huc = null;
		HttpsURLConnection huc2 = null;
		String url = "https://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbanswhd432059001&QueryType=ItemNewAll&MaxResults=10&start=1&SearchTarget=Book&output=js&Version=20131101&CategoryId=";
		//비교용 문자열들
		String s1 = "detective";
		String s2 = "romance";
		String url2 = null;
		
		try {
			if(likes.contains(s1)) {
				url = url + "50926";
				System.out.println(url);
			}else if(likes.contains(s2)) {
				url = url +"50935";
				System.out.println(url);
			}else if(likes.contains(s1)&&likes.contains(s2)){
				url2 = url + "50926";
				url =  url +"50935";
				System.out.println(url);
				System.out.println(url2);
			}
			
			if(url2 == null) {
				URL u = new URL(url);
				huc = (HttpsURLConnection) u.openConnection();
				
				InputStream is = huc.getInputStream();
				InputStreamReader isr = new InputStreamReader(is, "utf-8");
				
				JSONParser jp = new JSONParser();
				JSONObject recommend = (JSONObject)jp.parse(isr);
				
				Recommend b = null;
				JSONArray items = (JSONArray)recommend.get("item");
				
				if(items.size()>= 10) {
					for(int i=0; i<items.size(); i++) {
						JSONObject book = (JSONObject)items.get(i);
						b = new Recommend();
						String title = (String)book.get("title");
						String imgUrl= (String)book.get("cover");
						String author = (String)book.get("author");
						String link = (String)book.get("link");				
						
						b.setTitle(title);
						b.setUrlImg(imgUrl);
						b.setAuthor(author);
						b.setLink(link);
						
						request.setAttribute("recommends"+i, b);
						
					}
				}else {
					System.out.println("10개가 안올라옴");
				}
				
			// 선택 장르가 두개일때
			}else {
				URL u = new URL(url);
				huc = (HttpsURLConnection) u.openConnection();
				
				InputStream is = huc.getInputStream();
				InputStreamReader isr = new InputStreamReader(is, "utf-8");
				
				JSONParser jp = new JSONParser();
				JSONObject recommend = (JSONObject)jp.parse(isr);
				
				Recommend b = null;
				JSONArray items = (JSONArray)recommend.get("item");
				
				if(items.size()>= 10) {
					for(int i=0; i<items.size(); i += 2) {
						JSONObject book = (JSONObject)items.get(i);
						b = new Recommend();
						String title = (String)book.get("title");
						String imgUrl= (String)book.get("cover");
						String author = (String)book.get("author");
						String link = (String)book.get("link");				
						
						b.setTitle(title);
						b.setUrlImg(imgUrl);
						b.setAuthor(author);
						b.setLink(link);
						
						request.setAttribute("recommends"+i, b);
						
					}
				}else {
					System.out.println("10개가 안올라옴");
				}
				
				URL u2 = new URL(url2);
				huc2 = (HttpsURLConnection) u2.openConnection();
				
				InputStream is2 = huc.getInputStream();
				InputStreamReader isr2 = new InputStreamReader(is2, "utf-8");
				
				JSONParser jp2 = new JSONParser();
				JSONObject recommend2 = (JSONObject)jp2.parse(isr2);
				
				Recommend b2 = null;
				JSONArray items2 = (JSONArray)recommend2.get("item");
				
				if(items2.size()>= 10) {
					for(int i=1; i<items2.size(); i+=2) {
						JSONObject book = (JSONObject)items.get(i);
						b2 = new Recommend();
						String title = (String)book.get("title");
						String imgUrl= (String)book.get("cover");
						String author = (String)book.get("author");
						String link = (String)book.get("link");				
						
						b.setTitle(title);
						b.setUrlImg(imgUrl);
						b.setAuthor(author);
						b.setLink(link);
						
						request.setAttribute("recommends"+i, b);
						
					}
				}else {
					System.out.println("10개가 안올라옴");
				}
				
			}
			
			
			
			
			
			
		}catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		
		
		
		
		
		
	}
	
	
	
}
