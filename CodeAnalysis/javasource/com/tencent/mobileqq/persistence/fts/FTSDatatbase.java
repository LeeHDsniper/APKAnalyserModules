package com.tencent.mobileqq.persistence.fts;

import android.text.TextUtils;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.commonsdk.soload.SoLoadUtilNew;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.fts.SQLiteFTSUtils;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import mqq.app.MobileQQ;

public class FTSDatatbase
{
  private static final String jdField_a_of_type_JavaLangString = "Q.fts.db";
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private boolean jdField_a_of_type_Boolean;
  private String jdField_b_of_type_JavaLangString;
  private boolean jdField_b_of_type_Boolean;
  private String c;
  private String d;
  
  public FTSDatatbase(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    if (!SoLoadUtilNew.loadSoByName(BaseApplicationImpl.getContext(), "FTSDatabase")) {
      com.tencent.mobileqq.app.proxy.FTSDBManager.jdField_a_of_type_Boolean = false;
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_b_of_type_JavaLangString = paramQQAppInterface.a();
    jdField_c_of_type_JavaLangString = jdField_b_of_type_JavaLangString;
    d = (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getFilesDir().getAbsolutePath().replace("files", "databases") + File.separator + jdField_c_of_type_JavaLangString + "-IndexQQMsg.db");
  }
  
  private native int batchTrans(ArrayList paramArrayList, String paramString, int paramInt);
  
  private native int closeFTS();
  
  private native int createCursor(String paramString);
  
  private native int createIndexTable(String paramString, int paramInt);
  
  private native int deleteIndexTable(FTSEntity paramFTSEntity);
  
  private native int initFTS(String paramString1, String paramString2, int paramInt1, int paramInt2);
  
  private native int insertIndexTable(FTSEntity paramFTSEntity);
  
  private native int isTableExist(String paramString);
  
  private native int queryIndexCount(String paramString);
  
  private native ArrayList queryIndexTable(String paramString1, String[] paramArrayOfString, boolean paramBoolean1, boolean paramBoolean2, int paramInt1, int paramInt2, String paramString2, String paramString3, int paramInt3);
  
  private native int readCursor(String paramString);
  
  private native int updateIndexTable(FTSEntity paramFTSEntity);
  
  public int a(String paramString)
  {
    if (!jdField_a_of_type_Boolean) {
      return -1;
    }
    return readCursor(paramString);
  }
  
  public int a(ArrayList paramArrayList)
  {
    int i;
    if (!jdField_a_of_type_Boolean) {
      i = -1;
    }
    int j;
    do
    {
      do
      {
        return i;
        if ((paramArrayList == null) || (paramArrayList.isEmpty()))
        {
          if (QLog.isColorLevel()) {
            QLog.w("Q.fts.db", 2, "transToDatabase: entities == null");
          }
          return -1;
        }
        Iterator localIterator = paramArrayList.iterator();
        while (localIterator.hasNext())
        {
          FTSEntity localFTSEntity = (FTSEntity)localIterator.next();
          if (mOpt == 16) {
            mContent = localFTSEntity.createDeleteSQL();
          }
        }
        j = batchTrans(paramArrayList, "SyncCursor", -1);
        i = j;
      } while (j != -1);
      i = j;
    } while (!QLog.isColorLevel());
    QLog.w("Q.fts.db", 2, "transToDatabase: failure");
    return j;
  }
  
  public int a(ArrayList paramArrayList, int paramInt)
  {
    if (!jdField_a_of_type_Boolean) {}
    do
    {
      do
      {
        return -1;
        if (paramArrayList != null) {
          break;
        }
      } while (!QLog.isColorLevel());
      QLog.w("Q.fts.db", 2, "insertAddWithTransToDatabase: entities == null");
      return -1;
      if (batchTrans(paramArrayList, "UpgradeCursor", paramInt) > 0) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.e("Q.fts.db", 2, "insertAddWithTransToDatabase: failure");
    return -1;
    return 0;
  }
  
  public int a(ArrayList paramArrayList, String paramString, int paramInt)
  {
    if (!jdField_a_of_type_Boolean) {}
    do
    {
      return -1;
      if ((paramArrayList != null) && (!paramArrayList.isEmpty())) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.w("Q.fts.db", 2, "batchTransToDatabase: entities == null");
    return -1;
    paramInt = batchTrans(paramArrayList, paramString, paramInt);
    if ((paramInt == -1) && (QLog.isColorLevel())) {
      QLog.w("Q.fts.db", 2, "batchTransToDatabase: failure");
    }
    return paramInt;
  }
  
  public ArrayList a(FTSQueryArgs paramFTSQueryArgs)
  {
    long l1;
    for (;;)
    {
      try
      {
        if (TextUtils.isEmpty(jdField_a_of_type_JavaLangString))
        {
          if (!QLog.isColorLevel()) {
            break label329;
          }
          QLog.e("Q.fts.db", 2, "query: sql is null");
          break label329;
        }
        if (TextUtils.isEmpty(jdField_c_of_type_JavaLangString))
        {
          if (!QLog.isColorLevel()) {
            break label331;
          }
          QLog.e("Q.fts.db", 2, "query: classpath is null");
          break label331;
        }
        if (QLog.isColorLevel()) {
          QLog.i("Q.fts.db", 2, "query: sql = " + jdField_a_of_type_JavaLangString);
        }
        l1 = System.nanoTime();
        paramFTSQueryArgs = queryIndexTable(jdField_a_of_type_JavaLangString, jdField_a_of_type_ArrayOfJavaLangString, jdField_a_of_type_Boolean, jdField_b_of_type_Boolean, jdField_a_of_type_Int, jdField_b_of_type_Int, jdField_b_of_type_JavaLangString, jdField_c_of_type_JavaLangString, jdField_c_of_type_Int);
        l2 = System.nanoTime();
        Object localObject;
        if (QLog.isColorLevel())
        {
          localObject = new StringBuilder().append("query: list = ");
          if (paramFTSQueryArgs == null)
          {
            i = 0;
            QLog.i("Q.fts.db", 2, i + ", cost = " + (l2 - l1) / 1000000L + "ms");
          }
        }
        else
        {
          if ((paramFTSQueryArgs == null) || (paramFTSQueryArgs.isEmpty())) {
            break label327;
          }
          l1 = System.nanoTime();
          localObject = paramFTSQueryArgs.iterator();
          if (!((Iterator)localObject).hasNext()) {
            break;
          }
          ((FTSEntity)((Iterator)localObject).next()).postRead();
          continue;
        }
        int i = paramFTSQueryArgs.size();
      }
      catch (Exception paramFTSQueryArgs)
      {
        paramFTSQueryArgs.printStackTrace();
        if (QLog.isColorLevel()) {
          QLog.e("Q.fts.db", 2, "query: failure, ", paramFTSQueryArgs);
        }
        return null;
      }
    }
    long l2 = System.nanoTime();
    if (QLog.isColorLevel()) {
      QLog.i("Q.fts.db", 2, "query: postRead cost = " + (l2 - l1) / 1000000L + "ms");
    }
    return paramFTSQueryArgs;
    label327:
    return null;
    label329:
    return null;
    label331:
    return null;
  }
  
  public void a()
  {
    if (jdField_a_of_type_Boolean)
    {
      jdField_a_of_type_Boolean = false;
      jdField_b_of_type_Boolean = true;
    }
  }
  
  public void a(FTSEntity paramFTSEntity)
  {
    if (!jdField_a_of_type_Boolean) {}
    do
    {
      do
      {
        do
        {
          return;
          if (paramFTSEntity != null) {
            break;
          }
        } while (!QLog.isColorLevel());
        QLog.w("Q.fts.db", 2, "insert: entity == null");
        return;
        if ((mType != -1) && (mContent != null)) {
          break;
        }
      } while (!QLog.isColorLevel());
      QLog.w("Q.fts.db", 2, "insert: entity no valid");
      return;
      if (QLog.isColorLevel()) {
        QLog.d("Q.fts.db", 2, "insert start");
      }
      paramFTSEntity.preWrite();
    } while ((insertIndexTable(paramFTSEntity) == 0) || (!QLog.isColorLevel()));
    QLog.w("Q.fts.db", 2, "insert: failure");
  }
  
  public boolean a()
  {
    return jdField_a_of_type_Boolean;
  }
  
  public boolean a(FTSEntity paramFTSEntity)
  {
    if (!jdField_a_of_type_Boolean) {}
    do
    {
      do
      {
        do
        {
          return false;
          if (paramFTSEntity != null) {
            break;
          }
        } while (!QLog.isColorLevel());
        QLog.w("Q.fts.db", 2, "delete: entity == null");
        return false;
        if ((mType != -1) && (mContent != null)) {
          break;
        }
      } while (!QLog.isColorLevel());
      QLog.w("Q.fts.db", 2, "delete: entity no valid");
      return false;
      if (QLog.isColorLevel()) {
        QLog.d("Q.fts.db", 2, "delete start");
      }
      paramFTSEntity.preWrite();
      if (deleteIndexTable(paramFTSEntity) == 0) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.w("Q.fts.db", 2, "delete: failure");
    return false;
    return true;
  }
  
  public boolean a(String paramString)
  {
    if (!jdField_a_of_type_Boolean) {}
    do
    {
      return false;
      if (createCursor(paramString) == 0) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.e("Q.fts.db", 2, "creatAssistTable: failure");
    return false;
    return true;
  }
  
  public boolean a(String paramString, boolean paramBoolean)
  {
    if (!jdField_a_of_type_Boolean) {
      return false;
    }
    if (paramBoolean) {}
    for (int i = 1;; i = 0)
    {
      if (createIndexTable(paramString, i) == 0) {
        break label46;
      }
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.e("Q.fts.db", 2, "createIndexTable: failure");
      return false;
    }
    label46:
    return true;
  }
  
  public int b(String paramString)
  {
    if (!jdField_a_of_type_Boolean) {
      return -1;
    }
    return queryIndexCount(paramString);
  }
  
  public void b()
  {
    String str = QLog.class.getName().replace('.', '/');
    if (QLog.isColorLevel()) {}
    for (int i = 1;; i = 0)
    {
      int j = SQLiteFTSUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      if (initFTS(jdField_c_of_type_JavaLangString, str, i, j) == 0) {
        break;
      }
      jdField_a_of_type_Boolean = false;
      if (QLog.isColorLevel()) {
        QLog.e("Q.fts.db", 2, "init: failure");
      }
      return;
    }
    jdField_a_of_type_Boolean = true;
  }
  
  @Deprecated
  public void b(FTSEntity paramFTSEntity)
  {
    if (!jdField_a_of_type_Boolean) {}
    do
    {
      do
      {
        do
        {
          return;
          if (paramFTSEntity != null) {
            break;
          }
        } while (!QLog.isColorLevel());
        QLog.w("Q.fts.db", 2, "update: entity == null");
        return;
        if ((mType != -1) && (mContent != null) && (mOId != -1L)) {
          break;
        }
      } while (!QLog.isColorLevel());
      QLog.w("Q.fts.db", 2, "update: entity no valid");
      return;
      paramFTSEntity.preWrite();
    } while ((updateIndexTable(paramFTSEntity) == 0) || (!QLog.isColorLevel()));
    QLog.w("Q.fts.db", 2, "update: failure");
  }
  
  public boolean b(String paramString)
  {
    if (!jdField_a_of_type_Boolean) {}
    while (isTableExist(paramString) != 0) {
      return false;
    }
    return true;
  }
  
  public void c()
  {
    if ((jdField_b_of_type_Boolean) || (jdField_a_of_type_Boolean))
    {
      jdField_b_of_type_Boolean = false;
      jdField_a_of_type_Boolean = false;
      if ((closeFTS() != 0) && (QLog.isColorLevel())) {
        QLog.e("Q.fts.db", 2, "close: failure");
      }
    }
  }
  
  public void d()
  {
    c();
    File localFile = new File(d);
    if ((localFile.exists()) && (localFile.isFile())) {
      localFile.delete();
    }
  }
}
