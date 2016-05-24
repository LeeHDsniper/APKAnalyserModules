package android.support.v4.view;

import android.os.Build.VERSION;
import android.view.View;
import android.view.animation.Interpolator;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

public class ViewPropertyAnimatorCompat
{
  static final ViewPropertyAnimatorCompatImpl IMPL = new BaseViewPropertyAnimatorCompatImpl();
  private Runnable mEndAction = null;
  private int mOldLayerType = -1;
  private Runnable mStartAction = null;
  private WeakReference<View> mView;
  
  static
  {
    int i = Build.VERSION.SDK_INT;
    if (i >= 21)
    {
      IMPL = new LollipopViewPropertyAnimatorCompatImpl();
      return;
    }
    if (i >= 19)
    {
      IMPL = new KitKatViewPropertyAnimatorCompatImpl();
      return;
    }
    if (i >= 18)
    {
      IMPL = new JBMr2ViewPropertyAnimatorCompatImpl();
      return;
    }
    if (i >= 16)
    {
      IMPL = new JBViewPropertyAnimatorCompatImpl();
      return;
    }
    if (i >= 14)
    {
      IMPL = new ICSViewPropertyAnimatorCompatImpl();
      return;
    }
  }
  
  ViewPropertyAnimatorCompat(View paramView)
  {
    mView = new WeakReference(paramView);
  }
  
  public ViewPropertyAnimatorCompat alpha(float paramFloat)
  {
    View localView = (View)mView.get();
    if (localView != null) {
      IMPL.alpha(this, localView, paramFloat);
    }
    return this;
  }
  
  public void cancel()
  {
    View localView = (View)mView.get();
    if (localView != null) {
      IMPL.cancel(this, localView);
    }
  }
  
  public ViewPropertyAnimatorCompat scaleY(float paramFloat)
  {
    View localView = (View)mView.get();
    if (localView != null) {
      IMPL.scaleY(this, localView, paramFloat);
    }
    return this;
  }
  
  public ViewPropertyAnimatorCompat setDuration(long paramLong)
  {
    View localView = (View)mView.get();
    if (localView != null) {
      IMPL.setDuration(this, localView, paramLong);
    }
    return this;
  }
  
  public ViewPropertyAnimatorCompat setInterpolator(Interpolator paramInterpolator)
  {
    View localView = (View)mView.get();
    if (localView != null) {
      IMPL.setInterpolator(this, localView, paramInterpolator);
    }
    return this;
  }
  
  public ViewPropertyAnimatorCompat setListener(ViewPropertyAnimatorListener paramViewPropertyAnimatorListener)
  {
    View localView = (View)mView.get();
    if (localView != null) {
      IMPL.setListener(this, localView, paramViewPropertyAnimatorListener);
    }
    return this;
  }
  
  public ViewPropertyAnimatorCompat setStartDelay(long paramLong)
  {
    View localView = (View)mView.get();
    if (localView != null) {
      IMPL.setStartDelay(this, localView, paramLong);
    }
    return this;
  }
  
  public ViewPropertyAnimatorCompat setUpdateListener(ViewPropertyAnimatorUpdateListener paramViewPropertyAnimatorUpdateListener)
  {
    View localView = (View)mView.get();
    if (localView != null) {
      IMPL.setUpdateListener(this, localView, paramViewPropertyAnimatorUpdateListener);
    }
    return this;
  }
  
  public void start()
  {
    View localView = (View)mView.get();
    if (localView != null) {
      IMPL.start(this, localView);
    }
  }
  
  public ViewPropertyAnimatorCompat translationX(float paramFloat)
  {
    View localView = (View)mView.get();
    if (localView != null) {
      IMPL.translationX(this, localView, paramFloat);
    }
    return this;
  }
  
  public ViewPropertyAnimatorCompat translationY(float paramFloat)
  {
    View localView = (View)mView.get();
    if (localView != null) {
      IMPL.translationY(this, localView, paramFloat);
    }
    return this;
  }
  
