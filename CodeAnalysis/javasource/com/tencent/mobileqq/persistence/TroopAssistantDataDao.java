package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.data.TroopAssistantData;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class TroopAssistantDataDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public TroopAssistantDataDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 3;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    paramEntity = (TroopAssistantData)paramEntity;
    if (paramNoColumnErrorHandler == null)
    {
      troopUin = paramCursor.getString(paramCursor.getColumnIndex("troopUin"));
      lastmsgtime = paramCursor.getLong(paramCursor.getColumnIndex("lastmsgtime"));
      lastdrafttime = paramCursor.getLong(paramCursor.getColumnIndex("lastdrafttime"));
      return paramEntity;
    }
    int i = paramCursor.getColumnIndex("troopUin");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("troopUin", String.class));
      i = paramCursor.getColumnIndex("lastmsgtime");
      if (i != -1) {
        break label187;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("lastmsgtime", Long.TYPE));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("lastdrafttime");
      if (i != -1) {
        break label202;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("lastdrafttime", Long.TYPE));
      return paramEntity;
      troopUin = paramCursor.getString(i);
      break;
      label187:
      lastmsgtime = paramCursor.getLong(i);
    }
    label202:
    lastdrafttime = paramCursor.getLong(i);
    return paramEntity;
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,troopUin TEXT UNIQUE ,lastmsgtime INTEGER ,lastdrafttime INTEGER)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (TroopAssistantData)paramEntity;
    paramContentValues.put("troopUin", troopUin);
    paramContentValues.put("lastmsgtime", Long.valueOf(lastmsgtime));
    paramContentValues.put("lastdrafttime", Long.valueOf(lastdrafttime));
  }
}
