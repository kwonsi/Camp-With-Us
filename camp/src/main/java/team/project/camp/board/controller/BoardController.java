package team.project.camp.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import lombok.extern.slf4j.Slf4j;
import team.project.camp.board.model.service.BoardService;
import team.project.camp.board.model.service.ReplyService;
import team.project.camp.board.model.vo.Board;
import team.project.camp.board.model.vo.BoardDetail;
import team.project.camp.board.model.vo.PlaceRecommend;
import team.project.camp.board.model.vo.Reply;
import team.project.camp.common.Util;
import team.project.camp.member.model.vo.Member;

@Slf4j
@Controller
@RequestMapping("/board")
@SessionAttributes({"loginMember"})
public class BoardController {

	@Autowired
	private BoardService service;

	@Autowired
	private ReplyService replyservice;

	
	// 게시글 목록 조회용 컨트롤러
	@GetMapping("/list/{boardCode}")
	public String boardList( @PathVariable("boardCode") int boardCode,
							@RequestParam(value="cp", required= false, defaultValue="1") int cp,
//							@RequestParam(value="boardContent", required= false) String boardContent,
							Model model, // -> 세션에 값을 올려주는 model! 값 올리라고 호출하는 방법 -> model.addAttribute();
							@RequestParam Map<String, Object> paramMap,
//							PlaceRecommend placeRecommend,
//							=> 이걸 쓰면 model에
//							placeRecommend=team.project.camp.board.model.vo.PlaceRecommend@736da7e8, org.springframework.validation.BindingResult.placeRecommend=org.springframework.validation.BeanPropertyBindingResult: 0 errors
//							가 담김
//							=> 여기에 적는 의미가 뭐지? 무조건 model에 값을 담는건가? -> 그건 아님! 그치만 저렇게 뜨는 이유는 모르겠군,, 땃쉬..
							Board board) {
							// 검색 요청인 경우 : key, query, cp(있거나 없거나)

		// 게시글 목록 조회 서비스 호출
		// 1) 게시판 이름 조회 -> 인터셉터로 application에 올려둔 boardTypeList 쓸 수 있을듯?
		// 2) 페이지네이션 객체 생성(listCount)
		// 3) 게시글 목록 조회
		
		
		Map<String, Object> map = null;
		
		List<PlaceRecommend> list =null;
		
		if(paramMap.get("key") == null) { // 검색이 아닌 경우의 게시글 목록조회
			
			map = service.selectBoardList(cp, boardCode);

			list = service.selectrdList();
			
			model.addAttribute(list);
			
			
			log.info("Controller list : " +  list);
			
			
		}else { // 검색인 경우

			// 검색에 필요한 데이터를 paramMap에 모두 담아서 서비스 호출
			// -> key, query, cp, boardCode

			paramMap.put("cp", cp);  // 있으면 같으면 값으로 덮어쓰기, 없으면 추가
			paramMap.put("boardCode", boardCode);

			map = service.searchBoardList(paramMap);


		}
		
	
		model.addAttribute("map", map);
		
		
		log.info("Controller map :" +  map);
		log.info("Controller model :" +  model);

		
		return "board/boardList"+ boardCode;
	}





