@Controller
public class UserController {
	//로그인 페이지로 이동
	@RequestMappting("/user/login.do")
	public String login(){
		logger.info("경로 : login")';

		return "user/login";
	}
	@RequestMapping("/user/insert.do")
	public String insert() {
		logger.info("login: insert");
		return "user/insert";
	}
	//회원 정보 수정 페이지로 이동
	@RequestMapping("/user/update.do")
	public String update() {
		logger.info("login: update");
		return "user/update";
	}
<<<<<<< HEAD
	//- master 브랜치에 주석 추가  되엇니????????????ㅜ^ㅜ
	//- 회원 탈퇴시 세션 삭제

	//회원 정보 삭제 페이지로 이동  
=======
	//회원 정보 삭제 페이지로 이동
>>>>>>> develop
	@RequestMapping("/user/delete.do")
	public String delete() {
		logger.info("login: delete");
		return "user/delete";
	}
	
}