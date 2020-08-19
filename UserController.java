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

}