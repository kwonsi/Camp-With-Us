package team.project.camp.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
