package com.tencent.mobileqq.app.automator.step;

import android.content.SharedPreferences;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.LBSHandler;
import com.tencent.mobileqq.app.NewFriendManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.soso.SosoInterface;
import com.tencent.mobileqq.app.soso.SosoInterface.SosoLbsInfo;
import com.tencent.mobileqq.app.soso.SosoInterface.SosoLocation;
import com.tencent.mobileqq.data.Card;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.nearby.NearbySPUtil;
import com.tencent.mobileqq.nearpeople.NearbyRecommender.NearbyRecommenderUtils;
import com.tencent.qphone.base.util.QLog;
import mqq.app.MobileQQ;
import nhy;

public class GetNearbyRecommender
  extends AsyncStep
{
  private nhy a;
  
  public GetNearbyRecommender()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    Object localObject1 = ((FriendsManager)jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.getManager(50)).a(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a());
    long l6 = 0L;
    long l5 = 0L;
    int k = 0;
    int n = 0;
    long l3 = 0L;
    int m = 0;
    int j = 0;
    if (localObject1 == null)
    {
      if (jdField_a_of_type_Nhy == null) {
        jdField_a_of_type_Nhy = new nhy(this);
      }
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(jdField_a_of_type_Nhy, true);
      if (QLog.isColorLevel()) {
        QLog.d("QQInitHandler", 2, "GetNearbyRecommender doStep|RESULT_WAITING");
      }
      return 2;
    }
    int i1 = age;
    long l4 = l3;
    long l2;
    long l1;
    int i;
    Object localObject2;
    if (i1 >= 18)
    {
      k = 1;
      localObject1 = jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.getApplication().getSharedPreferences("sp_nearbyrecommender", 0);
      l2 = ((Long)NearbySPUtil.a(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.getAccount(), "nearby_enter_time", Long.valueOf(0L))).longValue();
      l1 = System.currentTimeMillis();
      if (l2 != 0L)
      {
        l4 = l3;
        if (86400L > Math.abs(l1 - l2) / 1000L) {}
      }
      else
      {
        j = 2;
        i = ((SharedPreferences)localObject1).getInt(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a() + "_" + "key_login_pull_interval", 86400);
        l3 = ((SharedPreferences)localObject1).getLong(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a() + "_" + "key_login_pull_time", 0L);
        if (l3 != 0L)
        {
          l4 = l3;
          k = i;
          l5 = l2;
          l6 = l1;
          if (i > Math.abs(l1 - l3) / 1000L) {
            break label748;
          }
        }
        m = 3;
        localObject1 = jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a();
        j = ((QQMessageFacade)localObject1).e();
        k = 0;
        if (((QQMessageFacade)localObject1).a().b(AppConstants.am, 4000)) {
          k = ((NewFriendManager)jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.getManager(33)).a();
        }
        n = ((QQMessageFacade)localObject1).i();
        j = j - k - n;
        if (QLog.isColorLevel()) {
          QLog.d("QQInitHandler", 2, "GetNearbyRecommender doStep|unreadnum|unReadMsgNum=" + j + ",newFriendUnread=" + k + ",paUnreaded=" + n);
        }
        k = m;
        m = j;
        l4 = l3;
        n = i;
        if (j <= 0)
        {
          m = 4;
          localObject2 = SosoInterface.a();
          if ((localObject2 != null) && (a != null) && (a.c != 0.0D))
          {
            localObject1 = localObject2;
            if (a.d != 0.0D) {}
          }
          else
          {
            SosoInterface.a(60000L, getClass().getSimpleName());
            localObject1 = SosoInterface.a();
          }
          if (localObject1 != null)
          {
            ((LBSHandler)jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(3)).a(0);
            m = 5;
            l4 = l3;
            l3 = l1;
            k = i;
            l1 = l4;
            i = m;
          }
        }
      }
    }
    for (;;)
    {
      if (QLog.isColorLevel())
      {
        localObject2 = new StringBuilder().append("GetNearbyRecommender doStep|age=").append(i1).append(",currentTime=").append(l3).append(",enter_nearby_time=").append(l2).append(",login_pull_interval=").append(k).append(",login_pull_time=").append(l1).append(",unReadMsgNum=").append(j).append(",lbsInfo=");
        if (localObject1 == null) {
          break label700;
        }
      }
      label700:
      for (boolean bool = true;; bool = false)
      {
        QLog.d("QQInitHandler", 2, bool + ",step=" + i);
        return 7;
      }
      k = i;
      l4 = l1;
      i = m;
      l1 = l3;
      l3 = l4;
      continue;
      i = k;
      localObject1 = null;
      j = m;
      k = n;
      l3 = l1;
      l1 = l4;
      continue;
      label748:
      localObject1 = null;
      m = 0;
      l1 = l4;
      l2 = l5;
      l3 = l6;
      i = j;
      j = m;
    }
  }
  
  public void a()
  {
    NearbyRecommenderUtils.a(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b);
    i = 1;
  }
  
  public void b()
  {
    if (jdField_a_of_type_Nhy != null)
    {
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.b(jdField_a_of_type_Nhy);
      jdField_a_of_type_Nhy = null;
    }
  }
}
