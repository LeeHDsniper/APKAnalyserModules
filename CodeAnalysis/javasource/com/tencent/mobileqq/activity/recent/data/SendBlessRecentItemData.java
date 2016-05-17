package com.tencent.mobileqq.activity.recent.data;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.bless.BlessManager;
import com.tencent.mobileqq.activity.bless.BlessTask;
import com.tencent.mobileqq.activity.recent.TimeManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class SendBlessRecentItemData
  extends RecentUserBaseData
{
  public SendBlessRecentItemData(RecentUser paramRecentUser)
  {
    super(paramRecentUser);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    super.a(paramQQAppInterface, paramContext);
    BlessManager localBlessManager = (BlessManager)paramQQAppInterface.getManager(137);
    BlessTask localBlessTask = localBlessManager.a();
    int i;
    if (!localBlessManager.i())
    {
      jdField_a_of_type_JavaLangString = paramContext.getResources().getString(2131371915);
      jdField_b_of_type_JavaLangCharSequence = localBlessManager.e();
      jdField_c_of_type_JavaLangCharSequence = "";
      ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X800618A", "0X800618A", 0, 0, "", "", "", "");
      if (localBlessManager.a() < 0) {
        break label378;
      }
      if (localBlessManager.a() != 0) {
        break label373;
      }
      i = 2;
      label103:
      G = i;
    }
    label373:
    label378:
    for (H = 1;; H = 0)
    {
      jdField_b_of_type_Long = jdField_a_of_type_ComTencentMobileqqDataRecentUser.lastmsgtime;
      if (jdField_b_of_type_Long > 0L) {
        jdField_b_of_type_JavaLangString = TimeManager.a().a(a(), jdField_b_of_type_Long);
      }
      localBlessManager.d();
      if (AppSetting.i)
      {
        paramQQAppInterface = new StringBuilder(24);
        paramQQAppInterface.append(jdField_a_of_type_JavaLangString);
        if (H == 1) {
          paramQQAppInterface.append("有一条未读");
        }
        if (jdField_c_of_type_JavaLangCharSequence != null) {
          paramQQAppInterface.append(jdField_c_of_type_JavaLangCharSequence + ",");
        }
        paramQQAppInterface.append(jdField_b_of_type_JavaLangCharSequence).append(' ').append(jdField_b_of_type_JavaLangString);
        jdField_c_of_type_JavaLangString = paramQQAppInterface.toString();
      }
      return;
      if (localBlessTask == null) {
        break;
      }
      jdField_a_of_type_JavaLangString = starWord;
      jdField_b_of_type_JavaLangCharSequence = starBless;
      jdField_c_of_type_JavaLangCharSequence = ex2;
      if (!TextUtils.isEmpty(jdField_c_of_type_JavaLangCharSequence))
      {
        jdField_c_of_type_JavaLangCharSequence = ("[" + jdField_c_of_type_JavaLangCharSequence + "] ");
        K = paramContext.getResources().getColor(2131428234);
      }
      ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X800632B", "0X800632B", 0, 0, "", "", "", "");
      break;
      i = 1;
      break label103;
    }
  }
}
