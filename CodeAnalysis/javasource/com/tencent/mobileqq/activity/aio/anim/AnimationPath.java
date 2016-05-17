package com.tencent.mobileqq.activity.aio.anim;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public abstract interface AnimationPath
{
  public static final AnimationPath.Values a = new AnimationPath.Values();
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public abstract int a(long paramLong, AnimationPath.Values paramValues);
  
  public abstract int a(AnimationPath.Values paramValues, int paramInt1, int paramInt2, int paramInt3, int paramInt4);
  
  public abstract AnimationPath a();
  
  public abstract boolean a(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4);
}
