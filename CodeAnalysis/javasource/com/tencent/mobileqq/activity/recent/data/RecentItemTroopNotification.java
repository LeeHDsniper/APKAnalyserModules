package com.tencent.mobileqq.activity.recent.data;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.contact.troop.TroopNotificationUtils;
import com.tencent.mobileqq.activity.recent.TimeManager;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.RecommendTroopManagerImp;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.systemmsg.GroupSystemMsgController;
import com.tencent.mobileqq.systemmsg.MessageForSystemMsg;
import java.util.List;
import tencent.mobileim.structmsg.structmsg.StructMsg;

public class RecentItemTroopNotification
  extends RecentUserBaseData
{
  public RecentItemTroopNotification(RecentUser paramRecentUser)
  {
    super(paramRecentUser);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private boolean a(QQAppInterface paramQQAppInterface, Context paramContext, RecommendTroopManagerImp paramRecommendTroopManagerImp, MessageRecord paramMessageRecord)
  {
    if ((paramQQAppInterface == null) || (paramContext == null) || (paramRecommendTroopManagerImp == null) || (paramMessageRecord == null)) {
      return false;
    }
    jdField_b_of_type_Long = time;
    if (msgtype == 64497)
    {
      if (paramRecommendTroopManagerImp != null)
      {
        jdField_b_of_type_JavaLangCharSequence = (paramContext.getResources().getString(2131364478) + paramRecommendTroopManagerImp.a());
        return true;
      }
    }
    else if ((msgtype == 64496) && (paramRecommendTroopManagerImp != null))
    {
      jdField_b_of_type_JavaLangCharSequence = paramRecommendTroopManagerImp.a();
      return true;
    }
    return false;
  }
  
  public void a(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    if ((paramQQAppInterface == null) || (paramContext == null)) {}
    RecommendTroopManagerImp localRecommendTroopManagerImp;
    MessageRecord localMessageRecord;
    label66:
    Object localObject;
    do
    {
      return;
      super.a(paramQQAppInterface, paramContext);
      if (TextUtils.isEmpty(jdField_a_of_type_JavaLangString)) {
        jdField_a_of_type_JavaLangString = paramContext.getString(2131367277);
      }
      localRecommendTroopManagerImp = (RecommendTroopManagerImp)paramQQAppInterface.getManager(21);
      H = TroopNotificationUtils.a(paramQQAppInterface);
      if (localRecommendTroopManagerImp == null) {
        break;
      }
      localMessageRecord = localRecommendTroopManagerImp.a();
      localObject = paramQQAppInterface.a().b(AppConstants.av, 0);
    } while ((localObject == null) && (localMessageRecord == null));
    label128:
    int i;
    int j;
    if ((localObject != null) && (((List)localObject).size() > 0))
    {
      localObject = ((MessageForSystemMsg)((List)localObject).get(((List)localObject).size() - 1)).getSystemMsg();
      i = GroupSystemMsgController.a().a(paramQQAppInterface);
      j = RecommendTroopManagerImp.a(paramQQAppInterface);
      if ((localObject == null) || (i <= 0)) {
        break label339;
      }
      jdField_b_of_type_Long = msg_time.get();
      jdField_b_of_type_JavaLangCharSequence = GroupSystemMsgController.a().a(paramQQAppInterface);
      i = 1;
    }
    for (;;)
    {
      label176:
      if ((jdField_b_of_type_Long > 0L) && (jdField_b_of_type_Long != 9223372036854775806L)) {
        jdField_b_of_type_JavaLangString = TimeManager.a().a(a(), jdField_b_of_type_Long);
      }
      if (i != 0)
      {
        jdField_a_of_type_ComTencentMobileqqDataRecentUser.jumpTabMode = 0;
        label226:
        if (!AppSetting.i) {
          break label495;
        }
        paramQQAppInterface = new StringBuilder(24);
        paramQQAppInterface.append(jdField_a_of_type_JavaLangString);
        if (H != 0) {
          break label497;
        }
      }
      for (;;)
      {
        if (jdField_c_of_type_JavaLangCharSequence != null) {
          paramQQAppInterface.append(jdField_c_of_type_JavaLangCharSequence + ",");
        }
        paramQQAppInterface.append(jdField_b_of_type_JavaLangCharSequence).append(',').append(jdField_b_of_type_JavaLangString);
        jdField_c_of_type_JavaLangString = paramQQAppInterface.toString();
        return;
        localMessageRecord = null;
        break label66;
        localObject = GroupSystemMsgController.a().a();
        break label128;
        label339:
        if (j > 0)
        {
          if (!a(paramQQAppInterface, paramContext, localRecommendTroopManagerImp, localMessageRecord)) {
            break label562;
          }
          i = 0;
          break label176;
        }
        if ((localObject != null) && (localMessageRecord != null))
        {
          if (msg_time.get() > time)
          {
            jdField_b_of_type_Long = msg_time.get();
            jdField_b_of_type_JavaLangCharSequence = GroupSystemMsgController.a().a(paramQQAppInterface);
            i = 1;
            break label176;
          }
          if (!a(paramQQAppInterface, paramContext, localRecommendTroopManagerImp, localMessageRecord)) {
            break label562;
          }
          i = 0;
          break label176;
        }
        if (localObject != null)
        {
          jdField_b_of_type_Long = msg_time.get();
          jdField_b_of_type_JavaLangCharSequence = GroupSystemMsgController.a().a(paramQQAppInterface);
        }
        if ((localMessageRecord == null) || (!a(paramQQAppInterface, paramContext, localRecommendTroopManagerImp, localMessageRecord))) {
          break label562;
        }
        i = 0;
        break label176;
        jdField_a_of_type_ComTencentMobileqqDataRecentUser.jumpTabMode = 1;
        break label226;
        label495:
        break;
        label497:
        if (H == 1) {
          paramQQAppInterface.append("有一条未读");
        } else if (H == 2) {
          paramQQAppInterface.append("有两条未读");
        } else if (H > 0) {
          paramQQAppInterface.append("有").append(H).append("条未读");
        }
      }
      label562:
      i = 1;
    }
  }
}
