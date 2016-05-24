package android.support.v4.view.animation;

import android.view.animation.Interpolator;

abstract class LookupTableInterpolator
  implements Interpolator
{
  private final float mStepSize;
  private final float[] mValues;
  
  public LookupTableInterpolator(float[] paramArrayOfFloat)
  {
    mValues = paramArrayOfFloat;
    mStepSize = (1.0F / (mValues.length - 1));
  }
  
  public float getInterpolation(float paramFloat)
  {
    if (paramFloat >= 1.0F) {
      return 1.0F;
    }
    if (paramFloat <= 0.0F) {
      return 0.0F;
    }
    int i = Math.min((int)((mValues.length - 1) * paramFloat), mValues.length - 2);
    paramFloat = (paramFloat - i * mStepSize) / mStepSize;
    return mValues[i] + (mValues[(i + 1)] - mValues[i]) * paramFloat;
  }
}
