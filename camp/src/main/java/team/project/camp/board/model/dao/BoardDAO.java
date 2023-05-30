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




}
