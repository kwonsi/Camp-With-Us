package team.project.camp.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.camp.member.model.vo.Member;

@Repository
public class MemberDAO {

	@Autowired // root-context.xml 에서 생성된 SqlSessionTemplate bean 을 의존성 주입(DI)
	private SqlSessionTemplate sqlSession;

	private Logger logger = LoggerFactory.getLogger(MemberDAO.class);

	public Member login(Member inputMember) {

		// 1행 조회(파라미터 VO, 반환되는 결과 VO)
		Member loginMember = sqlSession.selectOne("memberMapper.login", inputMember);

		return loginMember;
	}


	/** 이메일 중복 검사 DAO
	 * @param memberEmail
	 * @return
	 */
	public int emailDupCheck(String memberEmail) {

		return sqlSession.selectOne("memberMapper.emailDupCheck", memberEmail);
	}


	/** 닉네임 중복 검사 DAO
	 * @param memberNickname
	 * @return
	 */
	public int nicknameDupCheck(String memberNickname) {
		return sqlSession.selectOne("memberMapper.nicknameDupCheck", memberNickname);
	}


	/** 회원가입 DAO
	 * @param signUpMember
	 * @return
	 */
	public int signUp(Member signUpMember) {

		// INSERT, UPDATE, DELETE 반환값 int 형으로 고정
		// -> mapper 에서도 resultType 항상 _int 고정
		// -> resultType 생략 가능(묵시적으로 _int)

		return sqlSession.insert("memberMapper.signUp", signUpMember);
	}


	/**구글 첫 로그인 시 DB 삽입
	 * @param member
	 * @return
	 */
	public int googleLoginInsert(Member member) {
		return sqlSession.insert("memberMapper.googleLoginInsert", member);
	}


	/**구글 로그인 회원정보 조회
	 * @param googleMember
	 * @return
	 */
	public Member googleLogin(Member googleMember) {

		Member googleLoginMember = sqlSession.selectOne("memberMapper.googleLogin", googleMember);
		return googleLoginMember;
	}


	/**카카오 첫 로그인 시 DB삽입
	 * @param member
	 * @return
	 */
	public int kakaoLoginInsert(Member member) {
		return sqlSession.insert("memberMapper.kakaoLoginInsert", member);
	}


	/**카카오 로그인 회원정보 조회
	 * @param kakaoMember
	 * @return
	 */
	public Member kakaoLogin(Member kakaoMember) {
		Member kakaoLoginMember = sqlSession.selectOne("memberMapper.kakaoLogin", kakaoMember);
		return kakaoLoginMember;
	}



}
