package ctrl;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import svc.*;
import vo.*;

@WebServlet("/placeFormIn")
public class PlaceFormInCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PlaceFormInCtrl() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
    	RequestDispatcher dispatcher = request.getRequestDispatcher("lmth/admin/lmth/02_place/place_form_in.jsp");
		dispatcher.forward(request, response);
    	
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
