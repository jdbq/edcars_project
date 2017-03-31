package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.passwordBean;
import Utility.DBConnectionUtil;
import Utility.changeEmailFactoryBean;

public class changeEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	public void init(ServletConfig config)throws ServletException{
		super.init(config);
		connection = DBConnectionUtil.getDBConnection();
	}
    public changeEmail() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pass = request.getParameter("pass");
		String email = request.getParameter("email");
		if(passwordBean.matchPassword(connection, pass)){
			changeEmailFactoryBean.setAndUpdateEmailBean(connection, email);
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			response.setHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", 0);
			response.sendRedirect("faqsResult.html");
		}
		else{
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			response.setHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", 0);
			request.setAttribute("errorMessage", "Error! the password does not match with the existing password.");
			request.getRequestDispatcher("changeEmailForm.jsp").forward(request, response);
		}
	}

}
