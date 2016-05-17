package com.tencent.mobileqq.app.automator;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class TimerChecker
  extends AsyncStep
{
  private static final String c = "LAST_UPDATE_TIME_PRE_";
  private static final String d = "TIMER_CHECK_STEP";
  private static final int j = 1000;
  private ParallGroup a;
  
  public TimerChecker()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppAutomatorParallGroup != null) {
      jdField_a_of_type_ComTencentMobileqqAppAutomatorParallGroup.run();
    }
    return 7;
  }
  
  public void a()
  {
    long l = System.currentTimeMillis();
    Object localObject = StepFactory.jdField_a_of_type_ArrayOfInt;
    StringBuilder localStringBuilder = new StringBuilder("[");
    int k = localObject.length;
    int i = 0;
    while (i < k)
    {
      if ((l - jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a.getLong("LAST_UPDATE_TIME_PRE_" + localObject[i], 0L) >= localObject[i] * 60 * 60 * 1000) && (StepFactory.jdField_a_of_type_ArrayOfJavaLangString[i].length() > 2))
      {
        localStringBuilder.append(StepFactory.jdField_a_of_type_ArrayOfJavaLangString[i]).append(',');
        jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a.edit().putLong("LAST_UPDATE_TIME_PRE_" + localObject[i], l).commit();
      }
      i += 1;
    }
    localObject = localStringBuilder.toString();
    if ((((String)localObject).substring(0, ((String)localObject).length() - 1) + "]").length() > 2)
    {
      jdField_a_of_type_ComTencentMobileqqAppAutomatorParallGroup = new ParallGroup();
      jdField_a_of_type_ComTencentMobileqqAppAutomatorParallGroup.c = localStringBuilder.toString();
      jdField_a_of_type_ComTencentMobileqqAppAutomatorParallGroup.b = "TIMER_CHECK_STEP";
      jdField_a_of_type_ComTencentMobileqqAppAutomatorParallGroup.h = 1000;
      jdField_a_of_type_ComTencentMobileqqAppAutomatorParallGroup.jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator = jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator;
      jdField_a_of_type_ComTencentMobileqqAppAutomatorParallGroup.i = 0;
    }
  }
}
