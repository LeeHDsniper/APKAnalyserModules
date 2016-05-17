package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class RecentUserDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public RecentUserDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 11;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    boolean bool = true;
    paramBoolean = true;
    paramEntity = (RecentUser)paramEntity;
    if (paramNoColumnErrorHandler == null)
    {
      if (1 == paramCursor.getShort(paramCursor.getColumnIndex("mIsParsed"))) {}
      for (;;)
      {
        mIsParsed = paramBoolean;
        uin = paramCursor.getString(paramCursor.getColumnIndex("uin"));
        troopUin = paramCursor.getString(paramCursor.getColumnIndex("troopUin"));
        displayName = paramCursor.getString(paramCursor.getColumnIndex("displayName"));
        type = paramCursor.getInt(paramCursor.getColumnIndex("type"));
        lastmsgtime = paramCursor.getLong(paramCursor.getColumnIndex("lastmsgtime"));
        lastmsgdrafttime = paramCursor.getLong(paramCursor.getColumnIndex("lastmsgdrafttime"));
        msgType = paramCursor.getInt(paramCursor.getColumnIndex("msgType"));
        msgData = paramCursor.getBlob(paramCursor.getColumnIndex("msgData"));
        showUpTime = paramCursor.getLong(paramCursor.getColumnIndex("showUpTime"));
        lFlag = paramCursor.getLong(paramCursor.getColumnIndex("lFlag"));
        return paramEntity;
        paramBoolean = false;
      }
    }
    int i = paramCursor.getColumnIndex("mIsParsed");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("mIsParsed", Boolean.TYPE));
      i = paramCursor.getColumnIndex("uin");
      if (i != -1) {
        break label636;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("uin", String.class));
      label294:
      i = paramCursor.getColumnIndex("troopUin");
      if (i != -1) {
        break label651;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("troopUin", String.class));
      label328:
      i = paramCursor.getColumnIndex("displayName");
      if (i != -1) {
        break label666;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("displayName", String.class));
      label362:
      i = paramCursor.getColumnIndex("type");
      if (i != -1) {
        break label681;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("type", Integer.TYPE));
      label397:
      i = paramCursor.getColumnIndex("lastmsgtime");
      if (i != -1) {
        break label696;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("lastmsgtime", Long.TYPE));
      label432:
      i = paramCursor.getColumnIndex("lastmsgdrafttime");
      if (i != -1) {
        break label711;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("lastmsgdrafttime", Long.TYPE));
      label467:
      i = paramCursor.getColumnIndex("msgType");
      if (i != -1) {
        break label726;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("msgType", Integer.TYPE));
      label502:
      i = paramCursor.getColumnIndex("msgData");
      if (i != -1) {
        break label741;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("msgData", [B.class));
      label536:
      i = paramCursor.getColumnIndex("showUpTime");
      if (i != -1) {
        break label756;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("showUpTime", Long.TYPE));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("lFlag");
      if (i != -1) {
        break label771;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("lFlag", Long.TYPE));
      return paramEntity;
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = bool;; paramBoolean = false)
      {
        mIsParsed = paramBoolean;
        break;
      }
      label636:
      uin = paramCursor.getString(i);
      break label294;
      label651:
      troopUin = paramCursor.getString(i);
      break label328;
      label666:
      displayName = paramCursor.getString(i);
      break label362;
      label681:
      type = paramCursor.getInt(i);
      break label397;
      label696:
      lastmsgtime = paramCursor.getLong(i);
      break label432;
      label711:
      lastmsgdrafttime = paramCursor.getLong(i);
      break label467;
      label726:
      msgType = paramCursor.getInt(i);
      break label502;
      label741:
      msgData = paramCursor.getBlob(i);
      break label536;
      label756:
      showUpTime = paramCursor.getLong(i);
    }
    label771:
    lFlag = paramCursor.getLong(i);
    return paramEntity;
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,mIsParsed INTEGER ,uin TEXT ,troopUin TEXT ,displayName TEXT ,type INTEGER ,lastmsgtime INTEGER ,lastmsgdrafttime INTEGER default 0 ,msgType INTEGER ,msgData BLOB ,showUpTime INTEGER default 0 ,lFlag INTEGER default 0,UNIQUE(uin,type) ON CONFLICT FAIL)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (RecentUser)paramEntity;
    paramContentValues.put("mIsParsed", Boolean.valueOf(mIsParsed));
    paramContentValues.put("uin", uin);
    paramContentValues.put("troopUin", troopUin);
    paramContentValues.put("displayName", displayName);
    paramContentValues.put("type", Integer.valueOf(type));
    paramContentValues.put("lastmsgtime", Long.valueOf(lastmsgtime));
    paramContentValues.put("lastmsgdrafttime", Long.valueOf(lastmsgdrafttime));
    paramContentValues.put("msgType", Integer.valueOf(msgType));
    paramContentValues.put("msgData", msgData);
    paramContentValues.put("showUpTime", Long.valueOf(showUpTime));
    paramContentValues.put("lFlag", Long.valueOf(lFlag));
  }
}
