package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hibernate.DAO;

@WebServlet("/memberareacontroller")
public class memberareacontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public memberareacontroller() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String action = request.getParameter("action");
    	switch(action) {
    	case "destroy":
    		request.getSession().invalidate();
    		response.sendRedirect(request.getContextPath()+"/NoteTaker?page=login");
    		break;
    	case "memberArea":
    		memberarea(request,response);
    		break;
    	case "delete":
    		delete(request,response);
    		break;
    	default:
    		request.getRequestDispatcher("index1.jsp").forward(request, response);
    		break;
    	}
    }

	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int nid = Integer.parseInt(request.getParameter("nid"));
		new DAO().deletenote(nid);
		response.sendRedirect(request.getContextPath()+"/NoteTaker?page=viewnotes");

	}
	private void memberarea(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("index1.jsp").forward(request, response);	
	}
}