	// 게시글 상세 조회
	@GetMapping("/detail/{boardCode}/{boardNo}")
	public String boardDetail(@PathVariable("boardCode") int boardCode,
							@PathVariable("boardNo") int boardNo,
							@RequestParam(value="cp", required= false, defaultValue="1") int cp,
							Model model,
							HttpSession session,
							HttpServletRequest req,
							HttpServletResponse resp) {

		// 게시글 상세 조회 서비스 호출
		BoardDetail detail = service.selectBoardDetail(boardNo);
		
		// BoardContent만 XSS 방지 처리 해제
		detail.setBoardContent(Util.XSSClear( detail.getBoardContent() ));
		
//		log.info("Controller detail.getBoardContent : " + detail.getBoardContent());
		
		// @ModelAttribute("loginMember") Member loginMember  (사용불가)
		// @ModelAttribute는 별도의 required 속성이 없어서 무조건 필수 조건임!
		// -> 세션에 loginMember가 없으면 예외가 발생됨
		// 해결 방법 : HttpSession을 이용


		// 상세 조회 성공 시(detail != null)
		// 쿠키를 이용한 조회수 중복 증가 방지 코드 + 본인이 쓴 글은 조회수 증가 하면 X
		// 들어가는 값 형식 : "1/2/3/50/65/.."

		if( detail != null) { // 상세 조회 성공 시

			// 댓글 목록을 조회해서 request scope 에 추가해줘야함
			List<Reply> rList = replyservice.selectAll(boardNo);
			model.addAttribute("rList", rList);


			Member loginMember = (Member)session.getAttribute("loginMember");

			int memberNo = 0;

			if(loginMember != null) { // 로그인 된 상태일 때
				memberNo = loginMember.getMemberNo();
			}

			// 글쓴이와 현재 클라이언트(로그인 한 사람)가 같지 않은 경우 -> 조회수 증가
			if( detail.getMemberNo() != memberNo ) {

				Cookie cookie = null; // 기존에 존재하던 쿠키를 저장 할 변수

				Cookie[] cArr = req.getCookies(); // 쿠키 얻어오기

				if(cArr != null && cArr.length > 0) { // 얻어온 쿠키가 있을 경우

					// 얻어온 쿠키 중 이름이 "readBoardNo"가 있으면 얻어오기
					for(Cookie c : cArr) {

						if(c.getName().equals("readBoardNo")) {
							cookie = c;
						}
					}

				}

				int result = 0;

				if( cookie == null ) { // 기존에 "readBoardNo" 라는 이름의 쿠키가 없을 경우

					cookie = new Cookie("readBoardNo", boardNo+"");

					result = service.updateReadCount(boardNo); // 조회 수 증가 서비스 호출

				} else { // 기존에 "readBoardNo" 라는 이름의 쿠키가 있을 경우
					// -> 쿠키에 저장된 값 뒤쪽에 현재 조회된 게시글 번호를 추가해줄것임
					// 단, 기존 쿠키값에 중복되는 번호가 없어야 한다.

					String[] temp = cookie.getValue().split("/"); // 기존 value

					// "readBoardNo" : "1/5/44/58/92/300/.." -> [1,5,44,58,92,300,..]

					List<String> list = Arrays.asList(temp); // 배열 -> List로 변환

					// String.indexOf("문자열")  :
					// - String에서 "문자열"과 일치하는 부분의 시작 인덱스를 반환
					// - 일치하는 부분이 없으면 -1 반환

					// List.indexOf(Object) :
					// - List에서 Object와 일치하는 부분의 인덱스를 반환
					// - 일치하는 부분이 없으면 -1 반환

					if( list.indexOf(boardNo+"") == -1 ) { // 기존 값에 같은 글번호가 없다는것 -> 그럼 추가해야지!

						cookie.setValue( cookie.getValue() + "/" + boardNo );

						result = service.updateReadCount(boardNo); // 조회수 증가 서비스 호출
					}

				}


				// 결과값 이용한 DB 동기화
				if(result > 0) { // 성공 -> DB동기화 시켜주기

					detail.setReadCount(detail.getReadCount() + 1); // 이미 조회된 데이터를 DB에 동기화 시켜주기

					cookie.setPath(req.getContextPath());
					cookie.setMaxAge(60 * 60 * 1);
					resp.addCookie(cookie);
				}


			}
		}

		model.addAttribute("detail", detail);

		return "board/boardDetail";

	}

	
	