  static class BaseViewPropertyAnimatorCompatImpl
    implements ViewPropertyAnimatorCompat.ViewPropertyAnimatorCompatImpl
  {
    WeakHashMap<View, Runnable> mStarterMap = null;
    
    BaseViewPropertyAnimatorCompatImpl() {}
    
    private void postStartMessage(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView)
    {
      Runnable localRunnable = null;
      if (mStarterMap != null) {
        localRunnable = (Runnable)mStarterMap.get(paramView);
      }
      Object localObject = localRunnable;
      if (localRunnable == null)
      {
        localObject = new Starter(paramViewPropertyAnimatorCompat, paramView, null);
        if (mStarterMap == null) {
          mStarterMap = new WeakHashMap();
        }
        mStarterMap.put(paramView, localObject);
      }
      paramView.removeCallbacks((Runnable)localObject);
      paramView.post((Runnable)localObject);
    }
    
    private void removeStartMessage(View paramView)
    {
      if (mStarterMap != null)
      {
        Runnable localRunnable = (Runnable)mStarterMap.get(paramView);
        if (localRunnable != null) {
          paramView.removeCallbacks(localRunnable);
        }
      }
    }
    
    private void startAnimation(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView)
    {
      Object localObject = paramView.getTag(2113929216);
      ViewPropertyAnimatorListener localViewPropertyAnimatorListener = null;
      if ((localObject instanceof ViewPropertyAnimatorListener)) {
        localViewPropertyAnimatorListener = (ViewPropertyAnimatorListener)localObject;
      }
      localObject = mStartAction;
      paramViewPropertyAnimatorCompat = mEndAction;
      if (localObject != null) {
        ((Runnable)localObject).run();
      }
      if (localViewPropertyAnimatorListener != null)
      {
        localViewPropertyAnimatorListener.onAnimationStart(paramView);
        localViewPropertyAnimatorListener.onAnimationEnd(paramView);
      }
      if (paramViewPropertyAnimatorCompat != null) {
        paramViewPropertyAnimatorCompat.run();
      }
      if (mStarterMap != null) {
        mStarterMap.remove(paramView);
      }
    }
    
    public void alpha(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, float paramFloat)
    {
      postStartMessage(paramViewPropertyAnimatorCompat, paramView);
    }
    
    public void cancel(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView)
    {
      postStartMessage(paramViewPropertyAnimatorCompat, paramView);
    }
    
    public void scaleY(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, float paramFloat)
    {
      postStartMessage(paramViewPropertyAnimatorCompat, paramView);
    }
    
    public void setDuration(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, long paramLong) {}
    
    public void setInterpolator(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, Interpolator paramInterpolator) {}
    
    public void setListener(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, ViewPropertyAnimatorListener paramViewPropertyAnimatorListener)
    {
      paramView.setTag(2113929216, paramViewPropertyAnimatorListener);
    }
    
    public void setStartDelay(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, long paramLong) {}
    
    public void setUpdateListener(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, ViewPropertyAnimatorUpdateListener paramViewPropertyAnimatorUpdateListener) {}
    
    public void start(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView)
    {
      removeStartMessage(paramView);
      startAnimation(paramViewPropertyAnimatorCompat, paramView);
    }
    
    public void translationX(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, float paramFloat)
    {
      postStartMessage(paramViewPropertyAnimatorCompat, paramView);
    }
    
    public void translationY(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, float paramFloat)
    {
      postStartMessage(paramViewPropertyAnimatorCompat, paramView);
    }
    
    class Starter
      implements Runnable
    {
      WeakReference<View> mViewRef;
      ViewPropertyAnimatorCompat mVpa;
      
      private Starter(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView)
      {
        mViewRef = new WeakReference(paramView);
        mVpa = paramViewPropertyAnimatorCompat;
      }
      
      public void run()
      {
        View localView = (View)mViewRef.get();
        if (localView != null) {
          ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl.this.startAnimation(mVpa, localView);
        }
      }
    }
  }
  
