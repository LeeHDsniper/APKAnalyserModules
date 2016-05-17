package com.tencent.mobileqq.activity.recent.data;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.recent.MsgSummary;
import com.tencent.mobileqq.activity.recent.TimeManager;
import com.tencent.mobileqq.activity.recent.msg.AbstructRecentUserMsg;
import com.tencent.mobileqq.activity.recent.msg.TroopAtAllMsg;
import com.tencent.mobileqq.app.DiscussionHandler;
import com.tencent.mobileqq.app.DiscussionManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.app.message.MsgProxyUtils;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.data.DiscussionInfo;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.qphone.base.util.QLog;

public class RecentItemDiscussionMsgData
  extends RecentUserBaseData
{
  private static final String i = "RecentItemDiscussionMsgData";
  
  public RecentItemDiscussionMsgData(RecentUser paramRecentUser)
  {
    super(paramRecentUser);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private void a(Context paramContext)
  {
    if (amsg == null)
    {
      jdField_c_of_type_JavaLangCharSequence = "";
      jdField_c_of_type_JavaLangString = "";
    }
    for (;;)
    {
      return;
      if ((amsg instanceof AbstructRecentUserMsg))
      {
        AbstructRecentUserMsg localAbstructRecentUserMsg = (AbstructRecentUserMsg)amsg;
        jdField_c_of_type_JavaLangCharSequence = jdField_a_of_type_JavaLangString;
        jdField_c_of_type_JavaLangString = jdField_b_of_type_JavaLangString;
        if ((amsg instanceof TroopAtAllMsg)) {
          jdField_c_of_type_JavaLangString = String.format("与%s的会话，有全体消息", new Object[] { jdField_a_of_type_JavaLangString });
        }
      }
      for (int j = 2131428234; (!TextUtils.isEmpty(jdField_c_of_type_JavaLangCharSequence)) && (j > 0); j = 0)
      {
        K = paramContext.getResources().getColor(j);
        return;
      }
    }
  }
  
  public void a(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    Object localObject2 = null;
    if ((paramQQAppInterface == null) || (paramContext == null)) {
      return;
    }
    super.a(paramQQAppInterface, paramContext);
    Object localObject1 = paramQQAppInterface.a();
    if (localObject1 != null) {}
    for (localObject1 = ((QQMessageFacade)localObject1).a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type);; localObject1 = null)
    {
      if (localObject1 != null) {
        if ((istroop == 3000) && (msg == null) && (time == 0L)) {
          jdField_b_of_type_Long = jdField_a_of_type_ComTencentMobileqqDataRecentUser.lastmsgtime;
        }
      }
      for (;;)
      {
        Object localObject3 = paramQQAppInterface.a();
        if (localObject3 != null)
        {
          H = ((ConversationFacade)localObject3).a(frienduin, istroop);
          label125:
          localObject3 = (DiscussionManager)paramQQAppInterface.getManager(52);
          if (localObject3 != null) {
            localObject2 = ((DiscussionManager)localObject3).a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);
          }
          if ((H <= 0) || (!MsgProxyUtils.a(paramQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type))) {
            break label628;
          }
          G = 3;
          if ((localObject2 != null) || (TimeManager.a().b(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin))) {}
        }
        try
        {
          long l = Long.parseLong(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);
          ((DiscussionHandler)paramQQAppInterface.a(6)).a(l);
          TimeManager.a().a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, true);
          if ((localObject1 != null) && (!TextUtils.isEmpty(senderuin)))
          {
            if (senderuin.equals(frienduin)) {
              nickName = "";
            }
          }
          else
          {
            jdField_a_of_type_JavaLangString = ContactUtils.c(paramQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);
            if (TextUtils.isEmpty(jdField_a_of_type_JavaLangString)) {
              jdField_a_of_type_JavaLangString = ContactUtils.a(paramContext, (DiscussionInfo)localObject2);
            }
            MsgSummary localMsgSummary = a();
            a((QQMessageFacade.Message)localObject1, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type, paramQQAppInterface, paramContext, localMsgSummary);
            localObject2 = "";
            localObject1 = localObject2;
            if (localObject3 != null)
            {
              int j = ((DiscussionManager)localObject3).a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);
              localObject1 = localObject2;
              if (j > 0) {
                localObject1 = "(" + j + ")";
              }
            }
            jdField_a_of_type_JavaLangCharSequence = ((CharSequence)localObject1);
            a(paramQQAppInterface);
            a(paramQQAppInterface, localMsgSummary);
            a(paramQQAppInterface, paramContext, localMsgSummary);
            if (a) {
              break label739;
            }
            a(paramContext);
            paramQQAppInterface = a();
            if ((paramQQAppInterface != null) && (msg == null)) {
              paramQQAppInterface.reParse();
            }
            if (AppSetting.i)
            {
              if (jdField_a_of_type_JavaLangString == null) {
                break label772;
              }
              paramQQAppInterface = jdField_a_of_type_JavaLangString + "讨论组";
              paramContext = new StringBuilder();
              paramContext.append(paramQQAppInterface).append(",");
              if (H != 0) {
                break label778;
              }
              if (jdField_c_of_type_JavaLangCharSequence != null) {
                paramContext.append(jdField_c_of_type_JavaLangCharSequence + ",");
              }
              paramContext.append(jdField_b_of_type_JavaLangCharSequence).append(",").append(jdField_b_of_type_JavaLangString);
              jdField_c_of_type_JavaLangString = paramContext.toString();
            }
            d();
            return;
            jdField_b_of_type_Long = time;
            continue;
            H = 0;
            break label125;
            H = 0;
            jdField_b_of_type_Long = 0L;
            break label125;
            label628:
            G = 1;
          }
        }
        catch (NumberFormatException localNumberFormatException)
        {
          for (;;)
          {
            if (QLog.isColorLevel())
            {
              QLog.e("discussion", 2, localNumberFormatException.toString());
              continue;
              if (!TextUtils.isEmpty(frienduin)) {
                nickName = ContactUtils.c(paramQQAppInterface, frienduin, senderuin);
              }
              if (TextUtils.isEmpty(nickName)) {
                nickName = ContactUtils.b(paramQQAppInterface, senderuin, true);
              }
              if (TextUtils.isEmpty(nickName))
              {
                nickName = senderuin;
                continue;
                label739:
                if ((amsg instanceof AbstructRecentUserMsg))
                {
                  jdField_c_of_type_JavaLangCharSequence = amsg).jdField_a_of_type_JavaLangString;
                  continue;
                  label772:
                  paramQQAppInterface = "讨论组";
                  continue;
                  label778:
                  if (H == 1) {
                    paramContext.append("有一条未读");
                  } else if (H == 2) {
                    paramContext.append("有两条未读");
                  } else if (H > 0) {
                    paramContext.append("有").append(H).append("条未读,");
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
