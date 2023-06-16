package team.project.camp.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import team.project.camp.board.model.service.ReplyService;
import team.project.camp.board.model.vo.Reply;

@RestController
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	private ReplyService replyService;


	// 댓글 목록 조회
	@GetMapping("/selectReplyList")
	public String replyList( @RequestParam("boardNo") int boardNo ) {

		List<Reply> rList = replyService.selectAll(boardNo);

		return new Gson().toJson(rList);
	}


	// 댓글 등록
	@PostMapping("/insert")
	public int insertReply(Reply reply) {

		return replyService.insertReply(reply);
	}


	// 댓글 삭제
	@GetMapping("/delete")
	public int deleteReply(Reply reply) {

		return replyService.deleteReply(reply);
	}


	// 댓글 수정
	@PostMapping("/update")
	public int updateReply(Reply reply) {

		return replyService.updateReply(reply);
	}


}
