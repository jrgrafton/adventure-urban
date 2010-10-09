package com.assentec.adventureurban.android.adapters;

import java.util.HashMap;
import java.util.Map;

public class CompletedAdventureListAdapter extends AdventureListAdapter {
	public CompletedAdventureListAdapter() {
		super(getSQLSelectAttributes());
	}
	
	private static Map<String, String> getSQLSelectAttributes() {
		Map<String, String> result = new HashMap<String, String>();
		result.put("complete", "true");
		return result;
	}
}
