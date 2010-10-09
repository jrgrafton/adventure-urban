package com.assentec.adventureurban.android;

import java.util.LinkedList;
import java.util.List;

public class Adventure {
	
	private String m_name;
	private double m_rating;
	private int m_num_steps;
	
	private List<Step> m_steps;
	private Step current_step;
	
	public Adventure(String json) {
		// get name etc from json request to server
		
		m_steps = new LinkedList<Step>();
		requestSteps();
	}
	
	private void requestSteps() {
		new Thread() {
			public void run() {
				for(int i = 0; i < m_num_steps; i++)
					requestStep(i);
			}
		}.start();
	}

	private void requestStep(int step_num) {
		new Thread() {
			public void run() {
				// get json representation from server
				String json = AdventureUrban.SERVER_HANDLE.get("");
				Step step = new Step(json);
				m_steps.add(step);
			}
		}.start();
	}
}
