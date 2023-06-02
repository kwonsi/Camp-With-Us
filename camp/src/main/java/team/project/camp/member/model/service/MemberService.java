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

}
