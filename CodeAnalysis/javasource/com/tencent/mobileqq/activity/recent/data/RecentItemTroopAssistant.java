package com.tencent.mobileqq.activity.recent.data;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import com.tencent.biz.anonymous.AnonymousChatHelper;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.recent.MsgSummary;
import com.tencent.mobileqq.activity.recent.TimeManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.MsgProxyUtils;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.data.DraftSummaryInfo;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.data.TroopAssistantData;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.managers.TroopAssistantManager;
import com.tencent.mobileqq.text.QQText;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.MsgUtils;

public class RecentItemTroopAssistant
  extends RecentUserBaseData
{
  public RecentItemTroopAssistant(RecentUser paramRecentUser)
  {
    super(paramRecentUser);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    G = 0;
  }
  
  public void a(Context paramContext)
  {
    if (H > 0)
    {
      jdField_c_of_type_JavaLangCharSequence = String.format(paramContext.getString(2131370470), new Object[] { Integer.valueOf(H) });
      K = paramContext.getResources().getColor(2131428234);
      return;
    }
    jdField_c_of_type_JavaLangCharSequence = "";
  }
  
  public void a(QQAppInterface paramQQAppInterface)
  {
    F = 0;
    TroopAssistantData localTroopAssistantData = TroopAssistantManager.a().a(paramQQAppInterface);
    if ((localTroopAssistantData == null) || (TextUtils.isEmpty(troopUin))) {}
    do
    {
      return;
      paramQQAppInterface = paramQQAppInterface.a();
    } while (paramQQAppInterface == null);
    paramQQAppInterface = paramQQAppInterface.a(troopUin, 1);
    if ((paramQQAppInterface != null) && (!TextUtils.isEmpty(paramQQAppInterface.getSummary())))
    {
      F = 4;
      return;
    }
    F = 0;
  }
  
  public void a(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    if ((paramQQAppInterface == null) || (paramContext == null)) {
      return;
    }
    super.a(paramQQAppInterface, paramContext);
    if (TextUtils.isEmpty(jdField_a_of_type_JavaLangString)) {
      jdField_a_of_type_JavaLangString = paramContext.getString(2131369095);
    }
    QQMessageFacade localQQMessageFacade = paramQQAppInterface.a();
    TroopAssistantManager localTroopAssistantManager;
    Object localObject;
    if (localQQMessageFacade != null)
    {
      localTroopAssistantManager = TroopAssistantManager.a();
      localObject = localTroopAssistantManager.a(paramQQAppInterface);
      if (localObject != null) {
        localObject = localQQMessageFacade.a(troopUin, 1);
      }
    }
    for (;;)
    {
      MsgSummary localMsgSummary = a();
      if (localObject != null)
      {
        H = localTroopAssistantManager.a(localQQMessageFacade);
        jdField_b_of_type_Long = time;
        a((QQMessageFacade.Message)localObject, 1, paramQQAppInterface, paramContext, localMsgSummary);
        if ((jdField_b_of_type_Long > 0L) && (jdField_b_of_type_Long != 9223372036854775806L)) {
          jdField_b_of_type_JavaLangString = TimeManager.a().a(a(), jdField_b_of_type_Long);
        }
      }
      for (;;)
      {
        if ((TextUtils.isEmpty(jdField_b_of_type_JavaLangCharSequence)) && (TextUtils.isEmpty(jdField_c_of_type_JavaLangCharSequence)))
        {
          jdField_a_of_type_JavaLangCharSequence = null;
          jdField_b_of_type_JavaLangCharSequence = paramContext.getString(2131369096);
        }
        a(paramQQAppInterface);
        a(paramQQAppInterface, localMsgSummary);
        a(paramQQAppInterface, paramContext, localMsgSummary);
        a(paramContext);
        if ((TextUtils.isEmpty(jdField_c_of_type_JavaLangCharSequence)) && (localObject != null) && (localMsgSummary != null) && (AnonymousChatHelper.a((MessageRecord)localObject))) {
          jdField_b_of_type_JavaLangCharSequence = localMsgSummary.a(paramContext, paramContext.getResources().getString(2131364597), -1);
        }
        if (!AppSetting.i) {
          break;
        }
        if (H <= 0) {
          break label317;
        }
        jdField_c_of_type_JavaLangString = String.format("群助手,%d个群有新消息，%s。", new Object[] { Integer.valueOf(H), jdField_b_of_type_JavaLangString });
        return;
        H = 0;
        jdField_b_of_type_Long = 0L;
      }
      label317:
      jdField_c_of_type_JavaLangString = String.format("群助手,%s，%s。", new Object[] { jdField_b_of_type_JavaLangCharSequence, jdField_b_of_type_JavaLangString });
      return;
      localObject = null;
      continue;
      localTroopAssistantManager = null;
      localObject = null;
    }
  }
  
  protected void a(QQAppInterface paramQQAppInterface, Context paramContext, MsgSummary paramMsgSummary)
  {
    super.a(paramQQAppInterface, paramContext, paramMsgSummary);
    if (H > 0) {
      jdField_b_of_type_JavaLangCharSequence = "";
    }
  }
  
  public void a(QQAppInterface paramQQAppInterface, MsgSummary paramMsgSummary)
  {
    if (paramMsgSummary != null)
    {
      jdField_a_of_type_Boolean = false;
      d = null;
    }
    Object localObject = paramQQAppInterface.a();
    if (localObject == null) {}
    TroopAssistantData localTroopAssistantData;
    do
    {
      do
      {
        return;
        localTroopAssistantData = TroopAssistantManager.a().a(paramQQAppInterface);
      } while ((localTroopAssistantData == null) || (TextUtils.isEmpty(troopUin)) || (jdField_b_of_type_Long >= lastdrafttime));
      localObject = ((QQMessageFacade)localObject).a(troopUin, 1);
    } while ((localObject == null) || (TextUtils.isEmpty(((DraftSummaryInfo)localObject).getSummary())));
    jdField_b_of_type_Long = ((DraftSummaryInfo)localObject).getTime();
    jdField_a_of_type_Boolean = true;
    localObject = ((DraftSummaryInfo)localObject).getSummary();
    paramQQAppInterface = ContactUtils.a(paramQQAppInterface, troopUin, true);
    d = new QQText(paramQQAppInterface + ": " + (String)localObject, 3, 16);
  }
  
  protected void a(QQMessageFacade.Message paramMessage, int paramInt, QQAppInterface paramQQAppInterface, Context paramContext, MsgSummary paramMsgSummary)
  {
    String str = ContactUtils.a(paramQQAppInterface, frienduin, true);
    MsgUtils.a(paramContext, paramQQAppInterface, paramMessage, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type, paramMsgSummary, str, false, false);
    if ((istroop == 1) && (MsgProxyUtils.i(msgtype))) {
      jdField_a_of_type_JavaLangCharSequence = str;
    }
  }
}
