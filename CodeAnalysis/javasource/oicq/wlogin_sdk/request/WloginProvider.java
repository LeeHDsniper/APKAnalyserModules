package oicq.wlogin_sdk.request;

import android.content.ContentProvider;
import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.content.UriMatcher;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteDatabase.CursorFactory;
import android.database.sqlite.SQLiteOpenHelper;
import android.net.Uri;
import oicq.wlogin_sdk.tools.util;

public class WloginProvider
  extends ContentProvider
{
  private a a;
  private SQLiteDatabase b = null;
  private final String c = "wlogin_provider.db";
  private final int d = 4;
  private final String e = "rsa_pubkey";
  private String f;
  private final int g = 1;
  private Context h;
  private UriMatcher i = new UriMatcher(-1);
  private Uri j;
  
  public WloginProvider() {}
  
  public int delete(Uri paramUri, String paramString, String[] paramArrayOfString)
  {
    switch (i.match(paramUri))
    {
    default: 
      throw new IllegalArgumentException("Unnown URI" + paramUri);
    }
    int k = b.delete("rsa_pubkey", paramString, paramArrayOfString);
    h.getContentResolver().notifyChange(paramUri, null);
    return k;
  }
  
  public String getType(Uri paramUri)
  {
    return null;
  }
  
  public Uri insert(Uri paramUri, ContentValues paramContentValues)
  {
    if (i.match(paramUri) != 1) {
      throw new IllegalArgumentException("Unknown URI " + paramUri);
    }
    long l = b.insert("rsa_pubkey", null, paramContentValues);
    if (l > 0L)
    {
      paramUri = ContentUris.withAppendedId(j, l);
      h.getContentResolver().notifyChange(paramUri, null);
      return paramUri;
    }
    throw new SQLException("Failed to insert row into " + paramUri);
  }
  
  public boolean onCreate()
  {
    h = getContext();
    f = "oicq.wlogin_sdk.WloginProvider";
    j = Uri.parse("content://" + f + "/" + "rsa_pubkey");
    i.addURI(f, "rsa_pubkey", 1);
    util.LOGI("oncreated!");
    a = new a(h, "wlogin_provider.db", null, 4);
    b = a.getWritableDatabase();
    return b != null;
  }
  
  public Cursor query(Uri paramUri, String[] paramArrayOfString1, String paramString1, String[] paramArrayOfString2, String paramString2)
  {
    switch (i.match(paramUri))
    {
    default: 
      throw new IllegalArgumentException("Unnown URI" + paramUri);
    }
    paramArrayOfString1 = b.query("rsa_pubkey", paramArrayOfString1, paramString1, paramArrayOfString2, null, null, paramString2);
    paramArrayOfString1.setNotificationUri(h.getContentResolver(), paramUri);
    return paramArrayOfString1;
  }
  
  public int update(Uri paramUri, ContentValues paramContentValues, String paramString, String[] paramArrayOfString)
  {
    switch (i.match(paramUri))
    {
    default: 
      throw new IllegalArgumentException("Unnown URI" + paramUri);
    }
    return b.update("rsa_pubkey", paramContentValues, paramString, paramArrayOfString);
  }
  
  private class a
    extends SQLiteOpenHelper
  {
    public a(Context paramContext, String paramString, SQLiteDatabase.CursorFactory paramCursorFactory, int paramInt)
    {
      super(paramString, paramCursorFactory, paramInt);
    }
    
    public void onCreate(SQLiteDatabase paramSQLiteDatabase)
    {
      try
      {
        paramSQLiteDatabase.execSQL(String.format("CREATE TABLE %s (id INTEGER PRIMARY KEY AUTOINCREMENT, appid INTEGER, subappid INTEGER, pubkey TEXT, pubkey_md5 TEXT)", new Object[] { "rsa_pubkey" }));
        return;
      }
      catch (Exception paramSQLiteDatabase)
      {
        util.printException(paramSQLiteDatabase, "");
      }
    }
    
    public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
    {
      paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS rsa_pubkey");
      onCreate(paramSQLiteDatabase);
    }
  }
}
