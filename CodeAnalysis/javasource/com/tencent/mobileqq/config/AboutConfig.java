package com.tencent.mobileqq.config;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Build;
import android.util.DisplayMetrics;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.app.PluginConfigProxy;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.data.ResourcePluginInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import cooperation.qzone.QZoneHelper;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import mqq.observer.ServerConfigObserver;
import nts;
import ntt;
import ntu;
import protocol.KQQConfig.GetResourceReqInfoV2;

public class AboutConfig
{
  public static final String a = "com.tx.aboutfunction";
  public static final boolean a = true;
  public static final String b = "http://fwd.3g.qq.com:8080/forward.jsp?bid=942";
  public static final String c = "com.tx.aboutimage";
  public static final String d = "http://fwd.3g.qq.com:8080/forward.jsp?bid=943";
  public static final String e = "com.tencent.Feedback_5_8";
  public static final String f = "http://mma.qq.com/feedback/index.html";
  public static final String g = "#_rc=mqq_faq_feedback";
  public static final String h = "com.tencent.help_5_8";
  public static final String i = "http://kf.qq.com/touch/product/mobileqq_platform_app.html?scene_id=kf180";
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private Hashtable jdField_a_of_type_JavaUtilHashtable;
  private List jdField_a_of_type_JavaUtilList;
  private ServerConfigObserver jdField_a_of_type_MqqObserverServerConfigObserver;
  private boolean b;
  
  public AboutConfig(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    b = true;
    jdField_a_of_type_MqqObserverServerConfigObserver = new ntt(this);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_JavaUtilList = new ArrayList();
    jdField_a_of_type_JavaUtilHashtable = new Hashtable();
  }
  
