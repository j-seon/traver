package act;

import javax.servlet.http.*;
import vo.*;

public interface Action {
// 여러 요청에 대한 처리를 동일한 방법(메소드)으로 처리되게끔 implements 시킬 인터페이스
	ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 각 요청을 처리하는 Action 클래스들이 공통적으로 구현해야 하는 메소드로서 선언된 메소드
}
