package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.sendModel;
import Utility.DBConnectionUtil;
import Utility.sendMailFactory;
public class sendBuyerEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Connection connection = null;
	private String fromEmail;
	private String username;
	private String password;
	private String toEmail;
	private String host;
    public void init(ServletConfig config)throws ServletException{
    	super.init(config);
    	connection = DBConnectionUtil.getDBConnection();
        fromEmail = config.getServletContext().getInitParameter("fromEmail");
        username = config.getServletContext().getInitParameter("userName");
        password = config.getServletContext().getInitParameter("password");
        host = config.getServletContext().getInitParameter("host");
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String time = request.getParameter("time");
		String date = request.getParameter("date");
		String queries = request.getParameter("message");
		String carSpecs = request.getParameter("carSpecs");
		ResultSet email = new sendModel().getEmailAccount(connection);
		
		try{
			email.next();
			toEmail = email.getString("email");
		}
		catch(SQLException e){
			
		}
		sendMailFactory.createBuyerEmailBean(username, password, fromEmail, toEmail, "Client-Seller", queries, host, name, phone, time,carSpecs,date);
		
		request.getRequestDispatcher("formsent.html").forward(request, response);
	}

}
