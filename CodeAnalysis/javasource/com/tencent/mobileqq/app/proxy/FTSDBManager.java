package com.tencent.mobileqq.app.proxy;

import android.database.Cursor;
import android.os.HandlerThread;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.SQLiteOpenHelper;
import com.tencent.mobileqq.app.proxy.fts.FTSIndexOperator;
import com.tencent.mobileqq.app.proxy.fts.FTSMsgOperator;
import com.tencent.mobileqq.app.proxy.fts.FTSSyncHandler;
import com.tencent.mobileqq.app.proxy.fts.FTSTroopOperator;
import com.tencent.mobileqq.data.QQEntityManagerFactory;
import com.tencent.mobileqq.data.fts.FTSTroopSync;
import com.tencent.mobileqq.data.fts.FTSTroopTime;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.persistence.fts.FTSDatatbase;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import com.tencent.mobileqq.utils.fts.SQLiteFTSUtils;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Observable;
import java.util.Set;
import mqq.app.MobileQQ;
import mqq.manager.Manager;
import nlp;

public class FTSDBManager
  extends Observable
  implements Manager
{
  public static final int a = 1;
  private static final String jdField_a_of_type_JavaLangString = "Q.fts.manager";
  public static volatile boolean a = false;
  public static final int b = 2;
  public static volatile boolean c;
  public static final boolean d = false;
  private HandlerThread jdField_a_of_type_AndroidOsHandlerThread;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  public FTSSyncHandler a;
  private FTSDatatbase jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase;
  private HashMap jdField_a_of_type_JavaUtilHashMap = new HashMap();
  public volatile boolean b = false;
  private int c;
  private volatile boolean e = false;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = true;
  }
  
  public FTSDBManager(QQAppInterface paramQQAppInterface)
  {
    jdField_c_of_type_Int = 0;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_AndroidOsHandlerThread = new HandlerThread("QQ_FTS_Sync", 3);
    jdField_a_of_type_AndroidOsHandlerThread.start();
    jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSSyncHandler = new FTSSyncHandler(jdField_a_of_type_AndroidOsHandlerThread.getLooper(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, this);
    jdField_a_of_type_JavaUtilHashMap.put(Integer.valueOf(1), new FTSMsgOperator(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSSyncHandler));
    jdField_a_of_type_JavaUtilHashMap.put(Integer.valueOf(2), new FTSTroopOperator(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSSyncHandler));
    a();
    if (QLog.isColorLevel()) {
      QLog.i("Q.fts.manager", 2, "FTSDBManager structure...");
    }
  }
  
  public static void a(QQAppInterface paramQQAppInterface, String paramString, boolean paramBoolean)
  {
    SQLiteFTSUtils.a(paramQQAppInterface, paramString);
    com.tencent.mobileqq.app.SQLiteDatabase localSQLiteDatabase = new QQEntityManagerFactory(paramString).build(paramString).a();
    localSQLiteDatabase.a("DROP TABLE IF EXISTS msg_upgrade_log;");
    localSQLiteDatabase.a("DROP TABLE IF EXISTS msg_sync_log;");
    localSQLiteDatabase.a("DROP TABLE IF EXISTS " + FTSTroopSync.class.getSimpleName() + ";");
    localSQLiteDatabase.a("DROP TABLE IF EXISTS " + FTSTroopTime.class.getSimpleName() + ";");
    if (!paramBoolean) {
      paramQQAppInterface.a().d();
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.i("Q.fts.manager", 2, "FTS clear...");
      }
      return;
      paramQQAppInterface = new File(paramQQAppInterface.getApplication().getFilesDir().getAbsolutePath().replace("files", "databases") + File.separator + paramString + "-IndexQQMsg.db");
      if ((paramQQAppInterface.exists()) && (paramQQAppInterface.isFile())) {
        paramQQAppInterface.delete();
      }
    }
  }
  
  private void e()
  {
    SQLiteFTSUtils.g(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, false);
    if ((e) || (QLog.isColorLevel())) {}
    try
    {
      localObject2 = android.database.sqlite.SQLiteDatabase.openOrCreateDatabase(":memory:", null).rawQuery("select sqlite_version() AS sqlite_version", null);
      for (localObject1 = ""; ((Cursor)localObject2).moveToNext(); localObject1 = (String)localObject1 + ((Cursor)localObject2).getString(0)) {}
      QLog.i("Q.fts.manager", 2, "OS: " + DeviceInfoUtil.e() + ", SQLite3 version: " + (String)localObject1);
      ((Cursor)localObject2).close();
    }
    catch (Exception localException)
    {
      Object localObject2;
      Object localObject1;
      for (;;) {}
    }
    jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase = new FTSDatatbase(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    try
    {
      jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase.b();
      SQLiteFTSUtils.f(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, true);
      localObject1 = jdField_a_of_type_JavaUtilHashMap.keySet().iterator();
      while (((Iterator)localObject1).hasNext())
      {
        int i = ((Integer)((Iterator)localObject1).next()).intValue();
        localObject2 = (FTSIndexOperator)jdField_a_of_type_JavaUtilHashMap.get(Integer.valueOf(i));
        if (!((FTSIndexOperator)localObject2).a(jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase))
        {
          if (QLog.isColorLevel()) {
            QLog.d("Q.fts.manager", 2, new Object[] { "operator init failed = ", localObject2.getClass().getSimpleName() });
          }
          return;
        }
      }
    }
    catch (Throwable localThrowable)
    {
      if (QLog.isColorLevel()) {
        QLog.e("Q.fts.manager", 2, "init: failure ", localThrowable);
      }
      jdField_a_of_type_Boolean = false;
      return;
    }
    e = true;
  }
  
  public FTSIndexOperator a(int paramInt)
  {
    return (FTSIndexOperator)jdField_a_of_type_JavaUtilHashMap.get(Integer.valueOf(paramInt));
  }
  
  public FTSMsgOperator a()
  {
    return (FTSMsgOperator)a(1);
  }
  
  public FTSDatatbase a()
  {
    return jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase;
  }
  
  public void a()
  {
    if (a()) {
      return;
    }
    jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSSyncHandler.post(new nlp(this));
  }
  
  public void a(int paramInt)
  {
    if (!b) {
      ((FTSIndexOperator)jdField_a_of_type_JavaUtilHashMap.get(Integer.valueOf(paramInt))).d();
    }
  }
  
  public boolean a()
  {
    try
    {
      boolean bool = e;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void b()
  {
    jdField_c_of_type_Boolean = true;
  }
  
  public void c()
  {
    if (!b)
    {
      Iterator localIterator = jdField_a_of_type_JavaUtilHashMap.keySet().iterator();
      while (localIterator.hasNext())
      {
        int i = ((Integer)localIterator.next()).intValue();
        ((FTSIndexOperator)jdField_a_of_type_JavaUtilHashMap.get(Integer.valueOf(i))).d();
      }
    }
  }
  
  public void d()
  {
    jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase.d();
  }
  
  public void onDestroy()
  {
    try
    {
      b = true;
      jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSSyncHandler.a();
      Iterator localIterator = jdField_a_of_type_JavaUtilHashMap.keySet().iterator();
      while (localIterator.hasNext())
      {
        int i = ((Integer)localIterator.next()).intValue();
        ((FTSIndexOperator)jdField_a_of_type_JavaUtilHashMap.get(Integer.valueOf(i))).a();
      }
      if (jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase == null) {
        break label88;
      }
    }
    finally {}
    jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase.c();
    label88:
    if (QLog.isColorLevel()) {
      QLog.i("Q.fts.manager", 2, "FTSDBManager destroy...");
    }
  }
}
