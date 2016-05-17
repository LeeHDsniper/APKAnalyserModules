package com.tencent.commonsdk.util;

import android.annotation.SuppressLint;

@SuppressLint({"UseValueOf"})
public class LargerInteger
{
  private static final Integer[] LARGER_VALUES = new Integer['ྀ'];
  private static final int MAX = 4096;
  
  static
  {
    int i = 128;
    while (i < 4096)
    {
      LARGER_VALUES[(i - 128)] = new Integer(i);
      i += 1;
    }
  }
  
  public LargerInteger() {}
  
  public static Integer valueOf(int paramInt)
  {
    if ((paramInt >= 128) && (paramInt < 4096)) {
      return LARGER_VALUES[(paramInt - 128)];
    }
    return Integer.valueOf(paramInt);
  }
}
