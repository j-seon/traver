package ctrl;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import svc.*;
import vo.*;

@WebServlet("/placeInfo")
public class PlaceInfoCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PlaceInfoCtrl() { super(); }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // 장소 idx를 가져와 장소정보 출력을위한 정보를 받아오는걸 연결할 컨트롤

	}
}
