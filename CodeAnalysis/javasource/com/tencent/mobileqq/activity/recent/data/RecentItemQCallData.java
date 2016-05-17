package com.tencent.mobileqq.activity.recent.data;

import android.content.Context;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.ContactUtils;

public class RecentItemQCallData
  extends RecentUserBaseData
{
  public RecentItemQCallData(RecentUser paramRecentUser)
  {
    super(paramRecentUser);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    jdField_a_of_type_JavaLangString = ContactUtils.b(paramQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, true);
    jdField_b_of_type_Long = jdField_a_of_type_ComTencentMobileqqDataRecentUser.lastmsgtime;
    a(paramQQAppInterface, paramContext, jdField_a_of_type_ComTencentMobileqqActivityRecentMsgSummary);
    super.a(paramQQAppInterface, paramContext);
    if (AppSetting.i)
    {
      paramQQAppInterface = new StringBuilder();
      paramQQAppInterface.append(jdField_a_of_type_JavaLangString).append(",");
      if (H != 0) {
        break label142;
      }
    }
    for (;;)
    {
      if (jdField_c_of_type_JavaLangCharSequence != null) {
        paramQQAppInterface.append(jdField_c_of_type_JavaLangCharSequence + ",");
      }
      paramQQAppInterface.append(jdField_b_of_type_JavaLangCharSequence).append(",").append(jdField_b_of_type_JavaLangString);
      jdField_c_of_type_JavaLangString = paramQQAppInterface.toString();
      return;
      label142:
      if (H == 1) {
        paramQQAppInterface.append("有一条未读");
      } else if (H == 2) {
        paramQQAppInterface.append("有两条未读");
      } else if (H > 0) {
        paramQQAppInterface.append("有").append(H).append("条未读,");
      }
    }
  }
}