	// summernote 업로드 이미지 저장을 위한 컨트롤러
	@RequestMapping(value="/upload", produces = "application/json; charset=utf8")
	@ResponseBody  // ajax 응답 시 사용!
	public String uploadSummernoteImageFile( @RequestParam("file") MultipartFile[] multipartFiles,
												 HttpServletRequest req
												 ) {
		
		System.out.println("summernote 컨트롤러 시작");
		
		JsonArray jsonArray = new JsonArray();
		JsonObject jsonObject = new JsonObject();
		
		// 내부경로로 저장
//		String contextRoot = new HttpServletRequestWrapper(request).getSession().getServletContext().getRealPath("/");
//			 	-> C:\workspace\Final_Camp_eunju3\Final_Camp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\camp\
//		String fileRoot = "C:\\workspace\\Final_Camp_eunju3\\Final_Camp\\camp\\src\\main\\webapp\\resources\\images\\summernote\\";
//				-> camp 프로젝트 내 /images/summernote 폴더 경로
//		String fileRoot = "C:/workspace/Final_Camp_eunju3/Final_Camp/camp/src/main/webapp/resources/images/summernote/";
		
		String webPath = "/resources/images/summernote/";
		String folderPath = req.getSession().getServletContext().getRealPath(webPath); // -> "C:/workspace/Final_Camp_eunju3/Final_Camp/camp/src/main/webapp/resources/images/summernote/"
		
		
		for (MultipartFile multipartFile : multipartFiles) {
			String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
			String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
			File targetFile = new File(folderPath + savedFileName);
			
//				log.debug("originalFileName : " + originalFileName);
//				log.debug("savedFileName : " + savedFileName);
//				log.debug("targetFile : " + targetFile);
		
			try {
				InputStream fileStream = multipartFile.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
				jsonObject.addProperty("url", req.getContextPath() + webPath + savedFileName);
				
//					jsonObject.addProperty("url", "/resources/images/summernote/"+savedFileName);
//						-> contextroot + resources + 저장할 내부 폴더명
				
//					log.debug("req.getContextPath() : " + req.getContextPath());  -> /camp
//					log.debug("jsonObject : " + jsonObject);  -> {"url":"/camp/resources/images/summernote/f794a7bc-7a9b-4111-b63b-6e46f79cbaa7.jpg"}
				
				
				// jsp에서 사용하기 위해 req에 값을 세팅해준다
				req.setAttribute("imgPath", webPath+savedFileName);
				// req에 값이 잘 들어갔는지 확인해보기 -> /resources/images/summernote/dca7dbfb-d327-4077-905b-88c01a0c005e.jpg
				log.debug("Controller req : " + req.getAttribute("imgPath"));
				
				
					
			} catch (IOException e) {
				FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
				jsonObject.addProperty("responseCode", "error");
				e.printStackTrace();
			}
			
	         jsonArray.add(jsonObject);
	      }
		
		String jsonResult = jsonArray.toString();
		
		log.debug("jsonResult(저장경로) : " + jsonResult);
		
		return jsonResult;
	}
	
	
	
	


	// 게시글 작성 화면 전환
	// 개행문자가 <br>로 되어있는 상태 -> textarea에서 출력하려면 \n 으로 변경해야함
	// -> Util.newLineClear() 메서드를 사용하면됨
	@GetMapping("/write/{boardCode}")
	public String boardWriteForm(@PathVariable("boardCode") int boardCode,
								String mode,
								@RequestParam(value="no", required=false, defaultValue="0") int boardNo,
								/* insert의 경우 파라미터에 no가 없을 수 있음*/
								Model model ) {

		if(mode.equals("update")) {

			// 게시글 상세조회 서비스 호출(boardNo)
			BoardDetail detail = service.selectBoardDetail(boardNo);

			// -> 개행문자가 <br> 태그로 되어있는 상태임 -> textarea 출력 예정이기 때문에  \n으로 변경해야함
			detail.setBoardContent( Util.newLineClear( detail.getBoardContent() ) );
			
			
			model.addAttribute("detail", detail);
		}

		return "board/boardWriteForm";
	}