  static class ICSViewPropertyAnimatorCompatImpl
    extends ViewPropertyAnimatorCompat.BaseViewPropertyAnimatorCompatImpl
  {
    WeakHashMap<View, Integer> mLayerMap = null;
    
    ICSViewPropertyAnimatorCompatImpl() {}
    
    public void alpha(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, float paramFloat)
    {
      ViewPropertyAnimatorCompatICS.alpha(paramView, paramFloat);
    }
    
    public void cancel(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView)
    {
      ViewPropertyAnimatorCompatICS.cancel(paramView);
    }
    
    public void scaleY(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, float paramFloat)
    {
      ViewPropertyAnimatorCompatICS.scaleY(paramView, paramFloat);
    }
    
    public void setDuration(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, long paramLong)
    {
      ViewPropertyAnimatorCompatICS.setDuration(paramView, paramLong);
    }
    
    public void setInterpolator(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, Interpolator paramInterpolator)
    {
      ViewPropertyAnimatorCompatICS.setInterpolator(paramView, paramInterpolator);
    }
    
    public void setListener(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, ViewPropertyAnimatorListener paramViewPropertyAnimatorListener)
    {
      paramView.setTag(2113929216, paramViewPropertyAnimatorListener);
      ViewPropertyAnimatorCompatICS.setListener(paramView, new MyVpaListener(paramViewPropertyAnimatorCompat));
    }
    
    public void setStartDelay(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, long paramLong)
    {
      ViewPropertyAnimatorCompatICS.setStartDelay(paramView, paramLong);
    }
    
    public void start(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView)
    {
      ViewPropertyAnimatorCompatICS.start(paramView);
    }
    
    public void translationX(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, float paramFloat)
    {
      ViewPropertyAnimatorCompatICS.translationX(paramView, paramFloat);
    }
    
    public void translationY(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, float paramFloat)
    {
      ViewPropertyAnimatorCompatICS.translationY(paramView, paramFloat);
    }
    
    static class MyVpaListener
      implements ViewPropertyAnimatorListener
    {
      ViewPropertyAnimatorCompat mVpa;
      
      MyVpaListener(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat)
      {
        mVpa = paramViewPropertyAnimatorCompat;
      }
      
      public void onAnimationCancel(View paramView)
      {
        Object localObject = paramView.getTag(2113929216);
        ViewPropertyAnimatorListener localViewPropertyAnimatorListener = null;
        if ((localObject instanceof ViewPropertyAnimatorListener)) {
          localViewPropertyAnimatorListener = (ViewPropertyAnimatorListener)localObject;
        }
        if (localViewPropertyAnimatorListener != null) {
          localViewPropertyAnimatorListener.onAnimationCancel(paramView);
        }
      }
      
      public void onAnimationEnd(View paramView)
      {
        if (mVpa.mOldLayerType >= 0)
        {
          ViewCompat.setLayerType(paramView, mVpa.mOldLayerType, null);
          ViewPropertyAnimatorCompat.access$402(mVpa, -1);
        }
        if (mVpa.mEndAction != null) {
          mVpa.mEndAction.run();
        }
        Object localObject = paramView.getTag(2113929216);
        ViewPropertyAnimatorListener localViewPropertyAnimatorListener = null;
        if ((localObject instanceof ViewPropertyAnimatorListener)) {
          localViewPropertyAnimatorListener = (ViewPropertyAnimatorListener)localObject;
        }
        if (localViewPropertyAnimatorListener != null) {
          localViewPropertyAnimatorListener.onAnimationEnd(paramView);
        }
      }
      
      public void onAnimationStart(View paramView)
      {
        if (mVpa.mOldLayerType >= 0) {
          ViewCompat.setLayerType(paramView, 2, null);
        }
        if (mVpa.mStartAction != null) {
          mVpa.mStartAction.run();
        }
        Object localObject = paramView.getTag(2113929216);
        ViewPropertyAnimatorListener localViewPropertyAnimatorListener = null;
        if ((localObject instanceof ViewPropertyAnimatorListener)) {
          localViewPropertyAnimatorListener = (ViewPropertyAnimatorListener)localObject;
        }
        if (localViewPropertyAnimatorListener != null) {
          localViewPropertyAnimatorListener.onAnimationStart(paramView);
        }
      }
    }
  }
  
  static class JBMr2ViewPropertyAnimatorCompatImpl
    extends ViewPropertyAnimatorCompat.JBViewPropertyAnimatorCompatImpl
  {
    JBMr2ViewPropertyAnimatorCompatImpl() {}
  }
  
  static class JBViewPropertyAnimatorCompatImpl
    extends ViewPropertyAnimatorCompat.ICSViewPropertyAnimatorCompatImpl
  {
    JBViewPropertyAnimatorCompatImpl() {}
    
    public void setListener(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, ViewPropertyAnimatorListener paramViewPropertyAnimatorListener)
    {
      ViewPropertyAnimatorCompatJB.setListener(paramView, paramViewPropertyAnimatorListener);
    }
  }
  
  static class KitKatViewPropertyAnimatorCompatImpl
    extends ViewPropertyAnimatorCompat.JBMr2ViewPropertyAnimatorCompatImpl
  {
    KitKatViewPropertyAnimatorCompatImpl() {}
    
    public void setUpdateListener(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, ViewPropertyAnimatorUpdateListener paramViewPropertyAnimatorUpdateListener)
    {
      ViewPropertyAnimatorCompatKK.setUpdateListener(paramView, paramViewPropertyAnimatorUpdateListener);
    }
  }
  
  static class LollipopViewPropertyAnimatorCompatImpl
    extends ViewPropertyAnimatorCompat.KitKatViewPropertyAnimatorCompatImpl
  {
    LollipopViewPropertyAnimatorCompatImpl() {}
  }
  
  static abstract interface ViewPropertyAnimatorCompatImpl
  {
    public abstract void alpha(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, float paramFloat);
    
    public abstract void cancel(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView);
    
    public abstract void scaleY(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, float paramFloat);
    
    public abstract void setDuration(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, long paramLong);
    
    public abstract void setInterpolator(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, Interpolator paramInterpolator);
    
    public abstract void setListener(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, ViewPropertyAnimatorListener paramViewPropertyAnimatorListener);
    
    public abstract void setStartDelay(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, long paramLong);
    
    public abstract void setUpdateListener(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, ViewPropertyAnimatorUpdateListener paramViewPropertyAnimatorUpdateListener);
    
    public abstract void start(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView);
    
    public abstract void translationX(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, float paramFloat);
    
    public abstract void translationY(ViewPropertyAnimatorCompat paramViewPropertyAnimatorCompat, View paramView, float paramFloat);
  }
}
