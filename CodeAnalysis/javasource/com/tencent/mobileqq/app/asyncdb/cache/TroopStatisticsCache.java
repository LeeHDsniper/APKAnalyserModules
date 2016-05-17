package com.tencent.mobileqq.app.asyncdb.cache;

import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.asyncdb.DBDelayManager;
import com.tencent.mobileqq.app.asyncdb.FullCache;
import com.tencent.mobileqq.data.TroopStatisticsInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.pic.PicPreDownloadUtils;
import com.tencent.mobileqq.pic.PreDownloadStrategyBeta;
import com.tencent.qphone.base.util.QLog;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

public class TroopStatisticsCache
  extends FullCache
{
  private static final String a = "Q.db.Cache.TroopStatisticsCache";
  
  public TroopStatisticsCache(QQAppInterface paramQQAppInterface, DBDelayManager paramDBDelayManager)
  {
    super(paramQQAppInterface, paramDBDelayManager, TroopStatisticsInfo.class);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    paramQQAppInterface = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    long l = System.currentTimeMillis();
    if (l - PicPreDownloadUtils.a(PreDownloadStrategyBeta.i, 0L) > 604800000L) {}
    for (;;)
    {
      try
      {
        PicPreDownloadUtils.a(PreDownloadStrategyBeta.i, l);
        paramQQAppInterface.a(TroopStatisticsInfo.class);
        jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
        if (QLog.isColorLevel()) {
          QLog.d("Q.db.Cache.TroopStatisticsCache", 2, "doInit record time over 7 days, drop table");
        }
        return;
        paramDBDelayManager = paramQQAppInterface.a(TroopStatisticsInfo.class);
        if (paramDBDelayManager != null)
        {
          jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
          localObject = paramDBDelayManager.iterator();
          if (((Iterator)localObject).hasNext())
          {
            TroopStatisticsInfo localTroopStatisticsInfo = (TroopStatisticsInfo)((Iterator)localObject).next();
            jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(a(localTroopStatisticsInfo), localTroopStatisticsInfo);
            continue;
          }
        }
      }
      catch (Exception paramDBDelayManager)
      {
        if (QLog.isColorLevel()) {
          QLog.e("Q.db.Cache.TroopStatisticsCache", 2, paramDBDelayManager.getMessage());
        }
        return;
        if (!QLog.isColorLevel()) {
          continue;
        }
        Object localObject = new StringBuilder().append("doInit size = ");
        if (paramDBDelayManager == null)
        {
          i = 0;
          QLog.d("Q.db.Cache.TroopStatisticsCache", 2, i);
          continue;
        }
      }
      finally
      {
        paramQQAppInterface.a();
      }
      int i = paramDBDelayManager.size();
    }
  }
  
  public TroopStatisticsInfo a(String paramString)
  {
    if (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap == null) {
      return null;
    }
    return (TroopStatisticsInfo)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString);
  }
  
  protected String a(Entity paramEntity)
  {
    return troopUin;
  }
  
  protected void a() {}
  
  protected void b() {}
}
