package com.tencent.mobileqq.app.automator;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class StepGroup
  extends AsyncStep
{
  protected AsyncStep[] a;
  protected String[] a;
  protected String c;
  public int j;
  
  public StepGroup()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private String a(String paramString)
  {
    Object localObject = paramString.toCharArray();
    int i1 = localObject.length;
    int k;
    int i2;
    int m;
    if (localObject[0] == '{')
    {
      k = 125;
      i2 = localObject[0];
      m = 0;
    }
    int i;
    for (int n = 0;; n = i)
    {
      if (m >= i1) {
        break label147;
      }
      if (localObject[m] == i2) {
        i = n + 1;
      }
      for (;;)
      {
        if (i != 0) {
          break label135;
        }
        localObject = paramString.substring(0, m + 1);
        do
        {
          return localObject;
          if (localObject[0] == '[')
          {
            k = 93;
            break;
          }
          localObject = paramString;
        } while (paramString.indexOf(",") == -1);
        return paramString.substring(0, paramString.indexOf(","));
        i = n;
        if (localObject[m] == k) {
          i = n - 1;
        }
      }
      label135:
      m += 1;
    }
    label147:
    return "";
  }
  
  private String[] a(String paramString)
  {
    int m = paramString.length();
    int i = 0;
    StringBuilder localStringBuilder = new StringBuilder(50);
    for (String str1 = paramString; i < m; str1 = paramString.substring(i, m))
    {
      int k = i;
      String str2 = str1;
      if (str1.startsWith(","))
      {
        k = i + 1;
        str2 = paramString.substring(k, m);
      }
      str1 = a(str2);
      localStringBuilder.append(str1).append("-");
      i = k + str1.length();
    }
    return localStringBuilder.toString().split("-");
  }
  
  protected AsyncStep a()
  {
    if (j < jdField_a_of_type_ArrayOfJavaLangString.length)
    {
      jdField_a_of_type_ArrayOfComTencentMobileqqAppAutomatorAsyncStep[j] = StepFactory.a(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator, jdField_a_of_type_ArrayOfJavaLangString[j]);
      AsyncStep[] arrayOfAsyncStep = jdField_a_of_type_ArrayOfComTencentMobileqqAppAutomatorAsyncStep;
      int i = j;
      j = (i + 1);
      return arrayOfAsyncStep[i];
    }
    return null;
  }
  
  public void a()
  {
    b = 2147483647L;
    jdField_a_of_type_ArrayOfJavaLangString = a(c.substring(1, c.length() - 1));
    j = 0;
    jdField_a_of_type_ArrayOfComTencentMobileqqAppAutomatorAsyncStep = new AsyncStep[jdField_a_of_type_ArrayOfJavaLangString.length];
  }
  
  public void a(int paramInt)
  {
    if (paramInt != 4) {
      super.a(paramInt);
    }
    AsyncStep[] arrayOfAsyncStep;
    int k;
    int i;
    if (((paramInt == 8) || (paramInt == 4)) && (jdField_a_of_type_ArrayOfComTencentMobileqqAppAutomatorAsyncStep != null))
    {
      arrayOfAsyncStep = jdField_a_of_type_ArrayOfComTencentMobileqqAppAutomatorAsyncStep;
      k = arrayOfAsyncStep.length;
      i = 0;
    }
    for (;;)
    {
      AsyncStep localAsyncStep;
      if (i < k)
      {
        localAsyncStep = arrayOfAsyncStep[i];
        if (localAsyncStep != null) {}
      }
      else
      {
        return;
      }
      localAsyncStep.a(paramInt);
      i += 1;
    }
  }
}
