package com.tencent.mobileqq.activity.recent.data;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import com.tencent.biz.pubaccount.subscript.SubscriptRecommendController;
import com.tencent.biz.pubaccount.troopbarassit.TroopBarAssistantManager;
import com.tencent.biz.pubaccount.troopbarassit.TroopBarData;
import com.tencent.biz.pubaccount.util.PublicAccountConfigUtil;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.aio.XMLMessageUtils;
import com.tencent.mobileqq.activity.recent.MsgSummary;
import com.tencent.mobileqq.app.PublicAccountDataManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.data.AccountDetail;
import com.tencent.mobileqq.data.DraftSummaryInfo;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.PAMessage;
import com.tencent.mobileqq.data.PAMessage.Item;
import com.tencent.mobileqq.data.PublicAccountInfo;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.MsgUtils;
import java.util.ArrayList;
import java.util.List;

public class RecentItemTroopBarAssitant
  extends RecentUserBaseData
{
  public RecentItemTroopBarAssitant(RecentUser paramRecentUser)
  {
    super(paramRecentUser);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    G = 2;
  }
  
  public void a(Context paramContext)
  {
    if ((H > 0) && (!SubscriptRecommendController.e((QQAppInterface)((BaseApplicationImpl)paramContext.getApplicationContext()).a()))) {
      if (H <= 99)
      {
        jdField_c_of_type_JavaLangCharSequence = String.format(paramContext.getString(2131364365), new Object[] { Integer.valueOf(H) });
        K = paramContext.getResources().getColor(2131428234);
      }
    }
    for (;;)
    {
      if (jdField_b_of_type_Long == 0L) {
        jdField_b_of_type_JavaLangString = "";
      }
      return;
      jdField_c_of_type_JavaLangCharSequence = paramContext.getString(2131364366);
      break;
      jdField_c_of_type_JavaLangCharSequence = "";
    }
  }
  
  public void a(QQAppInterface paramQQAppInterface)
  {
    F = 0;
    TroopBarData localTroopBarData = TroopBarAssistantManager.a().a(paramQQAppInterface);
    if ((localTroopBarData == null) || (TextUtils.isEmpty(mUin))) {}
    do
    {
      do
      {
        return;
        paramQQAppInterface = paramQQAppInterface.a();
      } while (paramQQAppInterface == null);
      paramQQAppInterface = paramQQAppInterface.a(mUin, 1008);
    } while ((paramQQAppInterface != null) && (!TextUtils.isEmpty(paramQQAppInterface.getSummary())));
    F = 0;
  }
  
  public void a(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    if ((paramQQAppInterface == null) || (paramContext == null)) {
      return;
    }
    super.a(paramQQAppInterface, paramContext);
    jdField_a_of_type_JavaLangString = PublicAccountConfigUtil.a(paramQQAppInterface, paramContext);
    Object localObject4 = TroopBarAssistantManager.a();
    MsgSummary localMsgSummary = a();
    Object localObject1;
    if (SubscriptRecommendController.e(paramQQAppInterface))
    {
      H = 1;
      b = H;
      localObject1 = SubscriptRecommendController.b(paramQQAppInterface);
      if (TextUtils.isEmpty((CharSequence)localObject1))
      {
        b = paramContext.getString(2131364371);
        jdField_b_of_type_Long = ((TroopBarAssistantManager)localObject4).a(paramQQAppInterface);
      }
    }
    for (;;)
    {
      a(paramQQAppInterface);
      a(paramQQAppInterface, localMsgSummary);
      a(paramQQAppInterface, paramContext, localMsgSummary);
      a(paramContext);
      return;
      b = ((CharSequence)localObject1);
      break;
      label141:
      Object localObject2;
      Object localObject3;
      if (((TroopBarAssistantManager)localObject4).a(paramQQAppInterface) == 0)
      {
        H = 0;
        b = 0;
        localObject2 = null;
        localObject3 = paramQQAppInterface.a();
        TroopBarData localTroopBarData = ((TroopBarAssistantManager)localObject4).a(paramQQAppInterface);
        localObject1 = localObject2;
        if (localObject3 != null)
        {
          localObject1 = localObject2;
          if (localTroopBarData != null) {
            localObject1 = ((QQMessageFacade)localObject3).a(mUin, 1008);
          }
        }
        if (localObject1 == null) {
          break label723;
        }
        jdField_b_of_type_Long = time;
        if (TextUtils.isEmpty(((TroopBarAssistantManager)localObject4).a(frienduin)))
        {
          localObject2 = (PublicAccountDataManager)paramQQAppInterface.getManager(55);
          if (localObject2 != null)
          {
            localObject4 = ((PublicAccountDataManager)localObject2).b(frienduin);
            if (localObject4 != null) {
              break label597;
            }
            localObject2 = ((PublicAccountDataManager)localObject2).a(frienduin);
            if (localObject2 == null) {
              break label587;
            }
            localObject2 = name;
          }
        }
        label284:
        if (localObject1 != null)
        {
          MsgUtils.a(paramContext, paramQQAppInterface, (QQMessageFacade.Message)localObject1, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type, localMsgSummary, "", true, false);
          int i = msgtype;
          if ((i == 62530) || (i == 60532))
          {
            jdField_c_of_type_JavaLangCharSequence = "";
            b = "";
            localObject4 = XMLMessageUtils.a((MessageRecord)localObject1);
            if ((localObject4 != null) && (items != null) && (items.size() != 0)) {
              break label607;
            }
            a((QQMessageFacade.Message)localObject1, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type, paramQQAppInterface, paramContext, localMsgSummary);
          }
        }
        if (PublicAccountUtil.a((MessageRecord)localObject1))
        {
          localObject2 = ((QQMessageFacade)localObject3).b(mUin, 1008);
          if (localObject2 != null) {
            b = ((QQMessageFacade)localObject3).a(paramContext, (MessageRecord)localObject2, false);
          }
        }
        label433:
        if ((localObject1 == null) && (TextUtils.isEmpty(b)) && (TextUtils.isEmpty(jdField_c_of_type_JavaLangCharSequence)))
        {
          jdField_a_of_type_JavaLangCharSequence = null;
          b = ("暂无" + PublicAccountConfigUtil.a(paramQQAppInterface, paramContext) + "消息");
        }
        if (!AppSetting.i) {
          continue;
        }
        localObject2 = PublicAccountConfigUtil.a(paramQQAppInterface, paramContext);
        if (H != 0) {
          break label746;
        }
        localObject3 = paramContext.getString(2131364363);
        if (b != null) {
          break label736;
        }
      }
      label587:
      label597:
      label607:
      label723:
      label736:
      for (localObject1 = "";; localObject1 = b)
      {
        jdField_c_of_type_JavaLangString = String.format((String)localObject3, new Object[] { localObject2, localObject1, jdField_b_of_type_JavaLangString });
        break;
        H = ((TroopBarAssistantManager)localObject4).b(paramQQAppInterface);
        break label141;
        localObject2 = frienduin;
        break label284;
        localObject2 = name;
        break label284;
        localObject2 = items.get(0)).title;
        if ((items.get(0)).cover == null) && (items.get(0)).digestList != null)) {
          localObject2 = (String)localObject2 + "：" + (String)items.get(0)).digestList.get(0);
        }
        for (;;)
        {
          b = ((CharSequence)localObject2);
          break;
        }
        jdField_b_of_type_Long = ((TroopBarAssistantManager)localObject4).a(paramQQAppInterface);
        break label433;
      }
      label746:
      if (H == 1) {
        jdField_c_of_type_JavaLangString = String.format(paramContext.getString(2131364362), new Object[] { localObject2, "一", jdField_b_of_type_JavaLangString });
      } else if (H == 2) {
        jdField_c_of_type_JavaLangString = String.format(paramContext.getString(2131364362), new Object[] { localObject2, "两", jdField_b_of_type_JavaLangString });
      } else if (H > 0) {
        jdField_c_of_type_JavaLangString = String.format(paramContext.getString(2131364362), new Object[] { localObject2, Integer.toString(H), jdField_b_of_type_JavaLangString });
      }
    }
  }
  
  public void a(QQAppInterface paramQQAppInterface, MsgSummary paramMsgSummary)
  {
    if (paramMsgSummary == null) {}
    do
    {
      do
      {
        do
        {
          return;
          jdField_a_of_type_Boolean = false;
          d = null;
          paramMsgSummary = paramQQAppInterface.a();
        } while (paramMsgSummary == null);
        paramQQAppInterface = TroopBarAssistantManager.a().a(paramQQAppInterface);
      } while ((paramQQAppInterface == null) || (TextUtils.isEmpty(mUin)) || (jdField_b_of_type_Long >= mLastDraftTime));
      paramQQAppInterface = paramMsgSummary.a(mUin, 1008);
    } while ((paramQQAppInterface == null) || (TextUtils.isEmpty(paramQQAppInterface.getSummary())));
    jdField_b_of_type_Long = paramQQAppInterface.getTime();
  }
}
