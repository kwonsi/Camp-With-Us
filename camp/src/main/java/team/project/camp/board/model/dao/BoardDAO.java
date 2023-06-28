package team.project.camp.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.camp.board.model.vo.Board;
import team.project.camp.board.model.vo.BoardDetail;
import team.project.camp.board.model.vo.BoardType;
import team.project.camp.board.model.vo.Pagination;
import team.project.camp.board.model.vo.PlaceRecommend;


@Repository
public class BoardDAO {

	@Autowired
	private SqlSession sqlSession;

	/** 게시판 코드, 이름 조회
	 * @return boardTypeList
	 */
	public List<BoardType> selectBoardType() {

		return sqlSession.selectList("boardMapper.selectBoardType");
	}

	/** 특정 게시판의 전체 게시글 수 조회 DAO
	 * @param boardCode
	 * @return listCode
	 */
	public int getListCount(int boardCode) {

		return sqlSession.selectOne("boardMapper.getListCount", boardCode);
	}

	/** 게시판 목록 조회 DAO
	 * @param pagination
	 * @param boardCode
	 * @param boardMap
	 * @param boardMap
	 * @param boardNo
	 * @return boardList
	 */
	public List<Board> selectBoardList(Pagination pagination, int boardCode) {

		// RowBounds 객체(마이바티스에서 제공)
		// - 전체 조회 결과에서 몇 개의 행을 건너 뛰고(offset)
		//	그 다음 몇 개의 행만 조회(limit)할 것인지를 지정함
		int offset = ( pagination.getCurrentPage() - 1 ) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("boardMapper.selectBoardList", boardCode, rowBounds);
	}

	/** 검색 조건에 맞는 게시글 목록의 전체 갯수 조회 DAO
	 * @param paramMap
	 * @return listCount
	 */
	public int searchListCount(Map<String, Object> paramMap) {

		return sqlSession.selectOne("boardMapper.searchListCount", paramMap);
	}

	/** 검색 조건에 맞는 게시글 목록 조회(페이징 처리 적용)
	 * @param paramMap
	 * @param pagination
	 * @return boardList
	 */
	public List<Board> searchBoardList(Map<String, Object> paramMap, Pagination pagination) {

		// offset : 몇개의 행을 건너뛸 것인가
		// limit : 건너 뛴 후 몇개의 행을 조회할 것인가
		int offset = ( pagination.getCurrentPage() - 1 ) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("boardMapper.searchBoardList", paramMap, rowBounds);
	}

	/** 게시글 상세 조회 DAO
	 * @param boardNo
	 * @return detail
	 */
	public BoardDetail selectBoardDetail(int boardNo) {

		return sqlSession.selectOne("boardMapper.selectBoardDetail", boardNo);
	}

	/** 게시글 삽입 DAO
	 * @param detail
	 * @return boardNo
	 */
	public int insertBoard(BoardDetail detail) {
		int result = sqlSession.insert("boardMapper.insertBoard", detail); // 0 or 1

		if( result > 0) result = detail.getBoardNo();

		// 게시글 삽입 성공 시
		// <selectKey> 태그를 이용해 세팅된 boardNo 값을 반환함 --> 게시글 번호 사용 가능

		return result;
	}

	/** 게시글 수정 DAO
	 * @param detail
	 * @return result
	 */
	public int updateBoard(BoardDetail detail) {

		return sqlSession.update("boardMapper.updateBoard", detail);
	}

	/** 게시글 삭제 DAO
	 * @param boardNo
	 * @return result
	 */
	public int deleteBoard(int boardNo) {

		return sqlSession.update("boardMapper.deleteBoard", boardNo);
	}

	/** 조회수 증가 DAO
	 * @param boardNo
	 * @return result
	 */
	public int updateReadCount(int boardNo) {

		return sqlSession.update("boardMapper.updateReadCount", boardNo);
	}


	/** 여행지 추천 목록 조회 DAO
	 * @return result
	 */
	public List<PlaceRecommend> selectrdList() {

		return sqlSession.selectList("boardMapper.selectrdList");
	}




}
