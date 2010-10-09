package com.assentec.adventureurban.android;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;

public class AdventureUrban extends Activity {
	
	protected static ServerHandle SERVER_HANDLE;
	
	protected static Database DB;
	
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.adventures);
        SERVER_HANDLE = new ServerHandle();
        DB = new Database(this);
    }
    
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.options, menu);
        return true;
    }
    
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle item selection
        switch (item.getItemId()) {
        case R.id.adventures:
        	setContentView(R.layout.adventures);
            return true;
        case R.id.create:
        	setContentView(R.layout.create);
            return true;
        case R.id.profile:
        	setContentView(R.layout.profile);
            return true;
        default:
            return super.onOptionsItemSelected(item);
        }
    }
    
    public static void error(String message) {
    	
    }
}