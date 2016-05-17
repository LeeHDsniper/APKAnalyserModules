package com.tencent.mobileqq.activity.recent.data;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.recent.MsgSummary;
import com.tencent.mobileqq.activity.recent.RecentBaseData;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.app.message.MsgProxyUtils;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.data.DraftSummaryInfo;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.dating.FansEntity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.text.QQText;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.qphone.base.util.QLog;

public class RecentSayHelloListItem
  extends RecentBaseData
{
  public int R;
  public int S;
  public int T;
  public int U;
  public int V;
  public int W;
  public int X;
  MessageRecord a;
  public boolean a;
  public boolean b;
  public boolean c;
  public String i;
  
  public RecentSayHelloListItem(MessageRecord paramMessageRecord)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    R = -1;
    S = -1;
    T = -1;
    U = -1;
    V = -1;
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
    jdField_c_of_type_Boolean = false;
    if (paramMessageRecord == null) {
      throw new NullPointerException("RecentDatingBoxItem data is null");
    }
    jdField_a_of_type_ComTencentMobileqqDataMessageRecord = paramMessageRecord;
  }
  
  public int a()
  {
    return jdField_a_of_type_ComTencentMobileqqDataMessageRecord.istroop;
  }
  
  public long a()
  {
    return jdField_a_of_type_ComTencentMobileqqDataMessageRecord.time;
  }
  
  public String a()
  {
    return jdField_a_of_type_ComTencentMobileqqDataMessageRecord.senderuin;
  }
  
  public void a(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    Object localObject1 = null;
    Object localObject3 = paramQQAppInterface.a();
    Object localObject2 = paramQQAppInterface.a();
    if (localObject3 != null) {
      localObject1 = ((QQMessageFacade)localObject3).a(a(), a());
    }
    label91:
    int m;
    int k;
    int j;
    if (localObject1 != null)
    {
      jdField_b_of_type_Long = time;
      if ((localObject2 != null) && (localObject1 != null))
      {
        H = ((ConversationFacade)localObject2).a(frienduin, istroop);
        if (MsgProxyUtils.c((MessageRecord)localObject1)) {
          G = 3;
        }
        localObject3 = super.a();
        jdField_a_of_type_Boolean = false;
        K = 0;
        jdField_c_of_type_JavaLangCharSequence = null;
        if ((localObject2 == null) || (localObject1 == null)) {
          break label709;
        }
        if (((QQMessageFacade.Message)localObject1).isSend()) {
          break label444;
        }
        m = ((ConversationFacade)localObject2).e(a(), 1001);
        if (m != 0) {
          break label701;
        }
        k = ((ConversationFacade)localObject2).d(a(), 1001);
        if (k > 0) {
          break label696;
        }
        j = ((ConversationFacade)localObject2).a((MessageRecord)localObject1);
      }
    }
    for (;;)
    {
      label176:
      if (m > 0)
      {
        jdField_c_of_type_JavaLangCharSequence = paramContext.getResources().getString(2131371653);
        K = paramContext.getResources().getColor(2131428234);
        jdField_b_of_type_JavaLangCharSequence = ((ConversationFacade)localObject2).a(a(), 1001, paramContext.getResources().getString(2131371654), 0);
        label234:
        localObject2 = ContactUtils.o(paramQQAppInterface, a());
        localObject1 = localObject2;
        if (TextUtils.isEmpty((CharSequence)localObject2)) {
          localObject1 = ContactUtils.b(paramQQAppInterface, a(), false);
        }
        localObject2 = localObject1;
        if (TextUtils.isEmpty((CharSequence)localObject1)) {
          localObject2 = a();
        }
        jdField_a_of_type_JavaLangString = ((String)localObject2);
        if (a() != 7100) {
          break label623;
        }
        I = 2130838643;
        label307:
        super.a(paramQQAppInterface);
        a(paramQQAppInterface, (MsgSummary)localObject3);
        super.a(paramQQAppInterface, paramContext, (MsgSummary)localObject3);
        if (AppSetting.i)
        {
          paramQQAppInterface = new StringBuilder(24);
          paramQQAppInterface.append(jdField_a_of_type_JavaLangString);
          if (H != 0) {
            break label631;
          }
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
        H = 0;
        jdField_b_of_type_Long = 0L;
        break label91;
        label444:
        j = ((ConversationFacade)localObject2).a((MessageRecord)localObject1);
        k = 0;
        m = 0;
        break label176;
        if ((k > 0) || (j > 0))
        {
          if (k > 0)
          {
            jdField_a_of_type_Boolean = true;
            jdField_c_of_type_JavaLangCharSequence = paramContext.getString(2131371713, new Object[] { "", Integer.valueOf(k) });
            K = paramContext.getResources().getColor(2131428234);
            break label234;
          }
          if (j <= 0) {
            break label234;
          }
          jdField_a_of_type_Boolean = true;
          K = paramContext.getResources().getColor(2131428212);
          if (!((QQMessageFacade.Message)localObject1).isSend())
          {
            jdField_c_of_type_JavaLangCharSequence = paramContext.getString(2131371713, new Object[] { "", Integer.valueOf(j) });
            break label234;
          }
          jdField_c_of_type_JavaLangCharSequence = paramContext.getString(2131371715, new Object[] { Integer.valueOf(j) });
          break label234;
        }
        super.a((QQMessageFacade.Message)localObject1, a(), paramQQAppInterface, paramContext, (MsgSummary)localObject3);
        break label234;
        label623:
        I = 0;
        break label307;
        label631:
        if (H == 1) {
          paramQQAppInterface.append("有一条未读");
        } else if (H == 2) {
          paramQQAppInterface.append("有两条未读");
        } else if (H > 0) {
          paramQQAppInterface.append("有").append(H).append("条未读");
        }
      }
      label696:
      j = 0;
      continue;
      label701:
      j = 0;
      k = 0;
      continue;
      label709:
      m = 0;
      j = 0;
      k = 0;
    }
  }
  
  public void a(QQAppInterface paramQQAppInterface, MsgSummary paramMsgSummary)
  {
    if (paramMsgSummary != null)
    {
      jdField_a_of_type_Boolean = false;
      d = null;
    }
    paramQQAppInterface = paramQQAppInterface.a();
    if (paramQQAppInterface == null) {}
    long l;
    do
    {
      do
      {
        return;
        paramQQAppInterface = paramQQAppInterface.a(a(), a());
      } while ((paramQQAppInterface == null) || (TextUtils.isEmpty(paramQQAppInterface.getSummary())));
      l = paramQQAppInterface.getTime();
    } while (jdField_b_of_type_Long > l);
    jdField_b_of_type_Long = l;
    jdField_a_of_type_Boolean = true;
    d = new QQText(paramQQAppInterface.getSummary(), 3, 16);
  }
  
  public boolean a(FansEntity paramFansEntity)
  {
    boolean bool = false;
    if ((S != age) || (T != gender) || (U != career) || (V != constellation) || (R != vip) || (jdField_b_of_type_Boolean != charmIcon) || (W != charmLevel) || (X != commonId) || (!Utils.a(i, common)))
    {
      S = age;
      T = gender;
      U = career;
      V = constellation;
      R = vip;
      jdField_b_of_type_Boolean = charmIcon;
      jdField_c_of_type_Boolean = true;
      W = charmLevel;
      X = commonId;
      i = common;
      bool = true;
    }
    if (QLog.isDevelopLevel()) {
      QLog.d("Q.msg_box", 4, "haveChange:" + bool + ",FansEntity:" + paramFansEntity.toString());
    }
    return bool;
  }
  
  public long b()
  {
    return 0L;
  }
}
