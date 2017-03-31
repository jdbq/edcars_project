package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class transactionUpdateOrDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public transactionUpdateOrDelete() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		switch(action.toLowerCase()){
			case "delete data":{
				request.getRequestDispatcher("transactionDelete.html").forward(request, response);
				break;
			}
			case "update data":{
				String id[] = request.getParameterValues("transactionRecords");
				if(id == null){
					request.setAttribute("errorMessage", "Error! you must select a vehicle to update.");
					request.getRequestDispatcher("generateTables.html").forward(request, response);
				}
				else if(id.length == 1){
					request.setAttribute("id", id[0].substring(0, id[0].indexOf("~")));
					request.getRequestDispatcher("updateTransaction.jsp").forward(request, response);
				}
				else{
					request.setAttribute("errorMessage", "Error! you can only update one vehicle at a time.");
					request.getRequestDispatcher("generateTables.html").forward(request, response);
				}
				break;
			}
		}
	}

}