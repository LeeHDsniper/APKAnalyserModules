package com.tencent.mobileqq.statistics;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import android.os.Handler.Callback;
import android.os.Message;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.persistence.EntityTransaction;
import com.tencent.mobileqq.servlet.ReportServlet;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.MqqWeakReferenceHandler;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;
import mqq.app.NewIntent;
import mqq.manager.ServerConfigManager.ConfigType;
import mqq.observer.BusinessObserver;

public class ReportControllerImpl
  extends ReportController
  implements Handler.Callback, BusinessObserver
{
  private static final int jdField_a_of_type_Int = 40;
  private static final long jdField_a_of_type_Long = 86400000L;
  private static final int jdField_b_of_type_Int = 20;
  private static final int c = 9527;
  private static final int d = 9528;
  private static final int e = 2;
  private static final String q = "pre_report_time";
  private static final String r = "${uin_unknown}";
  private static final String s = "${count_unknown}";
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private ProxyManager jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager;
  private MqqWeakReferenceHandler jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler;
  private Boolean jdField_a_of_type_JavaLangBoolean;
  private final HashMap jdField_a_of_type_JavaUtilHashMap;
  private long jdField_b_of_type_Long;
  private int f;
  
  private ReportControllerImpl(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilHashMap = new HashMap();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    if (QLog.isColorLevel()) {
      QLog.d("ReportController", 2, "Create:" + paramQQAppInterface);
    }
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler = new MqqWeakReferenceHandler(ThreadManager.b(), this);
    try
    {
      paramQQAppInterface = paramQQAppInterface.a(ServerConfigManager.ConfigType.common, "ActionReportInterval");
      if ((paramQQAppInterface != null) && (paramQQAppInterface.length() > 0)) {
        b = (Long.parseLong(paramQQAppInterface) * 1000L);
      }
    }
    catch (Exception paramQQAppInterface)
    {
      for (;;) {}
    }
    if (b <= 1000L) {
      b = 86400000L;
    }
  }
  
  private int a()
  {
    for (;;)
    {
      try
      {
        if (f <= 0)
        {
          f = (new Random().nextInt(1000000) + 100);
          int i = f;
          return i;
        }
        if (f >= 1000100) {
          f = 100;
        } else {
          f += 1;
        }
      }
      finally {}
    }
  }
  
  public static ReportController a(QQAppInterface paramQQAppInterface)
  {
    return new ReportControllerImpl(paramQQAppInterface);
  }
  
  private boolean a()
  {
    if (!NetworkUtil.e(BaseApplicationImpl.a)) {
      return false;
    }
    if (QLog.isColorLevel()) {
      QLog.d("ReportController", 2, "doReportClickEvent:" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    }
    label201:
    label483:
    label498:
    label501:
    label516:
    label539:
    label550:
    for (;;)
    {
      int j;
      int k;
      int m;
      synchronized (jdField_a_of_type_JavaUtilHashMap)
      {
        j = jdField_a_of_type_JavaUtilHashMap.size();
        ArrayList localArrayList = new ArrayList(20);
        localObject3 = new ArrayList(20);
        int i = a();
        Iterator localIterator = jdField_a_of_type_JavaUtilHashMap.keySet().iterator();
        k = 0;
        if (localIterator.hasNext())
        {
          localObject4 = (String)localIterator.next();
          Reporting localReporting = (Reporting)jdField_a_of_type_JavaUtilHashMap.get(localObject4);
          if ((mDetailHashCode != 0) && (mDetail.hashCode() != mDetailHashCode))
          {
            localIterator.remove();
            jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a("", 0, "Reporting", localReporting, 5, null);
            m = j - 1;
            j = k;
            k = m;
            break label501;
            localObject4 = new NewIntent(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication(), ReportServlet.class);
            ((NewIntent)localObject4).putExtra("sendType", 10);
            ((NewIntent)localObject4).putExtra("seqKey", i);
            ((NewIntent)localObject4).putExtra("tags", localArrayList);
            ((NewIntent)localObject4).putExtra("retryTime", 0);
            ((NewIntent)localObject4).putExtra("contents", (Serializable)localObject3);
            ((NewIntent)localObject4).setObserver(this);
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.startServlet((NewIntent)localObject4);
            localObject3 = new ArrayList(20);
            localArrayList = new ArrayList(20);
            if (j < k)
            {
              i = a();
              break label516;
            }
          }
          else
          {
            localArrayList.add(mTag);
            localObject4 = mDetail.replace("${count_unknown}", String.valueOf(mCount));
            if (!((String)localObject4).startsWith("${report_seq_prefix}")) {
              break label498;
            }
            localObject4 = ((String)localObject4).substring(((String)localObject4).indexOf("|") + 1);
            ((ArrayList)localObject3).add(localObject4);
            localIterator.remove();
            jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a("", 0, "Reporting", localReporting, 5, null);
            if (!QLog.isColorLevel()) {
              break label539;
            }
            QLog.d("ReportController", 2, "Report: " + mTag + ", " + (String)localObject4 + ", " + i);
            break label539;
          }
        }
        else
        {
          return true;
        }
      }
      break label516;
      Object localObject4 = localObject1;
      Object localObject2 = localObject3;
      Object localObject3 = localObject4;
      break label516;
      continue;
      for (;;)
      {
        if (j % 20 == 0) {
          break label550;
        }
        if (j < k) {
          break label483;
        }
        break label201;
        localObject4 = localObject3;
        m = k;
        localObject3 = localObject2;
        localObject2 = localObject4;
        k = j;
        j = m;
        break;
        m = k + 1;
        k = j;
        j = m;
      }
    }
  }
  
  private void b()
  {
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.removeMessages(9527);
    try
    {
      a();
      Object localObject = BaseApplicationImpl.a.getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), 0);
      long l = System.currentTimeMillis();
      localObject = ((SharedPreferences)localObject).edit();
      ((SharedPreferences.Editor)localObject).putLong("pre_report_time", l);
      ((SharedPreferences.Editor)localObject).commit();
      jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.sendEmptyMessageDelayed(9527, b);
      return;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        if (QLog.isDevelopLevel()) {
          QLog.d("ReportController", 4, "report exception:" + localException);
        }
      }
    }
  }
  
  private void b(QQAppInterface paramQQAppInterface)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ReportController", 2, "saveReportData:" + paramQQAppInterface);
    }
    synchronized (jdField_a_of_type_JavaUtilHashMap)
    {
      Object localObject = jdField_a_of_type_JavaUtilHashMap.values();
      if (localObject != null)
      {
        int i = ((Collection)localObject).size();
        if (i <= 0) {}
      }
      try
      {
        paramQQAppInterface = paramQQAppInterface.a().createEntityManager();
        EntityTransaction localEntityTransaction = paramQQAppInterface.a();
        localEntityTransaction.a();
        try
        {
          localObject = ((Collection)localObject).iterator();
          while (((Iterator)localObject).hasNext())
          {
            localReporting = (Reporting)((Iterator)localObject).next();
            if (localReporting.getStatus() != 1000) {
              break label161;
            }
            paramQQAppInterface.b(localReporting);
          }
          jdField_a_of_type_JavaUtilHashMap.clear();
        }
        catch (Throwable localThrowable)
        {
          localEntityTransaction.c();
          localEntityTransaction.b();
          paramQQAppInterface.a();
        }
      }
      catch (Throwable paramQQAppInterface)
      {
        Reporting localReporting;
        label161:
        for (;;) {}
      }
      return;
      paramQQAppInterface.a(localReporting);
    }
  }
  
  protected void a()
  {
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.removeMessages(9527);
  }
  
  protected void a(QQAppInterface arg1, ProxyManager paramProxyManager)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = ???;
    jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager = paramProxyManager;
    jdField_a_of_type_JavaLangBoolean = Boolean.valueOf(true);
    if (QLog.isColorLevel()) {
      QLog.d("ReportController", 2, "Init:" + ???);
    }
    paramProxyManager = ???.a().createEntityManager().a(Reporting.class);
    if (paramProxyManager != null) {
      synchronized (jdField_a_of_type_JavaUtilHashMap)
      {
        paramProxyManager = paramProxyManager.iterator();
        if (paramProxyManager.hasNext())
        {
          Reporting localReporting1 = (Reporting)paramProxyManager.next();
          String str = mTag + ":" + mDetail;
          Reporting localReporting2 = (Reporting)jdField_a_of_type_JavaUtilHashMap.get(str);
          if (localReporting2 != null)
          {
            int i = mCount;
            mCount += i;
          }
          jdField_a_of_type_JavaUtilHashMap.put(str, localReporting1);
        }
      }
    }
  }
  
  protected void a(String paramString1, String paramString2, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ReportController", 2, "addReporting:" + paramString2 + ", " + paramInt);
    }
    String str = paramString1 + ":" + paramString2;
    for (;;)
    {
      synchronized (jdField_a_of_type_JavaUtilHashMap)
      {
        Reporting localReporting = (Reporting)jdField_a_of_type_JavaUtilHashMap.get(str);
        if (localReporting == null)
        {
          localReporting = new Reporting();
          mTag = paramString1;
          mDetail = paramString2;
          mCount = paramInt;
          mDetailHashCode = mDetail.hashCode();
          jdField_a_of_type_JavaUtilHashMap.put(str, localReporting);
          if ((jdField_a_of_type_JavaLangBoolean != null) && (jdField_a_of_type_JavaLangBoolean.booleanValue())) {
            jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a("", 0, "Reporting", localReporting, 3, null);
          }
          if (jdField_a_of_type_JavaLangBoolean != null)
          {
            if (!jdField_a_of_type_JavaLangBoolean.booleanValue()) {
              break label275;
            }
            if (jdField_a_of_type_JavaUtilHashMap.size() >= 40) {
              b();
            }
          }
        }
        else
        {
          mCount += paramInt;
          if ((jdField_a_of_type_JavaLangBoolean == null) || (!jdField_a_of_type_JavaLangBoolean.booleanValue())) {
            continue;
          }
          jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a("", 0, "Reporting", localReporting.clone(), 4, null);
        }
      }
      label275:
      if (!jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.hasMessages(9528)) {
        jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.sendEmptyMessage(9528);
      }
    }
  }
  
  protected void a(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      BaseApplicationImpl localBaseApplicationImpl = BaseApplicationImpl.a;
      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount() != null) {}
      for (Object localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount();; localObject = "10000")
      {
        localObject = localBaseApplicationImpl.getSharedPreferences((String)localObject, 0);
        long l = System.currentTimeMillis();
        if (Math.abs(l - ((SharedPreferences)localObject).getLong("pre_report_time", l)) >= b) {
          break;
        }
        return;
      }
    }
    b();
  }
  
  protected void b(QQAppInterface paramQQAppInterface, ProxyManager paramProxyManager)
  {
    jdField_a_of_type_JavaLangBoolean = Boolean.valueOf(false);
    if (QLog.isColorLevel()) {
      QLog.d("ReportController", 2, "Destory:" + paramQQAppInterface);
    }
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.sendEmptyMessage(9528);
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    if (what == 9527) {
      b();
    }
    for (;;)
    {
      return true;
      if (what == 9528) {
        b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      }
    }
  }
  
  public void onReceive(int paramInt, boolean paramBoolean, Bundle paramBundle)
  {
    if (paramInt == 10)
    {
      int i = paramBundle.getInt("seqKey");
      paramInt = 0;
      if (QLog.isColorLevel()) {
        QLog.d("ReportController", 2, "OnReceive: isSuccess-" + paramBoolean + ", seqKey = " + i);
      }
      if (!paramBoolean) {
        paramInt = paramBundle.getInt("retryTime");
      }
      QQAppInterface localQQAppInterface = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
      if ((!paramBoolean) && (paramInt < 2) && (localQQAppInterface != null))
      {
        NewIntent localNewIntent = new NewIntent(localQQAppInterface.a(), ReportServlet.class);
        localNewIntent.putExtra("sendType", 10);
        localNewIntent.putExtra("seqKey", i);
        localNewIntent.putExtra("tags", paramBundle.getStringArrayList("tags"));
        localNewIntent.putExtra("contents", paramBundle.getStringArrayList("contents"));
        localNewIntent.putExtra("retryTime", paramInt + 1);
        localNewIntent.setObserver(this);
        localQQAppInterface.startServlet(localNewIntent);
      }
    }
  }
}
