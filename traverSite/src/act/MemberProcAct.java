package act;

import javax.servlet.http.*;
import java.util.*;
import java.io.*;
import svc.*;
import vo.*;

public class MemberProcAct implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String kind = request.getParameter("kind");
		// 회원 가입(in), 수정(up), 탈퇴(del) 여부를 구분하는 값
		MemberInfo memberInfo = new MemberInfo();	// 받아온 회원 데이터들을 저장할 인스턴스
		
		HttpSession session = request.getSession();
		MemberInfo mi = null;
		// 정보 수정이나 탈퇴시 사용할 세션안에 들어있는 로그인 정보를 저장할 인스턴스
		
		if (kind.equals("in") || kind.equals("up")) {
		// 현재 처리하는 작업이 회원 가입이나 정보 수정일 경우
			memberInfo.setMi_nickname(request.getParameter("mi_nickname"));
			memberInfo.setMi_nickname(request.getParameter("mi_mbti"));
			memberInfo.setMi_mail(request.getParameter("e1") + "@" + 
			request.getParameter("e3"));
		}
		
		if (kind.equals("in")) {
			memberInfo.setMi_id(request.getParameter("mi_id").trim().toLowerCase());
			memberInfo.setMi_pw(request.getParameter("mi_pw").trim());
			memberInfo.setMi_name(request.getParameter("mi_name").trim());
			memberInfo.setMi_birth(request.getParameter("mi_birth"));
			

		} else if (kind.equals("up") || kind.equals("del")) {
		// 정보 수정이나 탈퇴인 경우는 로그인 상태이므로 아이디를 세션에서 추출하여 가져감
			mi = (MemberInfo)session.getAttribute("loginInfo");
			memberInfo.setMi_id(mi.getMi_id());
			// 매개변수로 가져갈 MemberInfo형 인스턴스 memberInfo에 회원 아이디를 저장함
			// 정보 수정이나 탈퇴시 where 절에서 조건으로 사용할 아이디가 필요하기 때문
		}
		
		MemberProcSvc memberProcSvc = new MemberProcSvc();
		int result = memberProcSvc.memberProc(kind, memberInfo);

		String link = "../index.jsp";	// 작업 후 이동할 경로를 저장할 변수
		if (result == 1) {	// 정상적으로 동작되었으면
			if (kind.equals("in"))			link = "../member/login_form.jsp";
			else if (kind.equals("del"))	link = "../member/logout.jsp";
			else if (kind.equals("up")) {
				link = "../index.jsp";
				mi.setMi_mbti(memberInfo.getMi_mbti());
				mi.setMi_mail(memberInfo.getMi_mail());
				// 정보 수정 성공시 현재 세션에 들어있는 로그인 회원 정보도 변경시킴
			}
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script> alert('작업에 실패했습니다. 다시 시도해 보세요.'); history.back(); </script>");
			out.close();
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(link);
		
		return forward;
	}
}
