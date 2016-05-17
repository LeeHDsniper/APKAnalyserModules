package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.data.CircleGroup;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class CircleGroupDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public CircleGroupDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 4;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    paramEntity = (CircleGroup)paramEntity;
    if (paramNoColumnErrorHandler == null)
    {
      groupId = paramCursor.getInt(paramCursor.getColumnIndex("groupId"));
      groupName = paramCursor.getString(paramCursor.getColumnIndex("groupName"));
      buddyCount = paramCursor.getInt(paramCursor.getColumnIndex("buddyCount"));
      showIndex = paramCursor.getInt(paramCursor.getColumnIndex("showIndex"));
      return paramEntity;
    }
    int i = paramCursor.getColumnIndex("groupId");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("groupId", Integer.TYPE));
      i = paramCursor.getColumnIndex("groupName");
      if (i != -1) {
        break label240;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("groupName", String.class));
      label153:
      i = paramCursor.getColumnIndex("buddyCount");
      if (i != -1) {
        break label255;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("buddyCount", Integer.TYPE));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("showIndex");
      if (i != -1) {
        break label270;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("showIndex", Integer.TYPE));
      return paramEntity;
      groupId = paramCursor.getInt(i);
      break;
      label240:
      groupName = paramCursor.getString(i);
      break label153;
      label255:
      buddyCount = paramCursor.getInt(i);
    }
    label270:
    showIndex = paramCursor.getInt(i);
    return paramEntity;
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,groupId INTEGER UNIQUE ,groupName TEXT ,buddyCount INTEGER ,showIndex INTEGER)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (CircleGroup)paramEntity;
    paramContentValues.put("groupId", Integer.valueOf(groupId));
    paramContentValues.put("groupName", groupName);
    paramContentValues.put("buddyCount", Integer.valueOf(buddyCount));
    paramContentValues.put("showIndex", Integer.valueOf(showIndex));
  }
}
