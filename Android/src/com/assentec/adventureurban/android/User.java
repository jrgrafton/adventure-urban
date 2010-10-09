package com.assentec.adventureurban.android;

public class User {
	private String m_name;
	private String m_password;
	private String m_session_id;
	
	private User(String name, String password, String session_id) {
		m_name = name;
		m_password = password;
		m_session_id = session_id;
	}
	
	public static User getLastUser() {
		return new User("", "", "");
	}
	
	public static User loginAs(String name, String password) {
		// attempt login to server, if valid user then save as last user
		String session_id = "";
		if(session_id != null) {
			User user = new User(name, password, session_id);
			user.save();
			return user;
		}
		
		return null;
	}
	
	public void save() {
		String to_save = m_name + "\n" + m_password + "\n" + m_session_id;
	}
}
