package com.nineoldandroids.animation;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.AndroidRuntimeException;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class ValueAnimator
  extends Animator
{
  private static ThreadLocal<AnimationHandler> sAnimationHandler = new ThreadLocal();
  private static final ThreadLocal<ArrayList<ValueAnimator>> sAnimations = new ThreadLocal()
  {
    protected ArrayList<ValueAnimator> initialValue()
    {
      return new ArrayList();
    }
  };
  private static final Interpolator sDefaultInterpolator;
  private static final ThreadLocal<ArrayList<ValueAnimator>> sDelayedAnims;
  private static final ThreadLocal<ArrayList<ValueAnimator>> sEndingAnims;
  private static final TypeEvaluator sFloatEvaluator = new FloatEvaluator();
  private static long sFrameDelay = 10L;
  private static final TypeEvaluator sIntEvaluator;
  private static final ThreadLocal<ArrayList<ValueAnimator>> sPendingAnimations = new ThreadLocal()
  {
    protected ArrayList<ValueAnimator> initialValue()
    {
      return new ArrayList();
    }
  };
  private static final ThreadLocal<ArrayList<ValueAnimator>> sReadyAnims;
  private float mCurrentFraction = 0.0F;
  private int mCurrentIteration = 0;
  private long mDelayStartTime;
  private long mDuration = 300L;
  boolean mInitialized = false;
  private Interpolator mInterpolator = sDefaultInterpolator;
  private boolean mPlayingBackwards = false;
  int mPlayingState = 0;
  private int mRepeatCount = 0;
  private int mRepeatMode = 1;
  private boolean mRunning = false;
  long mSeekTime = -1L;
  private long mStartDelay = 0L;
  long mStartTime;
  private boolean mStarted = false;
  private boolean mStartedDelay = false;
  private ArrayList<AnimatorUpdateListener> mUpdateListeners = null;
  PropertyValuesHolder[] mValues;
  HashMap<String, PropertyValuesHolder> mValuesMap;
  
  static
  {
    sDelayedAnims = new ThreadLocal()
    {
      protected ArrayList<ValueAnimator> initialValue()
      {
        return new ArrayList();
      }
    };
    sEndingAnims = new ThreadLocal()
    {
      protected ArrayList<ValueAnimator> initialValue()
      {
        return new ArrayList();
      }
    };
    sReadyAnims = new ThreadLocal()
    {
      protected ArrayList<ValueAnimator> initialValue()
      {
        return new ArrayList();
      }
    };
    sDefaultInterpolator = new AccelerateDecelerateInterpolator();
    sIntEvaluator = new IntEvaluator();
  }
  
  public ValueAnimator() {}
  
  private boolean delayedAnimationFrame(long paramLong)
  {
    if (!mStartedDelay)
    {
      mStartedDelay = true;
      mDelayStartTime = paramLong;
    }
    long l;
    do
    {
      return false;
      l = paramLong - mDelayStartTime;
    } while (l <= mStartDelay);
    mStartTime = (paramLong - (l - mStartDelay));
    mPlayingState = 1;
    return true;
  }
  
  private void endAnimation()
  {
    ((ArrayList)sAnimations.get()).remove(this);
    ((ArrayList)sPendingAnimations.get()).remove(this);
    ((ArrayList)sDelayedAnims.get()).remove(this);
    mPlayingState = 0;
    if ((mRunning) && (mListeners != null))
    {
      ArrayList localArrayList = (ArrayList)mListeners.clone();
      int j = localArrayList.size();
      int i = 0;
      while (i < j)
      {
        ((Animator.AnimatorListener)localArrayList.get(i)).onAnimationEnd(this);
        i += 1;
      }
    }
    mRunning = false;
    mStarted = false;
  }
  
  public static ValueAnimator ofFloat(float... paramVarArgs)
  {
    ValueAnimator localValueAnimator = new ValueAnimator();
    localValueAnimator.setFloatValues(paramVarArgs);
    return localValueAnimator;
  }
  
  public static ValueAnimator ofInt(int... paramVarArgs)
  {
    ValueAnimator localValueAnimator = new ValueAnimator();
    localValueAnimator.setIntValues(paramVarArgs);
    return localValueAnimator;
  }
  
  public static ValueAnimator ofObject(TypeEvaluator paramTypeEvaluator, Object... paramVarArgs)
  {
    ValueAnimator localValueAnimator = new ValueAnimator();
    localValueAnimator.setObjectValues(paramVarArgs);
    localValueAnimator.setEvaluator(paramTypeEvaluator);
    return localValueAnimator;
  }
  
  private void start(boolean paramBoolean)
  {
    if (Looper.myLooper() == null) {
      throw new AndroidRuntimeException("Animators may only be run on Looper threads");
    }
    mPlayingBackwards = paramBoolean;
    mCurrentIteration = 0;
    mPlayingState = 0;
    mStarted = true;
    mStartedDelay = false;
    ((ArrayList)sPendingAnimations.get()).add(this);
    if (mStartDelay == 0L)
    {
      setCurrentPlayTime(getCurrentPlayTime());
      mPlayingState = 0;
      mRunning = true;
      if (mListeners != null)
      {
        localObject = (ArrayList)mListeners.clone();
        int j = ((ArrayList)localObject).size();
        int i = 0;
        while (i < j)
        {
          ((Animator.AnimatorListener)((ArrayList)localObject).get(i)).onAnimationStart(this);
          i += 1;
        }
      }
    }
    AnimationHandler localAnimationHandler = (AnimationHandler)sAnimationHandler.get();
    Object localObject = localAnimationHandler;
    if (localAnimationHandler == null)
    {
      localObject = new AnimationHandler(null);
      sAnimationHandler.set(localObject);
    }
    ((AnimationHandler)localObject).sendEmptyMessage(0);
  }
  
  private void startAnimation()
  {
    initAnimation();
    ((ArrayList)sAnimations.get()).add(this);
    if ((mStartDelay > 0L) && (mListeners != null))
    {
      ArrayList localArrayList = (ArrayList)mListeners.clone();
      int j = localArrayList.size();
      int i = 0;
      while (i < j)
      {
        ((Animator.AnimatorListener)localArrayList.get(i)).onAnimationStart(this);
        i += 1;
      }
    }
  }
  
  public void addUpdateListener(AnimatorUpdateListener paramAnimatorUpdateListener)
  {
    if (mUpdateListeners == null) {
      mUpdateListeners = new ArrayList();
    }
    mUpdateListeners.add(paramAnimatorUpdateListener);
  }
  
  void animateValue(float paramFloat)
  {
    paramFloat = mInterpolator.getInterpolation(paramFloat);
    mCurrentFraction = paramFloat;
    int j = mValues.length;
    int i = 0;
    while (i < j)
    {
      mValues[i].calculateValue(paramFloat);
      i += 1;
    }
    if (mUpdateListeners != null)
    {
      j = mUpdateListeners.size();
      i = 0;
      while (i < j)
      {
        ((AnimatorUpdateListener)mUpdateListeners.get(i)).onAnimationUpdate(this);
        i += 1;
      }
    }
  }
  
  boolean animationFrame(long paramLong)
  {
    boolean bool2 = false;
    if (mPlayingState == 0)
    {
      mPlayingState = 1;
      if (mSeekTime >= 0L) {
        break label58;
      }
      mStartTime = paramLong;
    }
    for (;;)
    {
      switch (mPlayingState)
      {
      default: 
        return false;
        label58:
        mStartTime = (paramLong - mSeekTime);
        mSeekTime = -1L;
      }
    }
    if (mDuration > 0L) {}
    boolean bool1;
    float f1;
    for (float f2 = (float)(paramLong - mStartTime) / (float)mDuration;; f2 = 1.0F)
    {
      bool1 = bool2;
      f1 = f2;
      if (f2 < 1.0F) {
        break label252;
      }
      if ((mCurrentIteration >= mRepeatCount) && (mRepeatCount != -1)) {
        break label282;
      }
      if (mListeners == null) {
        break;
      }
      int j = mListeners.size();
      int i = 0;
      while (i < j)
      {
        ((Animator.AnimatorListener)mListeners.get(i)).onAnimationRepeat(this);
        i += 1;
      }
    }
    if (mRepeatMode == 2)
    {
      if (mPlayingBackwards)
      {
        bool1 = false;
        mPlayingBackwards = bool1;
      }
    }
    else
    {
      mCurrentIteration += (int)f2;
      f1 = f2 % 1.0F;
      mStartTime += mDuration;
      bool1 = bool2;
    }
    for (;;)
    {
      label252:
      f2 = f1;
      if (mPlayingBackwards) {
        f2 = 1.0F - f1;
      }
      animateValue(f2);
      return bool1;
      bool1 = true;
      break;
      label282:
      bool1 = true;
      f1 = Math.min(f2, 1.0F);
    }
  }
  
  public void cancel()
  {
    if ((mPlayingState != 0) || (((ArrayList)sPendingAnimations.get()).contains(this)) || (((ArrayList)sDelayedAnims.get()).contains(this)))
    {
      if ((mRunning) && (mListeners != null))
      {
        Iterator localIterator = ((ArrayList)mListeners.clone()).iterator();
        while (localIterator.hasNext()) {
          ((Animator.AnimatorListener)localIterator.next()).onAnimationCancel(this);
        }
      }
      endAnimation();
    }
  }
  
  public ValueAnimator clone()
  {
    ValueAnimator localValueAnimator = (ValueAnimator)super.clone();
    int j;
    int i;
    if (mUpdateListeners != null)
    {
      localObject = mUpdateListeners;
      mUpdateListeners = new ArrayList();
      j = ((ArrayList)localObject).size();
      i = 0;
      while (i < j)
      {
        mUpdateListeners.add(((ArrayList)localObject).get(i));
        i += 1;
      }
    }
    mSeekTime = -1L;
    mPlayingBackwards = false;
    mCurrentIteration = 0;
    mInitialized = false;
    mPlayingState = 0;
    mStartedDelay = false;
    Object localObject = mValues;
    if (localObject != null)
    {
      j = localObject.length;
      mValues = new PropertyValuesHolder[j];
      mValuesMap = new HashMap(j);
      i = 0;
      while (i < j)
      {
        PropertyValuesHolder localPropertyValuesHolder = localObject[i].clone();
        mValues[i] = localPropertyValuesHolder;
        mValuesMap.put(localPropertyValuesHolder.getPropertyName(), localPropertyValuesHolder);
        i += 1;
      }
    }
    return localValueAnimator;
  }
  
  public Object getAnimatedValue()
  {
    if ((mValues != null) && (mValues.length > 0)) {
      return mValues[0].getAnimatedValue();
    }
    return null;
  }
  
  public long getCurrentPlayTime()
  {
    if ((!mInitialized) || (mPlayingState == 0)) {
      return 0L;
    }
    return AnimationUtils.currentAnimationTimeMillis() - mStartTime;
  }
  
  void initAnimation()
  {
    if (!mInitialized)
    {
      int j = mValues.length;
      int i = 0;
      while (i < j)
      {
        mValues[i].init();
        i += 1;
      }
      mInitialized = true;
    }
  }
  
  public boolean isRunning()
  {
    return (mPlayingState == 1) || (mRunning);
  }
  
  public boolean isStarted()
  {
    return mStarted;
  }
  
  public void setCurrentPlayTime(long paramLong)
  {
    initAnimation();
    long l = AnimationUtils.currentAnimationTimeMillis();
    if (mPlayingState != 1)
    {
      mSeekTime = paramLong;
      mPlayingState = 2;
    }
    mStartTime = (l - paramLong);
    animationFrame(l);
  }
  
  public ValueAnimator setDuration(long paramLong)
  {
    if (paramLong < 0L) {
      throw new IllegalArgumentException("Animators cannot have negative duration: " + paramLong);
    }
    mDuration = paramLong;
    return this;
  }
  
  public void setEvaluator(TypeEvaluator paramTypeEvaluator)
  {
    if ((paramTypeEvaluator != null) && (mValues != null) && (mValues.length > 0)) {
      mValues[0].setEvaluator(paramTypeEvaluator);
    }
  }
  
  public void setFloatValues(float... paramVarArgs)
  {
    if ((paramVarArgs == null) || (paramVarArgs.length == 0)) {
      return;
    }
    if ((mValues == null) || (mValues.length == 0)) {
      setValues(new PropertyValuesHolder[] { PropertyValuesHolder.ofFloat("", paramVarArgs) });
    }
    for (;;)
    {
      mInitialized = false;
      return;
      mValues[0].setFloatValues(paramVarArgs);
    }
  }
  
  public void setIntValues(int... paramVarArgs)
  {
    if ((paramVarArgs == null) || (paramVarArgs.length == 0)) {
      return;
    }
    if ((mValues == null) || (mValues.length == 0)) {
      setValues(new PropertyValuesHolder[] { PropertyValuesHolder.ofInt("", paramVarArgs) });
    }
    for (;;)
    {
      mInitialized = false;
      return;
      mValues[0].setIntValues(paramVarArgs);
    }
  }
  
  public void setInterpolator(Interpolator paramInterpolator)
  {
    if (paramInterpolator != null)
    {
      mInterpolator = paramInterpolator;
      return;
    }
    mInterpolator = new LinearInterpolator();
  }
  
  public void setObjectValues(Object... paramVarArgs)
  {
    if ((paramVarArgs == null) || (paramVarArgs.length == 0)) {
      return;
    }
    if ((mValues == null) || (mValues.length == 0)) {
      setValues(new PropertyValuesHolder[] { PropertyValuesHolder.ofObject("", (TypeEvaluator)null, paramVarArgs) });
    }
    for (;;)
    {
      mInitialized = false;
      return;
      mValues[0].setObjectValues(paramVarArgs);
    }
  }
  
  public void setStartDelay(long paramLong)
  {
    mStartDelay = paramLong;
  }
  
  public void setValues(PropertyValuesHolder... paramVarArgs)
  {
    int j = paramVarArgs.length;
    mValues = paramVarArgs;
    mValuesMap = new HashMap(j);
    int i = 0;
    while (i < j)
    {
      PropertyValuesHolder localPropertyValuesHolder = paramVarArgs[i];
      mValuesMap.put(localPropertyValuesHolder.getPropertyName(), localPropertyValuesHolder);
      i += 1;
    }
    mInitialized = false;
  }
  
  public void start()
  {
    start(false);
  }
  
  public String toString()
  {
    String str1 = "ValueAnimator@" + Integer.toHexString(hashCode());
    String str2 = str1;
    if (mValues != null)
    {
      int i = 0;
      for (;;)
      {
        str2 = str1;
        if (i >= mValues.length) {
          break;
        }
        str1 = str1 + "\n    " + mValues[i].toString();
        i += 1;
      }
    }
    return str2;
  }
  
  private static class AnimationHandler
    extends Handler
  {
    private AnimationHandler() {}
    
    public void handleMessage(Message paramMessage)
    {
      int j = 1;
      int i = 1;
      ArrayList localArrayList1 = (ArrayList)ValueAnimator.sAnimations.get();
      ArrayList localArrayList2 = (ArrayList)ValueAnimator.sDelayedAnims.get();
      switch (what)
      {
      }
      label112:
      label151:
      long l;
      do
      {
        return;
        paramMessage = (ArrayList)ValueAnimator.sPendingAnimations.get();
        if ((localArrayList1.size() > 0) || (localArrayList2.size() > 0)) {
          i = 0;
        }
        j = i;
        ValueAnimator localValueAnimator;
        if (paramMessage.size() > 0)
        {
          localObject = (ArrayList)paramMessage.clone();
          paramMessage.clear();
          k = ((ArrayList)localObject).size();
          j = 0;
          if (j < k)
          {
            localValueAnimator = (ValueAnimator)((ArrayList)localObject).get(j);
            if (mStartDelay != 0L) {
              break label151;
            }
            localValueAnimator.startAnimation();
          }
          for (;;)
          {
            j += 1;
            break label112;
            break;
            localArrayList2.add(localValueAnimator);
          }
        }
        l = AnimationUtils.currentAnimationTimeMillis();
        Object localObject = (ArrayList)ValueAnimator.sReadyAnims.get();
        paramMessage = (ArrayList)ValueAnimator.sEndingAnims.get();
        int k = localArrayList2.size();
        i = 0;
        while (i < k)
        {
          localValueAnimator = (ValueAnimator)localArrayList2.get(i);
          if (localValueAnimator.delayedAnimationFrame(l)) {
            ((ArrayList)localObject).add(localValueAnimator);
          }
          i += 1;
        }
        k = ((ArrayList)localObject).size();
        if (k > 0)
        {
          i = 0;
          while (i < k)
          {
            localValueAnimator = (ValueAnimator)((ArrayList)localObject).get(i);
            localValueAnimator.startAnimation();
            ValueAnimator.access$802(localValueAnimator, true);
            localArrayList2.remove(localValueAnimator);
            i += 1;
          }
          ((ArrayList)localObject).clear();
        }
        i = localArrayList1.size();
        k = 0;
        while (k < i)
        {
          localObject = (ValueAnimator)localArrayList1.get(k);
          if (((ValueAnimator)localObject).animationFrame(l)) {
            paramMessage.add(localObject);
          }
          if (localArrayList1.size() == i)
          {
            k += 1;
          }
          else
          {
            i -= 1;
            paramMessage.remove(localObject);
          }
        }
        if (paramMessage.size() > 0)
        {
          i = 0;
          while (i < paramMessage.size())
          {
            ((ValueAnimator)paramMessage.get(i)).endAnimation();
            i += 1;
          }
          paramMessage.clear();
        }
      } while ((j == 0) || ((localArrayList1.isEmpty()) && (localArrayList2.isEmpty())));
      sendEmptyMessageDelayed(1, Math.max(0L, ValueAnimator.sFrameDelay - (AnimationUtils.currentAnimationTimeMillis() - l)));
    }
  }
  
  public static abstract interface AnimatorUpdateListener
  {
    public abstract void onAnimationUpdate(ValueAnimator paramValueAnimator);
  }
}
