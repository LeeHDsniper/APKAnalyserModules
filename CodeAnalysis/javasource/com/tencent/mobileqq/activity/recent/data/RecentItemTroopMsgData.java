package com.tencent.mobileqq.activity.recent.data;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import com.tencent.biz.anonymous.AnonymousChatHelper;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.recent.MsgSummary;
import com.tencent.mobileqq.activity.recent.TimeManager;
import com.tencent.mobileqq.activity.recent.msg.AbstructRecentUserMsg;
import com.tencent.mobileqq.activity.recent.msg.TroopAtAllMsg;
import com.tencent.mobileqq.activity.recent.msg.TroopNotificationMsg;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.proxy.RecentUserProxy;
import com.tencent.mobileqq.data.HotChatInfo;
import com.tencent.mobileqq.data.MessageForQQWalletMsg;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.hotchat.PttShowRoomMng;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.TroopInfoManager;
import com.tencent.mobileqq.nearby.HotChatUtil;
import com.tencent.mobileqq.nearby.NearbyUtils;
import com.tencent.mobileqq.troop.utils.TroopNotificationHelper;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.qphone.base.util.QLog;
import java.util.List;

public class RecentItemTroopMsgData
  extends RecentUserBaseData
{
  public static final String i = "[topic]";
  private static final String l = RecentItemTroopMsgData.class.getSimpleName();
  public long a;
  public boolean a;
  private boolean b;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public RecentItemTroopMsgData(RecentUser paramRecentUser)
  {
    super(paramRecentUser);
    jdField_a_of_type_Long = 5L;
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
  }
  
  public void a(QQAppInterface paramQQAppInterface)
  {
    super.a(paramQQAppInterface);
  }
  
  public void a(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    if ((paramQQAppInterface == null) || (paramContext == null)) {
      return;
    }
    super.a(paramQQAppInterface, paramContext);
    Object localObject3 = paramQQAppInterface.a();
    Object localObject1 = null;
    if (localObject3 != null)
    {
      localObject2 = ((QQMessageFacade)localObject3).a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type);
      localObject1 = localObject2;
      if (HotChatUtil.a(paramQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, false))
      {
        localObject3 = ((QQMessageFacade)localObject3).a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, 1026);
        if (localObject3 == null) {
          break label996;
        }
        if (QLog.isColorLevel())
        {
          long l1 = shmsgseq;
          long l2 = time;
          if (localObject2 != null) {
            break label983;
          }
          localObject1 = "msg is null";
          NearbyUtils.a("PttShow", new Object[] { "RecentItemTroopMsgData_update", "hcLastMsg", Long.valueOf(l1), Long.valueOf(l2), localObject1 });
        }
        if (localObject2 != null)
        {
          localObject1 = localObject2;
          if (time <= time) {}
        }
        else
        {
          if ((nickName == null) || (nickName.equals(senderuin)))
          {
            localObject1 = paramQQAppInterface.a(true).a(true);
            ((PttShowRoomMng)localObject1).a((MessageRecord)localObject3);
            nickName = ((PttShowRoomMng)localObject1).a(senderuin);
          }
          localObject1 = localObject3;
        }
      }
    }
    label244:
    if (localObject1 != null)
    {
      jdField_b_of_type_Long = time;
      localObject2 = paramQQAppInterface.a();
      if (localObject2 != null)
      {
        H = ((ConversationFacade)localObject2).a(frienduin, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type);
        if (HotChatUtil.a(paramQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, false))
        {
          j = ((ConversationFacade)localObject2).a(frienduin, 1026);
          if (QLog.isColorLevel()) {
            NearbyUtils.a("PttShow", new Object[] { "RecentItemTroopMsgData_update", "unread", Integer.valueOf(j), Integer.valueOf(H) });
          }
          H = (j + H);
        }
      }
    }
    TroopManager localTroopManager;
    label884:
    boolean bool;
    for (;;)
    {
      localTroopManager = (TroopManager)paramQQAppInterface.getManager(51);
      HotChatManager localHotChatManager = (HotChatManager)paramQQAppInterface.getManager(59);
      HotChatInfo localHotChatInfo = localHotChatManager.a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);
      if (localHotChatInfo == null) {
        break label1054;
      }
      G = 3;
      jdField_a_of_type_JavaLangString = name;
      localObject2 = null;
      MsgSummary localMsgSummary = a();
      a((QQMessageFacade.Message)localObject1, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type, paramQQAppInterface, paramContext, localMsgSummary);
      if ((localHotChatInfo == null) && (TextUtils.isEmpty(jdField_b_of_type_JavaLangCharSequence)) && (TextUtils.isEmpty(jdField_c_of_type_JavaLangCharSequence)))
      {
        localObject3 = localObject2;
        if (localObject2 == null) {
          localObject3 = "";
        }
        jdField_b_of_type_JavaLangCharSequence = ((CharSequence)localObject3);
      }
      a(paramQQAppInterface);
      a(paramQQAppInterface, localMsgSummary);
      a(paramQQAppInterface, paramContext, localMsgSummary);
      if ((jdField_a_of_type_Boolean) && (amsg == null))
      {
        if (QLog.isColorLevel()) {
          QLog.d(l + ".troop.special_msg.special_attention", 2, "msgSummary.bShowDraft && (null == getRecentUser().msg)");
        }
        jdField_c_of_type_JavaLangCharSequence = "";
      }
      if (!jdField_a_of_type_Boolean) {
        b(paramQQAppInterface, paramContext);
      }
      if (localHotChatManager.b(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin))
      {
        paramQQAppInterface = localHotChatManager.a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);
        if ((paramQQAppInterface != null) && (!TextUtils.isEmpty(memo)) && (!memoShowed))
        {
          jdField_c_of_type_JavaLangCharSequence = paramContext.getString(2131367486);
          K = paramContext.getResources().getColor(2131428234);
        }
      }
      if ((TextUtils.isEmpty(jdField_c_of_type_JavaLangCharSequence)) && (localObject1 != null) && (localMsgSummary != null) && (AnonymousChatHelper.a((MessageRecord)localObject1))) {
        jdField_b_of_type_JavaLangCharSequence = localMsgSummary.a(paramContext, paramContext.getResources().getString(2131364597), -1);
      }
      paramQQAppInterface = a();
      if ((paramQQAppInterface != null) && (msg == null)) {
        paramQQAppInterface.reParse();
      }
      TimeManager.a().a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, jdField_b_of_type_Long);
      if (localTroopManager != null)
      {
        paramQQAppInterface = localTroopManager.a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);
        if (paramQQAppInterface != null)
        {
          jdField_a_of_type_Long = troopCreditLevel;
          if (jdField_a_of_type_Long == 0L) {
            jdField_a_of_type_Long = 5L;
          }
          if (QLog.isColorLevel()) {
            QLog.i("troop.credit.act", 2, "RecentItemTroopMsgData->update," + jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin + "," + jdField_a_of_type_Long);
          }
        }
      }
      if (AppSetting.i)
      {
        paramQQAppInterface = new StringBuilder();
        paramQQAppInterface.append(jdField_a_of_type_JavaLangString).append(",");
        if (H != 0) {
          break label1231;
        }
        if (jdField_c_of_type_JavaLangCharSequence != null) {
          paramQQAppInterface.append(jdField_c_of_type_JavaLangCharSequence + ",");
        }
        paramQQAppInterface.append(jdField_b_of_type_JavaLangCharSequence).append(",").append(jdField_b_of_type_JavaLangString);
        jdField_c_of_type_JavaLangString = paramQQAppInterface.toString();
      }
      paramQQAppInterface = localTroopManager.a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);
      if ((paramQQAppInterface == null) || (!paramQQAppInterface.hasOrgs())) {
        break label1300;
      }
      bool = true;
      label976:
      jdField_b_of_type_Boolean = bool;
      return;
      label983:
      localObject1 = Long.valueOf(time);
      break;
      label996:
      localObject1 = localObject2;
      if (!QLog.isColorLevel()) {
        break label244;
      }
      NearbyUtils.a("PttShow", new Object[] { "RecentItemTroopMsgData_update", "no hc topic msg" });
      localObject1 = localObject2;
      break label244;
      H = 0;
      continue;
      jdField_b_of_type_Long = 0L;
      H = 0;
    }
    label1054:
    int j = M;
    Object localObject2 = null;
    if (localTroopManager != null) {
      localObject2 = localTroopManager.a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);
    }
    if (localObject2 != null)
    {
      localObject3 = troopname;
      localObject2 = troopmemo;
    }
    for (;;)
    {
      M = (j & 0xF0FF | 0x100);
      j = paramQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);
      if ((j == 1) || (jdField_a_of_type_Boolean))
      {
        G = 1;
        label1142:
        if (!TextUtils.isEmpty((CharSequence)localObject3)) {
          break label1222;
        }
      }
      label1222:
      for (jdField_a_of_type_JavaLangString = ContactUtils.a(paramQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, true);; jdField_a_of_type_JavaLangString = ((String)localObject3))
      {
        if ((localObject1 != null) && (TextUtils.isEmpty(nickName))) {
          nickName = senderuin;
        }
        d();
        break;
        if ((j != 2) && (j != 3) && (j != 4)) {
          break label1142;
        }
        G = 3;
        break label1142;
      }
      label1231:
      if (H == 1)
      {
        paramQQAppInterface.append("有一条未读");
        break label884;
      }
      if (H == 2)
      {
        paramQQAppInterface.append("有两条未读");
        break label884;
      }
      if (H <= 0) {
        break label884;
      }
      paramQQAppInterface.append("有").append(H).append("条未读,");
      break label884;
      label1300:
      bool = false;
      break label976;
      localObject2 = null;
      localObject3 = null;
    }
  }
  
  public void b(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    if (jdField_a_of_type_ComTencentMobileqqDataRecentUser == null) {}
    label422:
    label425:
    for (;;)
    {
      return;
      Object localObject1 = (TroopInfoManager)paramQQAppInterface.getManager(36);
      Object localObject2 = amsg;
      AbstructRecentUserMsg localAbstructRecentUserMsg;
      int j;
      if (localObject2 != null)
      {
        if (!(localObject2 instanceof AbstructRecentUserMsg)) {
          break label422;
        }
        localAbstructRecentUserMsg = (AbstructRecentUserMsg)localObject2;
        jdField_c_of_type_JavaLangCharSequence = jdField_a_of_type_JavaLangString;
        jdField_c_of_type_JavaLangString = jdField_b_of_type_JavaLangString;
        long l1 = ((TroopInfoManager)localObject1).b(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);
        localObject1 = null;
        if (l1 != 0L) {
          localObject1 = paramQQAppInterface.a().c(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type, l1);
        }
        if (MessageForQQWalletMsg.isRedPacketMsg((MessageRecord)localObject1))
        {
          jdField_c_of_type_JavaLangCharSequence = paramContext.getString(2131371660);
          jdField_c_of_type_JavaLangString = paramContext.getString(2131371660);
          j = 2131428234;
        }
      }
      for (;;)
      {
        if ((TextUtils.isEmpty(jdField_c_of_type_JavaLangCharSequence)) || (j <= 0)) {
          break label425;
        }
        K = paramContext.getResources().getColor(j);
        return;
        if ((localObject2 instanceof TroopAtAllMsg))
        {
          jdField_c_of_type_JavaLangString = String.format("与%s群的会话，有全体消息", new Object[] { jdField_a_of_type_JavaLangString });
          break;
        }
        if (!(amsg instanceof TroopNotificationMsg)) {
          break;
        }
        if (amsg).c == 1)
        {
          jdField_c_of_type_JavaLangCharSequence = paramContext.getString(2131367488);
          break;
        }
        if ((TroopNotificationHelper.b(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin)) || (TroopNotificationHelper.d(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin)))
        {
          jdField_c_of_type_JavaLangCharSequence = jdField_a_of_type_JavaLangString;
          break;
        }
        jdField_c_of_type_JavaLangCharSequence = "";
        break;
        jdField_c_of_type_JavaLangCharSequence = "";
        jdField_c_of_type_JavaLangString = "";
        j = ((TroopInfoManager)localObject1).b(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);
        if (QLog.isColorLevel()) {
          QLog.d(l, 2, "dealMsgAttention, navigateMsgType:" + j);
        }
        if (j == 9)
        {
          paramQQAppInterface = ((TroopInfoManager)localObject1).a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, 9);
          if ((paramQQAppInterface != null) && (paramQQAppInterface.size() != 0))
          {
            jdField_c_of_type_JavaLangCharSequence = paramContext.getString(2131367137);
            jdField_c_of_type_JavaLangString = jdField_c_of_type_JavaLangCharSequence.toString();
            j = 2131428234;
            continue;
          }
        }
        j = 0;
      }
    }
  }
  
  public boolean b()
  {
    return false;
  }
  
  public long c()
  {
    return jdField_a_of_type_Long;
  }
  
  public void c(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    MsgSummary localMsgSummary = new MsgSummary();
    RecentUserProxy localRecentUserProxy = paramQQAppInterface.a().a();
    if (localRecentUserProxy != null) {
      localRecentUserProxy.b(jdField_a_of_type_ComTencentMobileqqDataRecentUser);
    }
    jdField_b_of_type_JavaLangCharSequence = "正在加载热聊信息。。。";
    jdField_b_of_type_Long = jdField_a_of_type_ComTencentMobileqqDataRecentUser.lastmsgtime;
    a(paramQQAppInterface, paramContext, localMsgSummary);
  }
}
