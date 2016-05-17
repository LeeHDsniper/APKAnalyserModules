package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.data.SubAccountInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class SubAccountInfoDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public SubAccountInfoDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 12;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    boolean bool2 = true;
    boolean bool1 = true;
    paramEntity = (SubAccountInfo)paramEntity;
    if (paramNoColumnErrorHandler == null)
    {
      subuin = paramCursor.getString(paramCursor.getColumnIndex("subuin"));
      subname = paramCursor.getString(paramCursor.getColumnIndex("subname"));
      trunkuin = paramCursor.getString(paramCursor.getColumnIndex("trunkuin"));
      isbind = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("isbind")));
      lasttime = paramCursor.getLong(paramCursor.getColumnIndex("lasttime"));
      if (1 == paramCursor.getShort(paramCursor.getColumnIndex("isTop")))
      {
        paramBoolean = true;
        isTop = paramBoolean;
        if (1 != paramCursor.getShort(paramCursor.getColumnIndex("hintIsNew"))) {
          break label255;
        }
      }
      label255:
      for (paramBoolean = bool1;; paramBoolean = false)
      {
        hintIsNew = paramBoolean;
        cookie = paramCursor.getBlob(paramCursor.getColumnIndex("cookie"));
        status = paramCursor.getInt(paramCursor.getColumnIndex("status"));
        serverErrorType = paramCursor.getInt(paramCursor.getColumnIndex("serverErrorType"));
        serverErrorMsg = paramCursor.getString(paramCursor.getColumnIndex("serverErrorMsg"));
        lastCleanQZoneMessageTime = paramCursor.getLong(paramCursor.getColumnIndex("lastCleanQZoneMessageTime"));
        return paramEntity;
        paramBoolean = false;
        break;
      }
    }
    int i = paramCursor.getColumnIndex("subuin");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("subuin", String.class));
      i = paramCursor.getColumnIndex("subname");
      if (i != -1) {
        break label692;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("subname", String.class));
      label328:
      i = paramCursor.getColumnIndex("trunkuin");
      if (i != -1) {
        break label707;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("trunkuin", String.class));
      label362:
      i = paramCursor.getColumnIndex("isbind");
      if (i != -1) {
        break label722;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("isbind", Byte.TYPE));
      label397:
      i = paramCursor.getColumnIndex("lasttime");
      if (i != -1) {
        break label738;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("lasttime", Long.TYPE));
      label432:
      i = paramCursor.getColumnIndex("isTop");
      if (i != -1) {
        break label753;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("isTop", Boolean.TYPE));
      i = paramCursor.getColumnIndex("hintIsNew");
      if (i != -1) {
        break label780;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("hintIsNew", Boolean.TYPE));
      i = paramCursor.getColumnIndex("cookie");
      if (i != -1) {
        break label808;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("cookie", [B.class));
      label536:
      i = paramCursor.getColumnIndex("status");
      if (i != -1) {
        break label823;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("status", Integer.TYPE));
      label571:
      i = paramCursor.getColumnIndex("serverErrorType");
      if (i != -1) {
        break label838;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("serverErrorType", Integer.TYPE));
      label606:
      i = paramCursor.getColumnIndex("serverErrorMsg");
      if (i != -1) {
        break label853;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("serverErrorMsg", String.class));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("lastCleanQZoneMessageTime");
      if (i != -1) {
        break label868;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("lastCleanQZoneMessageTime", Long.TYPE));
      return paramEntity;
      subuin = paramCursor.getString(i);
      break;
      label692:
      subname = paramCursor.getString(i);
      break label328;
      label707:
      trunkuin = paramCursor.getString(i);
      break label362;
      label722:
      isbind = ((byte)paramCursor.getShort(i));
      break label397;
      label738:
      lasttime = paramCursor.getLong(i);
      break label432;
      label753:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        isTop = paramBoolean;
        break;
      }
      label780:
      if (1 == paramCursor.getShort(i)) {}
      for (paramBoolean = bool2;; paramBoolean = false)
      {
        hintIsNew = paramBoolean;
        break;
      }
      label808:
      cookie = paramCursor.getBlob(i);
      break label536;
      label823:
      status = paramCursor.getInt(i);
      break label571;
      label838:
      serverErrorType = paramCursor.getInt(i);
      break label606;
      label853:
      serverErrorMsg = paramCursor.getString(i);
    }
    label868:
    lastCleanQZoneMessageTime = paramCursor.getLong(i);
    return paramEntity;
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,subuin TEXT ,subname TEXT ,trunkuin TEXT ,isbind INTEGER ,lasttime INTEGER ,isTop INTEGER ,hintIsNew INTEGER ,cookie BLOB ,status INTEGER ,serverErrorType INTEGER ,serverErrorMsg TEXT ,lastCleanQZoneMessageTime INTEGER,UNIQUE(subuin,trunkuin) ON CONFLICT IGNORE)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (SubAccountInfo)paramEntity;
    paramContentValues.put("subuin", subuin);
    paramContentValues.put("subname", subname);
    paramContentValues.put("trunkuin", trunkuin);
    paramContentValues.put("isbind", Byte.valueOf(isbind));
    paramContentValues.put("lasttime", Long.valueOf(lasttime));
    paramContentValues.put("isTop", Boolean.valueOf(isTop));
    paramContentValues.put("hintIsNew", Boolean.valueOf(hintIsNew));
    paramContentValues.put("cookie", cookie);
    paramContentValues.put("status", Integer.valueOf(status));
    paramContentValues.put("serverErrorType", Integer.valueOf(serverErrorType));
    paramContentValues.put("serverErrorMsg", serverErrorMsg);
    paramContentValues.put("lastCleanQZoneMessageTime", Long.valueOf(lastCleanQZoneMessageTime));
  }
}
