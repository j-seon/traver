package ctrl;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import svc.*;
import vo.*;

@WebServlet("/addPlace")
public class AddPlaceCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AddPlaceCtrl() { super(); }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
