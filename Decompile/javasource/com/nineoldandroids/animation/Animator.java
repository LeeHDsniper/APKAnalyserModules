package com.nineoldandroids.animation;

import android.view.animation.Interpolator;
import java.util.ArrayList;

public abstract class Animator
  implements Cloneable
{
  ArrayList<AnimatorListener> mListeners = null;
  
  public Animator() {}
  
  public void addListener(AnimatorListener paramAnimatorListener)
  {
    if (mListeners == null) {
      mListeners = new ArrayList();
    }
    mListeners.add(paramAnimatorListener);
  }
  
  public void cancel() {}
  
  public Animator clone()
  {
    try
    {
      Animator localAnimator = (Animator)super.clone();
      if (mListeners != null)
      {
        ArrayList localArrayList = mListeners;
        mListeners = new ArrayList();
        int j = localArrayList.size();
        int i = 0;
        while (i < j)
        {
          mListeners.add(localArrayList.get(i));
          i += 1;
        }
      }
      return localCloneNotSupportedException;
    }
    catch (CloneNotSupportedException localCloneNotSupportedException)
    {
      throw new AssertionError();
    }
  }
  
  public ArrayList<AnimatorListener> getListeners()
  {
    return mListeners;
  }
  
  public abstract boolean isRunning();
  
  public boolean isStarted()
  {
    return isRunning();
  }
  
  public void removeListener(AnimatorListener paramAnimatorListener)
  {
    if (mListeners == null) {}
    do
    {
      return;
      mListeners.remove(paramAnimatorListener);
    } while (mListeners.size() != 0);
    mListeners = null;
  }
  
  public abstract Animator setDuration(long paramLong);
  
  public abstract void setInterpolator(Interpolator paramInterpolator);
  
  public abstract void setStartDelay(long paramLong);
  
  public void start() {}
  
  public static abstract interface AnimatorListener
  {
    public abstract void onAnimationCancel(Animator paramAnimator);
    
    public abstract void onAnimationEnd(Animator paramAnimator);
    
    public abstract void onAnimationRepeat(Animator paramAnimator);
    
    public abstract void onAnimationStart(Animator paramAnimator);
  }
}
