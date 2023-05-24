package team.project.camp.camp.model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/camp")
public class CampListController {

	@GetMapping("/campList")
	public String campList() {
		return "common/campList";
	}
}
