package com.tencent.mobileqq.activity.recent;

import android.content.Context;
import android.text.TextUtils;
import com.tencent.mobileqq.app.DiscussionManager;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.proxy.RecentUserProxy;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.TraceUtils;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

public class RecentDataListManager
{
  private static RecentDataListManager jdField_a_of_type_ComTencentMobileqqActivityRecentRecentDataListManager;
  private static final Object jdField_a_of_type_JavaLangObject = new Object();
  public List a;
  private ConcurrentHashMap jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap = null;
  public List b;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private RecentDataListManager()
  {
    jdField_a_of_type_JavaUtilList = null;
    jdField_a_of_type_JavaUtilList = new ArrayList(99);
  }
  
  public static RecentDataListManager a()
  {
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentDataListManager == null) {
        jdField_a_of_type_ComTencentMobileqqActivityRecentRecentDataListManager = new RecentDataListManager();
      }
      return jdField_a_of_type_ComTencentMobileqqActivityRecentRecentDataListManager;
    }
  }
  
  public static String a(String paramString, int paramInt)
  {
    return paramString + "-" + paramInt;
  }
  
  private void a(QQAppInterface paramQQAppInterface, List paramList)
  {
    TraceUtils.a("splitRecents");
    ArrayList localArrayList1 = new ArrayList(4);
    ArrayList localArrayList2 = new ArrayList(4);
    ArrayList localArrayList3 = new ArrayList(4);
    localArrayList1.add(paramQQAppInterface.a());
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      RecentUser localRecentUser = (RecentUser)paramList.next();
      switch (type)
      {
      default: 
        break;
      case 0: 
        localArrayList1.add(uin);
        break;
      case 1: 
        localArrayList2.add(uin);
        break;
      case 3000: 
        localArrayList3.add(uin);
      }
    }
    TraceUtils.a();
    if (localArrayList1.size() > 2) {
      ((FriendsManager)paramQQAppInterface.getManager(50)).a(localArrayList1);
    }
    if (localArrayList3.size() > 2) {
      ((DiscussionManager)paramQQAppInterface.getManager(52)).a(localArrayList3);
    }
    if (localArrayList2.size() > 2) {
      ((TroopManager)paramQQAppInterface.getManager(51)).a(localArrayList2);
    }
  }
  
  public RecentBaseData a(String paramString)
  {
    try
    {
      if ((jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap != null) && (!TextUtils.isEmpty(paramString)))
      {
        paramString = (RecentBaseData)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString);
        return paramString;
      }
    }
    catch (Exception paramString)
    {
      if (QLog.isColorLevel()) {
        QLog.i("Q.recent", 2, paramString.toString());
      }
    }
    return null;
  }
  
  public void a()
  {
    try
    {
      if (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap != null) {
        jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
      }
      if (jdField_a_of_type_JavaUtilList != null) {
        jdField_a_of_type_JavaUtilList.clear();
      }
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public void a(RecentBaseData paramRecentBaseData, String paramString)
  {
    if ((jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap != null) && (!TextUtils.isEmpty(paramString)) && (paramRecentBaseData != null)) {
      jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(paramString, paramRecentBaseData);
    }
  }
  
  public void a(String paramString)
  {
    if ((jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap != null) && (!TextUtils.isEmpty(paramString))) {
      jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.remove(paramString);
    }
  }
  
  public boolean a(QQAppInterface paramQQAppInterface, Context paramContext, boolean paramBoolean)
  {
    boolean bool = false;
    if (paramQQAppInterface == null)
    {
      localObject = null;
      if (localObject == null) {
        break label176;
      }
    }
    label31:
    label118:
    label176:
    for (Object localObject = ((RecentUserProxy)localObject).a(true);; localObject = null)
    {
      int i;
      int j;
      if (localObject == null)
      {
        i = 0;
        j = Math.min(8, i);
        if (j > 0)
        {
          if (paramBoolean) {
            break label118;
          }
          a(paramQQAppInterface, (List)localObject);
          b = new ArrayList(j);
          ConversationDataFactory.a((List)localObject, paramQQAppInterface, paramContext, b, j);
        }
      }
      for (;;)
      {
        paramBoolean = bool;
        if (j > 0) {
          paramBoolean = true;
        }
        return paramBoolean;
        localObject = paramQQAppInterface.a().a();
        break;
        i = ((List)localObject).size();
        break label31;
        paramQQAppInterface = new RecentFaceDecoder(paramQQAppInterface);
        i = 0;
        while (i < j)
        {
          paramContext = (RecentUser)((List)localObject).get(i);
          if (paramContext != null) {
            paramQQAppInterface.a(type, uin);
          }
          i += 1;
        }
      }
    }
  }
  
  public boolean a(String paramString)
  {
    if ((jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap != null) && (!TextUtils.isEmpty(paramString))) {
      return jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(paramString);
    }
    return false;
  }
}
