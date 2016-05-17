package com.tencent.mobileqq.activity.recent.data;

import QQService.EVIPSPEC;
import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import com.tencent.biz.eqq.CrmUtils;
import com.tencent.biz.pubaccount.util.PublicAccountConfigUtil;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.common.config.AppSetting;
import com.tencent.device.datadef.DeviceInfo;
import com.tencent.device.devicemgr.SmartDeviceProxyMgr;
import com.tencent.device.file.DeviceAVFileMsgObserver;
import com.tencent.device.msg.data.DeviceMsgHandle;
import com.tencent.device.msg.data.MessageForDevLittleVideo;
import com.tencent.device.msg.data.MessageForDevPtt;
import com.tencent.device.msg.data.MessageForDevShortVideo;
import com.tencent.device.utils.SmartDeviceUtil;
import com.tencent.mobileqq.activity.aio.XMLMessageUtils;
import com.tencent.mobileqq.activity.aio.rebuild.DeviceMsgChatPie;
import com.tencent.mobileqq.activity.recent.MsgSummary;
import com.tencent.mobileqq.activity.specialcare.QvipSpecialCareManager;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.CircleManager;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.PublicAccountDataManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.RecommendTroopManagerImp;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.data.AccountDetail;
import com.tencent.mobileqq.data.CircleBuddy;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.MessageForApproval;
import com.tencent.mobileqq.data.MessageForDeviceFile;
import com.tencent.mobileqq.data.MessageForRichState;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.PAMessage;
import com.tencent.mobileqq.data.PAMessage.Item;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.data.PublicAccountInfo;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.structmsg.AbsStructMsg;
import com.tencent.mobileqq.systemmsg.SystemMsgController;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.MsgUtils;
import com.tencent.qphone.base.util.BaseApplication;
import java.util.ArrayList;
import java.util.List;
import mib;
import org.json.JSONObject;