  private Hashtable a()
  {
    Hashtable localHashtable = new Hashtable();
    ResourcePluginInfo localResourcePluginInfo = new ResourcePluginInfo();
    strPkgName = "com.tx.aboutfunction";
    strResName = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131369289);
    strResURL = "";
    sResSubType = 2;
    cCanChangeState = 0;
    cDefaultState = 0;
    cLocalState = 1;
    cDataType = 1;
    isNew = 1;
    sLanType = 1;
    uiResId = 0L;
    strGotoUrl = "http://fwd.3g.qq.com:8080/forward.jsp?bid=942";
    iPluginType = 32;
    localHashtable.put(strPkgName, localResourcePluginInfo);
    localResourcePluginInfo = new ResourcePluginInfo();
    strPkgName = "com.tx.aboutimage";
    strResName = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131369290);
    strResURL = "";
    sResSubType = 2;
    cCanChangeState = 0;
    cDefaultState = 0;
    cLocalState = 1;
    cDataType = 1;
    isNew = 1;
    sLanType = 1;
    uiResId = 0L;
    strGotoUrl = "http://fwd.3g.qq.com:8080/forward.jsp?bid=943";
    iPluginType = 32;
    localHashtable.put(strPkgName, localResourcePluginInfo);
    localResourcePluginInfo = new ResourcePluginInfo();
    strPkgName = "com.tencent.help_5_8";
    strResName = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131367495);
    strResDesc = "";
    strResURL = "";
    sResSubType = 2;
    cCanChangeState = 0;
    cDefaultState = 0;
    cLocalState = 1;
    cDataType = 1;
    isNew = 1;
    sLanType = 1;
    sPriority = 0;
    uiResId = 0L;
    strGotoUrl = "http://kf.qq.com/touch/product/mobileqq_platform_app.html?scene_id=kf180";
    iPluginType = 32;
    localHashtable.put(strPkgName, localResourcePluginInfo);
    localResourcePluginInfo = new ResourcePluginInfo();
    strPkgName = "com.tencent.Feedback_5_8";
    strResName = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131371255);
    strResDesc = "";
    strResURL = "";
    sResSubType = 2;
    cCanChangeState = 0;
    cDefaultState = 0;
    cLocalState = 1;
    cDataType = 1;
    isNew = 1;
    sLanType = 1;
    sPriority = 0;
    uiResId = 0L;
    strGotoUrl = "http://mma.qq.com/feedback/index.html";
    iPluginType = 32;
    localHashtable.put(strPkgName, localResourcePluginInfo);
    return localHashtable;
  }
  
  public static void a(QQAppInterface paramQQAppInterface, Context paramContext, ResourcePluginInfo paramResourcePluginInfo)
  {
    AboutConfig localAboutConfig = paramQQAppInterface.a();
    Object localObject2 = strGotoUrl;
    Object localObject1 = "version=6.3.3.2755&appid=" + AppSetting.a + "&QUA=" + QZoneHelper.a() + "&sid=" + paramQQAppInterface.getSid();
    Object localObject3;
    if (!strPkgName.equals("com.tencent.Feedback_5_8"))
    {
      localObject3 = localObject1;
      if (!strPkgName.equals("com.tencent.help_5_8")) {}
    }
    else
    {
      localObject3 = (String)localObject1 + "&adtag=2755";
    }
    if (strPkgName.equals("com.tencent.Feedback_5_8"))
    {
      localObject1 = localObject2;
      if (((String)localObject2).endsWith("#_rc=mqq_faq_feedback")) {
        localObject1 = ((String)localObject2).substring(0, ((String)localObject2).length() - "#_rc=mqq_faq_feedback".length());
      }
      localObject3 = "?" + (String)localObject3;
      localObject2 = localObject1;
      localObject1 = localObject3;
      localObject3 = (String)localObject2 + (String)localObject1;
      if ((!strPkgName.equals("com.tencent.Feedback_5_8")) && (!strPkgName.equals("com.tencent.help_5_8"))) {
        break label836;
      }
      if (QLog.isColorLevel())
      {
        if (!strPkgName.equals("com.tencent.Feedback_5_8")) {
          break label724;
        }
        QLog.i("About-Feedback", 2, "feedfack before: url = " + (String)localObject3);
      }
      label273:
      localObject1 = Build.MODEL;
      if (localObject1 == null) {
        break label767;
      }
      localObject1 = ((String)localObject1).replaceAll(" ", "_");
      label294:
      int j = StatisticCollector.a();
      localObject2 = localObject1;
      if (j > 0) {
        localObject2 = (String)localObject1 + "_qzpatch" + j;
      }
      localObject1 = Build.MANUFACTURER;
      if (localObject1 == null) {
        break label774;
      }
      localObject1 = ((String)localObject1).replaceAll(" ", "_");
      label353:
      StringBuilder localStringBuilder = new StringBuilder();
      localStringBuilder.append((String)localObject3).append("&model=").append((String)localObject2).append("&manufacture=").append((String)localObject1).append("&cpunum=").append(DeviceInfoUtil.b()).append("&cpurate=").append(DeviceInfoUtil.a()).append("&mem=").append(DeviceInfoUtil.c() / 1024L / 1024L).append("&amem=").append(DeviceInfoUtil.d() / 1024L / 1024L).append("&w=").append(DeviceInfoUtil.f()).append("&h=").append(DeviceInfoUtil.g());
      localObject2 = localStringBuilder.toString();
      localObject1 = localObject2;
      if (strPkgName.equals("com.tencent.Feedback_5_8")) {
        localObject1 = (String)localObject2 + "#_rc=mqq_faq_feedback";
      }
      localObject2 = localObject1;
      if (QLog.isColorLevel())
      {
        if (!strPkgName.equals("com.tencent.Feedback_5_8")) {
          break label781;
        }
        QLog.i("About-Feedback", 2, "feedfack after: url = " + (String)localObject1);
      }
    }
    label574:
    label724:
    label767:
    label774:
    label781:
    label836:
    for (localObject2 = localObject1;; localObject2 = localObject3)
    {
      localObject1 = new Intent(paramContext, QQBrowserActivity.class);
      ((Intent)localObject1).putExtra("portraitOnly", true);
      ((Intent)localObject1).putExtra("url", (String)localObject2).putExtra("bFormatUrl", false);
      ((Intent)localObject1).putExtra("uin", paramQQAppInterface.a());
      if ((strPkgName.equals("com.tencent.Feedback_5_8")) || (strPkgName.equals("com.tencent.help_5_8"))) {
        ((Intent)localObject1).putExtra("reportMsfLog", true);
      }
      try
      {
        paramContext.startActivity((Intent)localObject1);
        if (isNew == 0)
        {
          isNew = 1;
          ThreadManager.a(new ntu(localAboutConfig, paramResourcePluginInfo), 8, null, false);
        }
        return;
        localObject1 = "&" + (String)localObject3;
        break;
        if (!strPkgName.equals("com.tencent.help_5_8")) {
          break label273;
        }
        QLog.i("About-Help", 2, "help before: url = " + (String)localObject3);
        break label273;
        localObject1 = "";
        break label294;
        localObject1 = "";
        break label353;
        localObject2 = localObject1;
        if (!strPkgName.equals("com.tencent.help_5_8")) {
          break label574;
        }
        QLog.i("About-Help", 2, "help after: url = " + (String)localObject1);
        localObject2 = localObject1;
      }
      catch (SecurityException paramQQAppInterface)
      {
        for (;;) {}
      }
    }
  }
  
  private void a(List paramList)
  {
    if ((jdField_a_of_type_JavaUtilHashtable != null) && (paramList != null) && (paramList.size() > 0))
    {
      paramList = paramList.iterator();
      while (paramList.hasNext())
      {
        ResourcePluginInfo localResourcePluginInfo = (ResourcePluginInfo)paramList.next();
        jdField_a_of_type_JavaUtilHashtable.put(strPkgName, localResourcePluginInfo);
      }
    }
  }
  
  private void c()
  {
    if (jdField_a_of_type_JavaUtilHashtable != null) {
      jdField_a_of_type_JavaUtilHashtable.clear();
    }
  }
  
  public ResourcePluginInfo a(String paramString)
  {
    return (ResourcePluginInfo)jdField_a_of_type_JavaUtilHashtable.get(paramString);
  }
  
  public void a()
  {
    int j = 0;
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getResources().getDisplayMetrics().widthPixels >= 480) {}
    for (boolean bool = true;; bool = false)
    {
      b = bool;
      a(false);
      while (j < jdField_a_of_type_JavaUtilList.size())
      {
        ResourcePluginListener.a((ResourcePluginListener)jdField_a_of_type_JavaUtilList.get(j), (byte)1, 2);
        j += 1;
      }
    }
  }
  
  public void a(PluginConfigProxy paramPluginConfigProxy)
  {
    ArrayList localArrayList = new ArrayList();
    if (jdField_a_of_type_JavaUtilHashtable != null)
    {
      Iterator localIterator = ((Hashtable)jdField_a_of_type_JavaUtilHashtable.clone()).values().iterator();
      while (localIterator.hasNext())
      {
        ResourcePluginInfo localResourcePluginInfo = (ResourcePluginInfo)localIterator.next();
        if (cDataType == 0)
        {
          GetResourceReqInfoV2 localGetResourceReqInfoV2 = new GetResourceReqInfoV2();
          cState = 0;
          sLanType = sLanType;
          sResSubType = 0;
          strPkgName = strPkgName;
          uiCurVer = uiCurVer;
          localArrayList.add(localGetResourceReqInfoV2);
        }
      }
    }
    if (QLog.isColorLevel()) {
      QLog.d("QQInitHandler", 2, "sendAboutConfig" + localArrayList.size());
    }
    paramPluginConfigProxy.a(32, localArrayList, jdField_a_of_type_MqqObserverServerConfigObserver);
  }
  
  public void a(ResourcePluginListener paramResourcePluginListener)
  {
    if (!jdField_a_of_type_JavaUtilList.contains(paramResourcePluginListener)) {
      jdField_a_of_type_JavaUtilList.add(paramResourcePluginListener);
    }
  }
  
  public void a(ResourcePluginInfo paramResourcePluginInfo)
  {
    ResourcePluginInfo localResourcePluginInfo;
    if ((jdField_a_of_type_JavaUtilHashtable != null) && (paramResourcePluginInfo != null) && (jdField_a_of_type_JavaUtilHashtable.containsKey(strPkgName)))
    {
      localResourcePluginInfo = (ResourcePluginInfo)jdField_a_of_type_JavaUtilHashtable.get(strPkgName);
      cLocalState = cLocalState;
      isNew = isNew;
      paramResourcePluginInfo = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    }
    try
    {
      ResourcePluginInfo.persistOrReplace(paramResourcePluginInfo, localResourcePluginInfo);
      if (paramResourcePluginInfo != null) {
        paramResourcePluginInfo.a();
      }
      return;
    }
    catch (Exception localException)
    {
      do
      {
        localException = localException;
      } while (paramResourcePluginInfo == null);
      paramResourcePluginInfo.a();
      return;
    }
    finally
    {
      localObject = finally;
      if (paramResourcePluginInfo != null) {
        paramResourcePluginInfo.a();
      }
      throw localObject;
    }
  }
  
  public void a(boolean paramBoolean)
  {
    if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.isLogin()) {
      if (QLog.isColorLevel()) {
        QLog.d("AboutConfig", 2, "error happens: loadAboutConfig while current account is null, which means there is no logined account now");
      }
    }
    do
    {
      return;
      if ((paramBoolean) || (jdField_a_of_type_JavaUtilHashtable == null) || (jdField_a_of_type_JavaUtilHashtable.size() <= 0)) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d("AboutConfig", 2, "there has about data in memory cache, do not need load from DB");
    return;
    jdField_a_of_type_JavaUtilHashtable = a();
    ThreadManager.a(new nts(this), 5, null, false);
  }
  
  public boolean a()
  {
    Iterator localIterator = jdField_a_of_type_JavaUtilHashtable.values().iterator();
    while (localIterator.hasNext())
    {
      ResourcePluginInfo localResourcePluginInfo = (ResourcePluginInfo)localIterator.next();
      if ((isNew == 0) && (cLocalState == 1)) {
        return true;
      }
    }
    return false;
  }
  
  public void b()
  {
    Iterator localIterator = new ArrayList(jdField_a_of_type_JavaUtilList).iterator();
    while (localIterator.hasNext()) {
      ResourcePluginListener.a((ResourcePluginListener)localIterator.next(), (byte)5, 2);
    }
  }
  
  public void b(ResourcePluginListener paramResourcePluginListener)
  {
    jdField_a_of_type_JavaUtilList.remove(paramResourcePluginListener);
  }
}
