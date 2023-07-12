package team.project.camp.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.camp.board.model.vo.Board;
import team.project.camp.detail.model.vo.Review;

@Repository
public class MyPageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 회원 정보 수정 DAO
	 * @param paramMap
	 * @return
	 */
	public int updateInfo(Map<String, Object> paramMap) {
		return sqlSession.update("myPageMapper.updateInfo", paramMap);
	}


	/** 비밀번호 변경 (현재 비밀번호 조회) DAO
	 *
	 */
	public String checkPw(int memberNo) {
		return sqlSession.selectOne("myPageMapper.checkPw", memberNo);
	}


	/** 비밀번호 변경 DAO
	 * @param paramMap
	 * @return
	 */
	public int changePw(Map<String, Object> paramMap) {
		return sqlSession.update("myPageMapper.changePw", paramMap);
	}


	/** 회원 탈퇴 DAO
	 * @param memberNo
	 * @return result
	 */
	public int doSecession(int memberNo) {
		return sqlSession.update("myPageMapper.secession", memberNo);
	}


	/** 프로필 이미지 변경 DAO
	 * @param map
	 * @return result
	 */
	public int updateProfile(Map<String, Object> map) {
		return sqlSession.update("myPageMapper.updateProfile", map);
	}


	/** 내 리뷰 조회 DAO
	 * @param memberNo
	 * @return
	 */
	public List<Review> selectMyReplyList(int memberNo) {
		return sqlSession.selectList("myPageMapper.selectMyReplyList", memberNo);
	}


	/** 내 게시글 조회 DAO
	 * @param memberNo
	 * @return
	 */
	public List<Board> selectMyBoard(int memberNo) {
		return sqlSession.selectList("myPageMapper.selectMyBoard", memberNo);
	}


	/** (관리자용) 전체 게시글 조회 DAO
	 * @return
	 */
	public List<Board> selectAllBoard() {
		return sqlSession.selectList("myPageMapper.selectAllBoard");
	}


	/** (관리자용) 전체 리뷰 조회 DAO
	 * @return
	 */
	public List<Review> selectAllReview() {
		return sqlSession.selectList("myPageMapper.selectAllReview");
	}


}
