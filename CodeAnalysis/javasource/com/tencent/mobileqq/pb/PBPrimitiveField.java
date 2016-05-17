package com.tencent.mobileqq.pb;

public abstract class PBPrimitiveField<T>
  extends PBField<T>
{
  private boolean hasFlag = false;
  
  public PBPrimitiveField() {}
  
  public final boolean has()
  {
    return hasFlag;
  }
  
  public final void setHasFlag(boolean paramBoolean)
  {
    hasFlag = paramBoolean;
  }
}
