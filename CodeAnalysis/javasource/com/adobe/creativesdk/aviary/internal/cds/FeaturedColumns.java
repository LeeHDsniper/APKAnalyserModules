package com.adobe.creativesdk.aviary.internal.cds;

import android.database.Cursor;
import android.provider.BaseColumns;

public final class FeaturedColumns
  implements BaseColumns
{
  public static final class CursorWrapper
  {
    private String contentPath;
    private String displayName;
    private String featureImageLocalPath;
    private String featureURL;
    private int free;
    private String iconPath;
    private final long id;
    private String identifier;
    private int isFreeWithLogin;
    private String packType;
    private int purchased;
    private int type;
    
    CursorWrapper(long paramLong)
    {
      id = paramLong;
    }
    
    public static CursorWrapper create(Cursor paramCursor)
    {
      if (VersionColumns.CursorWrapper.isValid(paramCursor))
      {
        CursorWrapper localCursorWrapper = new CursorWrapper(paramCursor.getLong(paramCursor.getColumnIndex("_id")));
        int i = paramCursor.getColumnIndex("displayName");
        if (i > -1) {
          displayName = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("identifier");
        if (i > -1) {
          identifier = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("type");
        if (i > -1) {
          type = paramCursor.getInt(i);
        }
        i = paramCursor.getColumnIndex("iconPath");
        if (i > -1) {
          iconPath = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("packType");
        if (i > -1) {
          packType = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("free");
        if (i > -1) {
          free = paramCursor.getInt(i);
        }
        i = paramCursor.getColumnIndex("purchased");
        if (i > -1) {
          purchased = paramCursor.getInt(i);
        }
        i = paramCursor.getColumnIndex("contentPath");
        if (i > -1) {
          contentPath = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("featureURL");
        if (i > -1) {
          featureURL = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("featureisFreeWithLogin");
        if (i > -1) {
          isFreeWithLogin = paramCursor.getInt(i);
        }
        i = paramCursor.getColumnIndex("featureImageLocalPath");
        if (i > -1) {
          featureImageLocalPath = paramCursor.getString(i);
        }
        return localCursorWrapper;
      }
      return null;
    }
    
    public String getFeatureImageLocalPath()
    {
      return featureImageLocalPath;
    }
    
    public long getId()
    {
      return id;
    }
  }
}
