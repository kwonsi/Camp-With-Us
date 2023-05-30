package team.project.camp.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.camp.board.model.dao.BoardDAO;
import team.project.camp.board.model.vo.Board;
import team.project.camp.board.model.vo.BoardDetail;
import team.project.camp.board.model.vo.BoardType;
import team.project.camp.board.model.vo.Pagination;

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
		Map<String, Object> map = new HashMap<String, Object>();
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
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("boardList", boardList);
		
		
		return map;
	}

	// 게시글 상세 조회 서비스 구현
	@Override
	public BoardDetail selectBoardDetail(int boardNo) {

		return dao.selectBoardDetail(boardNo);
	}
	
	
	

}
