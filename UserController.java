@Controller
public class UserController {
	//로그인 페이지로 이동
	@RequestMappting("/user/login.do")
	public String login(){
		logger.info("경로 : login")';

		return "user/login";
	}


}