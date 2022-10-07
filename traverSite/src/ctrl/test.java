package ctrl;

import java.io.*;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import svc.*;
import vo.*;

@WebServlet("/test")
public class test extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public test() { super();}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String piid =  request.getParameter("piid"); // 장바구니 index번호
        //String piname = request.getParameter("piname"); // 변경할 옵션
        
        HttpSession session = request.getSession();
        ArrayList<PlaceInfo> scheduleList = (ArrayList<PlaceInfo>)session.getAttribute("scheduleList");
        PlaceInfo pi = new PlaceInfo();
        pi.setPi_id(piid);
        //pi.setPi_name(piname);
        scheduleList.add(pi); 
        session.setAttribute("scheduleList", scheduleList);

        int result = scheduleList.size();

        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println(result);
	}
}
