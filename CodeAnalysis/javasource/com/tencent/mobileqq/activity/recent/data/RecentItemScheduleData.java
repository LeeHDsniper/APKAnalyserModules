package com.tencent.mobileqq.activity.recent.data;

import android.content.Context;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.TimeFormatterUtils;

public class RecentItemScheduleData
  extends RecentUserBaseData
{
  public long a;
  
  public RecentItemScheduleData(RecentUser paramRecentUser)
  {
    super(paramRecentUser);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    super.a(paramQQAppInterface, paramContext);
    if (AppSetting.i)
    {
      paramQQAppInterface = new StringBuilder(24);
      paramQQAppInterface.append(jdField_a_of_type_JavaLangString);
      if (H != 0) {
        break label102;
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
      label102:
      if (H == 1) {
        paramQQAppInterface.append("有一条未读");
      } else if (H == 2) {
        paramQQAppInterface.append("有两条未读");
      } else if (H > 0) {
        paramQQAppInterface.append("有").append(H).append("条未读");
      }
    }
  }
  
  public void a(String paramString, long paramLong)
  {
    jdField_a_of_type_JavaLangString = paramString;
    jdField_a_of_type_Long = paramLong;
    jdField_b_of_type_JavaLangString = TimeFormatterUtils.a(paramLong, true, "yyyy-MM-dd");
  }
}
