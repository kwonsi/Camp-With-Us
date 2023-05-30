package team.project.camp.board.model.service;

import java.util.List;
import java.util.Map;

import team.project.camp.board.model.vo.BoardDetail;
import team.project.camp.board.model.vo.BoardType;


public interface BoardService {

	/** 게시판 코드, 이름 조회
	 * @return boardTypeList
	 */
	List<BoardType> selectBoardType();
	
	/** 게시글 목록 조회 서비스
	 * @param cp
	 * @param boardCode
	 * @return map
	 */
	Map<String, Object> selectBoardList(int cp, int boardCode);

	/** 검색 게시글 목록 조회 서비스
	 * @param paramMap
	 * @return map
	 */
	Map<String, Object> searchBoardList(Map<String, Object> paramMap);

	/** 게시글 상세 조회 서비스
	 * @param boardNo
	 * @return detail
	 */
	BoardDetail selectBoardDetail(int boardNo);

}
