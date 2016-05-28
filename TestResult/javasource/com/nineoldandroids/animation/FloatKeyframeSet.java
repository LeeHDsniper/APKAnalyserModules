package com.nineoldandroids.animation;

import android.view.animation.Interpolator;
import java.util.ArrayList;

class FloatKeyframeSet
  extends KeyframeSet
{
  private float deltaValue;
  private boolean firstTime = true;
  private float firstValue;
  private float lastValue;
  
  public FloatKeyframeSet(Keyframe.FloatKeyframe... paramVarArgs)
  {
    super(paramVarArgs);
  }
  
  public FloatKeyframeSet clone()
  {
    ArrayList localArrayList = mKeyframes;
    int j = mKeyframes.size();
    Keyframe.FloatKeyframe[] arrayOfFloatKeyframe = new Keyframe.FloatKeyframe[j];
    int i = 0;
    while (i < j)
    {
      arrayOfFloatKeyframe[i] = ((Keyframe.FloatKeyframe)((Keyframe)localArrayList.get(i)).clone());
      i += 1;
    }
    return new FloatKeyframeSet(arrayOfFloatKeyframe);
  }
  
  public float getFloatValue(float paramFloat)
  {
    float f1;
    if (mNumKeyframes == 2)
    {
      if (firstTime)
      {
        firstTime = false;
        firstValue = ((Keyframe.FloatKeyframe)mKeyframes.get(0)).getFloatValue();
        lastValue = ((Keyframe.FloatKeyframe)mKeyframes.get(1)).getFloatValue();
        deltaValue = (lastValue - firstValue);
      }
      f1 = paramFloat;
      if (mInterpolator != null) {
        f1 = mInterpolator.getInterpolation(paramFloat);
      }
      if (mEvaluator == null) {
        return firstValue + deltaValue * f1;
      }
      return ((Number)mEvaluator.evaluate(f1, Float.valueOf(firstValue), Float.valueOf(lastValue))).floatValue();
    }
    Keyframe.FloatKeyframe localFloatKeyframe;
    float f2;
    float f3;
    float f4;
    float f5;
    if (paramFloat <= 0.0F)
    {
      localObject = (Keyframe.FloatKeyframe)mKeyframes.get(0);
      localFloatKeyframe = (Keyframe.FloatKeyframe)mKeyframes.get(1);
      f2 = ((Keyframe.FloatKeyframe)localObject).getFloatValue();
      f3 = localFloatKeyframe.getFloatValue();
      f4 = ((Keyframe.FloatKeyframe)localObject).getFraction();
      f5 = localFloatKeyframe.getFraction();
      localObject = localFloatKeyframe.getInterpolator();
      f1 = paramFloat;
      if (localObject != null) {
        f1 = ((Interpolator)localObject).getInterpolation(paramFloat);
      }
      paramFloat = (f1 - f4) / (f5 - f4);
      if (mEvaluator == null) {
        return (f3 - f2) * paramFloat + f2;
      }
      return ((Number)mEvaluator.evaluate(paramFloat, Float.valueOf(f2), Float.valueOf(f3))).floatValue();
    }
    if (paramFloat >= 1.0F)
    {
      localObject = (Keyframe.FloatKeyframe)mKeyframes.get(mNumKeyframes - 2);
      localFloatKeyframe = (Keyframe.FloatKeyframe)mKeyframes.get(mNumKeyframes - 1);
      f2 = ((Keyframe.FloatKeyframe)localObject).getFloatValue();
      f3 = localFloatKeyframe.getFloatValue();
      f4 = ((Keyframe.FloatKeyframe)localObject).getFraction();
      f5 = localFloatKeyframe.getFraction();
      localObject = localFloatKeyframe.getInterpolator();
      f1 = paramFloat;
      if (localObject != null) {
        f1 = ((Interpolator)localObject).getInterpolation(paramFloat);
      }
      paramFloat = (f1 - f4) / (f5 - f4);
      if (mEvaluator == null) {
        return (f3 - f2) * paramFloat + f2;
      }
      return ((Number)mEvaluator.evaluate(paramFloat, Float.valueOf(f2), Float.valueOf(f3))).floatValue();
    }
    Object localObject = (Keyframe.FloatKeyframe)mKeyframes.get(0);
    int i = 1;
    while (i < mNumKeyframes)
    {
      localFloatKeyframe = (Keyframe.FloatKeyframe)mKeyframes.get(i);
      if (paramFloat < localFloatKeyframe.getFraction())
      {
        Interpolator localInterpolator = localFloatKeyframe.getInterpolator();
        f1 = paramFloat;
        if (localInterpolator != null) {
          f1 = localInterpolator.getInterpolation(paramFloat);
        }
        paramFloat = (f1 - ((Keyframe.FloatKeyframe)localObject).getFraction()) / (localFloatKeyframe.getFraction() - ((Keyframe.FloatKeyframe)localObject).getFraction());
        f1 = ((Keyframe.FloatKeyframe)localObject).getFloatValue();
        f2 = localFloatKeyframe.getFloatValue();
        if (mEvaluator == null) {
          return (f2 - f1) * paramFloat + f1;
        }
        return ((Number)mEvaluator.evaluate(paramFloat, Float.valueOf(f1), Float.valueOf(f2))).floatValue();
      }
      localObject = localFloatKeyframe;
      i += 1;
    }
    return ((Number)((Keyframe)mKeyframes.get(mNumKeyframes - 1)).getValue()).floatValue();
  }
  
  public Object getValue(float paramFloat)
  {
    return Float.valueOf(getFloatValue(paramFloat));
  }
}
