package team.project.camp.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/main")
	public String mainForward() {

		return "common/main";
	}
	
	@GetMapping("/selectLoc")
	public String popUpLoc() {
		return "common/selectLoc";
	}

	@GetMapping("/selectTheme")
	public String popUpTheme() {
		return "common/selectTheme";
	}

	
}
