package com.assentec.adventureurban.android;

import android.location.Location;

public class Step {
	
	private String m_description;
	
	private String m_answer;
	private Location m_location;
	
	public Step(String json) {
		
	}
	
	public boolean answerSubmitted(String answer) {
		return checkLocation() && answer.equals(m_answer);
	}
	
	private boolean checkLocation() {
		return true;
	}
}
