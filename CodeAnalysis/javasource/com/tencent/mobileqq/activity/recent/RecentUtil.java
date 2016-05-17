package com.tencent.mobileqq.activity.recent;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import com.dataline.activities.LiteActivity;
import com.tencent.biz.eqq.CrmUtils;
import com.tencent.biz.pubaccount.assistant.PubAccountAssistantManager;
import com.tencent.biz.pubaccount.ecshopassit.EcShopAssistantActivity;
import com.tencent.biz.pubaccount.ecshopassit.EcShopAssistantManager;
import com.tencent.biz.pubaccount.ecshopassit.EcShopData;
import com.tencent.biz.pubaccount.readinjoy.activity.ReadInJoyActivityHelper;
import com.tencent.biz.pubaccount.subscript.SubscriptFeedsActivity;
import com.tencent.biz.pubaccount.subscript.SubscriptRecommendController;
import com.tencent.biz.pubaccount.troopbarassit.TroopBarAssistantManager;
import com.tencent.biz.pubaccount.troopbarassit.TroopBarData;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.biz.webviewbase.WebViewJumpAction;
import com.tencent.device.devicemgr.SmartDeviceProxyMgr;
import com.tencent.device.utils.SmartDeviceReport;
import com.tencent.mobileqq.activity.ChatActivity;
import com.tencent.mobileqq.activity.ChatActivityFacade;
import com.tencent.mobileqq.activity.ProfileActivity.AllInOne;
import com.tencent.mobileqq.activity.QQBroadcastActivity;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.TroopAssistantActivity;
import com.tencent.mobileqq.activity.VisitorsActivity;
import com.tencent.mobileqq.activity.activateFriend.ActivateFriendActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.XMLMessageUtils;
import com.tencent.mobileqq.activity.aio.item.PAWeatherItemBuilder;
import com.tencent.mobileqq.activity.bless.BlessActivity;
import com.tencent.mobileqq.activity.bless.BlessManager;
import com.tencent.mobileqq.activity.contact.newfriend.NewFriendActivity;
import com.tencent.mobileqq.activity.contact.troop.TroopActivity;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.NewFriendManager;
import com.tencent.mobileqq.app.PublicAccountDataManager;
import com.tencent.mobileqq.app.PublicAccountHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.RecommendTroopManagerImp;
import com.tencent.mobileqq.app.SecMsgManager;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.message.BaseMessageProcessor;
import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.app.message.MsgProxyUtils;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.app.message.SubAccountMessageProcessor;
import com.tencent.mobileqq.app.message.SystemMessageProcessor;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.proxy.RecentUserProxy;
import com.tencent.mobileqq.data.DraftSummaryInfo;
import com.tencent.mobileqq.data.HotChatInfo;
import com.tencent.mobileqq.data.MessageForQQWalletMsg;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.PAMessage;
import com.tencent.mobileqq.data.PubAccountAssistantData;
import com.tencent.mobileqq.data.PublicAccountInfo;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.data.TroopAssistantData;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.dating.MsgBoxListActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.managers.TroopAssistantManager;
import com.tencent.mobileqq.model.TroopInfoManager;
import com.tencent.mobileqq.nearby.HotChatUtil;
import com.tencent.mobileqq.nearby.profilecard.NearbyPeopleProfileActivity;
import com.tencent.mobileqq.nearpeople.NearbyRecommender.NearbyRecommenderUtils;
import com.tencent.mobileqq.pb.ByteStringMicro;
import com.tencent.mobileqq.pb.MessageMicro;
import com.tencent.mobileqq.pb.PBBytesField;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.structmsg.AbsStructMsg;
import com.tencent.mobileqq.subaccount.SubAccountAssistantForward;
import com.tencent.mobileqq.subaccount.datamanager.SubAccountManager;
import com.tencent.mobileqq.systemmsg.GroupSystemMsgController;
import com.tencent.mobileqq.systemmsg.SystemMsgController;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.HexUtil;
import com.tencent.mobileqq.utils.StartupTracker;
import com.tencent.qphone.base.util.QLog;
import cooperation.dingdong.DingdongPluginHelper;
import cooperation.dingdong.DingdongPluginManager;
import cooperation.qqhotspot.QQHotSpotAcitivtyHelper;
import cooperation.qqhotspot.QQHotSpotBridgeActivity;
import cooperation.qqhotspot.WifiConversationManager;
import cooperation.qqhotspot.WifiNetworkUtil;
import cooperation.qqhotspot.hotspotnode.HotSpotNodeUtil;
import cooperation.secmsg.SecMsgHelper;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import mhl;
import mhm;
import mhn;
import mho;
import msf.msgsvc.msg_svc.PbC2CReadedReportReq;
import msf.msgsvc.msg_svc.PbC2CReadedReportReq.UinPairReadInfo;
import msf.msgsvc.msg_svc.PbDiscussReadedReportReq;
import msf.msgsvc.msg_svc.PbGroupReadedReportReq;
import msf.msgsvc.msg_svc.PbMsgReadedReportReq;
import org.json.JSONObject;

