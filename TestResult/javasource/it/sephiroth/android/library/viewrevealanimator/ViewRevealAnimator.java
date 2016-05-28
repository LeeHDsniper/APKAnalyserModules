package it.sephiroth.android.library.viewrevealanimator;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Point;
import android.os.Build.VERSION;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;
import android.widget.FrameLayout;
import android.widget.ViewAnimator;

public class ViewRevealAnimator
  extends FrameLayout
{
  boolean mAnimateFirstTime = true;
  int mAnimationDuration;
  boolean mFirstTime = true;
  boolean mHideBeforeReveal;
  Animation mInAnimation;
  RevealAnimator mInstance;
  Interpolator mInterpolator;
  Animation mOutAnimation;
  OnViewAnimationListener mViewAnimationListener;
  OnViewChangedListener mViewChangedListener;
  int mWhichChild = 0;
  
  public ViewRevealAnimator(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public ViewRevealAnimator(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public ViewRevealAnimator(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet);
    if (Build.VERSION.SDK_INT >= 21) {}
    for (mInstance = new LollipopRevealAnimatorImpl(this);; mInstance = new ICSRevealAnimatorImpl(this))
    {
      TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.ViewRelealAnimator, paramInt, 0);
      paramInt = localTypedArray.getResourceId(R.styleable.ViewRelealAnimator_android_inAnimation, 0);
      int i = localTypedArray.getResourceId(R.styleable.ViewRelealAnimator_android_outAnimation, 0);
      boolean bool1 = localTypedArray.getBoolean(R.styleable.ViewRelealAnimator_android_animateFirstView, true);
      int j = localTypedArray.getInteger(R.styleable.ViewRelealAnimator_android_animationDuration, 400);
      boolean bool2 = localTypedArray.getBoolean(R.styleable.ViewRelealAnimator_vra_hideBeforeReveal, true);
      setInAnimation(paramContext, paramInt);
      setOutAnimation(paramContext, i);
      setAnimateFirstView(bool1);
      setAnimationDuration(j);
      setHideBeforeReveal(bool2);
      if (Build.VERSION.SDK_INT >= 21) {
        setInterpolator(AnimationUtils.loadInterpolator(paramContext, localTypedArray.getResourceId(R.styleable.ViewRelealAnimator_android_interpolator, 17563654)));
      }
      localTypedArray.recycle();
      initViewAnimator(paramContext, paramAttributeSet);
      return;
    }
  }
  
  public static final double distance(Point paramPoint1, Point paramPoint2)
  {
    return Math.sqrt((x - x) * (x - x) + (y - y) * (y - y));
  }
  
  private void initViewAnimator(Context paramContext, AttributeSet paramAttributeSet)
  {
    if (paramAttributeSet == null)
    {
      setMeasureAllChildren(true);
      return;
    }
    paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.ViewRelealAnimator);
    setMeasureAllChildren(paramContext.getBoolean(R.styleable.ViewRelealAnimator_android_measureAllChildren, true));
    paramContext.recycle();
  }
  
  private boolean shouldAnimate()
  {
    return mInstance.shouldAnimate();
  }
  
  public void addView(View paramView, int paramInt, ViewGroup.LayoutParams paramLayoutParams)
  {
    super.addView(paramView, paramInt, paramLayoutParams);
    if (getChildCount() == 1) {
      paramView.setVisibility(0);
    }
    for (;;)
    {
      if ((paramInt >= 0) && (mWhichChild >= paramInt)) {
        setDisplayedChild(mWhichChild + 1, false, null);
      }
      return;
      paramView.setVisibility(8);
    }
  }
  
  public boolean getAnimateFirstView()
  {
    return mAnimateFirstTime;
  }
  
  public int getAnimationDuration()
  {
    return mAnimationDuration;
  }
  
  public int getBaseline()
  {
    if (getCurrentView() == null) {
      return super.getBaseline();
    }
    return getCurrentView().getBaseline();
  }
  
  public View getCurrentView()
  {
    return getChildAt(mWhichChild);
  }
  
  public int getDisplayedChild()
  {
    return mWhichChild;
  }
  
  public boolean getHideBeforeReveal()
  {
    return mHideBeforeReveal;
  }
  
  public Animation getInAnimation()
  {
    return mInAnimation;
  }
  
  public Interpolator getInterpolator()
  {
    return mInterpolator;
  }
  
  public Animation getOutAnimation()
  {
    return mOutAnimation;
  }
  
  protected Point getViewCenter(View paramView)
  {
    Point localPoint = new Point();
    x = (paramView.getWidth() / 2);
    y = (paramView.getHeight() / 2);
    return localPoint;
  }
  
  public int getViewRadius(View paramView)
  {
    return Math.max(paramView.getWidth(), paramView.getHeight());
  }
  
  protected void onAnimationCompleted(int paramInt1, int paramInt2)
  {
    if (mViewAnimationListener != null) {
      mViewAnimationListener.onViewAnimationCompleted(paramInt1, paramInt2);
    }
  }
  
  protected void onAnimationStarted(int paramInt1, int paramInt2)
  {
    if (mViewAnimationListener != null) {
      mViewAnimationListener.onViewAnimationStarted(paramInt1, paramInt2);
    }
  }
  
  public void onInitializeAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    super.onInitializeAccessibilityEvent(paramAccessibilityEvent);
    paramAccessibilityEvent.setClassName(ViewAnimator.class.getName());
  }
  
  public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo paramAccessibilityNodeInfo)
  {
    super.onInitializeAccessibilityNodeInfo(paramAccessibilityNodeInfo);
    paramAccessibilityNodeInfo.setClassName(ViewAnimator.class.getName());
  }
  
  protected void onViewChanged(int paramInt1, int paramInt2)
  {
    if (mViewChangedListener != null) {
      mViewChangedListener.onViewChanged(paramInt1, paramInt2);
    }
  }
  
  public void removeAllViews()
  {
    super.removeAllViews();
    mWhichChild = 0;
    mFirstTime = true;
  }
  
  public void removeView(View paramView)
  {
    int i = indexOfChild(paramView);
    if (i >= 0) {
      removeViewAt(i);
    }
  }
  
  public void removeViewAt(int paramInt)
  {
    super.removeViewAt(paramInt);
    int i = getChildCount();
    if (i == 0)
    {
      mWhichChild = 0;
      mFirstTime = true;
    }
    do
    {
      return;
      if (mWhichChild >= i)
      {
        setDisplayedChild(i - 1, false, null);
        return;
      }
    } while (mWhichChild != paramInt);
    setDisplayedChild(mWhichChild, false, null);
  }
  
  public void removeViewInLayout(View paramView)
  {
    removeView(paramView);
  }
  
  public void removeViews(int paramInt1, int paramInt2)
  {
    super.removeViews(paramInt1, paramInt2);
    if (getChildCount() == 0)
    {
      mWhichChild = 0;
      mFirstTime = true;
    }
    while ((mWhichChild < paramInt1) || (mWhichChild >= paramInt1 + paramInt2)) {
      return;
    }
    setDisplayedChild(mWhichChild, false, null);
  }
  
  public void removeViewsInLayout(int paramInt1, int paramInt2)
  {
    removeViews(paramInt1, paramInt2);
  }
  
  public void setAnimateFirstView(boolean paramBoolean)
  {
    mAnimateFirstTime = paramBoolean;
  }
  
  public void setAnimationDuration(int paramInt)
  {
    mAnimationDuration = paramInt;
  }
  
  public void setDisplayedChild(int paramInt)
  {
    setDisplayedChild(paramInt, true, null);
  }
  
  public void setDisplayedChild(int paramInt, boolean paramBoolean)
  {
    setDisplayedChild(paramInt, paramBoolean, null);
  }
  
  public void setDisplayedChild(int paramInt, boolean paramBoolean, Point paramPoint)
  {
    int i = 0;
    if (paramInt == mWhichChild) {
      return;
    }
    int j = mWhichChild;
    mWhichChild = paramInt;
    if (paramInt >= getChildCount()) {
      mWhichChild = 0;
    }
    for (;;)
    {
      paramInt = i;
      if (getFocusedChild() != null) {
        paramInt = 1;
      }
      showOnly(j, mWhichChild, paramBoolean, paramPoint);
      if (paramInt == 0) {
        break;
      }
      requestFocus(2);
      return;
      if (paramInt < 0) {
        mWhichChild = (getChildCount() - 1);
      }
    }
  }
  
  public void setHideBeforeReveal(boolean paramBoolean)
  {
    mHideBeforeReveal = paramBoolean;
  }
  
  public void setInAnimation(Context paramContext, int paramInt)
  {
    setInAnimation(AnimationUtils.loadAnimation(paramContext, paramInt));
  }
  
  public void setInAnimation(Animation paramAnimation)
  {
    mInAnimation = paramAnimation;
  }
  
  public void setInterpolator(Interpolator paramInterpolator)
  {
    mInterpolator = paramInterpolator;
  }
  
  public void setOnViewAnimationListener(OnViewAnimationListener paramOnViewAnimationListener)
  {
    mViewAnimationListener = paramOnViewAnimationListener;
  }
  
  public void setOnViewChangedListener(OnViewChangedListener paramOnViewChangedListener)
  {
    mViewChangedListener = paramOnViewChangedListener;
  }
  
  public void setOutAnimation(Context paramContext, int paramInt)
  {
    setOutAnimation(AnimationUtils.loadAnimation(paramContext, paramInt));
  }
  
  public void setOutAnimation(Animation paramAnimation)
  {
    mOutAnimation = paramAnimation;
  }
  
  void showOnly(int paramInt1, int paramInt2, boolean paramBoolean, Point paramPoint)
  {
    if ((paramBoolean) && (shouldAnimate())) {}
    for (int i = 1;; i = 0)
    {
      mFirstTime = false;
      if (i != 0) {
        break;
      }
      mInstance.showOnlyNoAnimation(paramInt1, paramInt2);
      onViewChanged(paramInt1, paramInt2);
      return;
    }
    mInstance.showOnly(paramInt1, paramInt2, paramPoint);
  }
  
  public static abstract interface OnViewAnimationListener
  {
    public abstract void onViewAnimationCompleted(int paramInt1, int paramInt2);
    
    public abstract void onViewAnimationStarted(int paramInt1, int paramInt2);
  }
  
  public static abstract interface OnViewChangedListener
  {
    public abstract void onViewChanged(int paramInt1, int paramInt2);
  }
}
