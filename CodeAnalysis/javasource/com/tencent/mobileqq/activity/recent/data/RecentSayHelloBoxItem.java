package com.tencent.mobileqq.activity.recent.data;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.recent.MsgSummary;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.app.message.MsgProxy;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.MsgUtils;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class RecentSayHelloBoxItem
  extends RecentMsgBoxItem
{
  private static final int R = 6;
  public List a;
  public boolean b;
  
  public RecentSayHelloBoxItem(MessageRecord paramMessageRecord)
  {
    super(paramMessageRecord);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_b_of_type_Boolean = false;
    jdField_a_of_type_JavaUtilList = new ArrayList(6);
  }
  
  public void a(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    if ((paramQQAppInterface == null) || (paramContext == null)) {
      return;
    }
    Object localObject2 = paramQQAppInterface.a(a()).a(a(), a());
    Object localObject1 = paramQQAppInterface.a();
    int i;
    Object localObject3;
    int k;
    int j;
    if (localObject2 == null)
    {
      i = 0;
      jdField_a_of_type_JavaUtilList.clear();
      H = ((ConversationFacade)localObject1).a(a(), a());
      if (i > 0)
      {
        localObject2 = ((List)localObject2).iterator();
        do
        {
          if (!((Iterator)localObject2).hasNext()) {
            break;
          }
          localObject3 = (MessageRecord)((Iterator)localObject2).next();
          if ((((ConversationFacade)localObject1).a(senderuin, istroop) > 0) && (jdField_a_of_type_JavaUtilList.size() < 6)) {
            jdField_a_of_type_JavaUtilList.add(localObject3);
          }
        } while (jdField_a_of_type_JavaUtilList.size() < 6);
      }
      if ((H == 0) && (!jdField_a_of_type_JavaUtilList.isEmpty())) {
        jdField_a_of_type_JavaUtilList.clear();
      }
      G = 3;
      jdField_b_of_type_JavaLangCharSequence = "";
      K = 0;
      jdField_c_of_type_JavaLangCharSequence = "";
      localObject2 = null;
      localObject3 = paramQQAppInterface.a();
      if (localObject3 != null) {
        localObject2 = ((QQMessageFacade)localObject3).a(a(), a());
      }
      if (localObject2 == null) {
        break label990;
      }
      if (((QQMessageFacade.Message)localObject2).isSend()) {
        break label573;
      }
      k = ((ConversationFacade)localObject1).e(a(), 1001);
      if (k != 0) {
        break label982;
      }
      j = ((ConversationFacade)localObject1).d(a(), 1001);
      if (j > 0) {
        break label977;
      }
      i = ((ConversationFacade)localObject1).a((MessageRecord)localObject2);
    }
    for (;;)
    {
      label300:
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg_box", 2, "boxUin" + a() + ",boxType" + a() + ",unreadNum:" + H + ",unReadGiftCount:" + j + ",lastMsgReadedGiftCount:" + i + ",unReadRedPacketCount:" + k);
      }
      if (k > 0)
      {
        jdField_c_of_type_JavaLangCharSequence = paramContext.getResources().getString(2131371653);
        K = paramContext.getResources().getColor(2131428234);
        localObject2 = a();
        jdField_b_of_type_JavaLangCharSequence = ((ConversationFacade)localObject1).a(a(), 1001, paramContext.getResources().getString(2131371654), 0);
        a(paramQQAppInterface, (MsgSummary)localObject2);
        a(paramQQAppInterface, paramContext, (MsgSummary)localObject2);
      }
      for (;;)
      {
        label466:
        if (AppSetting.i)
        {
          paramQQAppInterface = new StringBuilder(24);
          paramQQAppInterface.append(jdField_a_of_type_JavaLangString);
          if (H != 0) {
            break label905;
          }
          label498:
          if (jdField_c_of_type_JavaLangCharSequence != null) {
            paramQQAppInterface.append(jdField_c_of_type_JavaLangCharSequence + ",");
          }
          paramQQAppInterface.append(jdField_b_of_type_JavaLangCharSequence).append(' ').append(jdField_b_of_type_JavaLangString);
          jdField_c_of_type_JavaLangString = paramQQAppInterface.toString();
          return;
          i = ((List)localObject2).size();
          break;
          label573:
          i = ((ConversationFacade)localObject1).a((MessageRecord)localObject2);
          j = 0;
          k = 0;
          break label300;
          if ((j > 0) || (i > 0))
          {
            if (j > 0)
            {
              jdField_b_of_type_Boolean = true;
              G = 1;
              jdField_c_of_type_JavaLangCharSequence = paramContext.getString(2131371712, new Object[] { Integer.valueOf(j) });
              K = paramContext.getResources().getColor(2131428234);
            }
            else if (i > 0)
            {
              jdField_b_of_type_Boolean = true;
              localObject1 = "";
              if (localObject2 != null)
              {
                localObject3 = ContactUtils.o(paramQQAppInterface, senderuin);
                localObject1 = localObject3;
                if (TextUtils.isEmpty((CharSequence)localObject3)) {
                  localObject1 = ContactUtils.b(paramQQAppInterface, senderuin, false);
                }
              }
              paramQQAppInterface = (QQAppInterface)localObject1;
              if (TextUtils.isEmpty((CharSequence)localObject1)) {
                paramQQAppInterface = "";
              }
              if (!((QQMessageFacade.Message)localObject2).isSend()) {}
              for (jdField_c_of_type_JavaLangCharSequence = paramContext.getString(2131371714, new Object[] { paramQQAppInterface, Integer.valueOf(i) });; jdField_c_of_type_JavaLangCharSequence = paramContext.getString(2131371715, new Object[] { Integer.valueOf(i) }))
              {
                K = paramContext.getResources().getColor(2131428212);
                break;
              }
            }
          }
          else if (H > 0)
          {
            jdField_b_of_type_JavaLangCharSequence = "";
          }
          else
          {
            localObject1 = null;
            if (localObject2 != null)
            {
              localObject3 = ContactUtils.o(paramQQAppInterface, senderuin);
              localObject1 = localObject3;
              if (TextUtils.isEmpty((CharSequence)localObject3)) {
                localObject1 = ContactUtils.b(paramQQAppInterface, senderuin, false);
              }
              if (!TextUtils.isEmpty((CharSequence)localObject1)) {
                break label974;
              }
              localObject1 = "";
            }
          }
        }
      }
      label905:
      label974:
      for (;;)
      {
        localObject3 = a();
        MsgUtils.a(paramContext, paramQQAppInterface, (QQMessageFacade.Message)localObject2, a(), (MsgSummary)localObject3, (String)localObject1, false, false);
        a(paramQQAppInterface, (MsgSummary)localObject3);
        a(paramQQAppInterface, paramContext, (MsgSummary)localObject3);
        break label466;
        break;
        if (H == 1)
        {
          paramQQAppInterface.append("有一条未读");
          break label498;
        }
        if (H == 2)
        {
          paramQQAppInterface.append("有两条未读");
          break label498;
        }
        if (H <= 0) {
          break label498;
        }
        paramQQAppInterface.append("有").append(H).append("条未读");
        break label498;
      }
      label977:
      i = 0;
      continue;
      label982:
      i = 0;
      j = 0;
      continue;
      label990:
      k = 0;
      i = 0;
      j = 0;
    }
  }
}
