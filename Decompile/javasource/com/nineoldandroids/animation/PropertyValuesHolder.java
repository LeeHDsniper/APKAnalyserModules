package com.nineoldandroids.animation;

import android.util.Log;
import com.nineoldandroids.util.FloatProperty;
import com.nineoldandroids.util.IntProperty;
import com.nineoldandroids.util.Property;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock.WriteLock;

public class PropertyValuesHolder
  implements Cloneable
{
  private static Class[] DOUBLE_VARIANTS;
  private static Class[] FLOAT_VARIANTS;
  private static Class[] INTEGER_VARIANTS;
  private static final TypeEvaluator sFloatEvaluator;
  private static final HashMap<Class, HashMap<String, Method>> sGetterPropertyMap = new HashMap();
  private static final TypeEvaluator sIntEvaluator = new IntEvaluator();
  private static final HashMap<Class, HashMap<String, Method>> sSetterPropertyMap;
  private Object mAnimatedValue;
  private TypeEvaluator mEvaluator;
  private Method mGetter = null;
  KeyframeSet mKeyframeSet = null;
  protected Property mProperty;
  final ReentrantReadWriteLock mPropertyMapLock = new ReentrantReadWriteLock();
  String mPropertyName;
  Method mSetter = null;
  final Object[] mTmpValueArray = new Object[1];
  Class mValueType;
  
  static
  {
    sFloatEvaluator = new FloatEvaluator();
    FLOAT_VARIANTS = new Class[] { Float.TYPE, Float.class, Double.TYPE, Integer.TYPE, Double.class, Integer.class };
    INTEGER_VARIANTS = new Class[] { Integer.TYPE, Integer.class, Float.TYPE, Double.TYPE, Float.class, Double.class };
    DOUBLE_VARIANTS = new Class[] { Double.TYPE, Double.class, Float.TYPE, Integer.TYPE, Float.class, Integer.class };
    sSetterPropertyMap = new HashMap();
  }
  
  private PropertyValuesHolder(Property paramProperty)
  {
    mProperty = paramProperty;
    if (paramProperty != null) {
      mPropertyName = paramProperty.getName();
    }
  }
  
  private PropertyValuesHolder(String paramString)
  {
    mPropertyName = paramString;
  }
  
  static String getMethodName(String paramString1, String paramString2)
  {
    if ((paramString2 == null) || (paramString2.length() == 0)) {
      return paramString1;
    }
    char c = Character.toUpperCase(paramString2.charAt(0));
    paramString2 = paramString2.substring(1);
    return paramString1 + c + paramString2;
  }
  
  private Method getPropertyFunction(Class paramClass1, String paramString, Class paramClass2)
  {
    Method localMethod1 = null;
    Class[] arrayOfClass = null;
    String str = getMethodName(paramString, mPropertyName);
    if (paramClass2 == null) {}
    for (;;)
    {
      try
      {
        paramClass2 = paramClass1.getMethod(str, null);
        return paramClass2;
      }
      catch (NoSuchMethodException paramString)
      {
        paramClass2 = arrayOfClass;
        try
        {
          paramClass1 = paramClass1.getDeclaredMethod(str, null);
          paramClass2 = paramClass1;
          paramClass1.setAccessible(true);
          paramClass2 = paramClass1;
        }
        catch (NoSuchMethodException paramClass1)
        {
          Log.e("PropertyValuesHolder", "Couldn't find no-arg method for property " + mPropertyName + ": " + paramString);
        }
        continue;
      }
      arrayOfClass = new Class[1];
      int j;
      int i;
      if (mValueType.equals(Float.class))
      {
        paramString = FLOAT_VARIANTS;
        j = paramString.length;
        i = 0;
        paramClass2 = localMethod1;
      }
      Object localObject;
      for (;;)
      {
        if (i >= j) {
          break label265;
        }
        localObject = paramString[i];
        arrayOfClass[0] = localObject;
        try
        {
          localMethod1 = paramClass1.getMethod(str, arrayOfClass);
          paramClass2 = localMethod1;
          mValueType = localObject;
          return localMethod1;
        }
        catch (NoSuchMethodException localNoSuchMethodException1)
        {
          try
          {
            Method localMethod2 = paramClass1.getDeclaredMethod(str, arrayOfClass);
            paramClass2 = localMethod2;
            localMethod2.setAccessible(true);
            paramClass2 = localMethod2;
            mValueType = localObject;
            return localMethod2;
          }
          catch (NoSuchMethodException localNoSuchMethodException2)
          {
            i += 1;
          }
        }
        if (mValueType.equals(Integer.class))
        {
          paramString = INTEGER_VARIANTS;
          break;
        }
        if (mValueType.equals(Double.class))
        {
          paramString = DOUBLE_VARIANTS;
          break;
        }
        paramString = new Class[1];
        paramString[0] = mValueType;
        break;
      }
      label265:
      Log.e("PropertyValuesHolder", "Couldn't find setter/getter for property " + mPropertyName + " with value type " + mValueType);
    }
  }
  
  public static PropertyValuesHolder ofFloat(Property<?, Float> paramProperty, float... paramVarArgs)
  {
    return new FloatPropertyValuesHolder(paramProperty, paramVarArgs);
  }
  
  public static PropertyValuesHolder ofFloat(String paramString, float... paramVarArgs)
  {
    return new FloatPropertyValuesHolder(paramString, paramVarArgs);
  }
  
  public static PropertyValuesHolder ofInt(Property<?, Integer> paramProperty, int... paramVarArgs)
  {
    return new IntPropertyValuesHolder(paramProperty, paramVarArgs);
  }
  
  public static PropertyValuesHolder ofInt(String paramString, int... paramVarArgs)
  {
    return new IntPropertyValuesHolder(paramString, paramVarArgs);
  }
  
  public static <V> PropertyValuesHolder ofObject(Property paramProperty, TypeEvaluator<V> paramTypeEvaluator, V... paramVarArgs)
  {
    paramProperty = new PropertyValuesHolder(paramProperty);
    paramProperty.setObjectValues(paramVarArgs);
    paramProperty.setEvaluator(paramTypeEvaluator);
    return paramProperty;
  }
  
  public static PropertyValuesHolder ofObject(String paramString, TypeEvaluator paramTypeEvaluator, Object... paramVarArgs)
  {
    paramString = new PropertyValuesHolder(paramString);
    paramString.setObjectValues(paramVarArgs);
    paramString.setEvaluator(paramTypeEvaluator);
    return paramString;
  }
  
  private void setupGetter(Class paramClass)
  {
    mGetter = setupSetterOrGetter(paramClass, sGetterPropertyMap, "get", null);
  }
  
  private Method setupSetterOrGetter(Class paramClass1, HashMap<Class, HashMap<String, Method>> paramHashMap, String paramString, Class paramClass2)
  {
    Method localMethod1 = null;
    try
    {
      mPropertyMapLock.writeLock().lock();
      HashMap localHashMap = (HashMap)paramHashMap.get(paramClass1);
      if (localHashMap != null) {
        localMethod1 = (Method)localHashMap.get(mPropertyName);
      }
      Method localMethod2 = localMethod1;
      if (localMethod1 == null)
      {
        localMethod2 = getPropertyFunction(paramClass1, paramString, paramClass2);
        paramString = localHashMap;
        if (localHashMap == null)
        {
          paramString = new HashMap();
          paramHashMap.put(paramClass1, paramString);
        }
        paramString.put(mPropertyName, localMethod2);
      }
      return localMethod2;
    }
    finally
    {
      mPropertyMapLock.writeLock().unlock();
    }
  }
  
  void calculateValue(float paramFloat)
  {
    mAnimatedValue = mKeyframeSet.getValue(paramFloat);
  }
  
  public PropertyValuesHolder clone()
  {
    try
    {
      PropertyValuesHolder localPropertyValuesHolder = (PropertyValuesHolder)super.clone();
      mPropertyName = mPropertyName;
      mProperty = mProperty;
      mKeyframeSet = mKeyframeSet.clone();
      mEvaluator = mEvaluator;
      return localPropertyValuesHolder;
    }
    catch (CloneNotSupportedException localCloneNotSupportedException) {}
    return null;
  }
  
  Object getAnimatedValue()
  {
    return mAnimatedValue;
  }
  
  public String getPropertyName()
  {
    return mPropertyName;
  }
  
  void init()
  {
    TypeEvaluator localTypeEvaluator;
    if (mEvaluator == null)
    {
      if (mValueType != Integer.class) {
        break label44;
      }
      localTypeEvaluator = sIntEvaluator;
    }
    for (;;)
    {
      mEvaluator = localTypeEvaluator;
      if (mEvaluator != null) {
        mKeyframeSet.setEvaluator(mEvaluator);
      }
      return;
      label44:
      if (mValueType == Float.class) {
        localTypeEvaluator = sFloatEvaluator;
      } else {
        localTypeEvaluator = null;
      }
    }
  }
  
  void setAnimatedValue(Object paramObject)
  {
    if (mProperty != null) {
      mProperty.set(paramObject, getAnimatedValue());
    }
    if (mSetter != null) {}
    try
    {
      mTmpValueArray[0] = getAnimatedValue();
      mSetter.invoke(paramObject, mTmpValueArray);
      return;
    }
    catch (InvocationTargetException paramObject)
    {
      Log.e("PropertyValuesHolder", paramObject.toString());
      return;
    }
    catch (IllegalAccessException paramObject)
    {
      Log.e("PropertyValuesHolder", paramObject.toString());
    }
  }
  
  public void setEvaluator(TypeEvaluator paramTypeEvaluator)
  {
    mEvaluator = paramTypeEvaluator;
    mKeyframeSet.setEvaluator(paramTypeEvaluator);
  }
  
  public void setFloatValues(float... paramVarArgs)
  {
    mValueType = Float.TYPE;
    mKeyframeSet = KeyframeSet.ofFloat(paramVarArgs);
  }
  
  public void setIntValues(int... paramVarArgs)
  {
    mValueType = Integer.TYPE;
    mKeyframeSet = KeyframeSet.ofInt(paramVarArgs);
  }
  
  public void setObjectValues(Object... paramVarArgs)
  {
    mValueType = paramVarArgs[0].getClass();
    mKeyframeSet = KeyframeSet.ofObject(paramVarArgs);
  }
  
  public void setProperty(Property paramProperty)
  {
    mProperty = paramProperty;
  }
  
  public void setPropertyName(String paramString)
  {
    mPropertyName = paramString;
  }
  
  void setupSetter(Class paramClass)
  {
    mSetter = setupSetterOrGetter(paramClass, sSetterPropertyMap, "set", mValueType);
  }
  
  void setupSetterAndGetter(Object paramObject)
  {
    Object localObject;
    if (mProperty != null)
    {
      try
      {
        mProperty.get(paramObject);
        Iterator localIterator = mKeyframeSet.mKeyframes.iterator();
        while (localIterator.hasNext())
        {
          localObject = (Keyframe)localIterator.next();
          if (!((Keyframe)localObject).hasValue()) {
            ((Keyframe)localObject).setValue(mProperty.get(paramObject));
          }
        }
        localClass = paramObject.getClass();
      }
      catch (ClassCastException localClassCastException)
      {
        Log.e("PropertyValuesHolder", "No such property (" + mProperty.getName() + ") on target object " + paramObject + ". Trying reflection instead");
        mProperty = null;
      }
    }
    else
    {
      Class localClass;
      if (mSetter == null) {
        setupSetter(localClass);
      }
      localObject = mKeyframeSet.mKeyframes.iterator();
      while (((Iterator)localObject).hasNext())
      {
        Keyframe localKeyframe = (Keyframe)((Iterator)localObject).next();
        if (!localKeyframe.hasValue())
        {
          if (mGetter == null) {
            setupGetter(localClass);
          }
          try
          {
            localKeyframe.setValue(mGetter.invoke(paramObject, new Object[0]));
          }
          catch (InvocationTargetException localInvocationTargetException)
          {
            Log.e("PropertyValuesHolder", localInvocationTargetException.toString());
          }
          catch (IllegalAccessException localIllegalAccessException)
          {
            Log.e("PropertyValuesHolder", localIllegalAccessException.toString());
          }
        }
      }
    }
  }
  
  public String toString()
  {
    return mPropertyName + ": " + mKeyframeSet.toString();
  }
  
  static class FloatPropertyValuesHolder
    extends PropertyValuesHolder
  {
    float mFloatAnimatedValue;
    FloatKeyframeSet mFloatKeyframeSet;
    private FloatProperty mFloatProperty;
    
    public FloatPropertyValuesHolder(Property paramProperty, float... paramVarArgs)
    {
      super(null);
      setFloatValues(paramVarArgs);
      if ((paramProperty instanceof FloatProperty)) {
        mFloatProperty = ((FloatProperty)mProperty);
      }
    }
    
    public FloatPropertyValuesHolder(String paramString, float... paramVarArgs)
    {
      super(null);
      setFloatValues(paramVarArgs);
    }
    
    void calculateValue(float paramFloat)
    {
      mFloatAnimatedValue = mFloatKeyframeSet.getFloatValue(paramFloat);
    }
    
    public FloatPropertyValuesHolder clone()
    {
      FloatPropertyValuesHolder localFloatPropertyValuesHolder = (FloatPropertyValuesHolder)super.clone();
      mFloatKeyframeSet = ((FloatKeyframeSet)mKeyframeSet);
      return localFloatPropertyValuesHolder;
    }
    
    Object getAnimatedValue()
    {
      return Float.valueOf(mFloatAnimatedValue);
    }
    
    void setAnimatedValue(Object paramObject)
    {
      if (mFloatProperty != null) {
        mFloatProperty.setValue(paramObject, mFloatAnimatedValue);
      }
      do
      {
        return;
        if (mProperty != null)
        {
          mProperty.set(paramObject, Float.valueOf(mFloatAnimatedValue));
          return;
        }
      } while (mSetter == null);
      try
      {
        mTmpValueArray[0] = Float.valueOf(mFloatAnimatedValue);
        mSetter.invoke(paramObject, mTmpValueArray);
        return;
      }
      catch (InvocationTargetException paramObject)
      {
        Log.e("PropertyValuesHolder", paramObject.toString());
        return;
      }
      catch (IllegalAccessException paramObject)
      {
        Log.e("PropertyValuesHolder", paramObject.toString());
      }
    }
    
    public void setFloatValues(float... paramVarArgs)
    {
      super.setFloatValues(paramVarArgs);
      mFloatKeyframeSet = ((FloatKeyframeSet)mKeyframeSet);
    }
    
    void setupSetter(Class paramClass)
    {
      if (mProperty != null) {
        return;
      }
      super.setupSetter(paramClass);
    }
  }
  
  static class IntPropertyValuesHolder
    extends PropertyValuesHolder
  {
    int mIntAnimatedValue;
    IntKeyframeSet mIntKeyframeSet;
    private IntProperty mIntProperty;
    
    public IntPropertyValuesHolder(Property paramProperty, int... paramVarArgs)
    {
      super(null);
      setIntValues(paramVarArgs);
      if ((paramProperty instanceof IntProperty)) {
        mIntProperty = ((IntProperty)mProperty);
      }
    }
    
    public IntPropertyValuesHolder(String paramString, int... paramVarArgs)
    {
      super(null);
      setIntValues(paramVarArgs);
    }
    
    void calculateValue(float paramFloat)
    {
      mIntAnimatedValue = mIntKeyframeSet.getIntValue(paramFloat);
    }
    
    public IntPropertyValuesHolder clone()
    {
      IntPropertyValuesHolder localIntPropertyValuesHolder = (IntPropertyValuesHolder)super.clone();
      mIntKeyframeSet = ((IntKeyframeSet)mKeyframeSet);
      return localIntPropertyValuesHolder;
    }
    
    Object getAnimatedValue()
    {
      return Integer.valueOf(mIntAnimatedValue);
    }
    
    void setAnimatedValue(Object paramObject)
    {
      if (mIntProperty != null) {
        mIntProperty.setValue(paramObject, mIntAnimatedValue);
      }
      do
      {
        return;
        if (mProperty != null)
        {
          mProperty.set(paramObject, Integer.valueOf(mIntAnimatedValue));
          return;
        }
      } while (mSetter == null);
      try
      {
        mTmpValueArray[0] = Integer.valueOf(mIntAnimatedValue);
        mSetter.invoke(paramObject, mTmpValueArray);
        return;
      }
      catch (InvocationTargetException paramObject)
      {
        Log.e("PropertyValuesHolder", paramObject.toString());
        return;
      }
      catch (IllegalAccessException paramObject)
      {
        Log.e("PropertyValuesHolder", paramObject.toString());
      }
    }
    
    public void setIntValues(int... paramVarArgs)
    {
      super.setIntValues(paramVarArgs);
      mIntKeyframeSet = ((IntKeyframeSet)mKeyframeSet);
    }
    
    void setupSetter(Class paramClass)
    {
      if (mProperty != null) {
        return;
      }
      super.setupSetter(paramClass);
    }
  }
}
