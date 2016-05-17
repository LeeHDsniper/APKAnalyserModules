package com.tencent.mobileqq.activity.recent.data;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.recent.MsgSummary;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.app.message.MsgProxyUtils;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.data.MessageForNearbyRecommenderTips;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.dating.DatingUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.MsgUtils;
import com.tencent.qphone.base.util.QLog;

public class RecentItemMsgBox
  extends RecentUserBaseData
{
  private QQMessageFacade.Message a;
  
  public RecentItemMsgBox(RecentUser paramRecentUser)
  {
    super(paramRecentUser);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    if ((paramQQAppInterface == null) || (paramContext == null)) {
      return;
    }
    super.a(paramQQAppInterface, paramContext);
    Object localObject1 = null;
    QQMessageFacade localQQMessageFacade = paramQQAppInterface.a();
    if (localQQMessageFacade != null) {
      localObject1 = localQQMessageFacade.a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type);
    }
    ConversationFacade localConversationFacade = paramQQAppInterface.a();
    if ((localConversationFacade != null) && (localObject1 != null))
    {
      H = localConversationFacade.a(frienduin, istroop);
      if (localObject1 != null) {
        break label2014;
      }
      if (jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$Message == null) {
        jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$Message = new QQMessageFacade.Message();
      }
      localObject1 = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade$Message;
      localObject3 = localObject1;
      if (QLog.isColorLevel()) {
        QLog.i("Q.recent", 2, "msg is null: " + jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin + "," + jdField_a_of_type_ComTencentMobileqqDataRecentUser.type);
      }
    }
    label281:
    label306:
    label438:
    label505:
    label546:
    label686:
    label848:
    label912:
    label1042:
    label1290:
    label1293:
    label1370:
    label1389:
    label1551:
    label1553:
    label1927:
    label1933:
    String str;
    label1940:
    label1952:
    label1998:
    label2005:
    label2014:
    for (Object localObject3 = localObject1;; localObject3 = str)
    {
      MsgSummary localMsgSummary = a();
      localObject1 = null;
      Object localObject2;
      if (!TextUtils.isEmpty(senderuin))
      {
        localObject2 = senderuin;
        if ((!AppConstants.aq.equals(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin)) && (!AppConstants.aG.equals(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin)))
        {
          localObject1 = localObject2;
          if (!AppConstants.af.equals(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin)) {}
        }
        else
        {
          if (!AppConstants.af.equals(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin)) {
            break label912;
          }
          localObject1 = ContactUtils.b(paramQQAppInterface, senderuin, true);
        }
      }
      int k;
      int m;
      int i1;
      int n;
      int j;
      int i;
      if ((((QQMessageFacade.Message)localObject3).getMessageText() != null) || (msgData != null))
      {
        jdField_b_of_type_Long = time;
        k = 0;
        m = 0;
        i1 = 0;
        n = 0;
        j = m;
        i = k;
        if (!AppConstants.aq.equals(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin)) {
          break label2005;
        }
        j = m;
        i = k;
        if (localConversationFacade == null) {
          break label2005;
        }
        if (((QQMessageFacade.Message)localObject3).isSend()) {
          break label1042;
        }
        m = localConversationFacade.e(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, 1001);
        j = m;
        i = k;
        if (m != 0) {
          break label2005;
        }
        k = localConversationFacade.d(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, 1001);
        j = m;
        i = k;
        if (k > 0) {
          break label2005;
        }
        i = localConversationFacade.a((MessageRecord)localObject3);
        j = m;
        m = k;
        k = i;
      }
      for (;;)
      {
        if (j > 0)
        {
          jdField_c_of_type_JavaLangCharSequence = paramContext.getResources().getString(2131371653);
          K = paramContext.getResources().getColor(2131428234);
          b = localConversationFacade.a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, 1001, paramContext.getResources().getString(2131371654), 0);
          i = 0;
          localObject1 = "";
          if ((msgtype != 64512) && (msgtype != 61525) && (i <= 0) && (j <= 0) && (m <= 0) && (k <= 0)) {
            break label1293;
          }
          if (!AppConstants.aq.equals(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin)) {
            break label1553;
          }
          if (msgtype != 61525) {
            break label1389;
          }
          jdField_a_of_type_JavaLangString = paramContext.getString(2131368009);
        }
        try
        {
          localObject1 = new MessageForNearbyRecommenderTips();
          msgData = msgData;
          ((MessageForNearbyRecommenderTips)localObject1).parse();
          b = paramContext.getResources().getString(2131371202);
          if ((strBrief != null) && (!"".equals(strBrief))) {
            b = strBrief;
          }
          if (readFlag) {
            break label1370;
          }
          jdField_c_of_type_JavaLangCharSequence = paramContext.getResources().getString(2131371203);
          K = paramContext.getResources().getColor(2131428234);
        }
        catch (Exception localException)
        {
          for (;;)
          {
            localException.printStackTrace();
          }
        }
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg_box", 2, "recent item update:[uin:" + jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin + ",type:" + jdField_a_of_type_ComTencentMobileqqDataRecentUser.type + ",sayHelloNum:" + i + ",unreadNum:" + H + ",unReadRedPacketCount:" + j + "]");
        }
        a(paramQQAppInterface);
        a(paramQQAppInterface, localMsgSummary);
        a(paramQQAppInterface, paramContext, localMsgSummary);
        if (AppSetting.i)
        {
          paramContext = b;
          paramQQAppInterface = paramContext;
          if (TextUtils.isEmpty(paramContext)) {
            paramQQAppInterface = jdField_c_of_type_JavaLangCharSequence;
          }
          paramContext = paramQQAppInterface;
          if (paramQQAppInterface == null) {
            paramContext = "";
          }
          if (H <= 0) {
            break label1940;
          }
          if (jdField_a_of_type_JavaLangString == null) {
            break label1927;
          }
          paramQQAppInterface = jdField_a_of_type_JavaLangString;
          if (jdField_b_of_type_JavaLangString == null) {
            break label1933;
          }
        }
        for (localObject1 = jdField_b_of_type_JavaLangString;; str = "")
        {
          paramQQAppInterface = String.format("%s,%s,%d条未读,%s", new Object[] { paramQQAppInterface, localObject1, Integer.valueOf(H), paramContext });
          jdField_c_of_type_JavaLangString = paramQQAppInterface;
          d();
          return;
          H = 0;
          break;
          if (MsgProxyUtils.c(senderuin))
          {
            localObject1 = localObject2;
            if (localQQMessageFacade == null) {
              break label281;
            }
            QQMessageFacade.Message localMessage = localQQMessageFacade.a(senderuin, istroop);
            localObject1 = localObject2;
            if (localMessage == null) {
              break label281;
            }
            localObject2 = ContactUtils.o(paramQQAppInterface, senderuin);
            localObject1 = localObject2;
            if (!TextUtils.isEmpty((CharSequence)localObject2)) {
              break label281;
            }
            localObject1 = ContactUtils.b(paramQQAppInterface, senderuin, false);
            break label281;
          }
          localObject2 = ContactUtils.o(paramQQAppInterface, senderuin);
          localObject1 = localObject2;
          if (!TextUtils.isEmpty((CharSequence)localObject2)) {
            break label281;
          }
          localObject1 = ContactUtils.b(paramQQAppInterface, senderuin, false);
          break label281;
          jdField_b_of_type_Long = 0L;
          break label306;
          k = localConversationFacade.a((MessageRecord)localObject3);
          j = 0;
          m = 0;
          break label438;
          if ((m > 0) || (k > 0))
          {
            if (m > 0)
            {
              jdField_c_of_type_JavaLangCharSequence = paramContext.getString(2131371712, new Object[] { Integer.valueOf(m) });
              K = paramContext.getResources().getColor(2131428234);
              i = 0;
              localObject1 = "";
              break label505;
            }
            i = i1;
            if (k <= 0) {
              break label1290;
            }
            localObject2 = localObject1;
            if (TextUtils.isEmpty((CharSequence)localObject1)) {
              localObject2 = "";
            }
            if ((localObject3 != null) && (!((QQMessageFacade.Message)localObject3).isSend())) {}
            for (jdField_c_of_type_JavaLangCharSequence = paramContext.getString(2131371714, new Object[] { localObject2, Integer.valueOf(k) });; jdField_c_of_type_JavaLangCharSequence = paramContext.getString(2131371715, new Object[] { Integer.valueOf(k) }))
            {
              K = paramContext.getResources().getColor(2131428212);
              i = 0;
              localObject1 = "";
              break;
            }
          }
          i = n;
          if (localConversationFacade != null) {
            i = localConversationFacade.b(istroop);
          }
          if (i > 0)
          {
            jdField_c_of_type_JavaLangCharSequence = paramContext.getString(2131371726);
            K = paramContext.getResources().getColor(2131428234);
            break label505;
          }
          jdField_c_of_type_JavaLangCharSequence = "";
          break label505;
          boolean bool = false;
          if (AppConstants.aq.equals(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin)) {
            bool = true;
          }
          if (((QQMessageFacade.Message)localObject3).isSend())
          {
            MsgUtils.a(paramContext, paramQQAppInterface, (QQMessageFacade.Message)localObject3, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type, localMsgSummary, null, bool, false);
            break label546;
          }
          MsgUtils.a(paramContext, paramQQAppInterface, (QQMessageFacade.Message)localObject3, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type, localMsgSummary, (String)localObject1, bool, false);
          break label546;
          jdField_c_of_type_JavaLangCharSequence = "";
          break label686;
          jdField_a_of_type_JavaLangString = paramContext.getString(2131368009);
          if (localQQMessageFacade != null)
          {
            G = 1;
            H = localConversationFacade.a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type);
            if ((H <= 0) && (localConversationFacade != null))
            {
              H = localConversationFacade.a(AppConstants.aN, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type);
              G = 3;
            }
          }
          if ((!TextUtils.isEmpty(localException)) || (j > 0)) {
            if (!((QQMessageFacade.Message)localObject3).isSendFromLocal()) {}
          }
          for (;;)
          {
            if ((m <= 0) && (k <= 0)) {
              break label1551;
            }
            b = "";
            break;
            if ((localException != null) && (localException.equals(senderuin)))
            {
              paramContext.getString(2131368562);
              continue;
              b = paramContext.getString(2131368010);
            }
          }
          break label686;
          if (AppConstants.aG.equals(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin))
          {
            jdField_a_of_type_JavaLangString = paramContext.getString(2131371367);
            if (localQQMessageFacade != null)
            {
              G = 1;
              H = localConversationFacade.a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type);
              if ((H <= 0) && (localConversationFacade != null))
              {
                H = localConversationFacade.a(AppConstants.aO, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type);
                G = 3;
              }
            }
            if ((msg == null) || (64537 == msgtype))
            {
              b = paramContext.getString(2131371368);
              localObject2 = localException;
            }
            for (;;)
            {
              DatingUtil.a("data_recent_msg", new Object[] { localObject2, b });
              break;
              localObject2 = localException;
              if (msgtype == 64512)
              {
                localObject2 = localException;
                if (localException != null)
                {
                  localObject2 = localException;
                  if (localException.length() > 12) {
                    localObject2 = localException.substring(0, 11) + "...";
                  }
                }
                if (((QQMessageFacade.Message)localObject3).isSendFromLocal()) {
                  b = paramContext.getString(2131371438, new Object[] { localObject2 });
                } else {
                  b = paramContext.getString(2131371439, new Object[] { localObject2 });
                }
              }
            }
          }
          if (AppConstants.af.equals(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin))
          {
            jdField_a_of_type_JavaLangString = paramContext.getString(2131368017);
            if (localQQMessageFacade != null) {
              H = localQQMessageFacade.g();
            }
            if ((64537 != msgtype) && (msg != null)) {
              break label686;
            }
            b = paramContext.getString(2131368018);
            break label686;
          }
          jdField_a_of_type_JavaLangString = ContactUtils.b(paramQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, true);
          break label686;
          paramQQAppInterface = "";
          break label848;
        }
        if (jdField_a_of_type_JavaLangString != null)
        {
          paramQQAppInterface = jdField_a_of_type_JavaLangString;
          if (jdField_b_of_type_JavaLangString == null) {
            break label1998;
          }
        }
        for (str = jdField_b_of_type_JavaLangString;; str = "")
        {
          paramQQAppInterface = String.format("%s,%s,%s", new Object[] { paramQQAppInterface, str, paramContext });
          break;
          paramQQAppInterface = "";
          break label1952;
        }
        k = 0;
        m = i;
      }
    }
  }
}
