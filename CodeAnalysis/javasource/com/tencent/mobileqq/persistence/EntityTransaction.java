package com.tencent.mobileqq.persistence;

import com.tencent.mobileqq.app.SQLiteDatabase;
import com.tencent.mobileqq.app.SQLiteOpenHelper;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class EntityTransaction
{
  private static final Lock jdField_a_of_type_JavaUtilConcurrentLocksLock = new ReentrantLock();
  private SQLiteDatabase jdField_a_of_type_ComTencentMobileqqAppSQLiteDatabase;
  private final SQLiteOpenHelper jdField_a_of_type_ComTencentMobileqqAppSQLiteOpenHelper;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  EntityTransaction(SQLiteOpenHelper paramSQLiteOpenHelper)
  {
    jdField_a_of_type_ComTencentMobileqqAppSQLiteOpenHelper = paramSQLiteOpenHelper;
  }
  
  public void a()
  {
    jdField_a_of_type_JavaUtilConcurrentLocksLock.lock();
    jdField_a_of_type_ComTencentMobileqqAppSQLiteDatabase = jdField_a_of_type_ComTencentMobileqqAppSQLiteOpenHelper.a();
    jdField_a_of_type_ComTencentMobileqqAppSQLiteDatabase.b();
  }
  
  public void b()
  {
    try
    {
      jdField_a_of_type_ComTencentMobileqqAppSQLiteDatabase.e();
      jdField_a_of_type_ComTencentMobileqqAppSQLiteDatabase = null;
      jdField_a_of_type_JavaUtilConcurrentLocksLock.unlock();
      return;
    }
    catch (Exception localException)
    {
      localException = localException;
      jdField_a_of_type_JavaUtilConcurrentLocksLock.unlock();
      return;
    }
    finally
    {
      localObject = finally;
      jdField_a_of_type_JavaUtilConcurrentLocksLock.unlock();
      throw localObject;
    }
  }
  
  public void c()
  {
    jdField_a_of_type_ComTencentMobileqqAppSQLiteDatabase.f();
  }
}
