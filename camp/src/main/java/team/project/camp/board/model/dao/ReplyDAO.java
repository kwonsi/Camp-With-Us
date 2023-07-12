package team.project.camp.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.camp.board.model.vo.Reply;

@Repository
public class ReplyDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 댓글 목록 조회 DAO
	 * @param boardNo
	 * @return rList
	 */
	public List<Reply> selectAll(int boardNo) {

		return sqlSession.selectList("replyMapper.selectAll", boardNo);
	}


	/** 댓글 등록 DAO
	 * @param reply
	 * @return result
	 */
	public int insertReply(Reply reply) {

		return sqlSession.insert("replyMapper.insertReply", reply);
	}


	/** 댓글 삭제 DAO
	 * @param reply
	 * @return result
	 */
	public int deleteReply(Reply reply) {

		return sqlSession.update("replyMapper.deleteReply", reply);
	}


	/** 댓글 수정 DAO
	 * @param reply
	 * @return result
	 */
	public int updateReply(Reply reply) {

		return sqlSession.update("replyMapper.updateReply", reply);
	}



}
