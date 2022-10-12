package ctrl;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import svc.*;

@WebServlet("/dupId")
public class DupIdCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DupIdCtrl() { super(); }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String uid = request.getParameter("uid").trim().toLowerCase();

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		try {
			DupIdSvc dupIdSvc = new DupIdSvc();
			int result = dupIdSvc.chkDupId(uid);
			out.println(result);
		} catch(Exception e) {
			e.printStackTrace();
			out.println(1);
		}
	}
}
