package team.project.camp.member.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import team.project.camp.board.model.vo.Board;
import team.project.camp.detail.model.vo.Review;
import team.project.camp.member.model.vo.Member;

public interface MyPageService {

	/** 회원 정보 수정 서비스
	 * @param paramMap
	 * @return result
	 */
	int updateInfo(Map<String, Object> paramMap);

	/** 비밀번호 변경 서비스
	 * @param newPw
	 * @param memberNo
	 * @return result
	 */
	int changePw(Map<String, Object> paramMap);

	/** 회원 탈퇴 서비스
	 * @param memberNo
	 * @return result
	 */
	int doSecession(Member member);

	/** 프로필 이미지 변경 서비스
	 * @param map
	 * @return result
	 */
	int updateProfile(Map<String, Object> map) throws IOException;


	/** 내 리뷰 조회
	 * @param memberNo
	 * @return
	 */
	List<Review> selectMyReplyList(int memberNo);

	/** 내 게시글 조회
	 * @param memberNo
	 * @return
	 */
	List<Board> selectMyBoard(int memberNo);

	
	/** (관리자용) 전체 게시글 조회
	 * @return
	 */
	List<Board> selectAllBoard();

	/** (관리자용) 전체 리뷰 조회
	 * @return
	 */
	List<Review> selectAllReview();

}
