package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.data.Stranger;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class StrangerDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public StrangerDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 9;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    paramEntity = (Stranger)paramEntity;
    if (paramNoColumnErrorHandler == null)
    {
      uin = paramCursor.getString(paramCursor.getColumnIndex("uin"));
      name = paramCursor.getString(paramCursor.getColumnIndex("name"));
      age = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("age")));
      remark = paramCursor.getString(paramCursor.getColumnIndex("remark"));
      gender = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("gender")));
      groupName = paramCursor.getString(paramCursor.getColumnIndex("groupName"));
      login = paramCursor.getString(paramCursor.getColumnIndex("login"));
      loginId = ((byte)paramCursor.getShort(paramCursor.getColumnIndex("loginId")));
      time = paramCursor.getLong(paramCursor.getColumnIndex("time"));
      return paramEntity;
    }
    int i = paramCursor.getColumnIndex("uin");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("uin", String.class));
      i = paramCursor.getColumnIndex("name");
      if (i != -1) {
        break label504;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("name", String.class));
      label245:
      i = paramCursor.getColumnIndex("age");
      if (i != -1) {
        break label519;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("age", Byte.TYPE));
      label280:
      i = paramCursor.getColumnIndex("remark");
      if (i != -1) {
        break label535;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("remark", String.class));
      label314:
      i = paramCursor.getColumnIndex("gender");
      if (i != -1) {
        break label550;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("gender", Byte.TYPE));
      label349:
      i = paramCursor.getColumnIndex("groupName");
      if (i != -1) {
        break label566;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("groupName", String.class));
      label383:
      i = paramCursor.getColumnIndex("login");
      if (i != -1) {
        break label581;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("login", String.class));
      label417:
      i = paramCursor.getColumnIndex("loginId");
      if (i != -1) {
        break label596;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("loginId", Byte.TYPE));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("time");
      if (i != -1) {
        break label612;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("time", Long.TYPE));
      return paramEntity;
      uin = paramCursor.getString(i);
      break;
      label504:
      name = paramCursor.getString(i);
      break label245;
      label519:
      age = ((byte)paramCursor.getShort(i));
      break label280;
      label535:
      remark = paramCursor.getString(i);
      break label314;
      label550:
      gender = ((byte)paramCursor.getShort(i));
      break label349;
      label566:
      groupName = paramCursor.getString(i);
      break label383;
      label581:
      login = paramCursor.getString(i);
      break label417;
      label596:
      loginId = ((byte)paramCursor.getShort(i));
    }
    label612:
    time = paramCursor.getLong(i);
    return paramEntity;
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,uin TEXT ,name TEXT ,age INTEGER ,remark TEXT ,gender INTEGER ,groupName TEXT ,login TEXT ,loginId INTEGER ,time INTEGER,UNIQUE(uin) ON CONFLICT IGNORE)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (Stranger)paramEntity;
    paramContentValues.put("uin", uin);
    paramContentValues.put("name", name);
    paramContentValues.put("age", Byte.valueOf(age));
    paramContentValues.put("remark", remark);
    paramContentValues.put("gender", Byte.valueOf(gender));
    paramContentValues.put("groupName", groupName);
    paramContentValues.put("login", login);
    paramContentValues.put("loginId", Byte.valueOf(loginId));
    paramContentValues.put("time", Long.valueOf(time));
  }
}
