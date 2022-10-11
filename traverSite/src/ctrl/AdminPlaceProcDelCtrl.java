package ctrl;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import svc.*;
import vo.*;

@WebServlet("/adminPlaceProcDel")
public class AdminPlaceProcDelCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminPlaceProcDelCtrl() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
	    
	}
}
