package com.nineoldandroids.animation;

import android.view.animation.Interpolator;
import java.util.ArrayList;

class IntKeyframeSet
  extends KeyframeSet
{
  private int deltaValue;
  private boolean firstTime = true;
  private int firstValue;
  private int lastValue;
  
  public IntKeyframeSet(Keyframe.IntKeyframe... paramVarArgs)
  {
    super(paramVarArgs);
  }
  
  public IntKeyframeSet clone()
  {
    ArrayList localArrayList = mKeyframes;
    int j = mKeyframes.size();
    Keyframe.IntKeyframe[] arrayOfIntKeyframe = new Keyframe.IntKeyframe[j];
    int i = 0;
    while (i < j)
    {
      arrayOfIntKeyframe[i] = ((Keyframe.IntKeyframe)((Keyframe)localArrayList.get(i)).clone());
      i += 1;
    }
    return new IntKeyframeSet(arrayOfIntKeyframe);
  }
  
  public int getIntValue(float paramFloat)
  {
    float f1;
    if (mNumKeyframes == 2)
    {
      if (firstTime)
      {
        firstTime = false;
        firstValue = ((Keyframe.IntKeyframe)mKeyframes.get(0)).getIntValue();
        lastValue = ((Keyframe.IntKeyframe)mKeyframes.get(1)).getIntValue();
        deltaValue = (lastValue - firstValue);
      }
      f1 = paramFloat;
      if (mInterpolator != null) {
        f1 = mInterpolator.getInterpolation(paramFloat);
      }
      if (mEvaluator == null) {
        return firstValue + (int)(deltaValue * f1);
      }
      return ((Number)mEvaluator.evaluate(f1, Integer.valueOf(firstValue), Integer.valueOf(lastValue))).intValue();
    }
    Keyframe.IntKeyframe localIntKeyframe;
    int j;
    float f2;
    float f3;
    if (paramFloat <= 0.0F)
    {
      localObject = (Keyframe.IntKeyframe)mKeyframes.get(0);
      localIntKeyframe = (Keyframe.IntKeyframe)mKeyframes.get(1);
      i = ((Keyframe.IntKeyframe)localObject).getIntValue();
      j = localIntKeyframe.getIntValue();
      f2 = ((Keyframe.IntKeyframe)localObject).getFraction();
      f3 = localIntKeyframe.getFraction();
      localObject = localIntKeyframe.getInterpolator();
      f1 = paramFloat;
      if (localObject != null) {
        f1 = ((Interpolator)localObject).getInterpolation(paramFloat);
      }
      paramFloat = (f1 - f2) / (f3 - f2);
      if (mEvaluator == null) {
        return (int)((j - i) * paramFloat) + i;
      }
      return ((Number)mEvaluator.evaluate(paramFloat, Integer.valueOf(i), Integer.valueOf(j))).intValue();
    }
    if (paramFloat >= 1.0F)
    {
      localObject = (Keyframe.IntKeyframe)mKeyframes.get(mNumKeyframes - 2);
      localIntKeyframe = (Keyframe.IntKeyframe)mKeyframes.get(mNumKeyframes - 1);
      i = ((Keyframe.IntKeyframe)localObject).getIntValue();
      j = localIntKeyframe.getIntValue();
      f2 = ((Keyframe.IntKeyframe)localObject).getFraction();
      f3 = localIntKeyframe.getFraction();
      localObject = localIntKeyframe.getInterpolator();
      f1 = paramFloat;
      if (localObject != null) {
        f1 = ((Interpolator)localObject).getInterpolation(paramFloat);
      }
      paramFloat = (f1 - f2) / (f3 - f2);
      if (mEvaluator == null) {
        return (int)((j - i) * paramFloat) + i;
      }
      return ((Number)mEvaluator.evaluate(paramFloat, Integer.valueOf(i), Integer.valueOf(j))).intValue();
    }
    Object localObject = (Keyframe.IntKeyframe)mKeyframes.get(0);
    int i = 1;
    while (i < mNumKeyframes)
    {
      localIntKeyframe = (Keyframe.IntKeyframe)mKeyframes.get(i);
      if (paramFloat < localIntKeyframe.getFraction())
      {
        Interpolator localInterpolator = localIntKeyframe.getInterpolator();
        f1 = paramFloat;
        if (localInterpolator != null) {
          f1 = localInterpolator.getInterpolation(paramFloat);
        }
        paramFloat = (f1 - ((Keyframe.IntKeyframe)localObject).getFraction()) / (localIntKeyframe.getFraction() - ((Keyframe.IntKeyframe)localObject).getFraction());
        i = ((Keyframe.IntKeyframe)localObject).getIntValue();
        j = localIntKeyframe.getIntValue();
        if (mEvaluator == null) {
          return (int)((j - i) * paramFloat) + i;
        }
        return ((Number)mEvaluator.evaluate(paramFloat, Integer.valueOf(i), Integer.valueOf(j))).intValue();
      }
      localObject = localIntKeyframe;
      i += 1;
    }
    return ((Number)((Keyframe)mKeyframes.get(mNumKeyframes - 1)).getValue()).intValue();
  }
  
  public Object getValue(float paramFloat)
  {
    return Integer.valueOf(getIntValue(paramFloat));
  }
}
