package product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class ProductMainServlet
 */
@WebServlet("/product/ProductMainServlet")
public class ProductMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	//ajax통신 옵션 보내주기
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//프로덕트키를 ajax에서 받아온다.
		int productKey = Integer.parseInt(request.getParameter("productKey"));
		
		//제이슨 배열 생성
		JSONArray ja = new JSONArray();
		
		//PrudctMgr에서 데이터를 받아온다
		ProductMgr pMgr = new ProductMgr();
		ArrayList<ProductOptionBean> pob = new ArrayList<>();
		
		
		try {
			pob = pMgr.getOption(productKey); //pMgr 에서 메소드 호출한 리스트
			for(int i=0; i<pob.size(); i++) {
				JSONObject obj = new JSONObject(); //json 객체 생성
				
				obj.put("oc1", pob.get(i).getOc1());
				obj.put("oc2", pob.get(i).getOc2());
				obj.put("oc3", pob.get(i).getOc3());
				obj.put("oc4", pob.get(i).getOc4());
				obj.put("oc5", pob.get(i).getOc5());
				
				ja.add(obj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.setContentType("application/x-json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(ja.toString());  //데이터 넘기기
		
	}

}
