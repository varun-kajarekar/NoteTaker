package com.controller;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;


import com.entity.Note;
import com.hibernate.DAO;

/**
 * Servlet implementation class NoteTaker
 */
@WebServlet("/NoteTaker")
public class NoteTaker extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public NoteTaker() {
        super();
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		switch (page) {
		case "viewnotes":
			viewnotes(request, response);
			break;
		case "addnotes":
			addnotes(request, response);
			break;
		
		case "register1":
			register1(request,response);
			break;
		case "login":
			login(request,response);
			break;
			
		default:
			login(request, response);
			break;
		}	
	}
	private void register1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("regester.jsp").forward(request, response);
		
	}


	private void viewnotes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Note> notes = new DAO().listFiles();
		request.setAttribute("notes", notes);
		request.getRequestDispatcher("viewnotes.jsp").forward(request, response);
	}
	
	private void addnotes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("index1.jsp").forward(request, response);

	}
	
	
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("log in.jsp").forward(request, response);

	}

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("action");
		switch (page) {
		case "savenote":
			savenotes(request, response);
			break;
			
		case "register":
			register(request,response);
			break;
			

		case "loginsubmit":
			authenticate(request,response);
			break;
			
		default:
			login(request, response);
			break;
		}
	}
	

	private void savenotes(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String title = request.getParameter("title");
		String note = request.getParameter("notes");
		String username = request.getParameter("username");
		System.out.print(username);
		Random random = new Random();   
		int id = random.nextInt(100000);
		String uniqueid = username+id;

		Note notes = new Note(id,title, note,uniqueid);
		new DAO().addFileDetails(notes);
		String message = "true";
		request.setAttribute("message", message);
		request.getRequestDispatcher("index1.jsp").forward(request, response);
	}

	private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		boolean validate = new DAO().validateregister(username, password);
		if(validate) {
			Random random = new Random();   
		
			int id = random.nextInt(100000);
			Note notes = new Note(id,username, password);
			new DAO().adduserDetails(notes);

			request.getRequestDispatcher("log in.jsp").forward(request, response);
		}
		else {
			String message = "true";
			request.setAttribute("message", message);
			request.getRequestDispatcher("regester.jsp").forward(request, response);
		}
		
	}
	
	public void authenticate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		boolean validate = new DAO().validate(username, password);
		System.out.println(validate);
		if(validate) {
			
			request.getSession().invalidate();
			HttpSession newSession = request.getSession(true);
			newSession.setMaxInactiveInterval(300);

			newSession.setAttribute("username", username);
			String encode = response.encodeURL(request.getContextPath());
			response.sendRedirect(encode+"/memberareacontroller?action=memberArea");
		}
		else {
			String message = "true";
			request.setAttribute("message", message);
			request.getRequestDispatcher("log in.jsp").forward(request, response);
		}
	}
	

	


}
