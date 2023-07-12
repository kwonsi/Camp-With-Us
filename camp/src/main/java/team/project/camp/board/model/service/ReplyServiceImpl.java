package team.project.camp.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.camp.board.model.dao.ReplyDAO;
import team.project.camp.board.model.vo.Reply;
import team.project.camp.common.Util;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyDAO dao;


	// 댓글 목록 조회 서비스 구현
	@Override
	public List<Reply> selectAll(int boardNo) {

		return dao.selectAll(boardNo);
	}


	// 댓글 등록 서비스 구현
	@Override
	public int insertReply(Reply reply) {

		reply.setReplyContent( Util.XSSHandling( reply.getReplyContent() ) );
		reply.setReplyContent( Util.newLineHandling( reply.getReplyContent() ) );

		return dao.insertReply(reply);
	}


	// 댓글 삭제 서비스 구현
	@Override
	public int deleteReply(Reply reply) {

		return dao.deleteReply(reply);
	}


	// 댓글 수정 서비스 구현
	@Override
	public int updateReply(Reply reply) {

		reply.setReplyContent( Util.XSSHandling( reply.getReplyContent() ) );
		reply.setReplyContent( Util.newLineHandling( reply.getReplyContent() ) );

		return dao.updateReply(reply);
	}

}
