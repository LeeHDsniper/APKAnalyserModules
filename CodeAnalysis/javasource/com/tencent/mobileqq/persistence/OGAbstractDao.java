package com.tencent.mobileqq.persistence;

import android.content.ContentValues;
import android.database.Cursor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public abstract class OGAbstractDao
{
  public int a;
  public boolean a;
  
  public OGAbstractDao()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public abstract Entity a(Entity paramEntity, Cursor paramCursor, boolean paramBoolean, NoColumnErrorHandler paramNoColumnErrorHandler);
  
  public abstract String a(String paramString);
  
  public abstract void a(Entity paramEntity, ContentValues paramContentValues);
}
