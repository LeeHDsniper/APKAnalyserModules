package com.tencent.mobileqq.activity.recent.data;

import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.TimeFormatterUtils;

public class RecentItemPullActivePush
  extends RecentUserBaseData
{
  public long a;
  
  public RecentItemPullActivePush(RecentUser paramRecentUser)
  {
    super(paramRecentUser);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(String paramString, long paramLong)
  {
    jdField_a_of_type_JavaLangString = paramString;
    jdField_a_of_type_Long = paramLong;
    b = TimeFormatterUtils.a(paramLong, true, "yyyy-MM-dd");
  }
}
