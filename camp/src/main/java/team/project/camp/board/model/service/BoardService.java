package team.project.camp.board.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import team.project.camp.board.model.vo.BoardDetail;
import team.project.camp.board.model.vo.BoardType;
import team.project.camp.board.model.vo.PlaceRecommend;


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

	/** 게시글 삽입 + 이미지 경로 저장
	 * @param detail
	 * @param thumbnailImgPaths
	 * @return boardNo
	 * @throws IOException
	 */
	int insertBoard(BoardDetail detail, String thumbnailImgPaths) throws IOException;

	/** 게시글 수정 서비스
	 * @param detail
	 * @param thumbnailImgPaths
	 * @param deleteList
	 * @return result
	 */
	int updateBoard(BoardDetail detail);

	/** 게시글 삭제 서비스
	 * @param boardNo
	 * @return result
	 */
	int deleteBoard(int boardNo);

	/** 조회수 증가 서비스
	 * @param boardNo
	 * @return result
	 */
	int updateReadCount(int boardNo);

	/** 여행지 추천 목록 조회 서비스
	 * @return rdList
	 */
	List<PlaceRecommend> selectrdList();



}
