package kr.or.ddit.basic.session;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/sessionLogin.do")
public class SessionLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String userId = request.getParameter("userId");
		String pass = request.getParameter("pass");
		
		session.setAttribute("userId", "admin");
		session.setAttribute("pass", "1234");
		
		String sessionId = (String) session.getAttribute("userId");
		String sessionPass = (String) session.getAttribute("pass");
		
		if(userId.equals(sessionId) && pass.equals(sessionPass)) {
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<html><head><meta charset='utf-8'>");
			out.println("<title>Session 연습</title></head>");
			out.println("<body>");
			out.println("<h2>" + userId + "님 반갑습니다.</h2><br>");
			out.println("<a href='" + request.getContextPath()
			+ "/sessionLogout.do'>로그아웃</a>");
			out.println("</body></html>");
		}else {
			response.sendRedirect(
					request.getContextPath() + "/basic/04/sessionLogin.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
