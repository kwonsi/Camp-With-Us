package team.project.camp.member.model.service;

import java.util.Map;

import team.project.camp.member.model.vo.Member;

public interface MemberService {

	/** 로그인 서비스
	 * @param inputMember
	 * @return loginMember
	 */
	public abstract Member login(Member inputMember);

	/** 이메일 중복 검사 서비스
	 * @param memberEmail
	 * @return result
	 */
	public abstract int emailDupCheck(String memberEmail);

	/** 닉네임 중복 검사 서비스
	 * @param memberNickname
	 * @return result
	 */
	public abstract int nicknameDupCheck(String memberNickname);


	/** 회원 가입 서비스
	 * @param inputMember
	 * @return result
	 */
	public abstract int signUp(Member inputMember);

	
	/** 아이디 찾기 서비스
	 * @param memberTel
	 * @return
	 */
	public abstract String findId(String memberTel);

	/** 임시 비밀번호 설정 서비스
	 * @param memberEmail
	 * @param randomPassword
	 */
	public abstract int setTempPassword(Member member);

	
	
	
	/** 네이버 이메일 중복검사 서비스
	 * @param memberEmail
	 * @return
	 */
	public abstract int naverEmailDupCheck(String memberEmail);

	
	
	/** 네이버 로그인 DB 저장
	 * @param loginMember
	 * @return 
	 */
	public abstract int naverLoginInsert(Member loginMember); 
	
	
	/** 네이버 로그인 회원정보 뽑아오기
	 * @param loginMember
	 * @return
	 */
	public abstract Member naverMember(Member loginMember);
	

	/**구글 첫 로그인 시 DB 삽입
	 * @param member
	 * @return result
	 */
	public abstract int googleLoginInsert(Member member);


	/**구글 로그인
	 * @param googleMember
	 * @return googleLoginMember
	 */
	public abstract Member googleLogin(Member googleMember);

	
	
	/**카카오 로그인
	 * @param kakaoMember
	 * @return
	 */
	public abstract Member kakaoLogin(Member kakaoMember);

	
	/**카카오 첫 로그인 시 DB삽입
	 * @param member
	 * @return
	 */
	public abstract int kakaoLoginInsert(Member member);





}
