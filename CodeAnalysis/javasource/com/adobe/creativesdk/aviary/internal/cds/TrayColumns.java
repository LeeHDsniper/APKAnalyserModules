package com.adobe.creativesdk.aviary.internal.cds;

import android.database.Cursor;
import android.provider.BaseColumns;

public final class TrayColumns
  implements BaseColumns
{
  public static final class TrayCursorWrapper
  {
    private String displayName;
    private boolean free;
    private final long id;
    private String identifier;
    private String installDate;
    private String packDisplayName;
    private long packId;
    private String packageName;
    private String path;
    private int type;
    
    TrayCursorWrapper(long paramLong)
    {
      id = paramLong;
    }
    
    public static TrayCursorWrapper create(Cursor paramCursor)
    {
      boolean bool = true;
      if (VersionColumns.CursorWrapper.isValid(paramCursor))
      {
        TrayCursorWrapper localTrayCursorWrapper = new TrayCursorWrapper(paramCursor.getLong(paramCursor.getColumnIndex("_id")));
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
        i = paramCursor.getColumnIndex("path");
        if (i > -1) {
          path = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("packagename");
        if (i > -1) {
          packageName = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("installDate");
        if (i > -1) {
          installDate = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("isFree");
        if (i > -1) {
          if (paramCursor.getInt(i) != 1) {
            break label263;
          }
        }
        for (;;)
        {
          free = bool;
          i = paramCursor.getColumnIndex("packId");
          if (i > -1) {
            packId = paramCursor.getLong(i);
          }
          i = paramCursor.getColumnIndex("packDisplayName");
          if (i > -1) {
            packDisplayName = paramCursor.getString(i);
          }
          return localTrayCursorWrapper;
          label263:
          bool = false;
        }
      }
      return null;
    }
    
    public long getId()
    {
      return id;
    }
    
    public String getIdentifier()
    {
      return identifier;
    }
    
    public long getPackId()
    {
      return packId;
    }
    
    public String getPackageName()
    {
      return packageName;
    }
    
    public String getPath()
    {
      return path;
    }
  }
}
