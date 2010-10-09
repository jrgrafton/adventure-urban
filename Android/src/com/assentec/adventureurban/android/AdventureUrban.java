package com.assentec.adventureurban.android;

import com.assentec.adventureurban.android.adapters.CompletedAdventureListAdapter;
import com.assentec.adventureurban.android.adapters.CurrentAdventureListAdapter;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.ListView;

public class AdventureUrban extends Activity {
	
	protected static ServerHandle SERVER_HANDLE;
	
	protected static Database DB;
	
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        // set the initial view
        setContentView(R.layout.adventures_page);
        
        // create the connection to the server and the app's database
        SERVER_HANDLE = new ServerHandle();
        DB = new Database(this);
        
        // setup the adapters for the views
        ((ListView)findViewById(R.id.adventures_current_list)).setAdapter(new CurrentAdventureListAdapter());
        ((ListView)findViewById(R.id.adventures_completed_list)).setAdapter(new CompletedAdventureListAdapter());
    }
    
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.options, menu);
        return super.onCreateOptionsMenu(menu);
    }
    
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle item selection
        switch (item.getItemId()) {
        case R.id.adventures:
        	setContentView(R.layout.adventures_page);
            return true;
        case R.id.create:
        	setContentView(R.layout.create_page);
            return true;
        case R.id.profile:
        	setContentView(R.layout.profile_page);
            return true;
        default:
            return super.onOptionsItemSelected(item);
        }
    }
    
    public static void error(String message) {
    	
    }
}