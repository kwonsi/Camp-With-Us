package team.project.camp.camp.model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping
public class CampListController {

	// main --> campList 이동 .
	@GetMapping("/campList")
	public String campList(
				@RequestParam(value = "loc", required = false , defaultValue = "") String loc
			,	Model model
			) {

		model.addAttribute("loc",loc);

		return "common/campList";
	}
	
	// campList --> detailList 이동
	@GetMapping("/campList/detailList")
	public String detailList() {
		return "common/detailList";
	}
	
	
}
