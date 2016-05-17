package com.tencent.mobileqq.app;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory.Options;
import android.text.TextUtils;
import com.tencent.mobileqq.config.DownloadIconsListener;
import com.tencent.mobileqq.config.ResourcePluginListener;
import com.tencent.mobileqq.data.ResourcePluginInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.util.BitmapManager;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import mqq.observer.ServerConfigObserver;
import mzb;
import mzc;
import mzd;
import protocol.KQQConfig.GetResourceReqInfoV2;

public class LebaHelper
{
  public static final String a = "qzone_feedlist";
  private static final int jdField_b_of_type_Int = 3;
  public static final String b = "nearby_friends";
  public static final String c = "nearby_troops";
  public static final String d = "com.tx.xingqubuluo.android";
  public static final String e = "hot_chat";
  private static final String f = "LebaHelper";
  private static final String g = "mqqapi://app/action?src_type=app&version=1&plg_sid=1&plg_ha3=1&plg_nickname=1&plg_newflag=1&plg_launchtime=1&pkg=com.tencent.mobileqq&cmp=com.qzone.feed.ui.activity.QZoneFriendFeedActivity&isFromQQ=true&qzone_uin=%s&page=%s";
  private static final String h = "mqqapi://app/action?src_type=app&version=1&pkg=com.tencent.mobileqq&cmp=com.tencent.mobileqq.activity.NearPeopleActivity";
  private static final String i = "mqqapi://app/action?src_type=app&version=1&pkg=com.tencent.mobileqq&cmp=com.tencent.mobileqq.troop.activity.NearbyTroopsActivity";
  private static final String j = "mqqapi://forward/url?src_type=internal&plg_auth=1&version=1&style=home&url_prefix=aHR0cDovL2J1bHVvLnFxLmNvbS9tb2JpbGUvaW5kZXguaHRtbD9fd3Y9MTAyNyZfYmlkPTEyOCNmcm9tPWRvbmd0YWkmdGFyZ2V0PWhvdA==";
  int jdField_a_of_type_Int;
  public QQAppInterface a;
  ArrayList jdField_a_of_type_JavaUtilArrayList;
  List jdField_a_of_type_JavaUtilList;
  public Set a;
  private ServerConfigObserver jdField_a_of_type_MqqObserverServerConfigObserver;
  public boolean a;
  byte[] jdField_a_of_type_ArrayOfByte;
  List jdField_b_of_type_JavaUtilList;
  public List c;
  public List d;
  
  public LebaHelper(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ArrayOfByte = new byte[0];
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_Int = 0;
    jdField_a_of_type_MqqObserverServerConfigObserver = new mzb(this);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_JavaUtilList = new ArrayList(10);
    b = new ArrayList(10);
    c = new ArrayList(2);
    jdField_a_of_type_JavaUtilSet = new HashSet();
    d = new ArrayList();
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
  }
  
  private Bitmap a(File paramFile)
  {
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    inJustDecodeBounds = true;
    BitmapManager.a(paramFile.getAbsolutePath(), localOptions);
    int k = outWidth;
    int m = outHeight;
    if ((k > 300) && (m > 300)) {
      inSampleSize = 3;
    }
    inJustDecodeBounds = false;
    return BitmapManager.a(paramFile.getAbsolutePath(), localOptions);
  }
  
  private void a(Runnable paramRunnable)
  {
    ThreadManager.a(paramRunnable, 5, null, true);
  }
  
