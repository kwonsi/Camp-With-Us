package team.project.camp.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	// main --> campList 이동 .
	@GetMapping("/campList")
	public String campList(
				@RequestParam(value = "loc", required = false , defaultValue = "") String loc,
				@RequestParam(value = "theme", required = false , defaultValue = "") String theme,
				@RequestParam(value = "campName", required = false , defaultValue = "") String campName,
				Model model
			) {

		model.addAttribute("loc", loc);
		model.addAttribute("theme", theme);
		model.addAttribute("campName", campName);

		return "camp/campList";

	}
	@GetMapping("/reservationComplete")
	public String reservationComplete() {

		return "camp/reservationComplete";
	}
}
