package com.tencent.mobileqq.activity.qqcard;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.text.TextUtils;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.persistence.EntityTransaction;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.StringTokenizer;
import mqq.manager.Manager;

public class QQCardManager
  implements QQCardConstant, Manager
{
  public static final int a = 86400;
  public static final String a;
  public static final int b = -28800;
  SharedPreferences jdField_a_of_type_AndroidContentSharedPreferences;
  QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  EntityManager jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = QQCardManager.class.getSimpleName();
  }
  
  public QQCardManager(QQAppInterface paramQQAppInterface)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager = paramQQAppInterface.a().createEntityManager();
    jdField_a_of_type_AndroidContentSharedPreferences = paramQQAppInterface.a().getSharedPreferences(paramQQAppInterface.getAccount() + "qqcard", 0);
  }
  
  public static int a(long paramLong1, long paramLong2)
  {
    int i = (int)((paramLong2 + 28800L) / 86400L) - (int)((paramLong1 + 28800L) / 86400L);
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "daysBetween, tEnd=" + paramLong2 + ",tBegin=" + paramLong1 + ",leftDays=" + i);
    }
    return i;
  }
  
  public long a(String paramString)
  {
    return jdField_a_of_type_AndroidContentSharedPreferences.getLong(paramString, 0L);
  }
  
  public QQCardFolder a(int paramInt)
  {
    return (QQCardFolder)jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a(QQCardFolder.class, String.valueOf(paramInt));
  }
  
  public List a(int paramInt)
  {
    List localList = jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a(QQCardItem.class, false, "folderId=? and isValid=1", new String[] { String.valueOf(paramInt) }, null, null, "_id asc", null);
    Object localObject = localList;
    if (localList == null) {
      localObject = new ArrayList();
    }
    return localObject;
  }
  
  public Map a()
  {
    Object localObject1 = jdField_a_of_type_AndroidContentSharedPreferences.getString("qqcard_page_map", null);
    if (TextUtils.isEmpty((CharSequence)localObject1)) {
      return null;
    }
    HashMap localHashMap = new HashMap();
    StringTokenizer localStringTokenizer = new StringTokenizer((String)localObject1, "^");
    for (;;)
    {
      try
      {
        if (!localStringTokenizer.hasMoreTokens()) {
          return localHashMap;
        }
        localObject1 = new StringTokenizer(localStringTokenizer.nextToken(), "'");
        int i = Integer.parseInt(((StringTokenizer)localObject1).nextToken());
        if (!((StringTokenizer)localObject1).hasMoreTokens()) {
          break label119;
        }
        localObject1 = ((StringTokenizer)localObject1).nextToken();
        localHashMap.put(Integer.valueOf(i), localObject1);
        continue;
        if (!QLog.isColorLevel()) {
          break;
        }
      }
      catch (NumberFormatException localNumberFormatException) {}
      QLog.e(jdField_a_of_type_JavaLangString, 2, "getPageMap, parse String to Integer exception=", localNumberFormatException);
      return null;
      label119:
      Object localObject2 = null;
    }
    return localHashMap;
  }
  
  public void a()
  {
    EntityTransaction localEntityTransaction = jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a();
    try
    {
      localEntityTransaction.a();
      jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a(QQCardFolder.class);
      jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a(QQCardItem.class);
      localEntityTransaction.c();
      return;
    }
    finally
    {
      localEntityTransaction.b();
    }
  }
  
  public void a(int paramInt, boolean paramBoolean)
  {
    jdField_a_of_type_AndroidContentSharedPreferences.edit().putBoolean("has_clicked_" + paramInt, paramBoolean).commit();
  }
  
  public void a(String paramString, int paramInt)
  {
    ReportController.b(null, "P_CliOper", "Vip_pay_mywallet", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), "wallet", paramString, 1, paramInt, "", "", "", "");
  }
  
  public void a(String paramString, long paramLong)
  {
    SharedPreferences.Editor localEditor = jdField_a_of_type_AndroidContentSharedPreferences.edit();
    localEditor.putLong(paramString, paramLong);
    localEditor.commit();
  }
  
  public void a(Map paramMap)
  {
    StringBuffer localStringBuffer1 = new StringBuffer();
    if (paramMap != null)
    {
      Iterator localIterator = paramMap.entrySet().iterator();
      if (localIterator.hasNext())
      {
        paramMap = (Map.Entry)localIterator.next();
        StringBuffer localStringBuffer2 = localStringBuffer1.append(((Integer)paramMap.getKey()).toString()).append("'");
        if (paramMap.getValue() == null)
        {
          paramMap = "";
          label78:
          localStringBuffer2 = localStringBuffer2.append(paramMap);
          if (!localIterator.hasNext()) {
            break label124;
          }
        }
        label124:
        for (paramMap = "^";; paramMap = "")
        {
          localStringBuffer2.append(paramMap);
          break;
          paramMap = ((String)paramMap.getValue()).toString();
          break label78;
        }
      }
    }
    paramMap = jdField_a_of_type_AndroidContentSharedPreferences.edit();
    paramMap.putString("qqcard_page_map", localStringBuffer1.toString());
    paramMap.commit();
  }
  
  public void a(boolean paramBoolean)
  {
    SharedPreferences.Editor localEditor = jdField_a_of_type_AndroidContentSharedPreferences.edit();
    localEditor.putBoolean("qqcard_page_more", paramBoolean);
    localEditor.commit();
  }
  
  public boolean a()
  {
    return jdField_a_of_type_AndroidContentSharedPreferences.getBoolean("qqcard_page_more", false);
  }
  
  public boolean a(int paramInt)
  {
    return jdField_a_of_type_AndroidContentSharedPreferences.getBoolean("has_clicked_" + paramInt, false);
  }
  
  public boolean a(QQCardFolder paramQQCardFolder, List paramList)
  {
    if ((paramQQCardFolder == null) || (paramList == null)) {
      return false;
    }
    EntityTransaction localEntityTransaction = jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a();
    Object localObject;
    try
    {
      localEntityTransaction.a();
      localObject = a(localFolderId);
      if (localObject == null)
      {
        jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a(paramQQCardFolder);
        if (paramQQCardFolder.getStatus() == 1001) {
          break label135;
        }
        throw new Exception("insert folder fail");
      }
    }
    catch (Exception paramQQCardFolder)
    {
      if (QLog.isColorLevel()) {
        QLog.e(jdField_a_of_type_JavaLangString, 2, "update card data exception", paramQQCardFolder);
      }
      return false;
      paramQQCardFolder.setId(((QQCardFolder)localObject).getId());
      paramQQCardFolder.setStatus(1001);
      if (!jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a(paramQQCardFolder)) {
        throw new Exception("update folder fail");
      }
    }
    finally
    {
      localEntityTransaction.b();
    }
    label135:
    paramQQCardFolder = paramList.iterator();
    while (paramQQCardFolder.hasNext())
    {
      paramList = (QQCardItem)paramQQCardFolder.next();
      localObject = (QQCardItem)jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a(QQCardItem.class, new String[] { cardId, code });
      if (localObject == null)
      {
        if (isValid == 1)
        {
          jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a(paramList);
          if (paramList.getStatus() != 1001) {
            throw new Exception("insert card fail! card_id=" + cardId + "_" + code);
          }
        }
      }
      else if (isValid == 0)
      {
        if (!jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.b((Entity)localObject)) {
          throw new Exception("remove card fail! card_id=" + cardId + "_" + code);
        }
      }
      else
      {
        paramList.setId(((QQCardItem)localObject).getId());
        paramList.setStatus(1001);
        if (!jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a(paramList)) {
          throw new Exception("update card fail! card_id=" + cardId + "_" + code);
        }
      }
    }
    localEntityTransaction.c();
    localEntityTransaction.b();
    return true;
  }
  
  public void onDestroy() {}
}
