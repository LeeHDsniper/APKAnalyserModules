package com.tencent.mobileqq.activity.recent.data;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import com.tencent.biz.anonymous.AnonymousChatHelper;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.recent.MsgSummary;
import com.tencent.mobileqq.activity.recent.RecentBaseData;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.data.TroopAssistantData;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.utils.TroopNotificationHelper;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;

public class RecentTroopAssistantItem
  extends RecentBaseData
{
  public long a;
  private TroopAssistantData a;
  
  public RecentTroopAssistantItem(TroopAssistantData paramTroopAssistantData)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Long = 5L;
    if (paramTroopAssistantData == null) {
      throw new NullPointerException("TroopAssistantData is null");
    }
    jdField_a_of_type_ComTencentMobileqqDataTroopAssistantData = paramTroopAssistantData;
    G = 3;
  }
  
  public int a()
  {
    return 1;
  }
  
  public long a()
  {
    return jdField_a_of_type_ComTencentMobileqqDataTroopAssistantData.lastmsgtime;
  }
  
  public String a()
  {
    return jdField_a_of_type_ComTencentMobileqqDataTroopAssistantData.troopUin;
  }
  
  public void a(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    Object localObject2 = null;
    if ((paramQQAppInterface == null) || (paramContext == null)) {
      return;
    }
    String str = a();
    int i = a();
    Object localObject1 = paramQQAppInterface.a();
    if (localObject1 != null) {}
    for (QQMessageFacade.Message localMessage = ((QQMessageFacade)localObject1).a(str, i);; localMessage = null)
    {
      int j;
      if (localMessage != null)
      {
        jdField_b_of_type_Long = time;
        localObject1 = paramQQAppInterface.a();
        if (localObject1 != null)
        {
          H = ((ConversationFacade)localObject1).a(frienduin, istroop);
          if ((TroopNotificationHelper.a(str)) || (TroopNotificationHelper.d(str)))
          {
            jdField_c_of_type_JavaLangCharSequence = BaseApplicationImpl.getContext().getString(2131367486);
            K = paramContext.getResources().getColor(2131428234);
          }
          j = M;
          localObject1 = (TroopManager)paramQQAppInterface.getManager(51);
          if (localObject1 == null) {
            break label639;
          }
        }
      }
      label212:
      label565:
      label639:
      for (TroopInfo localTroopInfo = ((TroopManager)localObject1).a(str);; localTroopInfo = null)
      {
        if (localTroopInfo != null) {
          localObject2 = troopname;
        }
        for (localObject1 = troopmemo;; localObject1 = null)
        {
          M = (j & 0xF0FF | 0x100);
          if (TextUtils.isEmpty((CharSequence)localObject2))
          {
            jdField_a_of_type_JavaLangString = ContactUtils.a(paramQQAppInterface, str, true);
            MsgSummary localMsgSummary = a();
            if ((localMessage != null) && (TextUtils.isEmpty(nickName))) {
              nickName = senderuin;
            }
            a(localMessage, i, paramQQAppInterface, paramContext, localMsgSummary);
            if ((TextUtils.isEmpty(jdField_b_of_type_JavaLangCharSequence)) && (TextUtils.isEmpty(jdField_c_of_type_JavaLangCharSequence)))
            {
              localObject2 = localObject1;
              if (localObject1 == null) {
                localObject2 = "";
              }
              jdField_b_of_type_JavaLangCharSequence = ((CharSequence)localObject2);
            }
            a(paramQQAppInterface);
            a(paramQQAppInterface, localMsgSummary);
            a(paramQQAppInterface, paramContext, localMsgSummary);
            if ((TextUtils.isEmpty(jdField_c_of_type_JavaLangCharSequence)) && (localMessage != null) && (localMsgSummary != null) && (AnonymousChatHelper.a(localMessage))) {
              jdField_b_of_type_JavaLangCharSequence = localMsgSummary.a(paramContext, paramContext.getResources().getString(2131364597), -1);
            }
            if (localTroopInfo != null)
            {
              jdField_a_of_type_Long = troopCreditLevel;
              if (jdField_a_of_type_Long == 0L) {
                jdField_a_of_type_Long = 5L;
              }
              if (QLog.isColorLevel()) {
                QLog.i("troop.credit.act", 2, "RecentTroopAssistantItem->update," + str + "," + jdField_a_of_type_Long);
              }
            }
            if (!AppSetting.i) {
              break;
            }
            paramQQAppInterface = new StringBuilder(24);
            paramQQAppInterface.append(jdField_a_of_type_JavaLangString);
            if (H != 0) {
              break label565;
            }
          }
          for (;;)
          {
            if (jdField_c_of_type_JavaLangCharSequence != null) {
              paramQQAppInterface.append(jdField_c_of_type_JavaLangCharSequence + ",");
            }
            paramQQAppInterface.append(jdField_b_of_type_JavaLangCharSequence).append(' ').append(jdField_b_of_type_JavaLangString);
            jdField_c_of_type_JavaLangString = paramQQAppInterface.toString();
            return;
            H = 0;
            break;
            jdField_b_of_type_Long = 0L;
            H = 0;
            break;
            jdField_a_of_type_JavaLangString = ((String)localObject2);
            break label212;
            if (H == 1) {
              paramQQAppInterface.append("有一条未读");
            } else if (H == 2) {
              paramQQAppInterface.append("有两条未读");
            } else if (H > 0) {
              paramQQAppInterface.append("有").append(H).append("条未读");
            }
          }
        }
      }
    }
  }
  
  public boolean a()
  {
    return false;
  }
  
  public long b()
  {
    return jdField_a_of_type_ComTencentMobileqqDataTroopAssistantData.lastdrafttime;
  }
  
  public long c()
  {
    return jdField_a_of_type_Long;
  }
}
