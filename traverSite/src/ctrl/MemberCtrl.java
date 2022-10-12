package ctrl;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import act.*;
import vo.*;

@WebServlet("*.mem")	// 마지막 4글자가 '.mem'인 모든 요청을 받겠다는 의미
public class MemberCtrl extends HttpServlet {
// 회원 관련 작업(가입, 정보수정, 탈퇴)의 연결(Model과 View)을 담당하는 컨트롤러
	private static final long serialVersionUID = 1L;
    public MemberCtrl() { super(); }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
    	String requestUri = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String command = requestUri.substring(contextPath.length());
    	
    	ActionForward forward = null;
    	Action action = null;
    	
    	switch (command) {
    	case "/member/member_proc.mem" :
    		action = new MemberProcAct();
    		break;
    	}
    	
    	try {
    		forward = action.execute(request, response);
    	} catch (Exception e) { e.printStackTrace(); }
    	
    	if (forward != null) {
    		if (forward.isRedirect()) {
    			response.sendRedirect(forward.getPath());
    		} else {
    			RequestDispatcher dispatcher = 
    				request.getRequestDispatcher(forward.getPath());
    			dispatcher.forward(request, response);
    		}
    	}
	}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}
