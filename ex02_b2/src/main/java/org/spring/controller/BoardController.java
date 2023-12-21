package org.spring.controller;

import org.spring.domain.BoardVO;
import org.spring.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@AllArgsConstructor // 기본생성자 자동 호출 -> boardService 주입
@Log4j
public class BoardController {
	// 의존성 주입
	// Spring 에서 인터페이스 주입 시, 해당 인터페이스를 구현한 객체를 주입
	private final BoardService boardService;
	
	@GetMapping("/list")
	public void listAll(Model model) {
//		boardService.listAll(); // boardList 의 이름으로 넘겨줘야함 -> Model 사용 하여 값 전달
		log.info("전체 회원 목록");
		// model : 매핑된 jsp 등의 화면으로 이동시에 전달되는 객체 
		// 바인딩 : name 과 value 의 쌍으로 저장
		model.addAttribute("boardList", boardService.listAll());
	}
	
	// board/register.jsp 로 화면 이동
	@GetMapping("/register")
	public void registerGet() {
		log.info("글 등록 화면");
	}
	// Ajax, Form 으로 controller 접근 : 데이터 이동
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("board : "+board);
		Integer bno = boardService.registerKey(board);
//		boardService.register(board);
//		int MaxBno = boardService.getMaxBno();
//		log.info(MaxBno);
		
		// 어차피 redirect 로 중복 방지 했으니, 해당 board 가 메모리 상에 남아 있을 이유 X
		// rttr.addFlashAttribute(board); // 일회성으로 사용 후 지워짐 (필수 X)
		// 글이 등록된 후 bno가 생성되기 때문에 안됨
//		rttr.addFlashAttribute("result", board.getBno()+"글 등록 완료");
		rttr.addFlashAttribute("alert", bno+"번째 글 등록 완료");
		
		// redirect	: 클라이언트의 브라우저에게 다른 URL 로 이동하라는 명령
		//			-> 바로 list.jsp 로 화면 이동이 아닌, DB에서 값 가지고 가겠다
		//			-> 새로고침으로 인한 중복 요청 방지
		return "redirect:/board/list";
	}
	// RedirectAttributes, redirect: 사용하여 새로 고침 시 글 재 등록 안되게 함
//	public String register(BoardVO board, RedirectAttributes rttr) {
//		log.info("board : "+board);
//		// 한번만 전송 가능
//		rttr.addFlashAttribute("name", board);
//		return "redirect:/board/list";
//	}
	
	@GetMapping({"/get","/modify"})
	public void get(int bno, Model model) {
		log.info("글 상세 보기 : "+bno);
		model.addAttribute("boardSelect", boardService.get(bno));
	}
	
//	@GetMapping("/modify")
//	public void modify(BoardVO board, int bno, RedirectAttributes rttr) {
//		log.info("글 수정하기 : "+bno);
//	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		int count = boardService.modify(board);
		// 수정된 튜플이 1개라면"result"라는 name 에 
		// 메세지를 바인딩 시켜서 화면으로 전달
		if(count==1) {
			rttr.addFlashAttribute("alert", "글 수정 완료");
		}
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam int bno, Model model) {
		log.info("글 삭제 : "+bno);
		boardService.remove(bno);
		return "redirect:/board/list";
	}
}
