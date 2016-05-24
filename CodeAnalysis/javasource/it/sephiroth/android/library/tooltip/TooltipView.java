package it.sephiroth.android.library.tooltip;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.Handler;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.view.Window;
import android.widget.TextView;
import com.nineoldandroids.animation.Animator;
import com.nineoldandroids.animation.Animator.AnimatorListener;
import com.nineoldandroids.animation.ObjectAnimator;
import com.nineoldandroids.view.ViewHelper;
import com.nineoldandroids.view.animation.AnimatorProxy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

class TooltipView
  extends ViewGroup
{
  private final long activateDelay;
  Runnable activateRunnable = new Runnable()
  {
    public void run()
    {
      TooltipView.access$202(TooltipView.this, true);
    }
  };
  private final TooltipManager.onTooltipClosingCallback closeCallback;
  private OnCloseListener closeListener;
  private final TooltipManager.ClosePolicy closePolicy;
  private final Rect drawRect;
  private final long fadeDuration;
  TooltipManager.Gravity gravity;
  private final boolean hideArrow;
  Runnable hideRunnable = new Runnable()
  {
    public void run()
    {
      TooltipView.this.onClose(false, false);
    }
  };
  private boolean mActivated;
  private boolean mAttached;
  private final TooltipTextDrawable mDrawable;
  private boolean mInitialized;
  Animator mShowAnimation;
  boolean mShowing;
  private TextView mTextView;
  private View mView;
  private final int maxWidth;
  private int padding;
  private final Point point;
  private final boolean restrict;
  private final long showDelay;
  private final long showDuration;
  private final View targetView;
  private final Rect tempRect;
  private CharSequence text;
  private final int textResId;
  private final int toolTipId;
  private OnToolTipListener tooltipListener;
  private final int topRule;
  private final Rect viewRect;
  
  public TooltipView(Context paramContext, TooltipManager.Builder paramBuilder)
  {
    super(paramContext);
    Object localObject = paramContext.getTheme().obtainStyledAttributes(null, R.styleable.TooltipLayout, defStyleAttr, defStyleRes);
    padding = ((TypedArray)localObject).getDimensionPixelSize(R.styleable.TooltipLayout_ttlm_padding, 30);
    ((TypedArray)localObject).recycle();
    toolTipId = id;
    text = text;
    gravity = gravity;
    textResId = textResId;
    maxWidth = maxWidth;
    topRule = actionbarSize;
    closePolicy = closePolicy;
    showDuration = showDuration;
    showDelay = showDelay;
    hideArrow = hideArrow;
    activateDelay = activateDelay;
    targetView = view;
    restrict = restrictToScreenEdges;
    fadeDuration = fadeDuration;
    closeCallback = closeCallback;
    if (point != null)
    {
      point = new Point(point);
      localObject = point;
      y += topRule;
      viewRect = new Rect();
      drawRect = new Rect();
      tempRect = new Rect();
      if (isCustomView) {
        break label293;
      }
    }
    label293:
    for (mDrawable = new TooltipTextDrawable(paramContext, paramBuilder);; mDrawable = null)
    {
      setVisibility(4);
      return;
      point = null;
      break;
    }
  }
  
  private void calculatePositions(List<TooltipManager.Gravity> paramList)
  {
    if (!isAttached()) {}
    TooltipManager.Gravity localGravity;
    Rect localRect;
    int j;
    Point localPoint;
    label349:
    label383:
    label419:
    do
    {
      return;
      if (paramList.size() < 1)
      {
        if (tooltipListener != null) {
          tooltipListener.onShowFailed(this);
        }
        setVisibility(8);
        return;
      }
      localGravity = (TooltipManager.Gravity)paramList.get(0);
      paramList.remove(0);
      localRect = new Rect();
      ((Activity)getContext()).getWindow().getDecorView().getWindowVisibleDisplayFrame(localRect);
      i = top;
      top += topRule;
      if (targetView != null)
      {
        targetView.getGlobalVisibleRect(viewRect);
        i = mView.getWidth();
        j = mView.getMeasuredHeight();
        localPoint = new Point();
        if (localGravity != TooltipManager.Gravity.BOTTOM) {
          break;
        }
        drawRect.set(viewRect.centerX() - i / 2, viewRect.bottom, viewRect.centerX() + i / 2, viewRect.bottom + j);
        x = viewRect.centerX();
        y = viewRect.bottom;
        if ((!restrict) || (localRect.contains(drawRect))) {
          break label419;
        }
        if (drawRect.right <= right) {
          break label349;
        }
        drawRect.offset(right - drawRect.right, 0);
      }
      for (;;)
      {
        if (drawRect.bottom <= bottom) {
          break label383;
        }
        calculatePositions(paramList);
        return;
        viewRect.set(point.x, point.y + i, point.x, point.y + i);
        break;
        if (drawRect.left < left) {
          drawRect.offset(-drawRect.left, 0);
        }
      }
      if (drawRect.top < top) {
        drawRect.offset(0, top - drawRect.top);
      }
      ViewHelper.setTranslationX(mView, drawRect.left);
      ViewHelper.setTranslationY(mView, drawRect.top);
    } while (mDrawable == null);
    mView.getGlobalVisibleRect(tempRect);
    x -= tempRect.left;
    y -= tempRect.top;
    if (AnimatorProxy.NEEDS_PROXY)
    {
      x -= drawRect.left;
      y -= drawRect.top;
    }
    if (!hideArrow)
    {
      if ((localGravity == TooltipManager.Gravity.LEFT) || (localGravity == TooltipManager.Gravity.RIGHT)) {
        y -= padding / 2;
      }
    }
    else
    {
      label586:
      paramList = mDrawable;
      if (!hideArrow) {
        break label1612;
      }
    }
    label1537:
    label1612:
    for (int i = 0;; i = padding / 2)
    {
      paramList.setAnchor(localGravity, i);
      if (hideArrow) {
        break;
      }
      mDrawable.setDestinationPoint(localPoint);
      return;
      if (localGravity == TooltipManager.Gravity.TOP)
      {
        drawRect.set(viewRect.centerX() - i / 2, viewRect.top - j, viewRect.centerX() + i / 2, viewRect.top);
        x = viewRect.centerX();
        y = viewRect.top;
        if ((!restrict) || (localRect.contains(drawRect))) {
          break label419;
        }
        if (drawRect.right > right) {
          drawRect.offset(right - drawRect.right, 0);
        }
        while (drawRect.top < top)
        {
          calculatePositions(paramList);
          return;
          if (drawRect.left < left) {
            drawRect.offset(-drawRect.left, 0);
          }
        }
        if (drawRect.bottom <= bottom) {
          break label419;
        }
        drawRect.offset(0, bottom - drawRect.bottom);
        break label419;
      }
      if (localGravity == TooltipManager.Gravity.RIGHT)
      {
        drawRect.set(viewRect.right, viewRect.centerY() - j / 2, viewRect.right + i, viewRect.centerY() + j / 2);
        x = viewRect.right;
        y = viewRect.centerY();
        if ((!restrict) || (localRect.contains(drawRect))) {
          break label419;
        }
        if (drawRect.bottom > bottom) {
          drawRect.offset(0, bottom - drawRect.bottom);
        }
        while (drawRect.right > right)
        {
          calculatePositions(paramList);
          return;
          if (drawRect.top < top) {
            drawRect.offset(0, top - drawRect.top);
          }
        }
        if (drawRect.left >= left) {
          break label419;
        }
        drawRect.offset(left - drawRect.left, 0);
        break label419;
      }
      if (localGravity == TooltipManager.Gravity.LEFT)
      {
        drawRect.set(viewRect.left - i, viewRect.centerY() - j / 2, viewRect.left, viewRect.centerY() + j / 2);
        x = viewRect.left;
        y = viewRect.centerY();
        if ((!restrict) || (localRect.contains(drawRect))) {
          break label419;
        }
        if (drawRect.bottom > bottom) {
          drawRect.offset(0, bottom - drawRect.bottom);
        }
        while (drawRect.left < left)
        {
          gravity = TooltipManager.Gravity.RIGHT;
          calculatePositions(paramList);
          return;
          if (drawRect.top < top) {
            drawRect.offset(0, top - drawRect.top);
          }
        }
        if (drawRect.right <= right) {
          break label419;
        }
        drawRect.offset(right - drawRect.right, 0);
        break label419;
      }
      if (gravity != TooltipManager.Gravity.CENTER) {
        break label419;
      }
      drawRect.set(viewRect.centerX() - i / 2, viewRect.centerY() - j / 2, viewRect.centerX() - i / 2, viewRect.centerY() + j / 2);
      x = viewRect.centerX();
      y = viewRect.centerY();
      if ((!restrict) || (localRect.contains(drawRect))) {
        break label419;
      }
      if (drawRect.bottom > bottom) {
        drawRect.offset(0, bottom - drawRect.bottom);
      }
      for (;;)
      {
        if (drawRect.right <= right) {
          break label1537;
        }
        drawRect.offset(right - drawRect.right, 0);
        break;
        if (drawRect.top < top) {
          drawRect.offset(0, top - drawRect.top);
        }
      }
      if (drawRect.left >= left) {
        break label419;
      }
      drawRect.offset(left - drawRect.left, 0);
      break label419;
      if ((localGravity != TooltipManager.Gravity.TOP) && (localGravity != TooltipManager.Gravity.BOTTOM)) {
        break label586;
      }
      x -= padding / 2;
      break label586;
    }
  }
  
  private void fireOnHideCompleted()
  {
    if (tooltipListener != null) {
      tooltipListener.onHideCompleted(this);
    }
  }
  
  private void initializeView()
  {
    if ((!isAttached()) || (mInitialized)) {
      return;
    }
    mInitialized = true;
    ViewGroup.LayoutParams localLayoutParams = new ViewGroup.LayoutParams(-2, -2);
    mView = LayoutInflater.from(getContext()).inflate(textResId, this, false);
    mView.setLayoutParams(localLayoutParams);
    if (mDrawable != null)
    {
      mView.setBackgroundDrawable(mDrawable);
      if (!hideArrow) {
        break label178;
      }
      mView.setPadding(padding / 2, padding / 2, padding / 2, padding / 2);
    }
    for (;;)
    {
      mTextView = ((TextView)mView.findViewById(16908308));
      mTextView.setText(Html.fromHtml((String)text));
      if (maxWidth > -1) {
        mTextView.setMaxWidth(maxWidth);
      }
      addView(mView);
      return;
      label178:
      mView.setPadding(padding, padding, padding, padding);
    }
  }
  
  private void onClose(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (getHandler() == null) {}
    do
    {
      do
      {
        return;
      } while (!isAttached());
      getHandler().removeCallbacks(hideRunnable);
      if (closeListener != null) {
        closeListener.onClose(this);
      }
    } while (closeCallback == null);
    closeCallback.onClosing(toolTipId, paramBoolean1, paramBoolean2);
  }
  
  protected void fadeIn()
  {
    if (mShowing) {}
    for (;;)
    {
      return;
      if (mShowAnimation != null) {
        mShowAnimation.cancel();
      }
      mShowing = true;
      if (fadeDuration > 0L)
      {
        mShowAnimation = ObjectAnimator.ofFloat(this, "alpha", new float[] { 0.0F, 1.0F });
        mShowAnimation.setDuration(fadeDuration);
        if (showDelay > 0L) {
          mShowAnimation.setStartDelay(showDelay);
        }
        mShowAnimation.addListener(new Animator.AnimatorListener()
        {
          boolean cancelled;
          
          public void onAnimationCancel(Animator paramAnonymousAnimator)
          {
            cancelled = true;
          }
          
          public void onAnimationEnd(Animator paramAnonymousAnimator)
          {
            if ((tooltipListener != null) && (!cancelled))
            {
              tooltipListener.onShowCompleted(TooltipView.this);
              postActivate(activateDelay);
            }
          }
          
          public void onAnimationRepeat(Animator paramAnonymousAnimator) {}
          
          public void onAnimationStart(Animator paramAnonymousAnimator)
          {
            setVisibility(0);
            cancelled = false;
          }
        });
        mShowAnimation.start();
      }
      while (showDuration > 0L)
      {
        getHandler().removeCallbacks(hideRunnable);
        getHandler().postDelayed(hideRunnable, showDuration);
        return;
        setVisibility(0);
        tooltipListener.onShowCompleted(this);
        if (!mActivated) {
          postActivate(activateDelay);
        }
      }
    }
  }
  
  protected void fadeOut(final boolean paramBoolean)
  {
    if ((!isAttached()) || (!mShowing)) {}
    do
    {
      return;
      if (mShowAnimation != null) {
        mShowAnimation.cancel();
      }
      mShowing = false;
      if (fadeDuration > 0L)
      {
        mShowAnimation = ObjectAnimator.ofFloat(this, "alpha", new float[] { ViewHelper.getAlpha(this), 0.0F });
        mShowAnimation.setDuration(fadeDuration);
        mShowAnimation.addListener(new Animator.AnimatorListener()
        {
          boolean cancelled;
          
          public void onAnimationCancel(Animator paramAnonymousAnimator)
          {
            cancelled = true;
          }
          
          public void onAnimationEnd(Animator paramAnonymousAnimator)
          {
            if (cancelled) {
              return;
            }
            if (paramBoolean) {
              TooltipView.this.fireOnHideCompleted();
            }
            mShowAnimation = null;
          }
          
          public void onAnimationRepeat(Animator paramAnonymousAnimator) {}
          
          public void onAnimationStart(Animator paramAnonymousAnimator)
          {
            cancelled = false;
          }
        });
        mShowAnimation.start();
        return;
      }
      setVisibility(4);
    } while (!paramBoolean);
    fireOnHideCompleted();
  }
  
  int getTooltipId()
  {
    return toolTipId;
  }
  
  public void hide(boolean paramBoolean)
  {
    if (!isAttached()) {
      return;
    }
    fadeOut(paramBoolean);
  }
  
  public boolean isAttached()
  {
    return mAttached;
  }
  
  protected void onAttachedToWindow()
  {
    super.onAttachedToWindow();
    mAttached = true;
    initializeView();
  }
  
  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    mAttached = false;
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    paramInt2 = getChildCount();
    paramInt1 = 0;
    Object localObject;
    while (paramInt1 < paramInt2)
    {
      localObject = getChildAt(paramInt1);
      if (((View)localObject).getVisibility() != 8) {
        ((View)localObject).layout(((View)localObject).getLeft(), ((View)localObject).getTop(), ((View)localObject).getMeasuredWidth(), ((View)localObject).getMeasuredHeight());
      }
      paramInt1 += 1;
    }
    if (paramBoolean)
    {
      localObject = new ArrayList(Arrays.asList(new TooltipManager.Gravity[] { TooltipManager.Gravity.LEFT, TooltipManager.Gravity.RIGHT, TooltipManager.Gravity.TOP, TooltipManager.Gravity.BOTTOM, TooltipManager.Gravity.CENTER }));
      ((List)localObject).remove(gravity);
      ((List)localObject).add(0, gravity);
      calculatePositions((List)localObject);
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, paramInt2);
    int k = -1;
    int i = -1;
    int i1 = View.MeasureSpec.getMode(paramInt1);
    int n = View.MeasureSpec.getMode(paramInt2);
    int m = View.MeasureSpec.getSize(paramInt1);
    int j = View.MeasureSpec.getSize(paramInt2);
    paramInt1 = k;
    if (i1 != 0) {
      paramInt1 = m;
    }
    paramInt2 = i;
    if (n != 0) {
      paramInt2 = j;
    }
    j = getChildCount();
    i = 0;
    while (i < j)
    {
      View localView = getChildAt(i);
      if (localView.getVisibility() != 8) {
        localView.measure(View.MeasureSpec.makeMeasureSpec(paramInt1, Integer.MIN_VALUE), View.MeasureSpec.makeMeasureSpec(paramInt2, Integer.MIN_VALUE));
      }
      i += 1;
    }
    setMeasuredDimension(paramInt1, paramInt2);
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    boolean bool2 = false;
    boolean bool3 = true;
    boolean bool1;
    if ((!mAttached) || (!mShowing) || (!isShown())) {
      bool1 = false;
    }
    boolean bool4;
    do
    {
      int i;
      do
      {
        return bool1;
        i = paramMotionEvent.getActionMasked();
        if ((closePolicy != TooltipManager.ClosePolicy.TouchOutside) && (closePolicy != TooltipManager.ClosePolicy.TouchInside) && (closePolicy != TooltipManager.ClosePolicy.TouchInsideExclusive) && (closePolicy != TooltipManager.ClosePolicy.TouchOutsideExclusive)) {
          break;
        }
        bool1 = bool3;
      } while (!mActivated);
      if (i != 0) {
        break label186;
      }
      bool4 = drawRect.contains((int)paramMotionEvent.getX(), (int)paramMotionEvent.getY());
      if ((closePolicy != TooltipManager.ClosePolicy.TouchInside) && (closePolicy != TooltipManager.ClosePolicy.TouchInsideExclusive)) {
        break;
      }
      if (bool4)
      {
        onClose(true, true);
        return true;
      }
      bool1 = bool3;
    } while (closePolicy == TooltipManager.ClosePolicy.TouchInsideExclusive);
    return false;
    onClose(true, bool4);
    if (closePolicy != TooltipManager.ClosePolicy.TouchOutsideExclusive)
    {
      bool1 = bool2;
      if (!bool4) {}
    }
    else
    {
      bool1 = true;
    }
    return bool1;
    label186:
    return false;
  }
  
  void postActivate(long paramLong)
  {
    if (paramLong > 0L)
    {
      if (isAttached()) {
        postDelayed(activateRunnable, paramLong);
      }
      return;
    }
    mActivated = true;
  }
  
  void removeFromParent()
  {
    ViewParent localViewParent = getParent();
    if (localViewParent != null)
    {
      if (getHandler() != null) {
        getHandler().removeCallbacks(hideRunnable);
      }
      ((ViewGroup)localViewParent).removeView(this);
      if ((mShowAnimation != null) && (mShowAnimation.isStarted())) {
        mShowAnimation.cancel();
      }
    }
  }
  
  void setOnCloseListener(OnCloseListener paramOnCloseListener)
  {
    closeListener = paramOnCloseListener;
  }
  
  void setOnToolTipListener(OnToolTipListener paramOnToolTipListener)
  {
    tooltipListener = paramOnToolTipListener;
  }
  
  public void show()
  {
    if (!isAttached()) {
      return;
    }
    fadeIn();
  }
  
  static abstract interface OnCloseListener
  {
    public abstract void onClose(TooltipView paramTooltipView);
  }
  
  static abstract interface OnToolTipListener
  {
    public abstract void onHideCompleted(TooltipView paramTooltipView);
    
    public abstract void onShowCompleted(TooltipView paramTooltipView);
    
    public abstract void onShowFailed(TooltipView paramTooltipView);
  }
}
