package ctrl;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import svc.*;
import vo.*;

@WebServlet("/placeProcIn")
public class PlaceProcInCtrl extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public PlaceProcInCtrl() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        
        String name = request.getParameter("pf_name").trim();
        String phone = request.getParameter("pf_phone").trim();
        String link = request.getParameter("pf_homepage").trim();
        String ctgr = request.getParameter("pf_ctgr").trim();
        String zip = request.getParameter("pf_postcode");
        String coords = request.getParameter("pf_addressCoords");
        String addr1 = request.getParameter("pf_address");
        String addr21 = request.getParameter("pf_detailAddress");
        String addr22 = request.getParameter("pf_extraAddress");
        String addr2 = addr21 + addr22;
        
        String desc = request.getParameter("pf_text");
        String img1 = request.getParameter("file_path_ssum");
        String img2 = request.getParameter("file_path1");
        String img3 = request.getParameter("file_path2");
        String img4 = request.getParameter("file_path3");
        String img5 = request.getParameter("file_path4");
        
        
        PlaceProcInSvc placeProcInSvc = new PlaceProcInSvc();
        int result = placeProcInSvc.placeInsert(name, phone, link, ctgr, zip, coords,
                addr1, addr2, desc, img1, img2, img3, img4, img5);
        
        /*
        RequestDispatcher dispatcher = request.getRequestDispatcher("/lmth/admin/02_place/place_list.jsp");
        dispatcher.forward(request, response);
        */
        
        
        if (result > 0) {
            response.sendRedirect("/traverSite/adminPlaceList");
        } else {
            response.setContentType("text/html; charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("<script> alert('등록에 실패하였습니다.'); history.back(); </script>");
            out.close();
        }
        
        
    }
}