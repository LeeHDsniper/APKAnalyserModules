package com.tencent.mobileqq.persistence;

import android.database.Cursor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.lang.reflect.Field;

public abstract class Entity
{
  public static final int DETACHED = 1002;
  public static final int MANAGED = 1001;
  public static final int NEW = 1000;
  public static final int REMOVED = 1003;
  long _id;
  int _status;
  
  public Entity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    _status = 1000;
    _id = -1L;
  }
  
  public Entity deepCopyByReflect()
  {
    try
    {
      Entity localEntity = (Entity)getClass().newInstance();
      if (localEntity != null)
      {
        Field[] arrayOfField = getClass().getFields();
        int j = arrayOfField.length;
        int i = 0;
        while (i < j)
        {
          Field localField = arrayOfField[i];
          if (!localField.isAccessible()) {
            localField.setAccessible(true);
          }
          localField.set(localEntity, localField.get(this));
          i += 1;
        }
        _status = 1000;
        localEntity.postRead();
      }
      return localEntity;
    }
    catch (Exception localException)
    {
      QLog.d("Entity", 1, " deepCopyByReflect:failed" + getClass().getName() + " exception e: = " + localException.getMessage());
      localException.printStackTrace();
    }
    return null;
  }
  
  protected boolean entityByCursor(Cursor paramCursor)
  {
    return false;
  }
  
  protected Class getClassForTable()
  {
    return getClass();
  }
  
  public long getId()
  {
    return _id;
  }
  
  public int getStatus()
  {
    return _status;
  }
  
  public String getTableName()
  {
    return getClass().getSimpleName();
  }
  
  public void postRead() {}
  
  protected void postwrite() {}
  
  public void prewrite() {}
  
  public void setId(long paramLong)
  {
    _id = paramLong;
  }
  
  public void setStatus(int paramInt)
  {
    _status = paramInt;
  }
}
