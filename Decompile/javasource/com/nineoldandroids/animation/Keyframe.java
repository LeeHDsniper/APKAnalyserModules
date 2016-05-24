package com.nineoldandroids.animation;

import android.view.animation.Interpolator;

public abstract class Keyframe
  implements Cloneable
{
  float mFraction;
  boolean mHasValue = false;
  private Interpolator mInterpolator = null;
  Class mValueType;
  
  public Keyframe() {}
  
  public static Keyframe ofFloat(float paramFloat)
  {
    return new FloatKeyframe(paramFloat);
  }
  
  public static Keyframe ofFloat(float paramFloat1, float paramFloat2)
  {
    return new FloatKeyframe(paramFloat1, paramFloat2);
  }
  
  public static Keyframe ofInt(float paramFloat)
  {
    return new IntKeyframe(paramFloat);
  }
  
  public static Keyframe ofInt(float paramFloat, int paramInt)
  {
    return new IntKeyframe(paramFloat, paramInt);
  }
  
  public static Keyframe ofObject(float paramFloat)
  {
    return new ObjectKeyframe(paramFloat, null);
  }
  
  public static Keyframe ofObject(float paramFloat, Object paramObject)
  {
    return new ObjectKeyframe(paramFloat, paramObject);
  }
  
  public abstract Keyframe clone();
  
  public float getFraction()
  {
    return mFraction;
  }
  
  public Interpolator getInterpolator()
  {
    return mInterpolator;
  }
  
  public abstract Object getValue();
  
  public boolean hasValue()
  {
    return mHasValue;
  }
  
  public void setInterpolator(Interpolator paramInterpolator)
  {
    mInterpolator = paramInterpolator;
  }
  
  public abstract void setValue(Object paramObject);
  
  static class FloatKeyframe
    extends Keyframe
  {
    float mValue;
    
    FloatKeyframe(float paramFloat)
    {
      mFraction = paramFloat;
      mValueType = Float.TYPE;
    }
    
    FloatKeyframe(float paramFloat1, float paramFloat2)
    {
      mFraction = paramFloat1;
      mValue = paramFloat2;
      mValueType = Float.TYPE;
      mHasValue = true;
    }
    
    public FloatKeyframe clone()
    {
      FloatKeyframe localFloatKeyframe = new FloatKeyframe(getFraction(), mValue);
      localFloatKeyframe.setInterpolator(getInterpolator());
      return localFloatKeyframe;
    }
    
    public float getFloatValue()
    {
      return mValue;
    }
    
    public Object getValue()
    {
      return Float.valueOf(mValue);
    }
    
    public void setValue(Object paramObject)
    {
      if ((paramObject != null) && (paramObject.getClass() == Float.class))
      {
        mValue = ((Float)paramObject).floatValue();
        mHasValue = true;
      }
    }
  }
  
  static class IntKeyframe
    extends Keyframe
  {
    int mValue;
    
    IntKeyframe(float paramFloat)
    {
      mFraction = paramFloat;
      mValueType = Integer.TYPE;
    }
    
    IntKeyframe(float paramFloat, int paramInt)
    {
      mFraction = paramFloat;
      mValue = paramInt;
      mValueType = Integer.TYPE;
      mHasValue = true;
    }
    
    public IntKeyframe clone()
    {
      IntKeyframe localIntKeyframe = new IntKeyframe(getFraction(), mValue);
      localIntKeyframe.setInterpolator(getInterpolator());
      return localIntKeyframe;
    }
    
    public int getIntValue()
    {
      return mValue;
    }
    
    public Object getValue()
    {
      return Integer.valueOf(mValue);
    }
    
    public void setValue(Object paramObject)
    {
      if ((paramObject != null) && (paramObject.getClass() == Integer.class))
      {
        mValue = ((Integer)paramObject).intValue();
        mHasValue = true;
      }
    }
  }
  
  static class ObjectKeyframe
    extends Keyframe
  {
    Object mValue;
    
    ObjectKeyframe(float paramFloat, Object paramObject)
    {
      mFraction = paramFloat;
      mValue = paramObject;
      boolean bool;
      if (paramObject != null)
      {
        bool = true;
        mHasValue = bool;
        if (!mHasValue) {
          break label48;
        }
      }
      label48:
      for (paramObject = paramObject.getClass();; paramObject = Object.class)
      {
        mValueType = paramObject;
        return;
        bool = false;
        break;
      }
    }
    
    public ObjectKeyframe clone()
    {
      ObjectKeyframe localObjectKeyframe = new ObjectKeyframe(getFraction(), mValue);
      localObjectKeyframe.setInterpolator(getInterpolator());
      return localObjectKeyframe;
    }
    
    public Object getValue()
    {
      return mValue;
    }
    
    public void setValue(Object paramObject)
    {
      mValue = paramObject;
      if (paramObject != null) {}
      for (boolean bool = true;; bool = false)
      {
        mHasValue = bool;
        return;
      }
    }
  }
}
