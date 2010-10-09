package com.assentec.adventureurban.android.adapters;

import java.util.HashMap;
import java.util.Map;

public class CurrentAdventureListAdapter extends AdventureListAdapter {
	
	public CurrentAdventureListAdapter() {
		super(getSQLSelectAttributes());
	}
	
	private static Map<String, String> getSQLSelectAttributes() {
		Map<String, String> result = new HashMap<String, String>();
		result.put("complete", "false");
		return result;
	}
}
