package com.tencent.mobileqq.app;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.TableNameCache;

public class SQLiteOpenHelper
{
  public static final boolean a = false;
  private android.database.sqlite.SQLiteOpenHelper jdField_a_of_type_AndroidDatabaseSqliteSQLiteOpenHelper;
  private SQLiteDatabase jdField_a_of_type_ComTencentMobileqqAppSQLiteDatabase;
  private TableNameCache jdField_a_of_type_ComTencentMobileqqPersistenceTableNameCache;
  private SQLiteDatabase b;
  
  public SQLiteOpenHelper(android.database.sqlite.SQLiteOpenHelper paramSQLiteOpenHelper)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqPersistenceTableNameCache = new TableNameCache();
    jdField_a_of_type_AndroidDatabaseSqliteSQLiteOpenHelper = paramSQLiteOpenHelper;
  }
  
  public SQLiteDatabase a()
  {
    try
    {
      localObject1 = jdField_a_of_type_AndroidDatabaseSqliteSQLiteOpenHelper.getWritableDatabase();
      if ((jdField_a_of_type_ComTencentMobileqqAppSQLiteDatabase == null) || (jdField_a_of_type_ComTencentMobileqqAppSQLiteDatabase.a != localObject1)) {
        jdField_a_of_type_ComTencentMobileqqAppSQLiteDatabase = new SQLiteDatabase((android.database.sqlite.SQLiteDatabase)localObject1, jdField_a_of_type_ComTencentMobileqqPersistenceTableNameCache);
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        Object localObject1;
        localException.printStackTrace();
      }
    }
    finally {}
    localObject1 = jdField_a_of_type_ComTencentMobileqqAppSQLiteDatabase;
    return localObject1;
  }
  
  public void a()
  {
    try
    {
      jdField_a_of_type_AndroidDatabaseSqliteSQLiteOpenHelper.close();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public SQLiteDatabase b()
  {
    try
    {
      localObject1 = jdField_a_of_type_AndroidDatabaseSqliteSQLiteOpenHelper.getReadableDatabase();
      if ((b == null) || (b.a != localObject1)) {
        b = new SQLiteDatabase((android.database.sqlite.SQLiteDatabase)localObject1, jdField_a_of_type_ComTencentMobileqqPersistenceTableNameCache);
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        Object localObject1;
        localException.printStackTrace();
      }
    }
    finally {}
    localObject1 = b;
    return localObject1;
  }
  
  public void b()
  {
    try
    {
      jdField_a_of_type_AndroidDatabaseSqliteSQLiteOpenHelper = null;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
}