public class RecentItemChatMsgData
  extends RecentUserBaseData
{
  private static MessageForRichState jdField_a_of_type_ComTencentMobileqqDataMessageForRichState;
  private boolean jdField_a_of_type_Boolean;
  private boolean b;
  
  public RecentItemChatMsgData(RecentUser paramRecentUser)
  {
    super(paramRecentUser);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_b_of_type_Boolean = TextUtils.equals(uin, AppConstants.aX);
    if (jdField_b_of_type_Boolean) {
      G = 2;
    }
  }
  
  private boolean a(FriendsManager paramFriendsManager, String paramString)
  {
    if ((paramFriendsManager == null) || (TextUtils.isEmpty(paramString))) {}
    boolean bool1;
    boolean bool2;
    do
    {
      do
      {
        return false;
        paramFriendsManager = paramFriendsManager.a(paramString);
      } while ((paramFriendsManager == null) || (!paramFriendsManager.isFriend()));
      bool1 = paramFriendsManager.isServiceEnabled(EVIPSPEC.E_SP_SUPERVIP);
      bool2 = paramFriendsManager.isServiceEnabled(EVIPSPEC.E_SP_QQVIP);
    } while ((!bool1) && (!bool2));
    return true;
  }
  
  public void a(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    if ((paramQQAppInterface == null) || (paramContext == null)) {
      return;
    }
    super.a(paramQQAppInterface, paramContext);
    jdField_a_of_type_Boolean = false;
    Object localObject2 = null;
    Object localObject5 = paramQQAppInterface.a();
    if (localObject5 != null) {
      localObject2 = ((QQMessageFacade)localObject5).a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type);
    }
    Object localObject1 = paramQQAppInterface.a();
    MsgSummary localMsgSummary;
    if ((localObject1 != null) && (localObject2 != null))
    {
      H = ((ConversationFacade)localObject1).a(frienduin, istroop);
      localMsgSummary = a();
      localObject1 = null;
    }
    label335:
    label635:
    label718:
    label823:
    label860:
    label866:
    label994:
    label999:
    label1200:
    label1506:
    label1711:
    label1719:
    Object localObject4;
    switch (jdField_a_of_type_ComTencentMobileqqDataRecentUser.type)
    {
    default: 
    case 9501: 
    case 1008: 
      for (;;)
      {
        a(paramQQAppInterface);
        a(paramQQAppInterface, localMsgSummary);
        if ((jdField_a_of_type_Boolean) && (jdField_a_of_type_Boolean))
        {
          jdField_b_of_type_JavaLangCharSequence = "";
          jdField_c_of_type_JavaLangCharSequence = "";
        }
        a(paramQQAppInterface, paramContext, localMsgSummary);
        if (AppSetting.i)
        {
          paramQQAppInterface = new StringBuilder();
          paramQQAppInterface.append(jdField_a_of_type_JavaLangString).append(",");
          if (H != 0) {
            break label3441;
          }
          if (jdField_c_of_type_JavaLangCharSequence != null) {
            paramQQAppInterface.append(jdField_c_of_type_JavaLangCharSequence + ",");
          }
          paramQQAppInterface.append(jdField_b_of_type_JavaLangCharSequence).append(",").append(jdField_b_of_type_JavaLangString);
          jdField_c_of_type_JavaLangString = paramQQAppInterface.toString();
        }
        d();
        return;
        H = 0;
        break;
        if (localObject2 != null)
        {
          jdField_b_of_type_JavaLangCharSequence = msg;
          jdField_b_of_type_Long = time;
          I = 0;
          localObject1 = ((SmartDeviceProxyMgr)paramQQAppInterface.a(51)).a(Long.parseLong(frienduin));
          if (localObject1 != null) {
            jdField_a_of_type_JavaLangString = SmartDeviceUtil.a((DeviceInfo)localObject1);
          }
          if ((jdField_b_of_type_JavaLangCharSequence == null) || (jdField_b_of_type_JavaLangCharSequence.length() == 0)) {
            jdField_b_of_type_JavaLangCharSequence = jdField_a_of_type_JavaLangString;
          }
          M = 1;
          if (msgtype == 61036)
          {
            localObject1 = new MessageForDeviceFile();
            msgData = msgData;
            ((MessageForDeviceFile)localObject1).parse();
            if (msgStatus == 1) {
              f = 2;
            } else if (msgStatus == 2) {
              f = 1;
            }
          }
          else if (msgtype == 61035)
          {
            localObject1 = new MessageForDevPtt();
            msgData = msgData;
            ((MessageForDevPtt)localObject1).parse();
            if (fileSize == -1L)
            {
              f = 2;
              if (!"device_groupchat".equals(extStr)) {
                continue;
              }
              if (!((QQMessageFacade.Message)localObject2).isSend()) {
                break label718;
              }
            }
            for (nickName = paramQQAppInterface.a().getString(2131367088);; nickName = ContactUtils.b(paramQQAppInterface, senderuin, true))
            {
              MsgUtils.a(paramContext, paramQQAppInterface, (QQMessageFacade.Message)localObject2, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type, localMsgSummary, nickName, true, false);
              break;
              if (fileSize != -3L) {
                break label635;
              }
              f = 1;
              break label635;
            }
          }
          else
          {
            int i;
            if (msgtype == 61033)
            {
              localObject1 = new MessageForDevShortVideo();
              msgData = msgData;
              ((MessageForDevShortVideo)localObject1).parse();
              if (videoFileStatus == 1005)
              {
                f = 2;
              }
              else if (videoFileStatus == 1002)
              {
                localObject1 = ((DeviceMsgHandle)paramQQAppInterface.a(49)).a();
                if (localObject1 != null)
                {
                  i = 1;
                  if (((DeviceAVFileMsgObserver)localObject1).a(uniseq)) {
                    break label860;
                  }
                }
                for (int j = 1;; j = 0)
                {
                  if ((i & j) == 0) {
                    break label866;
                  }
                  f = 2;
                  break;
                  i = 0;
                  break label823;
                }
                f = 1;
              }
            }
            else
            {
              Object localObject3;
              if (msgtype == 61027)
              {
                localObject1 = new MessageForDevLittleVideo();
                msgData = msgData;
                ((MessageForDevLittleVideo)localObject1).parse();
                if (videoFileStatus == 1005)
                {
                  f = 2;
                }
                else if (videoFileStatus == 1002)
                {
                  localObject3 = ((DeviceMsgHandle)paramQQAppInterface.a(49)).a();
                  if (!DeviceMsgChatPie.b((MessageRecord)localObject1)) {
                    if (localObject3 == null) {
                      break label994;
                    }
                  }
                  for (i = 1;; i = 0)
                  {
                    if ((i & ((DeviceAVFileMsgObserver)localObject3).a(uniseq)) == 0) {
                      break label999;
                    }
                    f = 1;
                    break;
                  }
                  f = 2;
                }
              }
              else if (msgtype == 61028)
              {
                if ("device_groupchat".equals(extStr))
                {
                  if (((QQMessageFacade.Message)localObject2).isSend()) {}
                  for (nickName = paramQQAppInterface.a().getString(2131367088);; nickName = ContactUtils.b(paramQQAppInterface, senderuin, true))
                  {
                    MsgUtils.a(paramContext, paramQQAppInterface, (QQMessageFacade.Message)localObject2, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type, localMsgSummary, nickName, true, false);
                    break;
                  }
                }
                MsgUtils.a(paramContext, paramQQAppInterface, (QQMessageFacade.Message)localObject2, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type, localMsgSummary, null, true, false);
                continue;
                if (localObject2 != null)
                {
                  i = msgtype;
                  if ((i == 62530) || (i == 60532)) {
                    break label1719;
                  }
                  a((QQMessageFacade.Message)localObject2, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type, paramQQAppInterface, paramContext, localMsgSummary);
                  if ((i == 63511) && (H > 0))
                  {
                    K = -881592;
                    jdField_c_of_type_JavaLangCharSequence = msg;
                    jdField_b_of_type_JavaLangCharSequence = "";
                  }
                }
                else
                {
                  localObject1 = null;
                  localObject3 = (PublicAccountDataManager)paramQQAppInterface.getManager(55);
                  if (localObject3 != null) {
                    localObject1 = ((PublicAccountDataManager)localObject3).b(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);
                  }
                  if ((localObject1 == null) && (localObject3 != null))
                  {
                    localObject3 = ((PublicAccountDataManager)localObject3).a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);
                    if (localObject3 != null) {
                      jdField_a_of_type_JavaLangString = name;
                    }
                    if (jdField_b_of_type_Boolean) {
                      jdField_a_of_type_JavaLangString = PublicAccountConfigUtil.b(paramQQAppInterface, paramQQAppInterface.a());
                    }
                  }
                  if (localObject1 == null) {
                    break label1901;
                  }
                  jdField_a_of_type_JavaLangString = name;
                  if (certifiedGrade <= 0L) {
                    break label1893;
                  }
                  I = 2130838643;
                }
                for (;;)
                {
                  if ((localObject2 == null) || (((QQMessageFacade.Message)localObject2).getMessageText() == null)) {
                    break label1909;
                  }
                  jdField_b_of_type_Long = time;
                  break;
                  jdField_c_of_type_JavaLangCharSequence = "";
                  K = 0;
                  if (!jdField_b_of_type_Boolean) {
                    break label1200;
                  }
                  localObject1 = ((QQMessageFacade)localObject5).a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type);
                  if ((localObject1 == null) || (!(localObject1 instanceof MessageForStructing))) {
                    break label1200;
                  }
                  localObject1 = (MessageForStructing)localObject1;
                  if (structingMsg == null) {
                    ((MessageForStructing)localObject1).parse();
                  }
                  if ((H > 0) && (structingMsg != null) && (!TextUtils.isEmpty(structingMsg.mOrangeWord)))
                  {
                    if (structingMsg.mOrangeWord.length() >= 8)
                    {
                      jdField_c_of_type_JavaLangCharSequence = ("[" + structingMsg.mOrangeWord.substring(0, 8) + "]");
                      K = paramContext.getResources().getColor(2131428234);
                    }
                  }
                  else
                  {
                    if ((extInt != 1) || (extLong != 1)) {
                      break label1200;
                    }
                    extLong = 0;
                    ThreadManager.a(new mib(this, paramQQAppInterface, (MessageForStructing)localObject1), 8, null, false);
                    if (TextUtils.isEmpty(structingMsg.mMsgActionData)) {
                      break label1711;
                    }
                    localObject3 = PublicAccountUtil.a(structingMsg.mMsgActionData);
                    if (localObject3 == null) {
                      break label1711;
                    }
                  }
                  for (;;)
                  {
                    try
                    {
                      l = Long.parseLong(((JSONObject)localObject3).getString("id"));
                      if (l != -1L) {
                        ReportController.b(null, "CliOper", "", "", "0X80066F3", "0X80066F3", 0, 0, String.valueOf(Q + 1), "", String.valueOf(l), "");
                      }
                      PublicAccountUtil.a(paramQQAppInterface, (MessageForStructing)localObject1, 7);
                    }
                    catch (Exception localException)
                    {
                      localException.printStackTrace();
                    }
                    jdField_c_of_type_JavaLangCharSequence = ("[" + structingMsg.mOrangeWord + "]");
                    break label1506;
                    long l = -1L;
                  }
                  jdField_b_of_type_JavaLangCharSequence = "";
                  localObject4 = XMLMessageUtils.a((MessageRecord)localObject2);
                  if ((localObject4 == null) || (items == null) || (items.size() == 0))
                  {
                    a((QQMessageFacade.Message)localObject2, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type, paramQQAppInterface, paramContext, localMsgSummary);
                    break label1200;
                  }
                  localObject1 = items.get(0)).title;
                  if ((items.get(0)).cover == null) && (items.get(0)).digestList != null)) {
                    localObject1 = (String)localObject1 + "：" + (String)items.get(0)).digestList.get(0);
                  }
                  for (;;)
                  {
                    jdField_b_of_type_JavaLangCharSequence = ((CharSequence)localObject1);
                    break;
                  }
                  I = 0;
                  continue;
                  I = 0;
                }
                jdField_b_of_type_Long = jdField_a_of_type_ComTencentMobileqqDataRecentUser.lastmsgtime;
              }
            }
          }
        }
      }
    case 1006: 
      label1893:
      label1901:
      label1909:
      localObject4 = ContactUtils.f(paramQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);
      localObject1 = (PhoneContactManager)paramQQAppInterface.getManager(10);
      if (localObject1 == null) {
        break;
      }
    }
    for (localObject1 = ((PhoneContactManager)localObject1).c(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);; localObject1 = null)
    {
      if (localObject1 != null) {
        jdField_a_of_type_JavaLangString = name;
      }
      for (;;)
      {
        a((QQMessageFacade.Message)localObject2, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type, paramQQAppInterface, paramContext, localMsgSummary);
        if ((localObject2 == null) || ((((QQMessageFacade.Message)localObject2).getMessageText() == null) && ((msgtype != 63525) || (msgData == null)) && ((msgtype != 60527) || (msgData == null)))) {
          break label2095;
        }
        jdField_b_of_type_Long = time;
        break;
        if (localObject4 != null) {
          jdField_a_of_type_JavaLangString = ContactUtils.b(paramQQAppInterface, (String)localObject4, true);
        } else {
          jdField_a_of_type_JavaLangString = jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin;
        }
      }
      label2095:
      jdField_b_of_type_Long = 0L;
      break;
      localObject1 = (CircleManager)paramQQAppInterface.getManager(34);
      localObject4 = ((CircleManager)localObject1).a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);
      if ((localObject1 != null) && (localObject4 != null)) {}
      for (jdField_a_of_type_JavaLangString = ((CircleManager)localObject1).a((CircleBuddy)localObject4);; jdField_a_of_type_JavaLangString = ContactUtils.b(paramQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, true))
      {
        a((QQMessageFacade.Message)localObject2, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type, paramQQAppInterface, paramContext, localMsgSummary);
        if ((localObject2 == null) || ((((QQMessageFacade.Message)localObject2).getMessageText() == null) && ((msgtype != 63525) || (msgData == null)) && ((msgtype != 60527) || (msgData == null)))) {
          break label2248;
        }
        jdField_b_of_type_Long = time;
        break;
      }
      label2248:
      jdField_b_of_type_Long = 0L;
      break;
      boolean bool = QvipSpecialCareManager.a(paramQQAppInterface.a() + jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);
      if ((H > 0) && (bool))
      {
        jdField_c_of_type_JavaLangCharSequence = paramContext.getString(2131370678);
        K = paramContext.getResources().getColor(2131428234);
        label2325:
        if (0 == 0) {
          localObject1 = (FriendsManager)paramQQAppInterface.getManager(50);
        }
        if (!a((FriendsManager)localObject1, jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin)) {
          break label2649;
        }
        G = 4;
        label2361:
        if ((localObject2 == null) || ((((QQMessageFacade.Message)localObject2).getMessageText() == null) && (msgData == null) && ((msgtype != 63525) || (jdField_a_of_type_ComTencentMobileqqDataRecentUser.type != 0)) && ((msgtype != 60527) || (jdField_a_of_type_ComTencentMobileqqDataRecentUser.type != 0)))) {
          break label2657;
        }
        jdField_b_of_type_Long = time;
        label2433:
        a((QQMessageFacade.Message)localObject2, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type, paramQQAppInterface, paramContext, localMsgSummary);
        if ((localObject2 != null) && (msgtype == 64502))
        {
          if (jdField_a_of_type_ComTencentMobileqqDataMessageForRichState == null) {
            jdField_a_of_type_ComTencentMobileqqDataMessageForRichState = new MessageForRichState();
          }
          jdField_a_of_type_ComTencentMobileqqDataMessageForRichStatemsg = msg;
          jdField_a_of_type_ComTencentMobileqqDataMessageForRichStatemIsParsed = false;
          jdField_a_of_type_ComTencentMobileqqDataMessageForRichState.parse();
          if (paramQQAppInterface.a().e(frienduin) >= jdField_a_of_type_ComTencentMobileqqDataMessageForRichStatetime) {
            break label2665;
          }
          jdField_c_of_type_JavaLangCharSequence = "[新签名]";
          K = paramContext.getResources().getColor(2131428234);
          label2549:
          jdField_a_of_type_Boolean = true;
        }
        if (!AppConstants.ap.equals(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin)) {
          break label2689;
        }
        jdField_a_of_type_JavaLangString = paramContext.getString(2131368846);
        H = SystemMsgController.a().b(paramQQAppInterface);
      }
      for (;;)
      {
        if ((localObject2 == null) || (msgtype != 63496)) {
          break label2941;
        }
        localObject1 = new MessageForApproval();
        msgData = msgData;
        jdField_b_of_type_JavaLangCharSequence = ((MessageForApproval)localObject1).getFullTitle();
        break;
        jdField_c_of_type_JavaLangCharSequence = "";
        break label2325;
        label2649:
        G = 1;
        break label2361;
        label2657:
        jdField_b_of_type_Long = 0L;
        break label2433;
        label2665:
        jdField_c_of_type_JavaLangCharSequence = "[签名]";
        K = paramContext.getResources().getColor(2131428212);
        break label2549;
        label2689:
        if (AppConstants.ar.equals(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin))
        {
          jdField_a_of_type_JavaLangString = paramContext.getString(2131368844);
        }
        else if (AppConstants.an.equals(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin))
        {
          jdField_a_of_type_JavaLangString = paramContext.getString(2131368886);
          if ((localObject2 != null) && (msg != null)) {
            jdField_b_of_type_JavaLangCharSequence = msg;
          }
        }
        else if (jdField_a_of_type_ComTencentMobileqqDataRecentUser.type == 1000)
        {
          localObject1 = (TroopManager)paramQQAppInterface.getManager(51);
          if (localObject1 != null)
          {
            localObject1 = ((TroopManager)localObject1).b(jdField_a_of_type_ComTencentMobileqqDataRecentUser.troopUin);
            jdField_a_of_type_JavaLangString = ContactUtils.a(paramQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, (String)localObject1, jdField_a_of_type_ComTencentMobileqqDataRecentUser.troopUin, true, null);
          }
        }
        else if (jdField_a_of_type_ComTencentMobileqqDataRecentUser.type == 1004)
        {
          jdField_a_of_type_JavaLangString = ContactUtils.c(paramQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataRecentUser.troopUin, jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);
          if ((jdField_a_of_type_JavaLangString != null) && (jdField_a_of_type_JavaLangString.equals(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin))) {
            jdField_a_of_type_JavaLangString = ContactUtils.b(paramQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, true);
          }
        }
        else
        {
          jdField_a_of_type_JavaLangString = ContactUtils.b(paramQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, true);
        }
      }
      label2941:
      if (msgtype == 63495)
      {
        localObject1 = paramContext.getString(2131371996);
        localObject2 = paramContext.getString(2131371997);
        jdField_b_of_type_JavaLangCharSequence = ((String)localObject1 + " " + (String)localObject2);
        break;
      }
      if ((localObject2 != null) && (msgtype == 63511))
      {
        if (H <= 0) {
          break label3118;
        }
        K = -881592;
        if (!bool) {
          break label3106;
        }
        jdField_c_of_type_JavaLangCharSequence += msg;
        label3068:
        jdField_b_of_type_JavaLangCharSequence = "";
      }
      while (jdField_a_of_type_ComTencentMobileqqDataRecentUser.type == 1024)
      {
        I = CrmUtils.a(paramQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);
        break;
        label3106:
        jdField_c_of_type_JavaLangCharSequence = msg;
        break label3068;
        label3118:
        jdField_c_of_type_JavaLangCharSequence = "";
      }
      jdField_a_of_type_JavaLangString = paramContext.getString(2131364475);
      localObject4 = "";
      localObject1 = null;
      if (localObject5 != null) {
        localObject1 = ((QQMessageFacade)localObject5).b(AppConstants.am, 4000);
      }
      if ((localObject1 != null) && (((List)localObject1).size() > 0))
      {
        localObject1 = (MessageRecord)((List)localObject1).get(((List)localObject1).size() - 1);
        if (msg != null) {
          if (msgtype == 64503)
          {
            localObject1 = msg;
            localObject1 = "好友推荐，" + (String)localObject1;
          }
        }
      }
      for (;;)
      {
        jdField_b_of_type_JavaLangCharSequence = ((CharSequence)localObject1);
        if ((localObject2 != null) && (((QQMessageFacade.Message)localObject2).getMessageText() != null))
        {
          jdField_b_of_type_Long = time;
          break;
          if (msgtype == 64506)
          {
            if ((PhoneContactManager)paramQQAppInterface.getManager(10) != null) {}
            localObject1 = "好友推荐，" + "";
            continue;
          }
          if (msgtype == 64497)
          {
            localObject1 = (RecommendTroopManagerImp)paramQQAppInterface.getManager(21);
            if (localObject1 == null) {
              break label3517;
            }
            localObject1 = paramContext.getResources().getString(2131364478) + ((RecommendTroopManagerImp)localObject1).a();
            continue;
          }
          if (msgtype != 64496) {
            break label3510;
          }
          localObject5 = (RecommendTroopManagerImp)paramQQAppInterface.getManager(21);
          localObject1 = localObject4;
          if (localObject5 != null) {
            localObject1 = ((RecommendTroopManagerImp)localObject5).a();
          }
          continue;
        }
        jdField_b_of_type_Long = 0L;
        break;
        label3441:
        if (H == 1)
        {
          paramQQAppInterface.append("有一条未读");
          break label335;
        }
        if (H == 2)
        {
          paramQQAppInterface.append("有两条未读");
          break label335;
        }
        if (H <= 0) {
          break label335;
        }
        paramQQAppInterface.append("有").append(H).append("条未读,");
        break label335;
        label3510:
        localObject1 = "";
        continue;
        label3517:
        localObject1 = "";
      }
    }
  }
}
