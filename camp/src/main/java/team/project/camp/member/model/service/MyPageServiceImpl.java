package team.project.camp.member.model.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import team.project.camp.board.model.vo.Board;
import team.project.camp.common.Util;
import team.project.camp.detail.model.vo.Review;
import team.project.camp.member.model.dao.MyPageDAO;
import team.project.camp.member.model.vo.Member;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDAO dao;

	@Autowired
	private BCryptPasswordEncoder bcrypt;

	// 회원 정보 수정 서비스 구현
	@Override
	public int updateInfo(Map<String, Object> paramMap) {
		return dao.updateInfo(paramMap);
	}

	// 비밀번호 변경 서비스 구현
	@Override
	public int changePw(Map<String, Object> paramMap) {

		// 1) DB에서 현재 회원의 비밀번호를 조회
		String checkPw = dao.checkPw( (int)paramMap.get("memberNo") );

		// 2) 입력된 현재 비밀번호(평문)과
		//    조회된 비밀번호(암호화)를 비교 (bcrypt.matches() 이용)

		// 3) 비교 결과가 일치하면
		//    새 비밀번호 암호화해서 update 구문 수행
		if( bcrypt.matches((String)paramMap.get("currentPw"), checkPw)) {
			paramMap.put("newPw", bcrypt.encode( (String) paramMap.get("newPw") ));

			return dao.changePw(paramMap);
		}

		// 비교 결과가 일치하지 않으면 0 반환
		// -> "현재 비밀번호가 일치하지 않습니다"
		return 0;
	}

	// 회원 탈퇴 서비스 구현
	@Override
	public int doSecession(Member loginMember) {

		// 1) DB에서 현재 회원의 비밀번호를 조회
		String checkPw = dao.checkPw(loginMember.getMemberNo());

		if( bcrypt.matches(loginMember.getMemberPw(), checkPw) ) {
			// 2) 비밀번호가 일치하면 회원번호를 이용해서 탈퇴 진행

			return dao.doSecession(loginMember.getMemberNo());
		}

		// 3) 비밀번호가 일치하지 않으면 0 반환
		return 0;
	}

	// 프로필 이미지 변경 서비스 구현
	@Override
	public int updateProfile(Map<String, Object> map) throws IOException {
							// webPath, folderPath, uploadImage, delete(String), memberNo

		// 자주 쓰는 값 변수에 저장
		MultipartFile uploadImage = (MultipartFile)map.get("uploadImage");
		String delete = (String)map.get("delete"); // "0" (변경) / "1" (삭제)

		// 프로필 이미지 삭제 여부를 확인해서
		// 삭제가 아닌 경우(== 새 이미지로 변경) -> 업로드된 파일명 변경
		// 삭제된 경우 -> NULL 값을 준비

		String renameImage = null; // 변경된 파일명 저장 변수

		if(delete.equals("0")) { // 이미지가 변경된 경우

			// 파일명 변경
			// uploadImage.getOriginalFilename() : 원본 파일명
			renameImage = Util.fileRename( uploadImage.getOriginalFilename() );

			map.put("profileImage", map.get("webPath") + renameImage);
									// /resources/images/memberProfile/image.png

		} else {
			map.put("profileImage", null);
		}

		// DAO 를 호출해서 프로필 이미지 수정
		int result = dao.updateProfile(map);

		// DB 수정 성공 시 메모리에 임시 저장되어 있는 파일을 서버에 저장
		if( result > 0 && map.get("profileImage") != null) {
			uploadImage.transferTo( new File(map.get("folderPath") + renameImage) );
		}

		return result;
	}

	// 내 리뷰 조회 서비스 구현
	@Override
	public List<Review> selectMyReplyList(int memberNo) {
		return dao.selectMyReplyList(memberNo);
	}

	// 내 게시글 조회 서비스 구현
	@Override
	public List<Board> selectMyBoard(int memberNo) {
		return dao.selectMyBoard(memberNo);
	}
	
	// (관리자용) 전체 게시글 조회
	@Override
	public List<Board> selectAllBoard() {
		return dao.selectAllBoard();
	}
	
	// (관리자용) 전체 리뷰 조회
	@Override
	public List<Review> selectAllReview() {
		return dao.selectAllReview();
	}
}
