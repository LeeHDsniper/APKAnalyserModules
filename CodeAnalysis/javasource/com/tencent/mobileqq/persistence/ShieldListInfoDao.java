package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.data.ShieldListInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ShieldListInfoDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public ShieldListInfoDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 4;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    paramEntity = (ShieldListInfo)paramEntity;
    if (paramNoColumnErrorHandler == null)
    {
      uin = paramCursor.getString(paramCursor.getColumnIndex("uin"));
      flags = paramCursor.getInt(paramCursor.getColumnIndex("flags"));
      source_id = paramCursor.getInt(paramCursor.getColumnIndex("source_id"));
      source_sub_id = paramCursor.getInt(paramCursor.getColumnIndex("source_sub_id"));
      return paramEntity;
    }
    int i = paramCursor.getColumnIndex("uin");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("uin", String.class));
      i = paramCursor.getColumnIndex("flags");
      if (i != -1) {
        break label240;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("flags", Integer.TYPE));
      label153:
      i = paramCursor.getColumnIndex("source_id");
      if (i != -1) {
        break label255;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("source_id", Integer.TYPE));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("source_sub_id");
      if (i != -1) {
        break label270;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("source_sub_id", Integer.TYPE));
      return paramEntity;
      uin = paramCursor.getString(i);
      break;
      label240:
      flags = paramCursor.getInt(i);
      break label153;
      label255:
      source_id = paramCursor.getInt(i);
    }
    label270:
    source_sub_id = paramCursor.getInt(i);
    return paramEntity;
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,uin TEXT ,flags INTEGER ,source_id INTEGER ,source_sub_id INTEGER,UNIQUE(uin) ON CONFLICT REPLACE)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (ShieldListInfo)paramEntity;
    paramContentValues.put("uin", uin);
    paramContentValues.put("flags", Integer.valueOf(flags));
    paramContentValues.put("source_id", Integer.valueOf(source_id));
    paramContentValues.put("source_sub_id", Integer.valueOf(source_sub_id));
  }
}
