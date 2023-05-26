package team.project.camp.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import team.project.camp.board.model.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;
	
	// 캠핑장 추천 게시판 연결
	@GetMapping("/list1")
	public String boardList1() {
		
		return "board/boardList1";
	}
	
	// 캠핑 나눔 게시판 연결
	@GetMapping("/list2")
	public String boardList2() {
		
		return "board/boardList2";
	}
	
	// 캠핑 꿀팁 게시판 연결
	@GetMapping("/list3")
	public String boardList3() {
		
		return "board/boardList3";
	}
	
	// 공지사항 게시판 연결
	@GetMapping("/list4")
	public String boardList4() {
		
		return "board/boardList4";
	}
	
	// 문의사항 게시판 연결
	@GetMapping("/list5")
	public String boardList5() {
		
		return "board/boardList5";
	}
	
}
