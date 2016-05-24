package com.adobe.creativesdk.aviary.internal.cds;

import android.database.Cursor;

public final class PacksColumns
{
  public static final class PackCursorWrapper
    extends VersionColumns.BaseCursorWrapper
  {
    PacksContentColumns.ContentCursorWrapper content;
    String creationDate;
    int displayOrder;
    String identifier;
    int markedForDeletion;
    String packType;
    String versionKey;
    int visible;
    
    PackCursorWrapper(long paramLong)
    {
      super();
    }
    
    public static PackCursorWrapper create(Cursor paramCursor)
    {
      if (VersionColumns.CursorWrapper.isValid(paramCursor))
      {
        PackCursorWrapper localPackCursorWrapper = new PackCursorWrapper(paramCursor.getLong(paramCursor.getColumnIndex("pack_id")));
        int i = paramCursor.getColumnIndex("pack_identifier");
        if (i > -1) {
          identifier = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("pack_versionKey");
        if (i > -1) {
          versionKey = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("pack_type");
        if (i > -1) {
          packType = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("pack_markedForDeletion");
        if (i > -1) {
          markedForDeletion = paramCursor.getInt(i);
        }
        i = paramCursor.getColumnIndex("pack_visible");
        if (i > -1) {
          visible = paramCursor.getInt(i);
        }
        i = paramCursor.getColumnIndex("pack_displayOrder");
        if (i > -1) {
          displayOrder = paramCursor.getInt(i);
        }
        i = paramCursor.getColumnIndex("pack_creationDate");
        if (i > -1) {
          creationDate = paramCursor.getString(i);
        }
        return localPackCursorWrapper;
      }
      return null;
    }
    
    public Object clone()
    {
      PackCursorWrapper localPackCursorWrapper = new PackCursorWrapper(id);
      identifier = identifier;
      packType = packType;
      versionKey = versionKey;
      displayOrder = displayOrder;
      visible = visible;
      creationDate = creationDate;
      markedForDeletion = markedForDeletion;
      if (content != null) {
        content = ((PacksContentColumns.ContentCursorWrapper)content.clone());
      }
      return localPackCursorWrapper;
    }
    
    public boolean equals(Object paramObject)
    {
      if (paramObject == null) {}
      do
      {
        do
        {
          return false;
        } while (!(paramObject instanceof PackCursorWrapper));
        paramObject = (PackCursorWrapper)paramObject;
      } while (id != id);
      return true;
    }
    
    public PacksContentColumns.ContentCursorWrapper getContent()
    {
      return content;
    }
    
    public int getDisplayOrder()
    {
      return displayOrder;
    }
    
    public String getIdentifier()
    {
      return identifier;
    }
    
    public String getPackType()
    {
      return packType;
    }
    
    public String getVersionKey()
    {
      return versionKey;
    }
    
    public int getVisible()
    {
      return visible;
    }
    
    public int hashCode()
    {
      return Long.valueOf(id).hashCode();
    }
    
    public void setContent(PacksContentColumns.ContentCursorWrapper paramContentCursorWrapper)
    {
      content = paramContentCursorWrapper;
    }
    
    public String toString()
    {
      return "PacksColumn.Pack{ id: " + id + ", identifier: " + identifier + ", packType: " + packType + ", versionKey: " + versionKey + ", markedForDeletion: " + markedForDeletion + ", order: " + displayOrder + ", visible: " + visible + " }";
    }
  }
}
