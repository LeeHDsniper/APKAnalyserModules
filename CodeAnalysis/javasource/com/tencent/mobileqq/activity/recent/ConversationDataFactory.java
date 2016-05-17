package com.tencent.mobileqq.activity.recent;

import android.content.Context;
import android.text.TextUtils;
import com.tencent.mobileqq.activity.recent.data.RecentItemActivateFriendsData;
import com.tencent.mobileqq.activity.recent.data.RecentItemChatMsgData;
import com.tencent.mobileqq.activity.recent.data.RecentItemDiscussionMsgData;
import com.tencent.mobileqq.activity.recent.data.RecentItemEcShopAssitant;
import com.tencent.mobileqq.activity.recent.data.RecentItemMsgBox;
import com.tencent.mobileqq.activity.recent.data.RecentItemNewFriendMsgData;
import com.tencent.mobileqq.activity.recent.data.RecentItemPcDataLine;
import com.tencent.mobileqq.activity.recent.data.RecentItemQCallData;
import com.tencent.mobileqq.activity.recent.data.RecentItemRouterDataLine;
import com.tencent.mobileqq.activity.recent.data.RecentItemSubAccount;
import com.tencent.mobileqq.activity.recent.data.RecentItemTroopAssistant;
import com.tencent.mobileqq.activity.recent.data.RecentItemTroopBarAssitant;
import com.tencent.mobileqq.activity.recent.data.RecentItemTroopMsgData;
import com.tencent.mobileqq.activity.recent.data.RecentItemTroopNotification;
import com.tencent.mobileqq.activity.recent.data.RecentItemWifiHotSpot;
import com.tencent.mobileqq.activity.recent.data.RecentUserBaseData;
import com.tencent.mobileqq.activity.recent.data.SecMsgRecentItemData;
import com.tencent.mobileqq.activity.recent.data.SendBlessRecentItemData;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.TraceUtils;
import cooperation.dingdong.DingdongPluginRecentItem;
import java.util.List;

public class ConversationDataFactory
{
  public ConversationDataFactory()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public static RecentBaseData a(RecentUser paramRecentUser, QQAppInterface paramQQAppInterface, Context paramContext)
  {
    Object localObject3 = null;
    Object localObject1 = null;
    Object localObject2 = localObject1;
    if (paramRecentUser != null)
    {
      localObject2 = localObject1;
      if (paramQQAppInterface != null)
      {
        if (paramContext != null) {
          break label29;
        }
        localObject2 = localObject1;
      }
    }
    label29:
    do
    {
      return localObject2;
      if (!TextUtils.isEmpty(uin)) {
        break;
      }
      localObject2 = localObject1;
    } while (!QLog.isColorLevel());
    QLog.i("Q.recent", 2, "buildRecentItemData, uin is null, " + paramRecentUser);
    return null;
    switch (type)
    {
    default: 
      localObject1 = localObject3;
    }
    for (;;)
    {
      localObject2 = localObject1;
      if (localObject1 == null) {
        break;
      }
      ((RecentBaseData)localObject1).a(paramQQAppInterface, paramContext);
      localObject2 = localObject1;
      if (!QLog.isDevelopLevel()) {
        break;
      }
      return localObject1;
      localObject1 = new RecentItemTroopAssistant(paramRecentUser);
      continue;
      localObject1 = new RecentItemPcDataLine(paramRecentUser);
      continue;
      localObject1 = new RecentItemPcDataLine(paramRecentUser);
      continue;
      localObject1 = new RecentItemRouterDataLine(paramRecentUser);
      continue;
      localObject1 = new RecentItemSubAccount(paramRecentUser);
      continue;
      localObject1 = new RecentItemMsgBox(paramRecentUser);
      continue;
      localObject1 = new RecentItemChatMsgData(paramRecentUser);
      continue;
      localObject1 = localObject3;
      if ((msg instanceof String))
      {
        localObject1 = new RecentItemNewFriendMsgData(paramRecentUser);
        continue;
        localObject1 = new RecentItemTroopMsgData(paramRecentUser);
        continue;
        localObject1 = new RecentItemDiscussionMsgData(paramRecentUser);
        continue;
        localObject1 = new RecentItemTroopNotification(paramRecentUser);
        continue;
        localObject1 = new SecMsgRecentItemData(paramRecentUser);
        continue;
        localObject1 = new SendBlessRecentItemData(paramRecentUser);
        continue;
        localObject1 = new RecentItemTroopBarAssitant(paramRecentUser);
        continue;
        localObject1 = new RecentItemEcShopAssitant(paramRecentUser);
        continue;
        localObject1 = new RecentItemActivateFriendsData(paramRecentUser);
        continue;
        localObject1 = new RecentItemQCallData(paramRecentUser);
        continue;
        localObject1 = new DingdongPluginRecentItem(paramRecentUser);
        continue;
        localObject1 = new RecentItemWifiHotSpot(paramRecentUser);
      }
    }
  }
  
  public static void a(List paramList1, QQAppInterface paramQQAppInterface, Context paramContext, List paramList2, int paramInt)
  {
    if (paramList2 == null) {}
    int i;
    int j;
    do
    {
      return;
      String str;
      try
      {
        paramList2.clear();
        if (paramList1 == null) {
          break label222;
        }
        i = paramList1.size();
      }
      finally {}
    } while ((j >= paramInt) || (j >= i));
    RecentUser localRecentUser = (RecentUser)paramList1.get(j);
    if ((localRecentUser != null) && (type != 9503) && ((paramInt >= i) || (type != 7000)))
    {
      TraceUtils.a(uin);
      str = RecentDataListManager.a(uin, type);
      RecentBaseData localRecentBaseData = RecentDataListManager.a().a(str);
      if (localRecentBaseData == null)
      {
        localRecentBaseData = a(localRecentUser, paramQQAppInterface, paramContext);
        RecentDataListManager.a().a(localRecentBaseData, str);
      }
      for (;;)
      {
        if (localRecentBaseData != null) {
          paramList2.add(localRecentBaseData);
        }
        TraceUtils.a();
        break;
        if ((localRecentBaseData instanceof RecentUserBaseData)) {
          ((RecentUserBaseData)localRecentBaseData).a(localRecentUser);
        }
        localRecentBaseData.a(paramQQAppInterface, paramContext);
      }
    }
    for (;;)
    {
      j = 0;
      break;
      j += 1;
      break;
      label222:
      i = 0;
    }
  }
}
