package team.project.camp.board.model.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import team.project.camp.board.model.dao.BoardDAO;
import team.project.camp.board.model.vo.Board;
import team.project.camp.board.model.vo.BoardDetail;
import team.project.camp.board.model.vo.BoardType;
import team.project.camp.board.model.vo.Pagination;
import team.project.camp.board.model.vo.PlaceRecommend;
import team.project.camp.common.Util;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO dao;




	// 게시판 코드, 이름 조회
	@Override
	public List<BoardType> selectBoardType() {

		return dao.selectBoardType();
	}


	// 게시글 목록 조회 서비스 구현
	@Override
	public Map<String, Object> selectBoardList(int cp, int boardCode) {

		// 1) 게시판 이름 조회 -> 인터셉터 application에 올려둔 boardTypeList 쓸 수 있을듯 하다

		// 2) 페이지네이션 객체 생성(listCount)
		int listCount = dao.getListCount(boardCode);
		Pagination pagination = new Pagination(cp, listCount);

		// 3) 게시글 목록 조회
		List<Board> boardList = dao.selectBoardList(pagination, boardCode);

		for (Board element : boardList) {
//			log.info(Util.XSSClear(boardList.get(i).getBoardContent()));

			String str = element.getBoardContent();

			// BoardContent에서 정규식을 이용한 이미지 태그 추출
			str = Util.XSSClear(str);

			// 이미지 태그를 추출하기 위한 정규식.
			Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");

			// 내용 중에서 이미지 태그를 찾기
			Matcher match = pattern.matcher( str );

			String[] imgTag = new String[10];

			if(match.find()){ // 이미지 태그를 찾았다면
				for(int j=0; j<imgTag.length; j++) {
					imgTag[j] = match.group(1); // 글 내용 중에 첫번째 이미지 태그를 뽑아옴.
//					log.info(imgTag[j]);
					element.setThumbnailImg(imgTag[j]);
				}
			}
		} // for(int i=0; i<boardList.size(); i++)

		// map 만들어서 담기
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("boardList", boardList);
		map.put("boardCode", boardCode);


		return map;
	}


	// 검색 게시글 목록 조회 서비스 구현
	@Override
	public Map<String, Object> searchBoardList(Map<String, Object> paramMap) {

		// 검색 조건에 맞는 게시글 목록의 전체 갯수 조회
		int listCount = dao.searchListCount(paramMap);

		// 페이지네이션 객체 생성
		Pagination pagination = new Pagination( (int) paramMap.get("cp"), listCount);

		// 검색 조건에 맞는 게시글 목록 조회(페이징 처리 적용)
		List<Board> boardList = dao.searchBoardList(paramMap, pagination);

		for (Board element : boardList) {
//		log.info(Util.XSSClear(boardList.get(i).getBoardContent()));

			String str = element.getBoardContent();

			// BoardContent에서 정규식을 이용한 이미지 태그 추출
			str = Util.XSSClear(str);

			// 이미지 태그를 추출하기 위한 정규식.
			Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");

			// 내용 중에서 이미지 태그를 찾아라!
			Matcher match = pattern.matcher( str );

			String[] imgTag = new String[10];
			if(match.find()){ // 이미지 태그를 찾았다면
				for(int j=0; j<imgTag.length; j++) {
					imgTag[j] = match.group(1); // 글 내용 중에 첫번째 이미지 태그를 뽑아옴.
//					log.info(imgTag[j]);
					element.setThumbnailImg(imgTag[j]);
				}
			}
		} // for(int i=0; i<boardList.size(); i++)

		// map 만들어 담기
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("boardList", boardList);


		return map;
	}


	// 게시글 상세 조회 서비스 구현
	@Override
	public BoardDetail selectBoardDetail(int boardNo) {

		return dao.selectBoardDetail(boardNo);
	}




	// 게시글 삽입 + 이미지 경로 저장 서비스 구현
	@Transactional(rollbackFor= { Exception.class })
	@Override
	public int insertBoard(BoardDetail detail, String thumbnailImgPaths) throws IOException {

		// 1. 게시글 삽입

		// 1) XSS 방지 처리 + 개행문자 처리
		detail.setBoardTitle( Util.XSSHandling( detail.getBoardTitle()) ); // XSS 방지 처리
		detail.setBoardContent( Util.XSSHandling( detail.getBoardContent()) ); // XSS 방지 처리

		detail.setBoardContent( Util.newLineHandling( detail.getBoardContent()) ); // 개행문자 처리

		// 2) 게시글 삽입 DAO 호출 후 게시글 번호 반환 받기

		//* 게시글 번호를 먼저 따로 생성했던 이유
		// 2-1. 서비스 결과 반환 후 컨트롤러에서 상세조회로 리다이렉트 하기위해
		// 2-2. 동일한 시간에 삽입이 2회이상 진행된 경우 시퀀스 번호가 의도와 달리 여러번 증가해서
		// 		이후에 작성된 이미지 삽입 코드에 영향을 미치는걸 방지하기 위해

		int boardNo = dao.insertBoard(detail);


		return boardNo;
	}




	// 게시글 수정
	// 선언적 트랜잭션 처리 방법(unchecked Exception 처리가 기본)
	@Transactional(rollbackFor = {Exception.class}) // 모든 종류의 예외 발생시 rollback
	@Override
	public int updateBoard(BoardDetail detail) {

		// 1) XSS 방지 처리 + 개행문자 처리
		detail.setBoardTitle( Util.XSSHandling( detail.getBoardTitle()) ); // XSS 방지 처리
		detail.setBoardContent( Util.XSSHandling( detail.getBoardContent()) ); // XSS 방지 처리

		detail.setBoardContent( Util.newLineHandling( detail.getBoardContent()) ); // 개행문자 처리

		// 2) 게시글( 제목, 내용, 마지막 수정일(sysdate) )만 수정하는 DAO 호출
		int result = dao.updateBoard(detail);


		return result;
	}




	//게시글 삭제 서비스 구현
	@Override
	public int deleteBoard(int boardNo) {

		return dao.deleteBoard(boardNo);
	}


	// 조회수 증가 서비스 구현
	@Override
	public int updateReadCount(int boardNo) {

		return dao.updateReadCount(boardNo);
	}


	// 여행지 추천 목록 조회 서비스 구현
	@Override
	public List<PlaceRecommend> selectrdList() {

		return dao.selectrdList();
	}





}
