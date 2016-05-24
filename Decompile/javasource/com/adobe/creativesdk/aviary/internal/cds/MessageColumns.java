package com.adobe.creativesdk.aviary.internal.cds;

import android.database.Cursor;

final class MessageColumns
{
  public static final class MessageCursorWrapper
    extends VersionColumns.BaseCursorWrapper
  {
    String identifier;
    String messageType;
    String versionKey;
    
    public MessageCursorWrapper(long paramLong)
    {
      super();
    }
    
    public static MessageCursorWrapper create(Cursor paramCursor)
    {
      if (VersionColumns.BaseCursorWrapper.isValid(paramCursor))
      {
        MessageCursorWrapper localMessageCursorWrapper = new MessageCursorWrapper(paramCursor.getLong(paramCursor.getColumnIndex("msg_id")));
        int i = paramCursor.getColumnIndex("msg_type");
        if (i > -1) {
          messageType = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("msg_versionKey");
        if (i > -1) {
          versionKey = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("msg_identifier");
        if (i > -1) {
          identifier = paramCursor.getString(i);
        }
        return localMessageCursorWrapper;
      }
      return null;
    }
    
    public Object clone()
    {
      MessageCursorWrapper localMessageCursorWrapper = new MessageCursorWrapper(id);
      messageType = messageType;
      versionKey = versionKey;
      identifier = identifier;
      return localMessageCursorWrapper;
    }
    
    public String getIdentifier()
    {
      return identifier;
    }
    
    public String getMessageType()
    {
      return messageType;
    }
    
    public String getVersionKey()
    {
      return versionKey;
    }
  }
}
