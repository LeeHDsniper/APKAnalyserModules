package com.tencent.mobileqq.app.asyncdb.cache;

import android.content.SharedPreferences;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.asyncdb.DBDelayManager;
import com.tencent.mobileqq.app.asyncdb.FullCache;
import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.app.message.MsgProxyUtils;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import mqq.app.MobileQQ;
import ngz;
import nha;
import nhb;
import nhc;

public class RecentUserCache
  extends FullCache
{
  private static final int jdField_a_of_type_Int = 99;
  private static final String jdField_a_of_type_JavaLangString = "Q.db.Cache.RecentUserCache";
  public static final boolean a = true;
  private static final int jdField_b_of_type_Int = 90;
  private static final String jdField_b_of_type_JavaLangString = "check_newfriend_when_upgrade";
  private static final String c = "new_friend_upgrade_pref";
  private static final String d = "pubaccount_assistant_upgrade_pref";
  private static final String e = "check_pubaccountassistant_when_upgrade";
  Comparator jdField_a_of_type_JavaUtilComparator;
  protected ConcurrentHashMap b;
  
  public RecentUserCache(QQAppInterface paramQQAppInterface, DBDelayManager paramDBDelayManager)
  {
    super(paramQQAppInterface, paramDBDelayManager, RecentUser.class);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    b = new ConcurrentHashMap();
    jdField_a_of_type_JavaUtilComparator = new nha(this);
    jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap = new RecentUserCache.CacheMap(this, null);
    d();
  }
  
  private RecentUser a(RecentUser paramRecentUser)
  {
    if (troopUin == null) {
      troopUin = "";
    }
    if (displayName == null) {
      displayName = "";
    }
    return paramRecentUser;
  }
  
  private final String a(String paramString)
  {
    String str;
    if (paramString == null) {
      str = "";
    }
    do
    {
      return str;
      str = paramString;
    } while (paramString.length() <= 4);
    return paramString.substring(0, 4);
  }
  
  private String a(String paramString, int paramInt)
  {
    return paramString + "&" + paramInt;
  }
  
  private void a(List paramList)
  {
    Iterator localIterator = paramList.iterator();
    Object localObject3 = null;
    Object localObject2 = null;
    Object localObject1 = null;
    while (localIterator.hasNext())
    {
      RecentUser localRecentUser = (RecentUser)localIterator.next();
      if (localRecentUser != null) {
        if ((localObject1 == null) && (AppConstants.ap.equals(uin)))
        {
          localObject1 = localRecentUser;
        }
        else if ((localObject2 == null) && ((AppConstants.am.equals(uin)) || (4000 == type)))
        {
          if ((msg == null) && (msgData != null)) {
            localRecentUser.doParse();
          }
          if ((msg != null) && (!(msg instanceof String))) {
            localObject2 = localRecentUser;
          }
        }
        else if ((localObject3 == null) && (AppConstants.az.equals(uin)))
        {
          localObject3 = localRecentUser;
        }
      }
    }
    if (localObject1 != null) {
      paramList.remove(localObject1);
    }
    if (localObject3 != null) {
      paramList.remove(localObject3);
    }
    if (localObject2 != null)
    {
      paramList.remove(localObject2);
      long l = localObject2.getId();
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(new ngz(this, l));
    }
  }
  
  private void e()
  {
    SharedPreferences localSharedPreferences = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getSharedPreferences("new_friend_upgrade_pref" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), 0);
    if (localSharedPreferences.getBoolean("check_newfriend_when_upgrade", true))
    {
      if (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap != null) {
        break label71;
      }
      if (QLog.isColorLevel()) {
        QLog.d("Q.db.Cache.RecentUserCache", 2, "checkNewFriendUpgrade | descRecentList == null");
      }
    }
    return;
    label71:
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(new nhb(this, localSharedPreferences));
  }
  
  private void f()
  {
    SharedPreferences localSharedPreferences = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getSharedPreferences("pubaccount_assistant_upgrade_pref" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), 0);
    if (localSharedPreferences.getBoolean("check_pubaccountassistant_when_upgrade", true))
    {
      if (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap != null) {
        break label71;
      }
      if (QLog.isColorLevel()) {
        QLog.d("Q.db.Cache.RecentUserCache", 2, "checkPubAccountAssistant | descRecentList == null");
      }
    }
    return;
    label71:
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(new nhc(this, localSharedPreferences));
  }
  
  public RecentUser a(String paramString, int paramInt)
  {
    RecentUser localRecentUser = (RecentUser)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(a(paramString, paramInt));
    if (localRecentUser == null)
    {
      localRecentUser = new RecentUser();
      uin = paramString;
      type = paramInt;
      displayName = uin;
      localRecentUser.parse();
      a(localRecentUser);
      paramString = localRecentUser;
    }
    do
    {
      return paramString;
      paramString = localRecentUser;
    } while (msg != null);
    if (mIsParsed)
    {
      localRecentUser.reParse();
      return localRecentUser;
    }
    localRecentUser.parse();
    return localRecentUser;
  }
  
  public String a(Entity paramEntity)
  {
    paramEntity = (RecentUser)paramEntity;
    return uin + "&" + type;
  }
  
  public List a(boolean paramBoolean)
  {
    try
    {
      ArrayList localArrayList = new ArrayList(jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.size());
      Iterator localIterator = jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.entrySet().iterator();
      while (localIterator.hasNext())
      {
        RecentUser localRecentUser = (RecentUser)((Map.Entry)localIterator.next()).getValue();
        localRecentUser.parse();
        localArrayList.add(localRecentUser);
      }
      if (!paramBoolean) {
        return localException;
      }
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.e("Q.db.Cache.RecentUserCache", 2, "getCacheList is error!", localException);
      }
      return new ArrayList();
    }
    Collections.sort(localException, jdField_a_of_type_JavaUtilComparator);
    return localException;
  }
  
  protected void a() {}
  
  public void a(RecentUser paramRecentUser)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.db.Cache.RecentUserCache_At_Me_DISC", 2, "user: " + uin + " type " + type + " msgType " + msgType);
    }
    Object localObject = paramRecentUser;
    if (type != 1)
    {
      localObject = paramRecentUser;
      if (type != 3000)
      {
        localObject = paramRecentUser;
        if (type != 7000)
        {
          ArrayList localArrayList = new ArrayList();
          localObject = MsgProxyUtils.p;
          int j = localObject.length;
          int i = 0;
          while (i < j)
          {
            int k = localObject[i];
            if (k != type)
            {
              String str = a(uin, k);
              if (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(str)) {
                localArrayList.add(str);
              }
            }
            i += 1;
          }
          j = localArrayList.size();
          localObject = paramRecentUser;
          if (j > 0)
          {
            i = 0;
            if (i < j)
            {
              if (i == 0)
              {
                localObject = (RecentUser)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.remove(localArrayList.get(i));
                type = type;
                displayName = displayName;
                lastmsgtime = lastmsgtime;
                showUpTime = Math.max(showUpTime, showUpTime);
                troopUin = troopUin;
                lastmsgdrafttime = lastmsgdrafttime;
                msgData = msgData;
                msgType = msgType;
                lFlag = lFlag;
                jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.remove(localArrayList.get(i));
                paramRecentUser = (RecentUser)localObject;
              }
              for (;;)
              {
                i += 1;
                break;
                jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.remove(localArrayList.get(i));
                jdField_a_of_type_ComTencentMobileqqAppAsyncdbDBDelayManager.a((Entity)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(localArrayList.get(i)), 2, 0, null);
              }
            }
            localObject = paramRecentUser;
          }
        }
      }
    }
    a((RecentUser)localObject);
    a((Entity)localObject);
  }
  
  public void a(RecentUser paramRecentUser, boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.db.Cache.RecentUserCache", 2, "delRecentUser user: " + a(uin) + " type " + type + " msgType " + msgType);
    }
    if (paramBoolean) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(uin, type, 0);
    }
    c(paramRecentUser);
  }
  
  public void a(String paramString)
  {
    Object localObject = (ConcurrentHashMap)b.get(paramString);
    if ((localObject != null) && (!((ConcurrentHashMap)localObject).isEmpty()))
    {
      localObject = ((ConcurrentHashMap)localObject).keySet().iterator();
      while (((Iterator)localObject).hasNext())
      {
        String str = (String)((Iterator)localObject).next();
        try
        {
          if (QLog.isColorLevel()) {
            QLog.d("Q.db.Cache.RecentUserCache", 2, "findRecentUserByUin, uin:" + paramString + ",type:" + str);
          }
          int i = Integer.valueOf(str).intValue();
          if (i != 7000) {
            b(a(paramString, i));
          }
        }
        catch (Exception localException) {}
      }
    }
  }
  
  public boolean a(String paramString)
  {
    paramString = (ConcurrentHashMap)b.get(paramString);
    return (paramString != null) && (!paramString.isEmpty());
  }
  
  public boolean a(String paramString, int paramInt)
  {
    synchronized (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap)
    {
      return (RecentUser)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(a(paramString, paramInt)) != null;
    }
  }
  
  public RecentUser b(String paramString, int paramInt)
  {
    for (;;)
    {
      synchronized (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap)
      {
        paramString = (RecentUser)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(a(paramString, paramInt));
        if (paramString == null) {
          return null;
        }
        if (msg == null)
        {
          if (mIsParsed) {
            paramString.reParse();
          }
        }
        else {
          return paramString;
        }
      }
      paramString.parse();
    }
  }
  
  protected void b() {}
  
  public void b(RecentUser paramRecentUser)
  {
    a(paramRecentUser, true);
  }
  
  public boolean b(String paramString)
  {
    if (paramString == null) {
      return false;
    }
    paramString = (ConcurrentHashMap)b.get(paramString);
    if ((paramString != null) && (!paramString.isEmpty()) && ((!paramString.containsKey(String.valueOf(7000))) || (paramString.keySet().size() > 1))) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public void c()
  {
    jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
  }
  
  protected void d()
  {
    EntityManager localEntityManager = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    Object localObject1;
    if (PublicAccountUtil.c(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface)) {
      localObject1 = localEntityManager.a(RecentUser.class, false, "uin!=?", new String[] { AppConstants.aW }, null, null, "lastmsgtime desc", null);
    }
    Object localObject2;
    for (;;)
    {
      if (localObject1 == null)
      {
        localObject2 = RecentUser.class.getSimpleName();
        localObject1 = localEntityManager.a(RecentUser.class, (String)localObject2, false, null, null, null, null, "lastmsgtime desc", null);
        if (localObject1 != null)
        {
          Iterator localIterator = ((List)localObject1).iterator();
          for (;;)
          {
            if (localIterator.hasNext())
            {
              RecentUser localRecentUser = (RecentUser)localIterator.next();
              localRecentUser.setStatus(1000);
              localRecentUser.setId(-1L);
              a(localRecentUser, 2, null);
              continue;
              localObject1 = localEntityManager.a(RecentUser.class, false, null, null, null, null, "lastmsgtime desc", null);
              break;
            }
          }
          localEntityManager.a((String)localObject2);
        }
      }
    }
    label477:
    label484:
    for (;;)
    {
      localEntityManager.a();
      a((List)localObject1);
      Collections.sort((List)localObject1, jdField_a_of_type_JavaUtilComparator);
      localObject1 = ((List)localObject1).iterator();
      for (;;)
      {
        long l;
        if (((Iterator)localObject1).hasNext())
        {
          localObject2 = (RecentUser)((Iterator)localObject1).next();
          a((RecentUser)localObject2);
          jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(a((Entity)localObject2), localObject2);
          continue;
          localObject1 = new ArrayList(20);
          break;
          if (((List)localObject1).size() <= 99) {
            break label484;
          }
          l = System.currentTimeMillis();
        }
        try
        {
          localObject2 = new RecentUser().getTableName();
          bool = localEntityManager.b("delete from " + (String)localObject2 + " where max(lastmsgtime, lastmsgdrafttime) < " + Math.max(get90lastmsgtime, get90lastmsgdrafttime) + "; ");
          if (!bool) {
            break label477;
          }
          localObject2 = new ArrayList(((List)localObject1).subList(0, 90));
        }
        catch (Exception localException2)
        {
          for (;;)
          {
            boolean bool;
            continue;
            localObject2 = localObject1;
          }
        }
        localObject1 = localObject2;
        try
        {
          if (!QLog.isColorLevel()) {
            break;
          }
          QLog.d("Q.db.Cache.RecentUserCache", 2, "doInit int recentUserProxy delete recent table >99 isOk = " + bool + "; time = " + (System.currentTimeMillis() - l));
          localObject1 = localObject2;
        }
        catch (Exception localException1)
        {
          localObject1 = localObject2;
        }
        localException1.printStackTrace();
        break;
      }
      e();
      f();
      return;
    }
  }
}
