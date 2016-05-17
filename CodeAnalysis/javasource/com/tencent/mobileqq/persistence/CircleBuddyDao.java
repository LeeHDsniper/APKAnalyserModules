package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.data.CircleBuddy;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class CircleBuddyDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public CircleBuddyDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 8;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    paramEntity = (CircleBuddy)paramEntity;
    if (paramNoColumnErrorHandler == null)
    {
      uin = paramCursor.getString(paramCursor.getColumnIndex("uin"));
      nickName = paramCursor.getString(paramCursor.getColumnIndex("nickName"));
      remark = paramCursor.getString(paramCursor.getColumnIndex("remark"));
      closeness = paramCursor.getInt(paramCursor.getColumnIndex("closeness"));
      groupId = paramCursor.getInt(paramCursor.getColumnIndex("groupId"));
      richBuffer = paramCursor.getBlob(paramCursor.getColumnIndex("richBuffer"));
      richTime = paramCursor.getLong(paramCursor.getColumnIndex("richTime"));
      checkUpdateTime = paramCursor.getLong(paramCursor.getColumnIndex("checkUpdateTime"));
      return paramEntity;
    }
    int i = paramCursor.getColumnIndex("uin");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("uin", String.class));
      i = paramCursor.getColumnIndex("nickName");
      if (i != -1) {
        break label449;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("nickName", String.class));
      label224:
      i = paramCursor.getColumnIndex("remark");
      if (i != -1) {
        break label464;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("remark", String.class));
      label258:
      i = paramCursor.getColumnIndex("closeness");
      if (i != -1) {
        break label479;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("closeness", Integer.TYPE));
      label293:
      i = paramCursor.getColumnIndex("groupId");
      if (i != -1) {
        break label494;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("groupId", Integer.TYPE));
      label328:
      i = paramCursor.getColumnIndex("richBuffer");
      if (i != -1) {
        break label509;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("richBuffer", [B.class));
      label362:
      i = paramCursor.getColumnIndex("richTime");
      if (i != -1) {
        break label524;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("richTime", Long.TYPE));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("checkUpdateTime");
      if (i != -1) {
        break label539;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("checkUpdateTime", Long.TYPE));
      return paramEntity;
      uin = paramCursor.getString(i);
      break;
      label449:
      nickName = paramCursor.getString(i);
      break label224;
      label464:
      remark = paramCursor.getString(i);
      break label258;
      label479:
      closeness = paramCursor.getInt(i);
      break label293;
      label494:
      groupId = paramCursor.getInt(i);
      break label328;
      label509:
      richBuffer = paramCursor.getBlob(i);
      break label362;
      label524:
      richTime = paramCursor.getLong(i);
    }
    label539:
    checkUpdateTime = paramCursor.getLong(i);
    return paramEntity;
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,uin TEXT UNIQUE ,nickName TEXT ,remark TEXT ,closeness INTEGER ,groupId INTEGER ,richBuffer BLOB ,richTime INTEGER ,checkUpdateTime INTEGER)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (CircleBuddy)paramEntity;
    paramContentValues.put("uin", uin);
    paramContentValues.put("nickName", nickName);
    paramContentValues.put("remark", remark);
    paramContentValues.put("closeness", Integer.valueOf(closeness));
    paramContentValues.put("groupId", Integer.valueOf(groupId));
    paramContentValues.put("richBuffer", richBuffer);
    paramContentValues.put("richTime", Long.valueOf(richTime));
    paramContentValues.put("checkUpdateTime", Long.valueOf(checkUpdateTime));
  }
}
