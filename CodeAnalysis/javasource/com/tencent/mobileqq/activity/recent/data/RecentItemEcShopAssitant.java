package com.tencent.mobileqq.activity.recent.data;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.text.TextUtils;
import com.tencent.biz.pubaccount.ecshopassit.EcShopAssistantManager;
import com.tencent.biz.pubaccount.ecshopassit.EcShopData;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.aio.XMLMessageUtils;
import com.tencent.mobileqq.activity.recent.MsgSummary;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.data.DraftSummaryInfo;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.PAMessage;
import com.tencent.mobileqq.data.PAMessage.Item;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.text.QQText;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.MsgUtils;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.List;

public class RecentItemEcShopAssitant
  extends RecentUserBaseData
{
  public RecentItemEcShopAssitant(RecentUser paramRecentUser)
  {
    super(paramRecentUser);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    G = 2;
  }
  
  public void a(Context paramContext)
  {
    if (H > 0)
    {
      if (H > 99) {}
      for (jdField_c_of_type_JavaLangCharSequence = paramContext.getString(2131364366);; jdField_c_of_type_JavaLangCharSequence = String.format(paramContext.getString(2131364365), new Object[] { Integer.valueOf(H) }))
      {
        K = paramContext.getResources().getColor(2131428234);
        return;
      }
    }
    jdField_c_of_type_JavaLangCharSequence = "";
  }
  
  public void a(QQAppInterface paramQQAppInterface)
  {
    F = 0;
    EcShopData localEcShopData = ((EcShopAssistantManager)paramQQAppInterface.getManager(87)).a();
    if ((localEcShopData == null) || (TextUtils.isEmpty(mUin))) {}
    do
    {
      return;
      paramQQAppInterface = paramQQAppInterface.a();
    } while (paramQQAppInterface == null);
    paramQQAppInterface = paramQQAppInterface.a(mUin, 1008);
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
      jdField_a_of_type_JavaLangString = paramContext.getString(2131371694);
    }
    if (!TextUtils.isEmpty(EcShopAssistantManager.m)) {
      jdField_a_of_type_JavaLangString = EcShopAssistantManager.m;
    }
    Object localObject2 = null;
    EcShopAssistantManager localEcShopAssistantManager = (EcShopAssistantManager)paramQQAppInterface.getManager(87);
    Object localObject3 = paramQQAppInterface.a();
    Object localObject1 = localObject2;
    if (localObject3 != null)
    {
      EcShopData localEcShopData = localEcShopAssistantManager.a();
      localObject1 = localObject2;
      if (localEcShopData != null) {
        localObject1 = ((QQMessageFacade)localObject3).a(mUin, 1008);
      }
    }
    localObject3 = super.a();
    if (localObject1 != null)
    {
      H = localEcShopAssistantManager.a(paramQQAppInterface);
      jdField_b_of_type_Long = time;
      localObject2 = localEcShopAssistantManager.a(paramQQAppInterface, frienduin);
      if (localObject1 != null)
      {
        MsgUtils.a(paramContext, paramQQAppInterface, (QQMessageFacade.Message)localObject1, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type, (MsgSummary)localObject3, (String)localObject2, true, false);
        i = msgtype;
        if ((i == 62530) || (i == 60532))
        {
          jdField_c_of_type_JavaLangCharSequence = "";
          jdField_b_of_type_JavaLangCharSequence = "";
          localObject2 = XMLMessageUtils.a((MessageRecord)localObject1);
          if ((localObject2 != null) && (items != null) && (items.size() != 0)) {
            break label718;
          }
          a((QQMessageFacade.Message)localObject1, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type, paramQQAppInterface, paramContext, (MsgSummary)localObject3);
        }
      }
      label261:
      localObject2 = paramQQAppInterface.a();
      localObject1 = localObject2;
      if (TextUtils.isEmpty((CharSequence)localObject2)) {
        localObject1 = "noLogin";
      }
      localObject1 = paramContext.getSharedPreferences("ecshop_sp" + (String)localObject1, 0);
      int i = ((SharedPreferences)localObject1).getInt("last_show_time1", 0);
      if ((i <= jdField_b_of_type_Long) && ((!TextUtils.isEmpty(jdField_b_of_type_JavaLangCharSequence)) || (!TextUtils.isEmpty(jdField_c_of_type_JavaLangCharSequence)))) {
        break label887;
      }
      if (i != 0) {
        jdField_b_of_type_Long = i;
      }
      jdField_c_of_type_JavaLangCharSequence = null;
      jdField_a_of_type_JavaLangCharSequence = null;
      localObject2 = ((SharedPreferences)localObject1).getString("str_ecshop_diy", null);
      if (!TextUtils.isEmpty((CharSequence)localObject2)) {
        break label847;
      }
      jdField_b_of_type_JavaLangCharSequence = paramContext.getString(2131371695);
      label406:
      jdField_c_of_type_JavaLangCharSequence = "";
      if (((SharedPreferences)localObject1).getBoolean("folder_reddot", false))
      {
        i = ((SharedPreferences)localObject1).getInt("last_show_time1", 0);
        int j = ((SharedPreferences)localObject1).getInt("reddot_start", 0);
        int k = ((SharedPreferences)localObject1).getInt("reddot_end", 0);
        int m = ((SharedPreferences)localObject1).getInt("max_reddot_time", 0);
        int n = (int)(System.currentTimeMillis() / 1000L);
        if ((n != 0) && (j != 0) && (k != 0) && (m != 0))
        {
          if ((n < j) || (n > k) || (n - i >= m)) {
            break label857;
          }
          jdField_a_of_type_Boolean = true;
        }
      }
      label531:
      a(paramQQAppInterface);
      a(paramQQAppInterface, (MsgSummary)localObject3);
      a(paramQQAppInterface, paramContext, (MsgSummary)localObject3);
      if ((H == 0) && (jdField_a_of_type_Boolean)) {
        H = 1;
      }
      if (AppSetting.i)
      {
        paramQQAppInterface = new StringBuilder();
        paramQQAppInterface.append(jdField_a_of_type_JavaLangString).append(",");
        if ((H != 0) && (!jdField_a_of_type_Boolean)) {
          break label895;
        }
      }
    }
    for (;;)
    {
      if (jdField_c_of_type_JavaLangCharSequence != null) {
        paramQQAppInterface.append(jdField_c_of_type_JavaLangCharSequence + ",");
      }
      paramQQAppInterface.append(jdField_b_of_type_JavaLangCharSequence).append(",").append(jdField_b_of_type_JavaLangString);
      jdField_c_of_type_JavaLangString = paramQQAppInterface.toString();
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.i("EcShop", 2, "first string to show:" + jdField_a_of_type_JavaLangCharSequence);
      return;
      label718:
      localObject1 = items.get(0)).title;
      if ((items.get(0)).cover == null) && (items.get(0)).digestList != null)) {
        localObject1 = (String)localObject1 + "：" + (String)items.get(0)).digestList.get(0);
      }
      for (;;)
      {
        jdField_b_of_type_JavaLangCharSequence = ((CharSequence)localObject1);
        break;
      }
      H = 0;
      jdField_b_of_type_Long = 0L;
      break label261;
      label847:
      jdField_b_of_type_JavaLangCharSequence = ((CharSequence)localObject2);
      break label406;
      label857:
      if (QLog.isColorLevel()) {
        QLog.i("EcShopAssistantActivity", 2, "reddot out of date!");
      }
      jdField_a_of_type_Boolean = false;
      H = 0;
      break label531;
      label887:
      a(paramContext);
      break label531;
      label895:
      if (H == 1) {
        paramQQAppInterface.append("有一条未读");
      } else if (H == 2) {
        paramQQAppInterface.append("有两条未读");
      } else if (H > 0) {
        paramQQAppInterface.append("有").append(H).append("条未读,");
      }
    }
  }
  
  public void a(QQAppInterface paramQQAppInterface, MsgSummary paramMsgSummary)
  {
    if (paramMsgSummary != null)
    {
      jdField_a_of_type_Boolean = false;
      d = null;
    }
    Object localObject2 = paramQQAppInterface.a();
    if (localObject2 == null) {}
    label179:
    for (;;)
    {
      return;
      Object localObject1 = (EcShopAssistantManager)paramQQAppInterface.getManager(87);
      if (localObject1 != null) {}
      for (localObject1 = ((EcShopAssistantManager)localObject1).a();; localObject1 = null)
      {
        if ((localObject1 == null) || (TextUtils.isEmpty(mUin)) || (jdField_b_of_type_Long >= mLastDraftTime)) {
          break label179;
        }
        localObject2 = ((QQMessageFacade)localObject2).a(mUin, 1008);
        if ((localObject2 == null) || (TextUtils.isEmpty(((DraftSummaryInfo)localObject2).getSummary()))) {
          break;
        }
        jdField_b_of_type_Long = ((DraftSummaryInfo)localObject2).getTime();
        localObject2 = ((DraftSummaryInfo)localObject2).getSummary();
        paramQQAppInterface = ContactUtils.a(paramQQAppInterface, mUin, true);
        if (paramMsgSummary == null) {
          break;
        }
        jdField_a_of_type_Boolean = true;
        d = new QQText(paramQQAppInterface + ": " + (String)localObject2, 3, 16);
        return;
      }
    }
  }
}
