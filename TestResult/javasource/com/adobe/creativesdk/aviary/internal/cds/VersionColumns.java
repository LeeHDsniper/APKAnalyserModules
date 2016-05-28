package com.adobe.creativesdk.aviary.internal.cds;

import android.database.Cursor;

final class VersionColumns
{
  public static abstract class BaseCursorWrapper
    implements Cloneable
  {
    protected final long id;
    
    public BaseCursorWrapper(long paramLong)
    {
      id = paramLong;
    }
    
    public static final boolean isValid(Cursor paramCursor)
    {
      return (paramCursor != null) && (!paramCursor.isAfterLast()) && (!paramCursor.isBeforeFirst());
    }
    
    public abstract Object clone();
    
    public final long getId()
    {
      return id;
    }
  }
  
  public static class CursorWrapper
    extends VersionColumns.BaseCursorWrapper
  {
    private String assetsBaseURL;
    private String versionKey;
    
    public CursorWrapper(long paramLong)
    {
      super();
    }
    
    public static CursorWrapper create(Cursor paramCursor)
    {
      if (isValid(paramCursor))
      {
        CursorWrapper localCursorWrapper = new CursorWrapper(paramCursor.getLong(paramCursor.getColumnIndex("version_id")));
        int i = paramCursor.getColumnIndex("version_versionKey");
        if (i > -1) {
          versionKey = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("version_assetsBaseURL");
        if (i > -1) {
          assetsBaseURL = paramCursor.getString(i);
        }
        return localCursorWrapper;
      }
      return null;
    }
    
    public Object clone()
    {
      CursorWrapper localCursorWrapper = new CursorWrapper(id);
      assetsBaseURL = assetsBaseURL;
      versionKey = versionKey;
      return localCursorWrapper;
    }
    
    public String getAssetsBaseURL()
    {
      return assetsBaseURL;
    }
    
    public String getVersionKey()
    {
      return versionKey;
    }
    
    public String toString()
    {
      return "VersionColumns.Version{ id: " + id + ", versionKey: " + versionKey + ", assetsBaseURL: " + assetsBaseURL + " }";
    }
  }
}
