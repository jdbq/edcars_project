package Utility;

import java.sql.Connection;

import Model.passwordBean;

public class changeEmailFactoryBean {
	public static void setAndUpdateEmailBean(Connection connection, String email){
		passwordBean bean = new passwordBean();
		bean.setEmail(email);
		bean.updateEmail(connection);
	}
}
