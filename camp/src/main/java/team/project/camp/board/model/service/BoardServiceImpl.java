package team.project.camp.board.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import team.project.camp.board.model.dao.BoardDAO;
import team.project.camp.board.model.exception.InsertFailException;
import team.project.camp.board.model.vo.Board;
import team.project.camp.board.model.vo.BoardDetail;
import team.project.camp.board.model.vo.BoardImage;
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


	// 게시글 삽입 + 이미지 삽입 서비스 구현
	@Transactional(rollbackFor= { Exception.class })
	@Override
	public int insertBoard(BoardDetail detail, List<MultipartFile> imageList, String webPath, String folderPath) throws IOException {

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

		
//		summernote를 사용하면서 imageList를 사용하지 않기 때문에 값이 들어가지 않아서 오류가 생겼음
//			-> && imageList != null 추가
		if(boardNo > 0 && imageList != null) { // 성공
			// 글만 있는걸 삽입하는데 성공했으니 이미지 삽입도 진행해라!

			// imageList : 실제 이미지 파일이 담겨있는 리스트
			// boardImageList : DB에 삽입할 이미지 정보만 담겨있는 리스트
			// reNameList : 변경된 파일명이 담겨있는 리스트
			
			List<BoardImage> boardImageList = new ArrayList<BoardImage>();
			List<String> reNameList = new ArrayList<String>();


			// imageList에 담겨있는 파일 정보 중 실제 업로드된 파일만 분류하는 작업
			for(int i=0; i < imageList.size(); i++) {

				if( imageList.get(i).getSize() > 0 ) { // i번째 요소에 업로드된 이미지가 있는경우

					// 변경된 파일명 저장
					String reName = Util.fileRename( imageList.get(i).getOriginalFilename() );
					reNameList.add(reName);

					// BoardImage 객체를 생성하여 값 세팅 후 boardImageList 추가
					BoardImage img = new BoardImage();
					img.setBoardNo(boardNo); // 게시글 번호
					img.setImageLevel(i); // 이미지 순서(파일 레벨)에 맞게 세팅하는것
					img.setImageOriginal( imageList.get(i).getOriginalFilename() ); // 원본 파일명
					img.setImageReName(webPath + reName); // 웹 접근경로 + 변경된 파일명

					boardImageList.add(img);

				}

			} // for문 종료


			// 분류작업 종료 후 boardImageList가 비어있지 않은 경우 == 파일이 업로드가 된 경우

			if( !boardImageList.isEmpty() ) {

				int result = dao.insertBoardImageList(boardImageList);

				// result == 삽입 성공한 행의 갯수가 들어옴
				// result =/= boardImageList 면 잘못 들어갔다는거니까 rollback 트랜잭션처리해주기

				if( result == boardImageList.size() ) { // 삽입된 행의 개수와 업로드 이미지 수가 같을 경우

					// 서버에 이미지 저장
					for(int i = 0; i < boardImageList.size(); i++) {
						int index = boardImageList.get(i).getImageLevel();

						imageList.get(index).transferTo(new File( folderPath + reNameList.get(i) ));
					}

				} else { // 이미지 삽입 실패 시

					// 강제로 예외를 발생시켜 rollback을 수행하게 함
					// -> 사용자 정의 예외
					throw new InsertFailException();

				}

			}

		}

		return boardNo;
	}


	// 게시글 수정
	// 선언적 트랜잭션 처리 방법(unchecked Exception 처리가 기본)
	@Transactional(rollbackFor = {Exception.class}) // 모든 종류의 예외 발생시 rollback
	@Override
	public int updateBoard(BoardDetail detail, List<MultipartFile> imageList, String webPath, String folderPath,
			String deleteList) throws IOException {

		// 1) XSS 방지 처리 + 개행문자 처리
		detail.setBoardTitle( Util.XSSHandling( detail.getBoardTitle()) ); // XSS 방지 처리
		detail.setBoardContent( Util.XSSHandling( detail.getBoardContent()) ); // XSS 방지 처리

		detail.setBoardContent( Util.newLineHandling( detail.getBoardContent()) ); // 개행문자 처리

		// 2) 게시글( 제목, 내용, 마지막 수정일(sysdate) )만 수정하는 DAO 호출
		int result = dao.updateBoard(detail);

		
//		summernote를 사용하면서 imageList를 사용하지 않기 때문에 값이 들어가지 않아서 오류가 생겼음
//			-> && imageList != null 추가
		if(result > 0 && imageList != null) { // 성공

			// 3) 업로드 된 이미지만 분류하는 작업 수행

			List<BoardImage> boardImageList = new ArrayList<>();
			List<String> reNameList = new ArrayList<>();

			// imageList에 담겨있는 파일 정보 중 실제 업로드된 파일만 분류하는 작업
			for(int i=0; i < imageList.size(); i++) {

				if( imageList.get(i).getSize() > 0 ) { // i번째 요소에 업로드된 이미지가 있는경우

					// 변경된 파일명 저장
					String reName = Util.fileRename( imageList.get(i).getOriginalFilename() );
					reNameList.add(reName);

					// BoardImage 객체를 생성하여 값 세팅 후 boardImageList 추가
					BoardImage img = new BoardImage();
					img.setBoardNo( detail.getBoardNo() ); // 게시글 번호
					img.setImageLevel(i); // 이미지 순서(파일 레벨)에 맞게 세팅하는것
					img.setImageOriginal( imageList.get(i).getOriginalFilename() ); // 원본 파일명
					img.setImageReName(webPath + reName); // 웹 접근경로 + 변경된 파일명

					boardImageList.add(img);

				}

			} // for문 종료


			// 4) deleteList를 이용해서 삭제된 이미지 delete
			if(!deleteList.equals("")) { // deleteList에 값이 있다 -> 삭제된 이미지가 있다 -> 삭제하자
				Map<String, Object> map = new HashMap<>();

				map.put("boardNo", detail.getBoardNo());
				map.put("deleteList", deleteList);

				result = dao.deleteBoardImage(map);

			}

			if(result > 0) {

				// 5) boardImageList를 순차 접근 하면서 하나씩 update
				for(BoardImage img : boardImageList) {
					result = dao.updateBoardImage(img); // 변경명, 원본명, 게시글번호, 레벨
					// 결과 1 -> 수정 o -> 기존에 이미지가 있었다 -> update 진행 -> 수정
					// 결과 0 -> 수정 x -> 기존에 이미지가 없었다 -> insert 진행 -> 삽입

					// 6) update를 실패하면 insert를 해라!(원래 없던걸 새로 추가한거니까)
					if(result == 0) {
						result = dao.insertBoardImage(img);
						// -> 값을 하나씩 대입해서 삽입하는 경우 결과가 0이 나올 수 없다!
						// 단, 예외(제약조건 위배, sql 문법 오류 등)는 발생할 수 있다

					}

				}

				// 7) 업로드 된 이미지가 있다면 서버에 저장하기
				if( !boardImageList.isEmpty() && result != 0 ) {

					// 서버에 이미지 저장
					for(int i = 0; i < boardImageList.size(); i++) {
						int index = boardImageList.get(i).getImageLevel();

						imageList.get(index).transferTo(new File( folderPath + reNameList.get(i) ));
					}

				}

			}

		}

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