public final class RecentUtil
{
  public static final int a = 0;
  public static long a = 0L;
  public static MessageRecord a;
  public static boolean a = false;
  public static final int b = 1;
  public static boolean b = false;
  public static final int c = 2;
  public static final int d = 4;
  public static final int e = 0;
  public static final int f = 1;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqDataMessageRecord = null;
    jdField_a_of_type_Long = 0L;
  }
  
  public RecentUtil() {}
  
  public static int a(Activity paramActivity, QQAppInterface paramQQAppInterface, RecentUser paramRecentUser, String paramString, boolean paramBoolean)
  {
    return a(paramActivity, paramQQAppInterface, paramRecentUser, paramString, paramBoolean, 0, -1);
  }
  
  public static int a(Activity paramActivity, QQAppInterface paramQQAppInterface, RecentUser paramRecentUser, String paramString, boolean paramBoolean, int paramInt1, int paramInt2)
  {
    int m = 0;
    int i = 0;
    int j = 0;
    int k = 0;
    if ((paramRecentUser == null) || (paramActivity == null) || (paramQQAppInterface == null))
    {
      paramInt2 = k;
      if (QLog.isDevelopLevel())
      {
        QLog.i("Q.recent", 4, "onRecentUserClick|[" + paramRecentUser + "," + paramActivity + "," + paramQQAppInterface + "]");
        paramInt2 = k;
      }
    }
    label321:
    label350:
    do
    {
      do
      {
        return paramInt2;
        if (QLog.isDevelopLevel()) {
          QLog.i("Q.recent", 4, "onRecentUserClick|[" + uin + "," + type + "]");
        }
        boolean bool = false;
        if (((uin != null) && (uin.length() == 4)) || (AppConstants.ar.equals(uin)) || (TextUtils.equals(uin, AppConstants.aX))) {
          bool = a(paramQQAppInterface, paramActivity, paramRecentUser, paramInt1, paramInt2);
        }
        paramInt1 = m;
        if (!bool)
        {
          if (type != 8999) {
            break;
          }
          paramInt1 = m;
        }
        if (msgType != 8) {
          break label1062;
        }
        paramActivity = (TroopInfoManager)paramQQAppInterface.getManager(36);
        long l = 0L;
        if (uin != null) {
          l = paramActivity.b(uin);
        }
        paramActivity = null;
        if (l != 0L) {
          paramActivity = paramQQAppInterface.a().c(uin, type, l);
        }
        if (!MessageForQQWalletMsg.isRedPacketMsg(paramActivity)) {
          break label1033;
        }
        ReportController.b(paramQQAppInterface, "P_CliOper", "Grp_msg", "", "Msglist", "Clk_hongbaoSign", 0, 0, uin, "", "", "");
        ReportController.b(paramQQAppInterface, "P_CliOper", "Grp_msg", "", "Msglist", "Clk_sfsign", 0, 0, uin, "", "", "");
        paramActivity = ".troop.special_msg.special_attention";
        paramInt2 = paramInt1;
      } while (TextUtils.isEmpty(paramActivity));
      paramInt2 = paramInt1;
    } while (!QLog.isColorLevel());
    QLog.d(RecentUtil.class.getSimpleName() + paramActivity, 2, "onRecentUserClick, r.uin:" + uin);
    return paramInt1;
    if (type == 7000)
    {
      if (QLog.isColorLevel()) {
        QLog.d("SUB_ACCOUNT", 2, "RecentUtil.onRecentUserClick. r.uin=" + uin + " r.type=" + type);
      }
      SubAccountAssistantForward.a(paramQQAppInterface, paramActivity, uin);
      paramQQAppInterface.a().c(uin, type);
      if (AppConstants.ag.equals(uin)) {}
      for (paramActivity = null;; paramActivity = uin)
      {
        ReportController.b(paramQQAppInterface, "CliOper", "", paramActivity, "Bind_account", "Clk_bind_account", 0, 0, "", "", "", "");
        paramInt1 = m;
        break;
      }
    }
    if ((type == 1000) || (type == 1020) || (type == 1004)) {
      if (a(paramQQAppInterface, uin))
      {
        type = 0;
        if (!paramBoolean) {
          break label1176;
        }
      }
    }
    label1033:
    label1062:
    label1176:
    for (paramInt1 = 2;; paramInt1 = 0)
    {
      paramInt2 = paramInt1 | a(paramActivity, paramQQAppInterface, String.valueOf(uin), type, paramString);
      paramInt1 = paramInt2;
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.i("Q.recent", 2, "from_enterchat");
      paramInt1 = paramInt2;
      break;
      Object localObject;
      if ((troopUin == null) || (troopUin.trim().length() == 0))
      {
        localObject = paramQQAppInterface.a().a().b(uin, 1);
        if (localObject != null) {
          troopUin = troopUin;
        }
      }
      a(paramActivity, uin, troopUin, type, paramString);
      paramInt1 = m;
      break;
      if ((type == 1005) || (type == 1023))
      {
        paramInt1 = i;
        if (a(paramQQAppInterface, uin))
        {
          type = 0;
          paramInt1 = i;
          if (paramBoolean) {
            paramInt1 = 2;
          }
        }
        paramInt1 |= a(paramActivity, paramQQAppInterface, uin, type, paramString);
        break;
      }
      if (type == 1024)
      {
        paramInt1 = 0x0 | a(paramActivity, paramQQAppInterface, uin, type, paramString);
        break;
      }
      if (type == 6002)
      {
        paramString = (SmartDeviceProxyMgr)paramQQAppInterface.a(51);
        paramString.a(paramActivity, paramString.a(Long.parseLong(uin)), false);
        paramInt1 = m;
        break;
      }
      if ((type == 1) && ((lFlag & 1L) != 0L))
      {
        localObject = paramQQAppInterface.a(true);
        if ((localObject != null) && (!((HotChatManager)localObject).b(uin))) {
          return 4;
        }
      }
      if (a(paramQQAppInterface, uin))
      {
        paramInt1 = j;
        if (1 != type)
        {
          paramInt1 = j;
          if (3000 != type)
          {
            paramInt1 = j;
            if (type != 0)
            {
              type = 0;
              paramInt1 = j;
              if (paramBoolean) {
                paramInt1 = 2;
              }
            }
          }
        }
        paramInt1 |= a(paramActivity, paramQQAppInterface, uin, type, paramString);
        break;
      }
      paramInt1 = 0x0 | a(paramActivity, paramQQAppInterface, uin, type, paramString);
      break;
      ReportController.b(paramQQAppInterface, "P_CliOper", "Grp_msg", "", "Msglist", "Clk_sfsign", 0, 0, uin, "", "", "");
      break label321;
      if (msgType == 11)
      {
        ReportController.b(paramQQAppInterface, "P_CliOper", "Grp_msg", "", "Msglist", "Clk_atsign", 0, 0, uin, "", "", "");
        paramActivity = ".troop.special_msg.at_msg";
        break label350;
      }
      if (msgType == 10)
      {
        paramInt2 = paramQQAppInterface.b(uin);
        ReportController.b(paramQQAppInterface, "P_CliOper", "Grp_replyMsg", "", "Msglist", "Clk_replySign", 0, 0, uin, "" + paramInt2, "", "");
      }
      paramActivity = "";
      break label350;
    }
  }
  
  public static int a(Context paramContext, QQAppInterface paramQQAppInterface, String paramString1, int paramInt, String paramString2)
  {
    StartupTracker.a(null, "Recent_clk_enterchat");
    Intent localIntent;
    long l1;
    if (jdField_a_of_type_Boolean)
    {
      localIntent = new Intent(paramContext, ChatActivity.class);
      if (jdField_a_of_type_ComTencentMobileqqDataMessageRecord != null) {
        if ((jdField_a_of_type_ComTencentMobileqqDataMessageRecordistroop == 1) || (jdField_a_of_type_ComTencentMobileqqDataMessageRecordistroop == 3000))
        {
          l1 = jdField_a_of_type_ComTencentMobileqqDataMessageRecordshmsgseq;
          localIntent.putExtra("searched_timeorseq", l1);
        }
      }
    }
    label73:
    label526:
    label539:
    label710:
    label827:
    label850:
    for (;;)
    {
      int i;
      if (paramInt == 3000) {
        i = 0;
      }
      for (;;)
      {
        localIntent.putExtra("uin", paramString1);
        localIntent.putExtra("uintype", paramInt);
        localIntent.putExtra("uinname", paramString2);
        localIntent.putExtra("entrance", 1);
        a(localIntent);
        paramContext.startActivity(localIntent);
        StartupTracker.a("Recent_clk_enterchat", null);
        return i;
        l1 = jdField_a_of_type_ComTencentMobileqqDataMessageRecordtime;
        break;
        if (jdField_a_of_type_Long == 0L) {
          break label850;
        }
        localIntent.putExtra("searched_timeorseq", jdField_a_of_type_Long);
        break label73;
        localIntent = AIOUtils.a(new Intent(paramContext, SplashActivity.class), new int[] { 1 });
        break label73;
        if ((paramInt == 0) || (paramInt == 1024))
        {
          if ((paramInt != 1024) && (!CrmUtils.c(paramQQAppInterface, paramString1))) {
            break label827;
          }
          StartupTracker.a(null, "Recent_clk_enterchat_cmr");
          ReportController.b(paramQQAppInterface, "CliOper", "", "", "Biz_card", "Biz_card_talk", 0, 0, paramString1, "0", "", "");
          StartupTracker.a("Recent_clk_enterchat_cmr", null);
          i = 0;
        }
        else
        {
          if (paramInt == 1)
          {
            StartupTracker.a(null, "Recent_clk_enterchat_troop");
            localObject1 = ((HotChatManager)paramQQAppInterface.getManager(59)).a(paramString1);
            if (localObject1 != null) {
              localIntent.putExtra("troop_uin", troopCode);
            }
            for (;;)
            {
              i = 1;
              StartupTracker.a("Recent_clk_enterchat_troop", null);
              break;
              localObject1 = (TroopManager)paramQQAppInterface.getManager(51);
              if (localObject1 != null)
              {
                localObject1 = ((TroopManager)localObject1).a(paramString1 + "");
                if ((localObject1 != null) && (troopcode != null)) {
                  localIntent.putExtra("troop_uin", troopcode);
                }
              }
              ReportController.b(paramQQAppInterface, "CliOper", "", "", "Update_tips", "Upd_tips_appear", 0, -1, "", "", "", "");
            }
          }
          if (paramInt != 1008) {
            break label710;
          }
          StartupTracker.a(null, "Recent_clk_enterchat_cmr");
          localObject1 = ((PublicAccountDataManager)paramQQAppInterface.getManager(55)).c(String.valueOf(paramString1));
          if ((localObject1 == null) || (extendType != 2)) {
            break label539;
          }
          ReportController.b(paramQQAppInterface, "CliOper", "", "", "Biz_card", "Biz_card_talk", 0, 0, paramString1, "0", "", "");
          localIntent.setClass(paramContext, ChatActivity.class);
          localIntent.putExtra("chat_subType", 1);
          StartupTracker.a("Recent_clk_enterchat_pub", null);
          i = 0;
        }
      }
      QQMessageFacade.Message localMessage = paramQQAppInterface.a().a(paramString1, 1008);
      Object localObject1 = "";
      Object localObject3 = localObject1;
      if (localMessage != null)
      {
        localObject3 = XMLMessageUtils.a(localMessage);
        if (localObject3 != null) {
          localObject1 = Long.toString(mMsgId);
        }
        localObject3 = localObject1;
        if (!TextUtils.isEmpty((CharSequence)localObject1)) {}
      }
      Object localObject2;
      for (localObject1 = localMessage.getExtInfoFromExtStr("pa_msgId");; localObject2 = localObject3)
      {
        i = 0;
        if (localMessage != null) {
          i = paramQQAppInterface.a().a(paramString1, istroop);
        }
        PublicAccountHandler.a(paramQQAppInterface, paramString1, "Pb_account_lifeservice", "mp_msg_sys_3", "msg_aio", (String)localObject1, String.valueOf(i));
        if (PAWeatherItemBuilder.a(paramString1)) {
          ReportController.b(paramQQAppInterface, "P_CliOper", "weather_public_account", "", "weather_public_account", "brief_weather_click", 0, 0, "", "", "", "");
        }
        localIntent.putExtra("shouldreport", true);
        localIntent.setClass(paramContext, ChatActivity.class);
        break label526;
        if (paramInt == 9501)
        {
          SmartDeviceReport.a(paramQQAppInterface, "Usr_AIO_Open", 2, 0, 0);
          paramQQAppInterface = (SmartDeviceProxyMgr)paramQQAppInterface.a(51);
          l1 = 0L;
        }
        try
        {
          long l2 = Long.parseLong(paramString1);
          l1 = l2;
        }
        catch (Exception localException)
        {
          for (;;)
          {
            localException.printStackTrace();
          }
        }
        localIntent.setClass(paramContext, ChatActivity.class);
        if ((paramQQAppInterface != null) && (paramQQAppInterface.a(l1, 9)))
        {
          paramQQAppInterface = new Bundle();
          paramQQAppInterface.putString("din", String.valueOf(l1));
          paramQQAppInterface.putString("devName", paramString2);
          paramQQAppInterface.putBoolean("bFromLightApp", false);
          paramQQAppInterface.putInt("operType", 5);
          localIntent.putExtras(paramQQAppInterface);
        }
        i = 0;
        break;
      }
    }
  }
  
  public static void a(Activity paramActivity, String paramString, int paramInt)
  {
    if ((paramActivity == null) || (TextUtils.isEmpty(paramString))) {
      return;
    }
    Intent localIntent = AIOUtils.a(new Intent(paramActivity, SplashActivity.class), null);
    localIntent.putExtra("uin", paramString);
    localIntent.putExtra("uintype", 7100);
    localIntent.putExtra("entrance", paramInt);
    paramActivity.startActivity(localIntent);
  }
  
  public static void a(Context paramContext, String paramString1, String paramString2, int paramInt, String paramString3)
  {
    Intent localIntent;
    long l;
    if (paramContext != null)
    {
      if (!jdField_a_of_type_Boolean) {
        break label134;
      }
      localIntent = new Intent(paramContext, ChatActivity.class);
      if (jdField_a_of_type_ComTencentMobileqqDataMessageRecord == null) {
        break label160;
      }
      if ((jdField_a_of_type_ComTencentMobileqqDataMessageRecordistroop != 1) && (jdField_a_of_type_ComTencentMobileqqDataMessageRecordistroop != 3000)) {
        break label123;
      }
      l = jdField_a_of_type_ComTencentMobileqqDataMessageRecordshmsgseq;
      localIntent.putExtra("searched_timeorseq", l);
    }
    label123:
    label134:
    label160:
    for (;;)
    {
      localIntent.putExtra("uin", paramString1);
      localIntent.putExtra("troop_uin", paramString2);
      localIntent.putExtra("uintype", paramInt);
      localIntent.putExtra("uinname", paramString3);
      a(localIntent);
      paramContext.startActivity(localIntent);
      return;
      l = jdField_a_of_type_ComTencentMobileqqDataMessageRecordtime;
      break;
      localIntent = AIOUtils.a(new Intent(paramContext, SplashActivity.class), new int[] { 1 });
    }
  }
  
  public static void a(Intent paramIntent)
  {
    if (jdField_a_of_type_Boolean)
    {
      paramIntent.putExtra("aio_msg_source", 1);
      jdField_a_of_type_Boolean = false;
      jdField_a_of_type_ComTencentMobileqqDataMessageRecord = null;
      jdField_a_of_type_Long = 0L;
      return;
    }
    paramIntent.putExtra("aio_msg_source", 0);
  }
  
  public static void a(QQAppInterface paramQQAppInterface, RecentUser paramRecentUser)
  {
    if (type == 5000) {}
    for (;;)
    {
      ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X800419C", "0X800419C", 0, 0, "", "", "", "");
      ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X80041A0", "0X80041A0", 0, 0, "", "", "", "");
      return;
      if ((type == 7200) || (type == 1008))
      {
        ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X80041A1", "0X80041A1", 0, 0, "", "", "", "");
        if (type == 1008) {
          a(paramQQAppInterface, uin, 1);
        }
      }
      else if (String.valueOf(9992L).equals(uin))
      {
        ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X800419F", "0X800419F", 0, 0, "", "", "", "");
      }
      else if ((type == 1001) && (AppConstants.aq.equals(uin)))
      {
        ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X80041A2", "0X80041A2", 0, 0, "", "", "", "");
        ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X80050FD", "0X80050FD", 0, 0, "", "", "", "");
      }
      else if ((type == 1010) && (AppConstants.aG.equals(uin)))
      {
        ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X80050FF", "0X80050FF", 0, 0, "", "", "", "");
      }
      else if ((type == 1009) && (AppConstants.af.equals(uin)))
      {
        ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X80041A4", "0X80041A4", 0, 0, "", "", "", "");
      }
    }
  }
  
  public static void a(QQAppInterface paramQQAppInterface, RecentUser paramRecentUser, boolean paramBoolean)
  {
    a(paramQQAppInterface, paramRecentUser, paramBoolean, false);
  }
  
  public static void a(QQAppInterface paramQQAppInterface, RecentUser paramRecentUser, boolean paramBoolean1, boolean paramBoolean2)
  {
    int j = 0;
    if ((paramQQAppInterface == null) || (paramRecentUser == null)) {}
    label139:
    label192:
    label333:
    label342:
    label344:
    label379:
    do
    {
      do
      {
        Object localObject;
        do
        {
          do
          {
            do
            {
              do
              {
                do
                {
                  do
                  {
                    do
                    {
                      do
                      {
                        do
                        {
                          do
                          {
                            do
                            {
                              return;
                              int i;
                              if (MsgProxyUtils.a(uin, type))
                              {
                                if ((AppConstants.aG.equals(uin)) || (AppConstants.aq.equals(uin)))
                                {
                                  localObject = paramQQAppInterface.a().a(uin, type);
                                  if (localObject != null) {
                                    paramQQAppInterface.a().a(type, time);
                                  }
                                }
                                localObject = uin;
                                i = type;
                                paramQQAppInterface.a().d((String)localObject, i);
                                ThreadManager.a(new mhm((MessageHandler)paramQQAppInterface.a(0), (String)localObject, i), 8, null, false);
                                if ((type == 0) && (AppConstants.ap.equals(uin))) {
                                  SystemMsgController.a().a(paramQQAppInterface, true);
                                }
                                if (type != 5000) {
                                  break label379;
                                }
                                paramRecentUser = TroopAssistantManager.a().a(paramQQAppInterface);
                                if (paramRecentUser != null) {
                                  break label333;
                                }
                                i = 0;
                                if (j >= i) {
                                  break label342;
                                }
                                localObject = (TroopAssistantData)paramRecentUser.get(j);
                                if (localObject != null) {
                                  break label344;
                                }
                              }
                              for (;;)
                              {
                                j += 1;
                                break label192;
                                if (paramBoolean1)
                                {
                                  localObject = new SessionInfo();
                                  jdField_a_of_type_JavaLangString = uin;
                                  b = uin;
                                  jdField_a_of_type_Int = type;
                                  if (jdField_a_of_type_Int == 1006) {
                                    f = ContactUtils.f(paramQQAppInterface, jdField_a_of_type_JavaLangString);
                                  }
                                  ChatActivityFacade.b(paramQQAppInterface, (SessionInfo)localObject);
                                }
                                paramQQAppInterface.a().a(uin, type, true, paramBoolean2);
                                if (type != 1) {
                                  break label139;
                                }
                                HotChatUtil.a(paramQQAppInterface, uin);
                                break label139;
                                i = paramRecentUser.size();
                                break label192;
                                break;
                                localObject = paramQQAppInterface.a().a(troopUin, 1);
                                if (localObject != null) {
                                  TroopAssistantManager.a().a(paramQQAppInterface, time);
                                }
                              }
                              if (type != 7200) {
                                break;
                              }
                              paramRecentUser = PubAccountAssistantManager.a().a(paramQQAppInterface);
                            } while ((paramRecentUser == null) || (paramRecentUser.size() <= 0));
                            paramRecentUser = (PubAccountAssistantData)paramRecentUser.get(0);
                          } while (paramRecentUser == null);
                          paramRecentUser = paramQQAppInterface.a().a(mUin, mType);
                        } while (paramRecentUser == null);
                        PubAccountAssistantManager.a().a(paramQQAppInterface, time);
                        return;
                        if (7000 != type) {
                          break;
                        }
                      } while ((uin == null) || (uin.length() < 5));
                      ((MessageHandler)paramQQAppInterface.a(0)).a().a(uin, null);
                      paramQQAppInterface = (SubAccountManager)paramQQAppInterface.getManager(60);
                    } while (paramQQAppInterface == null);
                    paramQQAppInterface.b(uin);
                    return;
                    if (String.valueOf(9995L).equals(uin))
                    {
                      ((NewFriendManager)paramQQAppInterface.getManager(33)).f();
                      return;
                    }
                    if (String.valueOf(9980L).equals(uin))
                    {
                      paramQQAppInterface.a().a().c();
                      GroupSystemMsgController.a().a(paramQQAppInterface, 0);
                      ((RecommendTroopManagerImp)paramQQAppInterface.getManager(21)).a();
                      return;
                    }
                    if (type != 7210) {
                      break;
                    }
                    paramRecentUser = TroopBarAssistantManager.a().a(paramQQAppInterface);
                  } while ((paramRecentUser == null) || (paramRecentUser.size() <= 0));
                  paramRecentUser = (TroopBarData)paramRecentUser.get(0);
                } while (paramRecentUser == null);
                paramRecentUser = paramQQAppInterface.a().a(mUin, 1008);
              } while (paramRecentUser == null);
              TroopBarAssistantManager.a().a(paramQQAppInterface, time);
              return;
              if (type != 7120) {
                break;
              }
              paramRecentUser = (EcShopAssistantManager)paramQQAppInterface.getManager(87);
            } while (paramRecentUser == null);
            localObject = paramRecentUser.a();
          } while ((localObject == null) || (((List)localObject).size() <= 0));
          localObject = (EcShopData)((List)localObject).get(0);
        } while (localObject == null);
        paramQQAppInterface = paramQQAppInterface.a().a(mUin, 1008);
      } while (paramQQAppInterface == null);
      paramRecentUser.a(time);
      return;
    } while (!AppConstants.aS.equals(uin));
    ((DingdongPluginManager)paramQQAppInterface.getManager(114)).a(true, paramBoolean2, false);
  }
  
  public static void a(QQAppInterface paramQQAppInterface, String paramString, int paramInt)
  {
    ThreadManager.a(new mho(paramQQAppInterface, paramString, paramInt), 2, null, false);
  }
  
  public static void a(RecentUser paramRecentUser, QQMessageFacade paramQQMessageFacade)
  {
    long l1 = System.currentTimeMillis();
    if ((paramRecentUser == null) || (paramQQMessageFacade == null)) {}
    long l2;
    do
    {
      return;
      if ((paramRecentUser.getStatus() == 1000) && (lastmsgdrafttime == 0L))
      {
        paramQQMessageFacade = paramQQMessageFacade.a(uin, type);
        if (paramQQMessageFacade != null) {
          lastmsgdrafttime = paramQQMessageFacade.getTime();
        }
      }
      l2 = System.currentTimeMillis();
    } while (!QLog.isDevelopLevel());
    QLog.i("Q.recent", 4, "updateLastDraftTimeForNewRU| cost = " + (l2 - l1));
  }
  
  public static boolean a(QQAppInterface paramQQAppInterface, Activity paramActivity, RecentUser paramRecentUser, int paramInt1, int paramInt2)
  {
    if (AppConstants.aq.equals(uin))
    {
      MsgBoxListActivity.a(paramActivity, 1001, uin);
      ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X80050F5", "0X80050F5", 0, 0, "", "", "", "");
      paramActivity = paramQQAppInterface.a().a(uin, 1001);
      if ((paramActivity != null) && (msgtype == 61525))
      {
        paramActivity = NearbyRecommenderUtils.a(paramQQAppInterface);
        ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X80055FB", "0X80055FB", 0, 0, paramActivity[0], "", paramActivity[1], "");
      }
      return true;
    }
    if (AppConstants.aG.equals(uin))
    {
      MsgBoxListActivity.a(paramActivity, 1010, uin);
      ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X8004947", "0X8004947", 0, 0, "", "", "", "");
      ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X80050F6", "0X80050F6", 0, 0, "", "", "", "");
      return true;
    }
    if (AppConstants.aL.equals(uin))
    {
      MsgBoxListActivity.a(paramActivity, 1001, AppConstants.aq);
      return true;
    }
    if (AppConstants.aM.equals(uin))
    {
      MsgBoxListActivity.a(paramActivity, 1010, AppConstants.aG);
      return true;
    }
    if (String.valueOf(AppConstants.af).equals(uin))
    {
      MsgBoxListActivity.a(paramActivity, 1009, uin);
      return true;
    }
    if (AppConstants.an.equals(uin))
    {
      paramQQAppInterface.a().c(AppConstants.an, 0);
      paramRecentUser = new Intent(paramActivity, VisitorsActivity.class);
      paramRecentUser.putExtra("votersOnly", true);
      paramRecentUser.putExtra("toUin", Long.valueOf(paramQQAppInterface.a()));
      paramActivity.startActivity(paramRecentUser);
      return true;
    }
    if (AppConstants.am.equals(uin))
    {
      paramRecentUser = new Intent(paramActivity, NewFriendActivity.class);
      paramRecentUser.setFlags(67108864);
      paramActivity.startActivity(paramRecentUser);
      ReportController.b(paramQQAppInterface, "CliOper", "", "", "Add_frd", "Clk_Frd_offer", 22, 0, "", "", "", "");
      return true;
    }
    if (AppConstants.al.equals(uin))
    {
      paramRecentUser = new Intent(paramActivity, TroopAssistantActivity.class);
      paramRecentUser.setFlags(67108864);
      paramActivity.startActivity(paramRecentUser);
      ReportController.b(paramQQAppInterface, "P_CliOper", "Grp_msg", "", "Msglist", "Clk_help", 0, 0, "", "", "", "");
      return true;
    }
    if (AppConstants.ar.equals(uin))
    {
      paramQQAppInterface = new Intent(paramActivity, QQBroadcastActivity.class);
      paramQQAppInterface.setFlags(67108864);
      paramActivity.startActivity(paramQQAppInterface);
      return true;
    }
    if (AppConstants.aH.equals(uin))
    {
      SubscriptRecommendController.c(paramQQAppInterface, false);
      paramRecentUser = TroopBarAssistantManager.a();
      if (paramRecentUser.f(paramQQAppInterface)) {
        ReportController.b(paramQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X8005B70", "0X8005B70", 0, 0, paramQQAppInterface.a(), "", "", "");
      }
      paramRecentUser.e(paramQQAppInterface, false);
      paramRecentUser.d(paramQQAppInterface, false);
      if (TroopBarAssistantManager.a().a(paramQQAppInterface) > 0)
      {
        ReportController.b(paramQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X800572B", "0X800572B", 0, 0, "", "", "", "");
        ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X8006573", "0X8006573", 0, 0, "", "", "", "");
        ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X800623E", "0X800623E", 0, 0, "", "", "", "");
        ReportController.b(paramQQAppInterface, "P_CliOper", "Grp_tribe", "", "Msglist", "Clk_tribeHelper", 0, 0, "", "", "", "");
        if (!PublicAccountUtil.a()) {
          break label819;
        }
        paramQQAppInterface = new Intent(paramActivity, WebViewJumpAction.class);
        paramQQAppInterface.putExtra("targetID", 1);
      }
      for (;;)
      {
        paramQQAppInterface.putExtra("come_from", 1);
        paramQQAppInterface.setFlags(67108864);
        paramActivity.startActivity(paramQQAppInterface);
        if (PublicAccountUtil.a()) {
          paramActivity.overridePendingTransition(2130968590, 2130968591);
        }
        return true;
        ReportController.b(paramQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X800572C", "0X800572C", 0, 0, "", "", "", "");
        ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X8006574", "0X8006574", 0, 0, "", "", "", "");
        break;
        label819:
        paramQQAppInterface = new Intent(paramActivity, SubscriptFeedsActivity.class);
      }
    }
    Object localObject1;
    Object localObject2;
    Object localObject3;
    if (TextUtils.equals(AppConstants.aX, uin))
    {
      localObject1 = new ArrayList();
      localObject2 = paramQQAppInterface.a();
      Object localObject4;
      if (localObject2 != null)
      {
        localObject3 = ((QQMessageFacade)localObject2).a(uin, type);
        if ((localObject3 == null) || (!(localObject3 instanceof MessageForStructing)) || (extInt != 1)) {
          break label1221;
        }
        localObject3 = (MessageForStructing)localObject3;
        if (structingMsg == null) {
          ((MessageForStructing)localObject3).parse();
        }
        if (structingMsg != null)
        {
          if (!TextUtils.isEmpty(structingMsg.mArticleIds))
          {
            localObject4 = structingMsg.mArticleIds.split("\\|");
            int i = localObject4.length;
            paramInt1 = 0;
            for (;;)
            {
              if (paramInt1 < i)
              {
                String str = localObject4[paramInt1];
                try
                {
                  ((ArrayList)localObject1).add(Long.valueOf(Long.parseLong(str)));
                  paramInt1 += 1;
                }
                catch (Exception localException2)
                {
                  for (;;)
                  {
                    localException2.printStackTrace();
                  }
                }
              }
            }
          }
          if (TextUtils.isEmpty(structingMsg.mMsgActionData)) {
            break label1213;
          }
          localObject4 = PublicAccountUtil.a(structingMsg.mMsgActionData);
          if (localObject4 == null) {
            break label1213;
          }
        }
      }
      for (;;)
      {
        try
        {
          l = Long.parseLong(((JSONObject)localObject4).getString("id"));
          if (l != -1L) {
            ReportController.b(null, "CliOper", "", "", "0X80066F5", "0X80066F5", 0, 0, String.valueOf(paramInt2 + 1), "", String.valueOf(l), "");
          }
          PublicAccountUtil.a(paramQQAppInterface, (MessageForStructing)localObject3, 1);
          localObject2 = ((QQMessageFacade)localObject2).a();
          if ((localObject2 != null) && (((ConversationFacade)localObject2).a(uin, type) > 0)) {
            ThreadManager.a(new mhl(paramRecentUser, paramQQAppInterface), 8, null, false);
          }
          if (!((ArrayList)localObject1).isEmpty()) {
            break label1255;
          }
          l = -1L;
          ReadInJoyActivityHelper.a(paramActivity, (List)localObject1, l, false);
          ReportController.b(null, "CliOper", "", "", "0X80066F4", "0X80066F4", 0, 0, String.valueOf(paramInt2 + 1), "", "", "");
          return true;
        }
        catch (Exception localException1)
        {
          localException1.printStackTrace();
        }
        label1213:
        long l = -1L;
        continue;
        label1221:
        ReportController.b(null, "CliOper", "", "", "0X80066F6", "0X80066F6", 0, 0, String.valueOf(paramInt2 + 1), "", "", "");
        continue;
        label1255:
        l = ((Long)((ArrayList)localObject1).get(0)).longValue();
      }
    }
    if (AppConstants.aE.equals(uin))
    {
      paramRecentUser = (SecMsgManager)paramQQAppInterface.getManager(56);
      paramInt1 = 0;
      if (paramRecentUser != null)
      {
        paramRecentUser.a("enter_msg_list", null, null, "msgtab", null);
        localObject1 = new Intent();
        if (h != 1) {
          break label2307;
        }
        paramInt1 = 1;
        ((Intent)localObject1).putExtra("extra_tab_mode", 1);
        ((Intent)localObject1).putExtra("extra_from_msg_tab", true);
      }
    }
    for (;;)
    {
      paramRecentUser.c();
      SecMsgHelper.a(paramActivity, paramQQAppInterface, 1, (Intent)localObject1);
      ReportController.b(null, "CliOper", "", "", "AnonyDiscuss", "enter_topic_list", paramInt1, 0, "", "", "msgtab", "");
      return true;
      if (AppConstants.aT.equals(uin))
      {
        paramRecentUser = (BlessManager)paramQQAppInterface.getManager(137);
        if (paramRecentUser != null)
        {
          localObject1 = new Intent();
          ((Intent)localObject1).setClass(paramActivity, BlessActivity.class);
          paramActivity.startActivity((Intent)localObject1);
          ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X800618B", "0X800618B", 0, 0, "", "", "", "");
          if (paramRecentUser.i()) {
            ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X800632C", "0X800632C", 0, 0, "", "", "", "");
          }
        }
        return true;
      }
      if (AppConstants.aA.equals(uin)) {
        return true;
      }
      if (AppConstants.aB.equals(uin))
      {
        localObject1 = "1";
        localObject3 = new Intent();
        ((Intent)localObject3).putExtra("key_tab_mode", 2);
        ((Intent)localObject3).setClass(paramActivity, TroopActivity.class);
        paramInt1 = GroupSystemMsgController.a().a(paramQQAppInterface);
        if (paramInt1 > 0)
        {
          localObject2 = "0";
          localObject1 = "0";
        }
        for (;;)
        {
          paramQQAppInterface.a().c(AppConstants.aB, 9000, -paramInt1);
          ((Intent)localObject3).putExtra("_key_mode", jumpTabMode);
          paramActivity.startActivity((Intent)localObject3);
          ReportController.b(paramQQAppInterface, "P_CliOper", "Grp_contacts", "", "notice", "Clk_notice", 0, 0, "", (String)localObject1, (String)localObject2, "");
          return true;
          paramInt1 = RecommendTroopManagerImp.a(paramQQAppInterface);
          if (paramInt1 > 0)
          {
            localObject1 = "0";
            localObject2 = "1";
          }
          else
          {
            localObject2 = "0";
          }
        }
      }
      if (AppConstants.ai.equals(uin))
      {
        paramRecentUser = new Intent(paramActivity, LiteActivity.class);
        paramRecentUser.putExtra("targetUin", AppConstants.ai);
        paramActivity.startActivity(paramRecentUser);
        ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X800603B", "0X800603B", 0, 0, "", "", "", "");
        return true;
      }
      if (AppConstants.aj.equals(uin))
      {
        paramRecentUser = new Intent(paramActivity, LiteActivity.class);
        paramRecentUser.putExtra("targetUin", AppConstants.aj);
        paramActivity.startActivity(paramRecentUser);
        ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X8006040", "0X8006040", 0, 0, "", "", "", "");
        return true;
      }
      if (AppConstants.aI.equals(uin))
      {
        paramQQAppInterface = new Intent(paramActivity, ActivateFriendActivity.class);
        paramQQAppInterface.setFlags(67108864);
        if (paramInt1 == 0) {}
        for (paramInt1 = 1;; paramInt1 = 3)
        {
          paramQQAppInterface.putExtra("af_key_from", paramInt1);
          paramActivity.startActivity(paramQQAppInterface);
          return true;
        }
      }
      if (AppConstants.aJ.equals(uin))
      {
        paramRecentUser = new Intent(paramActivity, EcShopAssistantActivity.class);
        paramRecentUser.setFlags(67108864);
        paramActivity.startActivity(paramRecentUser);
        ReportController.b(paramQQAppInterface, "P_CliOper", "Shop_lifeservice", "", "Msglist", "Clk_ShopHelper", 0, 0, "", "", "", "");
        paramActivity = (EcShopAssistantManager)paramQQAppInterface.getManager(87);
        if (paramActivity != null)
        {
          paramActivity = paramActivity.a();
          if (paramActivity != null) {
            break label2005;
          }
        }
        label2005:
        for (paramInt1 = 0;; paramInt1 = paramActivity.size())
        {
          if (paramInt1 == 0) {
            ReportController.b(paramQQAppInterface, "P_CliOper", "Shop_lifeservice", "", "Shop_noMsglist", "Clk_ShopHelper", 0, 0, "", "", "", "");
          }
          return true;
        }
      }
      if (1012 == msgType)
      {
        paramQQAppInterface = new ProfileActivity.AllInOne(paramQQAppInterface.a(), 0);
        paramRecentUser = new Intent(paramActivity, NearbyPeopleProfileActivity.class);
        paramRecentUser.putExtra("param_mode", 2);
        paramRecentUser.putExtra("AllInOne", paramQQAppInterface);
        paramRecentUser.putExtra("frome_where", -1);
        paramRecentUser.putExtra("abp_flag", true);
        paramRecentUser.addFlags(67108864);
        paramActivity.startActivity(paramRecentUser);
        return true;
      }
      if (AppConstants.aS.equals(uin))
      {
        ((DingdongPluginManager)paramQQAppInterface.getManager(114)).a(false, false, true);
        paramRecentUser = new Intent();
        paramRecentUser.putExtra("_current_unread_num", paramQQAppInterface.a().a(AppConstants.aS, 9999));
        paramRecentUser.putExtra("_from_", 2);
        DingdongPluginHelper.a(paramActivity, "com.dingdong.business.base.activity.DingdongUinListActivity", paramRecentUser, -1);
        DingdongPluginHelper.a("0x8005EBA");
        return true;
      }
      if (AppConstants.aU.equals(uin))
      {
        if (!QQHotSpotBridgeActivity.a())
        {
          WifiConversationManager.a().a(true);
          paramRecentUser = new Bundle();
          if (WifiNetworkUtil.a()) {
            QQHotSpotAcitivtyHelper.a(paramQQAppInterface, paramActivity, "com.qqhotspot.activity.WiFiHotSpotListActivity", HotSpotNodeUtil.a(), 0);
          }
          for (;;)
          {
            ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X8006352", "0X8006352", 0, 0, "", "", "", "");
            return true;
            QQHotSpotAcitivtyHelper.a(paramQQAppInterface, paramActivity, "com.qqhotspot.activity.WiFiHintActivity", paramRecentUser, 0);
            ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X8006354", "0X8006354", 0, 0, "", "", "", "");
          }
        }
      }
      else {
        return false;
      }
      return true;
      label2307:
      paramInt1 = 0;
    }
  }
  
  public static boolean a(QQAppInterface paramQQAppInterface, String paramString)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (paramQQAppInterface != null)
    {
      bool1 = bool2;
      if (!TextUtils.isEmpty(paramString))
      {
        paramQQAppInterface = (FriendsManager)paramQQAppInterface.getManager(50);
        if (paramQQAppInterface != null) {
          break label35;
        }
      }
    }
    label35:
    for (bool1 = false;; bool1 = paramQQAppInterface.b(paramString)) {
      return bool1;
    }
  }
  
  public static void b(QQAppInterface paramQQAppInterface, RecentUser paramRecentUser)
  {
    if ((paramQQAppInterface == null) || (paramRecentUser == null)) {}
    label350:
    label464:
    label539:
    label541:
    label585:
    label709:
    label744:
    label776:
    label778:
    label817:
    label890:
    label929:
    label966:
    label1016:
    label1018:
    label1059:
    do
    {
      for (;;)
      {
        return;
        paramQQAppInterface.a().a().a(paramRecentUser, false);
        Object localObject1;
        int i;
        int j;
        if (MsgProxyUtils.a(uin, type))
        {
          if ((AppConstants.aG.equals(uin)) || (AppConstants.aq.equals(uin)))
          {
            localObject1 = paramQQAppInterface.a().a(uin, type);
            if (localObject1 != null) {
              paramQQAppInterface.a().a(type, time);
            }
          }
          localObject1 = uin;
          i = type;
          ThreadManager.a(new mhn((MessageHandler)paramQQAppInterface.a(0), (String)localObject1, i), 8, null, false);
          paramQQAppInterface.a().a(uin, type, true, true);
          if (type == 1) {
            HotChatUtil.a(paramQQAppInterface, uin);
          }
          if ((type == 0) && (AppConstants.ap.equals(uin))) {
            SystemMsgController.a().a(paramQQAppInterface, true);
          }
          if ((type == 4000) && (AppConstants.am.equals(uin)))
          {
            NewFriendManager.a(paramQQAppInterface, true);
            ((NewFriendManager)paramQQAppInterface.getManager(33)).g();
          }
          if ((type == 7210) && (AppConstants.aH.equals(uin)))
          {
            TroopBarAssistantManager.a().g(paramQQAppInterface);
            TroopBarAssistantManager.a().e(paramQQAppInterface);
            paramQQAppInterface.a(true, 0);
          }
          if (!AppConstants.aH.equals(uin)) {
            break label585;
          }
          ReportController.b(paramQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X800572D", "0X800572D", 0, 0, "", "", "", "");
          ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X800623F", "0X800623F", 0, 0, "", "", "", "");
          SubscriptRecommendController.c(paramQQAppInterface, false);
          i = 0;
          switch (type)
          {
          default: 
            ReportController.b(paramQQAppInterface, "CliOper", "", "", "Msg_tab", "Delete_msg", 0, 0, i + "", "", "", "");
            if (type != 5000) {
              break label744;
            }
            TroopAssistantManager.a().a(paramQQAppInterface, true);
            paramRecentUser = TroopAssistantManager.a().a(paramQQAppInterface);
            if (paramRecentUser == null)
            {
              i = 0;
              j = 0;
              if (j >= i) {
                continue;
              }
              localObject1 = (TroopAssistantData)paramRecentUser.get(j);
              if (localObject1 != null) {
                break label709;
              }
            }
            break;
          }
        }
        for (;;)
        {
          j += 1;
          break label541;
          b(paramQQAppInterface, uin, type);
          break;
          if (!AppConstants.aJ.equals(uin)) {
            break label350;
          }
          ReportController.b(paramQQAppInterface, "P_CliOper", "Shop_lifeservice", "", "Shop_DelMsglist", "Del_shopHelper", 0, 0, "", "", "", "");
          break label350;
          if (!uin.equals(AppConstants.ap)) {
            break label464;
          }
          i = 7;
          break label464;
          i = 1;
          break label464;
          i = 2;
          break label464;
          i = 3;
          a(paramQQAppInterface, uin, 2);
          break label464;
          i = 4;
          break label464;
          i = 5;
          break label464;
          i = 6;
          break label464;
          i = 8;
          break label464;
          i = 9;
          break label464;
          i = paramRecentUser.size();
          break label539;
          localObject1 = paramQQAppInterface.a().a(troopUin, 1);
          if (localObject1 != null) {
            TroopAssistantManager.a().a(paramQQAppInterface, time);
          }
        }
        if (type == 7200)
        {
          PubAccountAssistantManager.a().a(paramQQAppInterface, true);
          paramRecentUser = PubAccountAssistantManager.a().a(paramQQAppInterface);
          if (paramRecentUser == null)
          {
            i = 0;
            j = 0;
            if (j < i)
            {
              localObject1 = (PubAccountAssistantData)paramRecentUser.get(j);
              if (localObject1 != null) {
                break label817;
              }
            }
          }
          for (;;)
          {
            j += 1;
            break label778;
            break;
            i = paramRecentUser.size();
            break label776;
            localObject1 = paramQQAppInterface.a().a(mUin, mType);
            if (localObject1 != null) {
              PubAccountAssistantManager.a().a(paramQQAppInterface, time);
            }
          }
        }
        if (type == 7210)
        {
          TroopBarAssistantManager.a().a(paramQQAppInterface, true);
          paramRecentUser = TroopBarAssistantManager.a().a(paramQQAppInterface);
          if (paramRecentUser == null)
          {
            i = 0;
            j = 0;
            if (j >= i) {
              break label966;
            }
            localObject1 = (TroopBarData)paramRecentUser.get(j);
            if (localObject1 != null) {
              break label929;
            }
          }
          for (;;)
          {
            j += 1;
            break label890;
            i = paramRecentUser.size();
            break;
            localObject1 = paramQQAppInterface.a().a(mUin, 1008);
            if (localObject1 != null) {
              TroopBarAssistantManager.a().a(paramQQAppInterface, time);
            }
          }
          TroopBarAssistantManager.a().j(paramQQAppInterface);
          return;
        }
        if (type == 7120)
        {
          paramRecentUser = (EcShopAssistantManager)paramQQAppInterface.getManager(87);
          if (paramRecentUser != null)
          {
            paramRecentUser.a(true);
            localObject1 = paramRecentUser.a();
            Object localObject2;
            if (localObject1 == null)
            {
              i = 0;
              j = 0;
              if (j < i)
              {
                localObject2 = (EcShopData)((List)localObject1).get(j);
                if (localObject2 != null) {
                  break label1059;
                }
              }
            }
            for (;;)
            {
              j += 1;
              break label1018;
              break;
              i = ((List)localObject1).size();
              break label1016;
              localObject2 = paramQQAppInterface.a().a(mUin, 1008);
              if (localObject2 != null) {
                paramRecentUser.a(time);
              }
            }
          }
        }
        else
        {
          if (type != 9002) {
            break;
          }
          ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X8004E99", "0X8004E99", 0, 0, "", "", "", "");
          paramRecentUser = paramQQAppInterface.a().b(AppConstants.aI, 0).iterator();
          while (paramRecentUser.hasNext())
          {
            localObject1 = (MessageRecord)paramRecentUser.next();
            paramQQAppInterface.a().b(AppConstants.aI, 0, uniseq);
          }
        }
      }
    } while (type != 9003);
    ((BlessManager)paramQQAppInterface.getManager(137)).c();
  }
  
  public static void b(QQAppInterface paramQQAppInterface, String paramString, int paramInt)
  {
    if ((paramQQAppInterface == null) || (paramString == null)) {
      break label8;
    }
    label8:
    label542:
    label547:
    for (;;)
    {
      return;
      if (paramQQAppInterface.a().a(paramString, paramInt) > 0)
      {
        long l2 = paramQQAppInterface.a().b(paramString, paramInt);
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.sendReadConfirm_PB", 2, String.format("RecentUtil,uin: %s, uinType: %d, id: %d", new Object[] { paramString, Integer.valueOf(paramInt), Long.valueOf(l2) }));
        }
        if (l2 == -1L) {
          break;
        }
        msg_svc.PbMsgReadedReportReq localPbMsgReadedReportReq = new msg_svc.PbMsgReadedReportReq();
        Object localObject1;
        Object localObject2;
        if (paramInt == 1)
        {
          localObject1 = "troop_processor";
          localObject2 = new msg_svc.PbGroupReadedReportReq();
          group_code.set(Long.valueOf(paramString).longValue());
          last_read_seq.set(l2);
          grp_read_report.add((MessageMicro)localObject2);
          paramString = (String)localObject1;
        }
        for (;;)
        {
          paramQQAppInterface.a().a(paramString).a(localPbMsgReadedReportReq);
          return;
          if (paramInt == 1026)
          {
            localObject1 = "hctopic_processor";
            localObject2 = new msg_svc.PbGroupReadedReportReq();
            group_code.set(Long.valueOf(paramString).longValue());
            last_read_seq.set(l2);
            grp_read_report.add((MessageMicro)localObject2);
            paramString = (String)localObject1;
          }
          else
          {
            if (paramInt != 3000) {
              break;
            }
            localObject1 = "disc_processor";
            localObject2 = new msg_svc.PbDiscussReadedReportReq();
            conf_uin.set(Long.valueOf(paramString).longValue());
            last_read_seq.set(l2);
            dis_read_report.add((MessageMicro)localObject2);
            paramString = (String)localObject1;
          }
        }
        if ((!MsgProxyUtils.c(paramInt)) || (l2 == 0L)) {
          break;
        }
        if (AppConstants.ap.equals(paramString))
        {
          paramQQAppInterface.a().a().a();
          return;
        }
        long l1;
        if (paramInt == 1006)
        {
          localObject1 = ContactUtils.f(paramQQAppInterface, paramString);
          if (TextUtils.isEmpty((CharSequence)localObject1)) {
            break label542;
          }
          l1 = Long.valueOf((String)localObject1).longValue();
        }
        for (;;)
        {
          if (l1 == -1L) {
            break label547;
          }
          localObject1 = new msg_svc.PbC2CReadedReportReq.UinPairReadInfo();
          peer_uin.set(l1);
          last_read_time.set((int)l2);
          if (paramInt == 1024)
          {
            paramString = paramQQAppInterface.a().d(paramString);
            if (paramString != null)
            {
              if (QLog.isDevelopLevel()) {
                QLog.d("Q.msg.sendReadConfirm_PB", 4, "Readcomfirmed------->Sig:" + HexUtil.a(paramString) + ",length:" + paramString.length);
              }
              crm_sig.set(ByteStringMicro.copyFrom(paramString));
            }
          }
          paramString = new msg_svc.PbC2CReadedReportReq();
          pair_info.add((MessageMicro)localObject1);
          localObject1 = paramQQAppInterface.a().a().a();
          if (localObject1 != null) {
            sync_cookie.set(ByteStringMicro.copyFrom((byte[])localObject1));
          }
          c2c_read_report.set(paramString);
          paramString = "c2c_processor";
          break;
          l1 = Long.valueOf(paramString).longValue();
          continue;
          l1 = -1L;
        }
      }
    }
  }
}
