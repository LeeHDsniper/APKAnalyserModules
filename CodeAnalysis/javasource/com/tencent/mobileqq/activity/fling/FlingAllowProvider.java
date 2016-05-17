package com.tencent.mobileqq.activity.fling;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;
import java.util.List;

public class FlingAllowProvider
{
  private static List a = new ArrayList();
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public FlingAllowProvider() {}
  
  public static boolean contain(String paramString)
  {
    return a.contains(paramString);
  }
}
