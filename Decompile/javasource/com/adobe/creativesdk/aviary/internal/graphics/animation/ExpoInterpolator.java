package com.adobe.creativesdk.aviary.internal.graphics.animation;

import android.view.animation.Interpolator;

public class ExpoInterpolator
  implements Interpolator
{
  private EasingType.Type type;
  
  public ExpoInterpolator(EasingType.Type paramType)
  {
    type = paramType;
  }
  
  private float in(float paramFloat)
  {
    if (paramFloat == 0.0F) {}
    for (double d = 0.0D;; d = Math.pow(2.0D, 10.0F * (paramFloat - 1.0F))) {
      return (float)d;
    }
  }
  
  private float inout(float paramFloat)
  {
    if (paramFloat == 0.0F) {
      return 0.0F;
    }
    if (paramFloat >= 1.0F) {
      return 1.0F;
    }
    paramFloat *= 2.0F;
    if (paramFloat < 1.0F) {
      return (float)(Math.pow(2.0D, 10.0F * (paramFloat - 1.0F)) * 0.5D);
    }
    return (float)((-Math.pow(2.0D, -10.0F * (paramFloat - 1.0F)) + 2.0D) * 0.5D);
  }
  
  private float out(float paramFloat)
  {
    double d = 1.0D;
    if (paramFloat >= 1.0F) {}
    for (;;)
    {
      return (float)d;
      d = 1.0D + -Math.pow(2.0D, -10.0F * paramFloat);
    }
  }
  
  public float getInterpolation(float paramFloat)
  {
    if (type == EasingType.Type.IN) {
      return in(paramFloat);
    }
    if (type == EasingType.Type.OUT) {
      return out(paramFloat);
    }
    if (type == EasingType.Type.INOUT) {
      return inout(paramFloat);
    }
    return 0.0F;
  }
}
