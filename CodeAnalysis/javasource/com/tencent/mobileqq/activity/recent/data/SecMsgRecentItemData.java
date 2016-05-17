package com.tencent.mobileqq.activity.recent.data;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.recent.TimeManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.SecMsgManager;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class SecMsgRecentItemData
  extends RecentUserBaseData
{
  public SecMsgRecentItemData(RecentUser paramRecentUser)
  {
    super(paramRecentUser);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    super.a(paramQQAppInterface, paramContext);
    paramQQAppInterface = (SecMsgManager)paramQQAppInterface.getManager(56);
    if (TextUtils.isEmpty(jdField_a_of_type_JavaLangString)) {
      jdField_a_of_type_JavaLangString = paramContext.getResources().getString(2131370969);
    }
    jdField_b_of_type_JavaLangCharSequence = "";
    jdField_c_of_type_JavaLangCharSequence = "";
    if ((paramQQAppInterface != null) && (paramQQAppInterface.c()))
    {
      jdField_c_of_type_JavaLangCharSequence = paramQQAppInterface.a(paramContext);
      K = paramContext.getResources().getColor(2131428234);
      jdField_b_of_type_Long = jdField_a_of_type_ComTencentMobileqqDataRecentUser.lastmsgtime;
      if (jdField_b_of_type_Long > 0L) {
        jdField_b_of_type_JavaLangString = TimeManager.a().a(a(), jdField_b_of_type_Long);
      }
      if (AppSetting.i)
      {
        paramQQAppInterface = new StringBuilder(24);
        paramQQAppInterface.append(jdField_a_of_type_JavaLangString);
        if (H != 0) {
          break label231;
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
      jdField_b_of_type_JavaLangCharSequence = paramContext.getString(2131370974);
      break;
      label231:
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
