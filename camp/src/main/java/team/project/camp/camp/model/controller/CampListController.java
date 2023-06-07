package team.project.camp.camp.model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import lombok.extern.slf4j.Slf4j;
import team.project.camp.member.model.vo.Member;

@Slf4j
@Controller
@RequestMapping("/campList")
public class CampListController {

	// campList --> detailList 이동
	@GetMapping("/detailList")
	public String detailList(
				@RequestParam(value = "campName",required = false,defaultValue = "") String campName,
				Model model
			) {
		
		model.addAttribute("campName",campName);
		return "camp/detailList";
	}

}
