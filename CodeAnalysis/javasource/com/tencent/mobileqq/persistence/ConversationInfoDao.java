package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.data.ConversationInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ConversationInfoDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public ConversationInfoDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 11;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    paramEntity = (ConversationInfo)paramEntity;
    if (paramNoColumnErrorHandler == null)
    {
      uin = paramCursor.getString(paramCursor.getColumnIndex("uin"));
      type = paramCursor.getInt(paramCursor.getColumnIndex("type"));
      lastread = paramCursor.getLong(paramCursor.getColumnIndex("lastread"));
      unreadCount = paramCursor.getInt(paramCursor.getColumnIndex("unreadCount"));
      unreadMark = paramCursor.getInt(paramCursor.getColumnIndex("unreadMark"));
      unreadGiftCount = paramCursor.getInt(paramCursor.getColumnIndex("unreadGiftCount"));
      extInt1 = paramCursor.getInt(paramCursor.getColumnIndex("extInt1"));
      extInt2 = paramCursor.getInt(paramCursor.getColumnIndex("extInt2"));
      extInt3 = paramCursor.getInt(paramCursor.getColumnIndex("extInt3"));
      extString = paramCursor.getString(paramCursor.getColumnIndex("extString"));
      extData = paramCursor.getBlob(paramCursor.getColumnIndex("extData"));
      return paramEntity;
    }
    int i = paramCursor.getColumnIndex("uin");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("uin", String.class));
      i = paramCursor.getColumnIndex("type");
      if (i != -1) {
        break label609;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("type", Integer.TYPE));
      label279:
      i = paramCursor.getColumnIndex("lastread");
      if (i != -1) {
        break label624;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("lastread", Long.TYPE));
      label314:
      i = paramCursor.getColumnIndex("unreadCount");
      if (i != -1) {
        break label639;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("unreadCount", Integer.TYPE));
      label349:
      i = paramCursor.getColumnIndex("unreadMark");
      if (i != -1) {
        break label654;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("unreadMark", Integer.TYPE));
      label384:
      i = paramCursor.getColumnIndex("unreadGiftCount");
      if (i != -1) {
        break label669;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("unreadGiftCount", Integer.TYPE));
      label419:
      i = paramCursor.getColumnIndex("extInt1");
      if (i != -1) {
        break label684;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("extInt1", Integer.TYPE));
      label454:
      i = paramCursor.getColumnIndex("extInt2");
      if (i != -1) {
        break label699;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("extInt2", Integer.TYPE));
      label489:
      i = paramCursor.getColumnIndex("extInt3");
      if (i != -1) {
        break label714;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("extInt3", Integer.TYPE));
      label524:
      i = paramCursor.getColumnIndex("extString");
      if (i != -1) {
        break label729;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("extString", String.class));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("extData");
      if (i != -1) {
        break label744;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("extData", [B.class));
      return paramEntity;
      uin = paramCursor.getString(i);
      break;
      label609:
      type = paramCursor.getInt(i);
      break label279;
      label624:
      lastread = paramCursor.getLong(i);
      break label314;
      label639:
      unreadCount = paramCursor.getInt(i);
      break label349;
      label654:
      unreadMark = paramCursor.getInt(i);
      break label384;
      label669:
      unreadGiftCount = paramCursor.getInt(i);
      break label419;
      label684:
      extInt1 = paramCursor.getInt(i);
      break label454;
      label699:
      extInt2 = paramCursor.getInt(i);
      break label489;
      label714:
      extInt3 = paramCursor.getInt(i);
      break label524;
      label729:
      extString = paramCursor.getString(i);
    }
    label744:
    extData = paramCursor.getBlob(i);
    return paramEntity;
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,uin TEXT ,type INTEGER ,lastread INTEGER ,unreadCount INTEGER ,unreadMark INTEGER ,unreadGiftCount INTEGER ,extInt1 INTEGER ,extInt2 INTEGER ,extInt3 INTEGER ,extString TEXT ,extData BLOB,UNIQUE(uin,type) ON CONFLICT FAIL)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (ConversationInfo)paramEntity;
    paramContentValues.put("uin", uin);
    paramContentValues.put("type", Integer.valueOf(type));
    paramContentValues.put("lastread", Long.valueOf(lastread));
    paramContentValues.put("unreadCount", Integer.valueOf(unreadCount));
    paramContentValues.put("unreadMark", Integer.valueOf(unreadMark));
    paramContentValues.put("unreadGiftCount", Integer.valueOf(unreadGiftCount));
    paramContentValues.put("extInt1", Integer.valueOf(extInt1));
    paramContentValues.put("extInt2", Integer.valueOf(extInt2));
    paramContentValues.put("extInt3", Integer.valueOf(extInt3));
    paramContentValues.put("extString", extString);
    paramContentValues.put("extData", extData);
  }
}