	// 게시글 작성 (삽입/수정을 한 함수에 같이 하기)
	// "/board/write/{boardCode}" -> 서비스 요청 url 주소가 동일함
	@PostMapping("/write/{boardCode}")
	public String boardWrite( BoardDetail detail, // boardTitle, boardContent, boardNo(수정)
							@RequestParam(value="images", required=false) List<MultipartFile> imageList, // 업로드 파일(이미지) 리스트
							@PathVariable("boardCode") int boardCode,
							String imgPath,
							String mode,
							@ModelAttribute("loginMember") Member loginMember,
							RedirectAttributes ra,
							HttpServletRequest req, // 이미지 저장 경로 얻어올때 씀
							@RequestParam(value="cp", required=false, defaultValue="1") int cp,
							@RequestParam(value="deleteList", required=false) String deleteList ) throws IOException {


		log.debug("imgPath : " + req.getAttribute("imgPath"));
		//String[] imgUrl;
//		log.debug("imageList : " + imageList);  -> null

		// 1) 로그인 한 회원번호 얻어와서 detail에 세팅해주기
		detail.setMemberNo( loginMember.getMemberNo() );

		// 2) 이미지 저장 경로 얻어오기 ( webPath, folderPath )
		String webPath = "/resources/images/summernote/";
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);
		
		
//		log.debug("folderPath : " + folderPath); // -> C:\workspace\Final_Camp_eunju3\Final_Camp\camp\src\main\webapp\resources\images\summernote\
//		log.info("Controller mode : "+ mode);
//		log.debug("Controller boardContent : " + detail.getBoardContent());
		
		
		// 3) 삽입인지 수정인지 나눠주기
		if(mode.equals("insert")) { // 삽입
			
			// BoardContent만 XSS 방지 처리 해제
			detail.setBoardContent(Util.XSSClear( detail.getBoardContent() ));
			
			// 게시글 부분 삽입 (이미지가 없을때) 제목, 내용, 회원번호, 게시판코드
			// -> 삽입 된 게시글의 번호(boardNo) 반환 (왜? 삽입이 끝나면 게시글 상세조회로 리다이렉트할거라서)

			// 게시글에 포함된 이미지 정보 삽입 (0 ~ 5개, 게시글 번호 필요)
			// -> 실제 파일로 변환해서 서버에 저장 ( transFer() )

			// 두번의 insert중 한번이라도 실패하면 전체 rollback (트랜잭션 처리)

			int boardNo = service.insertBoard(detail, imageList, webPath, folderPath);
			
//			log.info("Controller imageList : "+imageList);
			
			
			
			String path = null;
			String message = null;

			if(boardNo > 0) {
				// /board/write/1 -> /board/detail/1/1500 으로 이동해야함

				path = "../detail/" + boardCode + "/" + boardNo;
				message = "게시글이 등록되었습니다.";

			} else {
				path = req.getHeader("referer"); // referer 은 이전페이지의 URL을 기억하고있음
				message = "게시글 삽입 실패..";
			}

			ra.addFlashAttribute("message", message);

			return "redirect:" + path;

		} else { // 수정
			
			// BoardContent만 XSS 방지 처리 해제
			detail.setBoardContent(Util.XSSClear( detail.getBoardContent() ));
			
			// 게시글 수정 서비스 호출
			// 게시글 번호를 알고있기 때문에 수정 결과만 반환받으면 된다.
			int result = service.updateBoard(detail, imageList, webPath, folderPath, deleteList);


			String path = null;
			String message = null;

			if(result > 0) {
				// /board/write/1 -> /board/detail/1/1500 으로 이동해야함

				// 현재 : /board/write/{boardCode}
				// 목표 : /board/detail/{boardCode}/{boardNo}?cp=10

				path = "../detail/" + boardCode + "/" + detail.getBoardNo() + "?cp=" + cp;
				message = "게시글이 수정되었습니다.";

			} else {
				path = req.getHeader("referer"); // referer 은 이전페이지의 URL을 기억하고있음
				message = "게시글 수정 실패..";
			}

			ra.addFlashAttribute("message", message);

			return "redirect:" + path;
		}

	}


	// 게시글 삭제
	@GetMapping("/delete/{boardCode}/{boardNo}")
	public String deleteBoard( @PathVariable("boardCode") int boardCode,
								@PathVariable("boardNo") int boardNo,
								RedirectAttributes ra,
								@RequestHeader("referer") String referer ) {

		int result = service.deleteBoard(boardNo);

		String path = null;
		String message = null;


		if(result > 0) {
			message = "삭제되었습니다.";
			//path = "../../list/" + boardCode; // 상대경로
			path = "/board/list/"+ boardCode;
		} else {
			message = "삭제 실패";
			path = referer;
		}

		ra.addFlashAttribute("message" ,message);


		return "redirect:" + path;
	}
	
	
	
}
