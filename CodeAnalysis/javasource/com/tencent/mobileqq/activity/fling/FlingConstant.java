package com.tencent.mobileqq.activity.fling;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class FlingConstant
{
  public static final int FLING_ACTION_DEFAULT = 0;
  public static final int FLING_ACTION_GESTURE = 2;
  public static final String FLING_ACTION_KEY = "fling_action_key";
  public static final int FLING_ACTION_SNAP = 1;
  public static final String FLING_CODE_KEY = "fling_code_key";
  
  public FlingConstant()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
}