  private void a(String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d("LebaHelper", 2, "Download success icon key = " + paramString);
    }
    Iterator localIterator = jdField_a_of_type_JavaUtilArrayList.iterator();
    while (localIterator.hasNext())
    {
      Map localMap = (Map)localIterator.next();
      if (localMap != null)
      {
        String str = (String)localMap.get("KEY");
        if ((str != null) && (str.equals(paramString))) {
          jdField_a_of_type_JavaUtilArrayList.remove(localMap);
        }
      }
    }
  }
  
  private void b(String paramString)
  {
    Iterator localIterator = jdField_a_of_type_JavaUtilArrayList.iterator();
    Map localMap;
    while (localIterator.hasNext())
    {
      localMap = (Map)localIterator.next();
      if (localMap != null)
      {
        String str = (String)localMap.get("KEY");
        if ((str != null) && (str.equals(paramString))) {
          if (!localMap.containsKey("TIME")) {
            break label176;
          }
        }
      }
    }
    label176:
    for (int k = ((Integer)localMap.get("TIME")).intValue();; k = 0)
    {
      if (k >= 3) {
        localIterator.remove();
      }
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d("LebaHelper", 2, "Download failed icon key = " + paramString + ",time=" + k);
        }
        return;
        k += 1;
        localMap.put("TIME", Integer.valueOf(k));
        localMap.put("LOADING", Boolean.valueOf(false));
      }
    }
  }
  
  private void e()
  {
    if ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface == null) || (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.isLogin())) {}
    SharedPreferences localSharedPreferences;
    do
    {
      return;
      localSharedPreferences = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences("mobileQQ", 0);
    } while (!localSharedPreferences.getBoolean("lebaplugin_clear_local" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), true));
    if (QLog.isDevelopLevel()) {
      QLog.d("LebaHelper", 4, "clearLocalDBPlugin.local plugin.");
    }
    localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    try
    {
      List localList = ResourcePluginInfo.getAll((EntityManager)localObject1, 64, false);
      if (localList != null)
      {
        int k = 0;
        while (k < localList.size())
        {
          ResourcePluginInfo localResourcePluginInfo = (ResourcePluginInfo)localList.get(k);
          if ((localResourcePluginInfo != null) && (cDataType == 1) && (iPluginType == 64)) {
            ResourcePluginInfo.remove((EntityManager)localObject1, strPkgName);
          }
          k += 1;
        }
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
        ((EntityManager)localObject1).a();
      }
    }
    finally
    {
      ((EntityManager)localObject1).a();
    }
    localObject1 = localSharedPreferences.edit();
    ((SharedPreferences.Editor)localObject1).putBoolean("lebaplugin_clear_local" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), false);
    ((SharedPreferences.Editor)localObject1).commit();
  }
  
  private void f()
  {
    ResourcePluginInfo localResourcePluginInfo = new ResourcePluginInfo();
    strPkgName = "qzone_feedlist";
    strResName = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131367898);
    strResURL = "qq_leba_list_seek_feeds";
    sResSubType = 2;
    cCanChangeState = 0;
    cDefaultState = 0;
    cLocalState = 1;
    cDataType = 1;
    isNew = 1;
    sLanType = 1;
    uiResId = 0L;
    strGotoUrl = String.format("mqqapi://app/action?src_type=app&version=1&plg_sid=1&plg_ha3=1&plg_nickname=1&plg_newflag=1&plg_launchtime=1&pkg=com.tencent.mobileqq&cmp=com.qzone.feed.ui.activity.QZoneFriendFeedActivity&isFromQQ=true&qzone_uin=%s&page=%s", new Object[] { jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), "tab_qzone" });
    iPluginType = 64;
    sPriority = 860;
    b.add(localResourcePluginInfo);
    localResourcePluginInfo = new ResourcePluginInfo();
    strPkgName = "nearby_friends";
    strResName = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131367887);
    strResURL = "qq_leba_list_seek_neighbour";
    strResDesc = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131369072);
    sResSubType = 2;
    cCanChangeState = 1;
    cDefaultState = 0;
    cLocalState = 1;
    cDataType = 1;
    isNew = 1;
    sLanType = 1;
    uiResId = 0L;
    strGotoUrl = "mqqapi://app/action?src_type=app&version=1&pkg=com.tencent.mobileqq&cmp=com.tencent.mobileqq.activity.NearPeopleActivity";
    iPluginType = 64;
    sPriority = 270;
    b.add(localResourcePluginInfo);
    localResourcePluginInfo = new ResourcePluginInfo();
    strPkgName = "com.tx.xingqubuluo.android";
    strResName = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131367907);
    strResURL = "qb_leba_xingqu_buluo";
    strResDesc = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131367907);
    sResSubType = 2;
    cCanChangeState = 1;
    cDefaultState = 0;
    cLocalState = 1;
    cDataType = 1;
    isNew = 1;
    sLanType = 1;
    uiResId = 826L;
    strGotoUrl = "mqqapi://forward/url?src_type=internal&plg_auth=1&version=1&style=home&url_prefix=aHR0cDovL2J1bHVvLnFxLmNvbS9tb2JpbGUvaW5kZXguaHRtbD9fd3Y9MTAyNyZfYmlkPTEyOCNmcm9tPWRvbmd0YWkmdGFyZ2V0PWhvdA==";
    iPluginType = 64;
    sPriority = 0;
    b.add(localResourcePluginInfo);
  }
  
  /* Error */
  private void g()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 69	com/tencent/mobileqq/app/LebaHelper:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   4: ifnull +13 -> 17
    //   7: aload_0
    //   8: getfield 69	com/tencent/mobileqq/app/LebaHelper:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   11: invokevirtual 232	com/tencent/mobileqq/app/QQAppInterface:isLogin	()Z
    //   14: ifne +19 -> 33
    //   17: invokestatic 139	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   20: ifeq +12 -> 32
    //   23: ldc 25
    //   25: iconst_2
    //   26: ldc_w 382
    //   29: invokestatic 154	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   32: return
    //   33: aload_0
    //   34: getfield 78	com/tencent/mobileqq/app/LebaHelper:b	Ljava/util/List;
    //   37: astore 4
    //   39: aload 4
    //   41: monitorenter
    //   42: aload_0
    //   43: getfield 78	com/tencent/mobileqq/app/LebaHelper:b	Ljava/util/List;
    //   46: invokeinterface 385 1 0
    //   51: aload 4
    //   53: monitorexit
    //   54: aload_0
    //   55: invokespecial 387	com/tencent/mobileqq/app/LebaHelper:f	()V
    //   58: aload_0
    //   59: invokespecial 389	com/tencent/mobileqq/app/LebaHelper:h	()V
    //   62: aload_0
    //   63: getfield 56	com/tencent/mobileqq/app/LebaHelper:jdField_a_of_type_ArrayOfByte	[B
    //   66: astore 6
    //   68: aload 6
    //   70: monitorenter
    //   71: aload_0
    //   72: getfield 76	com/tencent/mobileqq/app/LebaHelper:jdField_a_of_type_JavaUtilList	Ljava/util/List;
    //   75: invokeinterface 385 1 0
    //   80: aload_0
    //   81: getfield 76	com/tencent/mobileqq/app/LebaHelper:jdField_a_of_type_JavaUtilList	Ljava/util/List;
    //   84: aload_0
    //   85: getfield 78	com/tencent/mobileqq/app/LebaHelper:b	Ljava/util/List;
    //   88: invokeinterface 393 2 0
    //   93: pop
    //   94: aload_0
    //   95: getfield 76	com/tencent/mobileqq/app/LebaHelper:jdField_a_of_type_JavaUtilList	Ljava/util/List;
    //   98: invokeinterface 278 1 0
    //   103: ifle +119 -> 222
    //   106: iconst_0
    //   107: istore_1
    //   108: iload_1
    //   109: aload_0
    //   110: getfield 76	com/tencent/mobileqq/app/LebaHelper:jdField_a_of_type_JavaUtilList	Ljava/util/List;
    //   113: invokeinterface 278 1 0
    //   118: if_icmpge +104 -> 222
    //   121: aload_0
    //   122: getfield 76	com/tencent/mobileqq/app/LebaHelper:jdField_a_of_type_JavaUtilList	Ljava/util/List;
    //   125: iload_1
    //   126: invokeinterface 281 2 0
    //   131: checkcast 269	com/tencent/mobileqq/data/ResourcePluginInfo
    //   134: astore 4
    //   136: aload 4
    //   138: ifnull +17 -> 155
    //   141: aload 4
    //   143: getfield 351	com/tencent/mobileqq/data/ResourcePluginInfo:uiResId	J
    //   146: lstore_2
    //   147: lload_2
    //   148: ldc2_w 394
    //   151: lcmp
    //   152: ifeq +28 -> 180
    //   155: iload_1
    //   156: iconst_1
    //   157: iadd
    //   158: istore_1
    //   159: goto -51 -> 108
    //   162: astore 5
    //   164: aload 4
    //   166: monitorexit
    //   167: aload 5
    //   169: athrow
    //   170: astore 4
    //   172: aload 4
    //   174: invokevirtual 314	java/lang/Exception:printStackTrace	()V
    //   177: goto -119 -> 58
    //   180: aload 4
    //   182: getfield 323	com/tencent/mobileqq/data/ResourcePluginInfo:strResName	Ljava/lang/String;
    //   185: astore 5
    //   187: aload 5
    //   189: astore 4
    //   191: aload 5
    //   193: ifnonnull +8 -> 201
    //   196: ldc_w 397
    //   199: astore 4
    //   201: aload_0
    //   202: getfield 69	com/tencent/mobileqq/app/LebaHelper:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   205: invokevirtual 400	com/tencent/mobileqq/app/QQAppInterface:getAccount	()Ljava/lang/String;
    //   208: ldc_w 402
    //   211: aload 4
    //   213: invokestatic 407	com/tencent/mobileqq/nearby/NearbySPUtil:a	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Z
    //   216: pop
    //   217: goto -62 -> 155
    //   220: astore 4
    //   222: aload 6
    //   224: monitorexit
    //   225: return
    //   226: astore 4
    //   228: aload 6
    //   230: monitorexit
    //   231: aload 4
    //   233: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	234	0	this	LebaHelper
    //   107	52	1	k	int
    //   146	2	2	l	long
    //   37	128	4	localObject1	Object
    //   170	11	4	localException	Exception
    //   189	23	4	localObject2	Object
    //   220	1	4	localThrowable	Throwable
    //   226	6	4	localObject3	Object
    //   162	6	5	localObject4	Object
    //   185	7	5	str	String
    // Exception table:
    //   from	to	target	type
    //   42	54	162	finally
    //   164	167	162	finally
    //   54	58	170	java/lang/Exception
    //   94	106	220	java/lang/Throwable
    //   108	136	220	java/lang/Throwable
    //   141	147	220	java/lang/Throwable
    //   180	187	220	java/lang/Throwable
    //   201	217	220	java/lang/Throwable
    //   71	94	226	finally
    //   94	106	226	finally
    //   108	136	226	finally
    //   141	147	226	finally
    //   180	187	226	finally
    //   201	217	226	finally
    //   222	225	226	finally
    //   228	231	226	finally
  }
  
  private void h()
  {
    if (QLog.isColorLevel()) {
      QLog.d("LebaHelper", 2, "loadServerPlugins");
    }
    Object localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    List localList = ResourcePluginInfo.getAll((EntityManager)localObject2, 64, false);
    ((EntityManager)localObject2).a();
    int k;
    ResourcePluginInfo localResourcePluginInfo1;
    int m;
    if ((localList != null) && (localList.size() > 0))
    {
      k = 0;
      if (k < localList.size())
      {
        localResourcePluginInfo1 = (ResourcePluginInfo)localList.get(k);
        if ((localResourcePluginInfo1 == null) || (strPkgName == null)) {
          break label266;
        }
        if ((strGotoUrl != null) && (!TextUtils.isEmpty(strGotoUrl))) {
          strGotoUrl = strGotoUrl.replace("com.qqreader.QRBridgeActivity", "cooperation.qqreader.QRBridgeActivity");
        }
        localObject2 = b;
        m = 0;
      }
    }
    for (;;)
    {
      try
      {
        if (m >= b.size()) {
          break label261;
        }
        ResourcePluginInfo localResourcePluginInfo2 = (ResourcePluginInfo)b.get(m);
        if ((localResourcePluginInfo2 == null) || (strPkgName == null) || (strPkgName.compareTo(strPkgName) != 0)) {
          break label273;
        }
        m = 1;
        if (m == 0)
        {
          b.add(localResourcePluginInfo1);
          if (QLog.isColorLevel()) {
            QLog.d("LebaHelper", 2, "addItem=" + localResourcePluginInfo1);
          }
        }
      }
      finally {}
      return;
      label261:
      m = 0;
      continue;
      label266:
      k += 1;
      break;
      label273:
      m += 1;
    }
  }
  
  private void i()
  {
    Iterator localIterator = new ArrayList(c).iterator();
    while (localIterator.hasNext()) {
      ResourcePluginListener.a((ResourcePluginListener)localIterator.next(), (byte)5, 1);
    }
  }
  
  public ResourcePluginInfo a(int paramInt)
  {
    Object localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    List localList = ResourcePluginInfo.getAll((EntityManager)localObject, 64, false);
    ((EntityManager)localObject).a();
    if ((localList != null) && (localList.size() > 0))
    {
      int k = 0;
      while (k < localList.size())
      {
        localObject = (ResourcePluginInfo)localList.get(k);
        if (uiResId == paramInt) {
          return localObject;
        }
        k += 1;
      }
    }
    return null;
  }
  
  public List a()
  {
    return jdField_a_of_type_JavaUtilList;
  }
  
  public void a()
  {
    if (QLog.isColorLevel()) {
      QLog.d("LebaHelper", 2, "LebaHelper  init");
    }
    a(new mzc(this));
  }
  
  public void a(PluginConfigProxy paramPluginConfigProxy)
  {
    if (QLog.isColorLevel()) {
      QLog.i("LebaHelper", 2, "send to get leba config");
    }
    ArrayList localArrayList = new ArrayList();
    byte[] arrayOfByte = jdField_a_of_type_ArrayOfByte;
    int k = 0;
    for (;;)
    {
      try
      {
        if (k < jdField_a_of_type_JavaUtilList.size())
        {
          ResourcePluginInfo localResourcePluginInfo = (ResourcePluginInfo)jdField_a_of_type_JavaUtilList.get(k);
          if (cDataType == 0)
          {
            GetResourceReqInfoV2 localGetResourceReqInfoV2 = new GetResourceReqInfoV2();
            cState = 0;
            sLanType = sLanType;
            sResSubType = 0;
            strPkgName = strPkgName;
            uiCurVer = uiCurVer;
            uiResId = uiResId;
            localArrayList.add(localGetResourceReqInfoV2);
          }
        }
        else
        {
          HotChatManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, false);
          if (QLog.isColorLevel()) {
            QLog.d("LebaHelper", 2, "on Get Leba start send: " + localArrayList.size());
          }
          paramPluginConfigProxy.a(64, localArrayList, jdField_a_of_type_MqqObserverServerConfigObserver);
          return;
        }
      }
      finally {}
      k += 1;
    }
  }
  
  public void a(DownloadIconsListener paramDownloadIconsListener)
  {
    synchronized (d)
    {
      if (!d.contains(paramDownloadIconsListener)) {
        d.add(paramDownloadIconsListener);
      }
      return;
    }
  }
  
  public void a(ResourcePluginListener paramResourcePluginListener)
  {
    synchronized (c)
    {
      if (!c.contains(paramResourcePluginListener)) {
        c.add(paramResourcePluginListener);
      }
      return;
    }
  }
  
  public void a(String paramString, URL paramURL, File paramFile)
  {
    if (QLog.isColorLevel()) {
      QLog.i("LebaHelper", 2, "Download icon for " + paramString);
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(new mzd(this, paramURL, paramFile, paramString));
  }
  
  public void a(List paramList)
  {
    if (paramList == null) {}
    for (;;)
    {
      return;
      jdField_a_of_type_JavaUtilArrayList.clear();
      jdField_a_of_type_JavaUtilArrayList.addAll(paramList);
      if (QLog.isColorLevel()) {
        QLog.i("LebaHelper", 2, "Download " + paramList.size() + " icons");
      }
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        Map localMap = (Map)localIterator.next();
        String str = (String)localMap.get("KEY");
        paramList = (URL)localMap.get("URL");
        Object localObject = MsfSdkUtils.insertMtype("Dynamic", paramList.toString());
        try
        {
          localObject = new URL((String)localObject);
          paramList = (List)localObject;
        }
        catch (MalformedURLException localMalformedURLException)
        {
          for (;;)
          {
            QLog.d("LebaHelper", 1, "add mType failed. " + localMalformedURLException, localMalformedURLException);
          }
        }
        localObject = (File)localMap.get("FILE");
        if (jdField_a_of_type_JavaUtilSet.add(str))
        {
          a(str, paramList, (File)localObject);
          if (QLog.isColorLevel()) {
            QLog.d("LebaHelper", 2, "Download icon key = " + str);
          }
          localMap.put("LOADING", Boolean.valueOf(true));
        }
      }
    }
  }
  
  public void b()
  {
    if ((jdField_a_of_type_Boolean) && (jdField_a_of_type_Int < 3))
    {
      jdField_a_of_type_Boolean = false;
      PluginConfigProxy localPluginConfigProxy = new PluginConfigProxy();
      a(localPluginConfigProxy);
      localPluginConfigProxy.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      jdField_a_of_type_Int += 1;
    }
  }
  
  public void b(DownloadIconsListener paramDownloadIconsListener)
  {
    synchronized (d)
    {
      d.remove(paramDownloadIconsListener);
      return;
    }
  }
  
  public void b(ResourcePluginListener paramResourcePluginListener)
  {
    synchronized (c)
    {
      c.remove(paramResourcePluginListener);
      return;
    }
  }
  
  public void c()
  {
    synchronized (jdField_a_of_type_ArrayOfByte)
    {
      jdField_a_of_type_JavaUtilList.clear();
      return;
    }
  }
  
  public void d()
  {
    if ((jdField_a_of_type_JavaUtilArrayList == null) || (jdField_a_of_type_JavaUtilArrayList.size() <= 0)) {}
    for (;;)
    {
      return;
      Iterator localIterator = new ArrayList(jdField_a_of_type_JavaUtilArrayList).iterator();
      while (localIterator.hasNext())
      {
        Map localMap = (Map)localIterator.next();
        String str;
        Object localObject1;
        if (localMap != null)
        {
          str = (String)localMap.get("KEY");
          localObject1 = (URL)localMap.get("URL");
          localObject2 = MsfSdkUtils.insertMtype("Dynamic", ((URL)localObject1).toString());
        }
        try
        {
          localObject2 = new URL((String)localObject2);
          localObject1 = localObject2;
        }
        catch (MalformedURLException localMalformedURLException)
        {
          for (;;)
          {
            Object localObject3;
            QLog.d("LebaHelper", 1, "add mType failed. " + localMalformedURLException, localMalformedURLException);
            continue;
            boolean bool = false;
          }
        }
        Object localObject2 = (File)localMap.get("FILE");
        localObject3 = localMap.get("LOADING");
        if ((localObject3 == null) || (!(localObject3 instanceof Boolean))) {
          break label273;
        }
        bool = ((Boolean)localObject3).booleanValue();
        if ((!TextUtils.isEmpty(str)) && (!bool) && (jdField_a_of_type_JavaUtilSet.add(str)))
        {
          a(str, (URL)localObject1, (File)localObject2);
          localMap.put("LOADING", Boolean.valueOf(true));
          if (QLog.isColorLevel()) {
            QLog.d("LebaHelper", 2, "reDownload icon key = " + str);
          }
        }
      }
    }
  }
}
