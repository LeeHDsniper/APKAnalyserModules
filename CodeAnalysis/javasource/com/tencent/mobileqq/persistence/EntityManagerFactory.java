package com.tencent.mobileqq.persistence;

import com.tencent.mobileqq.app.SQLiteOpenHelper;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public abstract class EntityManagerFactory
{
  private static final String CLOSE_EXCEPTION_MSG = "The EntityManagerFactory has been already closed";
  private boolean closed;
  private final SQLiteOpenHelper dbHelper;
  
  public EntityManagerFactory(String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    dbHelper = build(paramString);
  }
  
  public abstract SQLiteOpenHelper build(String paramString);
  
  public void close()
  {
    if (closed) {
      throw new IllegalStateException("The EntityManagerFactory has been already closed");
    }
    closed = true;
    dbHelper.a();
  }
  
  public EntityManager createEntityManager()
  {
    if (closed) {
      throw new IllegalStateException("The EntityManagerFactory has been already closed");
    }
    OGEntityManager localOGEntityManager = new OGEntityManager(dbHelper);
    closed = false;
    return localOGEntityManager;
  }
  
  public EntityManager createMessageRecordEntityManager()
  {
    if (closed) {
      throw new IllegalStateException("The EntityManagerFactory has been already closed");
    }
    MessageRecordEntityManager localMessageRecordEntityManager = new MessageRecordEntityManager(dbHelper);
    closed = false;
    return localMessageRecordEntityManager;
  }
  
  public boolean isOpen()
  {
    return !closed;
  }
}
