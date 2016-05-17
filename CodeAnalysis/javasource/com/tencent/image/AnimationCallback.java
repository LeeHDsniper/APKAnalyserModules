package com.tencent.image;

public abstract interface AnimationCallback
{
  public abstract void invalidateSelf();
  
  public abstract void scheduleSelf(Runnable paramRunnable, long paramLong);
}
