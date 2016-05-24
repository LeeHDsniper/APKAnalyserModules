package android.support.v7.internal.view;

import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.support.v4.view.ViewPropertyAnimatorListener;
import android.support.v4.view.ViewPropertyAnimatorListenerAdapter;
import android.view.View;
import android.view.animation.Interpolator;
import java.util.ArrayList;
import java.util.Iterator;

public class ViewPropertyAnimatorCompatSet
{
  private final ArrayList<ViewPropertyAnimatorCompat> mAnimators = new ArrayList();
  private long mDuration = -1L;
  private Interpolator mInterpolator;
  private boolean mIsStarted;
  private ViewPropertyAnimatorListener mListener;
  private final ViewPropertyAnimatorListenerAdapter mProxyListener = new ViewPropertyAnimatorListenerAdapter()
  {
    private int mProxyEndCount = 0;
    private boolean mProxyStarted = false;
    
    public void onAnimationEnd(View paramAnonymousView)
    {
      int i = mProxyEndCount + 1;
      mProxyEndCount = i;
      if (i == mAnimators.size())
      {
        if (mListener != null) {
          mListener.onAnimationEnd(null);
        }
        onEnd();
      }
    }
    
    public void onAnimationStart(View paramAnonymousView)
    {
      if (mProxyStarted) {}
      do
      {
        return;
        mProxyStarted = true;
      } while (mListener == null);
      mListener.onAnimationStart(null);
    }
    
    void onEnd()
    {
      mProxyEndCount = 0;
      mProxyStarted = false;
      ViewPropertyAnimatorCompatSet.this.onAnimationsEnded();
    }
  };
  
  public ViewPropertyAnimatorCompatSet() {}
  
  private void onAnimationsEnded()
  {
    mIsStarted = false;
  }
  
  public void cancel()
  {
    if (!mIsStarted) {
      return;
    }
    Iterator localIterator = mAnimators.iterator();
    while (localIterator.hasNext()) {
      ((ViewPropertyAnimatorCompat)localIterator.next()).cancel();
    }
    mIsStarted = false;
  }
  
  public ViewPropertyAnimatorCompatSet play(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat)
  {
    if (!mIsStarted) {
      mAnimators.add(paramViewPropertyAnimatorCompat);
    }
    return this;
  }
  
  public ViewPropertyAnimatorCompatSet setDuration(long paramLong)
  {
    if (!mIsStarted) {
      mDuration = paramLong;
    }
    return this;
  }
  
  public ViewPropertyAnimatorCompatSet setInterpolator(Interpolator paramInterpolator)
  {
    if (!mIsStarted) {
      mInterpolator = paramInterpolator;
    }
    return this;
  }
  
  public ViewPropertyAnimatorCompatSet setListener(ViewPropertyAnimatorListener paramViewPropertyAnimatorListener)
  {
    if (!mIsStarted) {
      mListener = paramViewPropertyAnimatorListener;
    }
    return this;
  }
  
  public void start()
  {
    if (mIsStarted) {
      return;
    }
    Iterator localIterator = mAnimators.iterator();
    while (localIterator.hasNext())
    {
      ViewPropertyAnimatorCompat localViewPropertyAnimatorCompat = (ViewPropertyAnimatorCompat)localIterator.next();
      if (mDuration >= 0L) {
        localViewPropertyAnimatorCompat.setDuration(mDuration);
      }
      if (mInterpolator != null) {
        localViewPropertyAnimatorCompat.setInterpolator(mInterpolator);
      }
      if (mListener != null) {
        localViewPropertyAnimatorCompat.setListener(mProxyListener);
      }
      localViewPropertyAnimatorCompat.start();
    }
    mIsStarted = true;
  }
}
