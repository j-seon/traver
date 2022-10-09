package ctrl;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import svc.*;
import vo.*;


@WebServlet("/addPlace")
public class AddPlaceCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AddPlaceCtrl() { super(); }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String piid =  request.getParameter("piid"); // 장바구니 index번호
        String piname = request.getParameter("piname"); // 변경할 옵션
        
        HttpSession session = request.getSession();
        ArrayList<PlaceInfo> addPlaceList = (ArrayList<PlaceInfo>)session.getAttribute("addPlaceList");
        PlaceInfo pi = new PlaceInfo();
        pi.setPi_id(piid);
        pi.setPi_name(piname);
        addPlaceList.add(pi); 
        session.setAttribute("scheduleList", addPlaceList);

        int result = addPlaceList.size();   

        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println(result);
    }
}
