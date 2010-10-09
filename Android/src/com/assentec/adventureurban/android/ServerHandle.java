package com.assentec.adventureurban.android;

import java.io.IOException;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

public class ServerHandle {
	
	private HttpClient m_client;
    	
    public ServerHandle() {
		m_client = new DefaultHttpClient();
	}
	
	public String get(String url) {
		HttpGet get = new HttpGet(url); 
		try {
			m_client.execute(get);
		} catch (ClientProtocolException e) {
			AdventureUrban.error(e.getLocalizedMessage());
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			AdventureUrban.error(e.getLocalizedMessage());
			e.printStackTrace();
			return null;
		}
		String result = "";
		// get result from the request
		return result;
	}
}
