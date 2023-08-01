package cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddCartNoMemServlet
 */
@WebServlet("/cart/AddCartNoMemServlet")
public class AddCartNoMemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String encoding = "UTF-8";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCartNoMemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(encoding);
		response.setContentType("text/html; charset=UTF-8");
		boolean flag = false;
		//프로덕트키, 멤키를 ajax에서 받아온다.
		int productKey = Integer.parseInt(request.getParameter("productKey"));
		int cartCount[] = null;
		String cartCount1[] = request.getParameterValues("cartCount");
		String optionText[] = request.getParameterValues("optionText");
		
		//cartCount 인트형으로 일일이 다변환
		if(cartCount1!=null){
			cartCount = new int[cartCount1.length];
			for(int i=0;i<cartCount1.length;i++){
				cartCount[i] = Integer.parseInt(cartCount1[i]);
			}
		}
		
		//모든 쿠키 얻어옴
	    Cookie[] cookies = request.getCookies();
	    if(cookies != null){
	    	
    	   for(int k=0; k<cookies.length; k++){
    		//쿠키 이름이 일치하는것 찾기
    	    if(cookies[k].getName().equals("noMemCart")){
    	    	String value = URLDecoder.decode(cookies[k].getValue(),encoding);
		    	for(int j=0; j<cartCount.length; j++) {
		    		if(optionText[j] == "") {
		    			optionText[j] = null;
		    		}
		    		if(value.contains(productKey+"-"+optionText[j]+",")) {
		    			flag=false;
		    		}else {
		    			value += cartCount[j]+"-"+productKey+"-"+optionText[j]+",";
		    			// 쿠키 이름 지정하여 생성( key, value 개념) 인코딩 해줌
						Cookie cookie = new Cookie("noMemCart", URLEncoder.encode(value, encoding)); 
					    cookie.setMaxAge(60*60*24); //쿠키 유효 기간: 하루로 설정(60초 * 60분 * 24시간)
					    cookie.setPath("/"); //모든 경로에서 접근 가능하도록 설정
					    response.addCookie(cookie); //response에 Cookie 추가
					    flag=true;
		    		}
				}
    	    }else {
    	    	String value="";
    	    	for(int j=0; j<cartCount.length; j++) {
    	    		if(optionText[j] == "") {
		    			optionText[j] = null;
		    		}
    	    		value += cartCount[j]+"-"+productKey+"-"+optionText[j]+",";
				}
		    	// 쿠키 이름 지정하여 생성( key, value 개념) 인코딩 해줌
				Cookie cookie = new Cookie("noMemCart", URLEncoder.encode(value, encoding)); 
			    cookie.setMaxAge(60*60*24); //쿠키 유효 기간: 하루로 설정(60초 * 60분 * 24시간)
			    cookie.setPath("/"); //모든 경로에서 접근 가능하도록 설정
			    response.addCookie(cookie); //response에 Cookie 추가.
			    flag=true;
    	    }
    	    
    	   }
    	}
	    
	    PrintWriter out = response.getWriter();
		
		out.print(flag);  //데이터 넘기기
	    
	}

}
