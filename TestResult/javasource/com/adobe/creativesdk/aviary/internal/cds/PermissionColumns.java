package com.adobe.creativesdk.aviary.internal.cds;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;

final class PermissionColumns
{
  static void create(SQLiteDatabase paramSQLiteDatabase)
  {
    paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS permission_table (perm_id INTEGER PRIMARY KEY AUTOINCREMENT, perm_value TEXT, perm_hash TEXT NOT NULL DEFAULT 0);");
    paramSQLiteDatabase.execSQL(" INSERT OR REPLACE INTO permission_table (perm_value, perm_hash) VALUES ( '" + Cds.Permission.hires.name() + "," + Cds.Permission.whitelabel.name() + "', '0' );");
  }
  
  static final class CursorWrapper
    extends VersionColumns.BaseCursorWrapper
  {
    private String hashCode;
    private String value;
    
    public CursorWrapper(long paramLong)
    {
      super();
    }
    
    public static CursorWrapper create(Cursor paramCursor)
    {
      if (isValid(paramCursor))
      {
        CursorWrapper localCursorWrapper = new CursorWrapper(paramCursor.getLong(0));
        int i = paramCursor.getColumnIndex("perm_value");
        if (i > -1) {
          value = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("perm_hash");
        if (i > -1) {
          hashCode = paramCursor.getString(i);
        }
        return localCursorWrapper;
      }
      return null;
    }
    
    public Object clone()
    {
      CursorWrapper localCursorWrapper = new CursorWrapper(getId());
      hashCode = hashCode;
      value = value;
      return localCursorWrapper;
    }
    
    public String getHashCode()
    {
      return hashCode;
    }
    
    public String getValue()
    {
      return value;
    }
    
    public String toString()
    {
      return "PermissionColumns.Permission{" + value + ", " + hashCode + "}";
    }
  }
}
