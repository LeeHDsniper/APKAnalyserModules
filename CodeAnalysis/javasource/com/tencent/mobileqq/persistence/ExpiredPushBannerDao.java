package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.data.ExpiredPushBanner;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ExpiredPushBannerDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public ExpiredPushBannerDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 3;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    paramEntity = (ExpiredPushBanner)paramEntity;
    if (paramNoColumnErrorHandler == null)
    {
      cid = paramCursor.getLong(paramCursor.getColumnIndex("cid"));
      md5 = paramCursor.getString(paramCursor.getColumnIndex("md5"));
      endtime = paramCursor.getLong(paramCursor.getColumnIndex("endtime"));
      return paramEntity;
    }
    int i = paramCursor.getColumnIndex("cid");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("cid", Long.TYPE));
      i = paramCursor.getColumnIndex("md5");
      if (i != -1) {
        break label187;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("md5", String.class));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("endtime");
      if (i != -1) {
        break label202;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("endtime", Long.TYPE));
      return paramEntity;
      cid = paramCursor.getLong(i);
      break;
      label187:
      md5 = paramCursor.getString(i);
    }
    label202:
    endtime = paramCursor.getLong(i);
    return paramEntity;
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,cid INTEGER UNIQUE ,md5 TEXT ,endtime INTEGER)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (ExpiredPushBanner)paramEntity;
    paramContentValues.put("cid", Long.valueOf(cid));
    paramContentValues.put("md5", md5);
    paramContentValues.put("endtime", Long.valueOf(endtime));
  }
}
