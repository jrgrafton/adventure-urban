package com.assentec.adventureurban.android;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class Database extends SQLiteOpenHelper {
	
	private static String DATABASE_NAME = "AUDatabase";
	private static int DATABASE_VERSION = 2;
	
	public Database(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }

	@Override
	public void onCreate(SQLiteDatabase db) {
		db.execSQL("CREATE TABLE users (" +
                "username TEXT, " +
                "password TEXT);" + 
                "sessionId TEXT");
	}

	@Override
	public void onUpgrade(SQLiteDatabase db, int from, int to) {
		AdventureUrban.error("Wrong database version!");
	}
}
