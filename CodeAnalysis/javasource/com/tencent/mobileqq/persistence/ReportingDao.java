package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.Reporting;

public class ReportingDao
  extends OGAbstractDao
{
  private OGEntityInfo a;
  
  public ReportingDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = 6;
  }
  
  public Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler)
  {
    paramEntity = (Reporting)paramEntity;
    if (paramNoColumnErrorHandler == null)
    {
      mTag = paramCursor.getString(paramCursor.getColumnIndex("mTag"));
      mDetail = paramCursor.getString(paramCursor.getColumnIndex("mDetail"));
      mCount = paramCursor.getInt(paramCursor.getColumnIndex("mCount"));
      mLockedCount = paramCursor.getInt(paramCursor.getColumnIndex("mLockedCount"));
      mSeqKey = paramCursor.getInt(paramCursor.getColumnIndex("mSeqKey"));
      mDetailHashCode = paramCursor.getInt(paramCursor.getColumnIndex("mDetailHashCode"));
      return paramEntity;
    }
    int i = paramCursor.getColumnIndex("mTag");
    if (i == -1)
    {
      paramNoColumnErrorHandler.a(new NoColumnError("mTag", String.class));
      i = paramCursor.getColumnIndex("mDetail");
      if (i != -1) {
        break label345;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mDetail", String.class));
      label188:
      i = paramCursor.getColumnIndex("mCount");
      if (i != -1) {
        break label360;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mCount", Integer.TYPE));
      label223:
      i = paramCursor.getColumnIndex("mLockedCount");
      if (i != -1) {
        break label375;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mLockedCount", Integer.TYPE));
      label258:
      i = paramCursor.getColumnIndex("mSeqKey");
      if (i != -1) {
        break label390;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mSeqKey", Integer.TYPE));
    }
    for (;;)
    {
      i = paramCursor.getColumnIndex("mDetailHashCode");
      if (i != -1) {
        break label405;
      }
      paramNoColumnErrorHandler.a(new NoColumnError("mDetailHashCode", Integer.TYPE));
      return paramEntity;
      mTag = paramCursor.getString(i);
      break;
      label345:
      mDetail = paramCursor.getString(i);
      break label188;
      label360:
      mCount = paramCursor.getInt(i);
      break label223;
      label375:
      mLockedCount = paramCursor.getInt(i);
      break label258;
      label390:
      mSeqKey = paramCursor.getInt(i);
    }
    label405:
    mDetailHashCode = paramCursor.getInt(i);
    return paramEntity;
  }
  
  public String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder("CREATE TABLE IF NOT EXISTS ");
    localStringBuilder.append(paramString);
    localStringBuilder.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT ,mTag TEXT ,mDetail TEXT ,mCount INTEGER ,mLockedCount INTEGER ,mSeqKey INTEGER ,mDetailHashCode INTEGER,UNIQUE(mTag, mDetail) ON CONFLICT IGNORE)");
    return localStringBuilder.toString();
  }
  
  public void a(Entity paramEntity, ContentValues paramContentValues)
  {
    paramEntity = (Reporting)paramEntity;
    paramContentValues.put("mTag", mTag);
    paramContentValues.put("mDetail", mDetail);
    paramContentValues.put("mCount", Integer.valueOf(mCount));
    paramContentValues.put("mLockedCount", Integer.valueOf(mLockedCount));
    paramContentValues.put("mSeqKey", Integer.valueOf(mSeqKey));
    paramContentValues.put("mDetailHashCode", Integer.valueOf(mDetailHashCode));
  }
}
