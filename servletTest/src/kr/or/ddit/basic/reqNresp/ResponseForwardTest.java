package kr.or.ddit.basic.reqNresp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ResponseForward.do") // 클래스 이름과 달라도 상관 없음.
public class ResponseForwardTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String userName = request.getParameter("username");
		
		// 이전 서블릿이나 JSP에서 request.setAttribute()메서드로
		// 만들어서 보낸 데이터를 받는다.
		String tel = (String) request.getAttribute("tel");
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html><head><meta charset='utf-8'>");
		out.println("<title>Response Forward연습</title></head>");
		out.println("<body>");
		out.println("<h2>Response Forward 결과</h2><hr>");
		out.println("<ul>");
		out.println("<li>이름 : " + userName + "</li>");
		out.println("<li>전화번호 : " + tel + "</li>");
		out.println("</ul>");
		out.println("</body></html>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
