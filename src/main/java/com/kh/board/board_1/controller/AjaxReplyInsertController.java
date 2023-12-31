package com.kh.board.board_1.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.board.board_1.model.service.BoardService;
import com.kh.board.board_1.model.vo.Reply;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AjaxReplyInsertController
 */
@WebServlet("/rinsert.bo")
public class AjaxReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReplyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 요청 시 전달값 먼저 뽑기
		String replyContent = request.getParameter("content");
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		// 작성자의 회원 번호
		HttpSession session = request.getSession();
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		// Reply VO 객체로 가공
		Reply r = new Reply();
		r.setReplyContent(replyContent);
		r.setBoardNo(boardNo);
		r.setMemberNo("" + memberNo);
		
		// 요청 후 결과 받기
		int result = new BoardService().insertReply(r);
		
		// 응답데이터 넘기기
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
