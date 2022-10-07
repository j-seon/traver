package ctrl;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import svc.*;
import vo.*;

@WebServlet("/adminLogin")
public class AdminLoginCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminLoginCtrl() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id").trim().toLowerCase();
		String pw = request.getParameter("pw").trim();
		String url = request.getParameter("url").replace('$', '&');
		
		AdminLoginSvc adminLoginSvc = new AdminLoginSvc();
		AdminInfo adminInfo = adminLoginSvc.getAdminLogin(id, pw);
		
		if (adminInfo != null) {	// 로그인 성공시
			HttpSession session = request.getSession();
			// JSP가 아니므로 세션객체를 사용하려면 직접 HttpSession클래스의 인스턴스를 생성해야 한다.
			session.setAttribute("adminInfo", adminInfo);
			// 로그인한 회원이 정보를 담은 loginInfo인스턴스를 세션의 속성으로 저장
			response.sendRedirect(url);
		}
	}
}
