package android.support.v4.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;

public class SlidingPaneLayout
  extends ViewGroup
{
  static final SlidingPanelLayoutImpl IMPL = new SlidingPanelLayoutImplBase();
  private boolean mCanSlide;
  private int mCoveredFadeColor;
  private final ViewDragHelper mDragHelper;
  private boolean mFirstLayout;
  private float mInitialMotionX;
  private float mInitialMotionY;
  private boolean mIsUnableToDrag;
  private final int mOverhangSize;
  private PanelSlideListener mPanelSlideListener;
  private int mParallaxBy;
  private float mParallaxOffset;
  private final ArrayList<DisableLayerRunnable> mPostedRunnables;
  private boolean mPreservedOpenState;
  private Drawable mShadowDrawableLeft;
  private Drawable mShadowDrawableRight;
  private float mSlideOffset;
  private int mSlideRange;
  private View mSlideableView;
  private int mSliderFadeColor;
  private final Rect mTmpRect;
  
  static
  {
    int i = Build.VERSION.SDK_INT;
    if (i >= 17)
    {
      IMPL = new SlidingPanelLayoutImplJBMR1();
      return;
    }
    if (i >= 16)
    {
      IMPL = new SlidingPanelLayoutImplJB();
      return;
    }
  }
  
  private boolean closePane(View paramView, int paramInt)
  {
    boolean bool = false;
    if ((mFirstLayout) || (smoothSlideTo(0.0F, paramInt)))
    {
      mPreservedOpenState = false;
      bool = true;
    }
    return bool;
  }
  
  private void dimChildView(View paramView, float paramFloat, int paramInt)
  {
    LayoutParams localLayoutParams = (LayoutParams)paramView.getLayoutParams();
    if ((paramFloat > 0.0F) && (paramInt != 0))
    {
      i = (int)(((0xFF000000 & paramInt) >>> 24) * paramFloat);
      if (dimPaint == null) {
        dimPaint = new Paint();
      }
      dimPaint.setColorFilter(new PorterDuffColorFilter(i << 24 | 0xFFFFFF & paramInt, PorterDuff.Mode.SRC_OVER));
      if (ViewCompat.getLayerType(paramView) != 2) {
        ViewCompat.setLayerType(paramView, 2, dimPaint);
      }
      invalidateChildRegion(paramView);
    }
    while (ViewCompat.getLayerType(paramView) == 0)
    {
      int i;
      return;
    }
    if (dimPaint != null) {
      dimPaint.setColorFilter(null);
    }
    paramView = new DisableLayerRunnable(paramView);
    mPostedRunnables.add(paramView);
    ViewCompat.postOnAnimation(this, paramView);
  }
  
  private void invalidateChildRegion(View paramView)
  {
    IMPL.invalidateChildRegion(this, paramView);
  }
  
  private boolean isLayoutRtlSupport()
  {
    return ViewCompat.getLayoutDirection(this) == 1;
  }
  
  private boolean openPane(View paramView, int paramInt)
  {
    if ((mFirstLayout) || (smoothSlideTo(1.0F, paramInt)))
    {
      mPreservedOpenState = true;
      return true;
    }
    return false;
  }
  
  private void parallaxOtherViews(float paramFloat)
  {
    boolean bool = isLayoutRtlSupport();
    Object localObject = (LayoutParams)mSlideableView.getLayoutParams();
    int i;
    label43:
    int j;
    if (dimWhenOffset) {
      if (bool)
      {
        i = rightMargin;
        if (i > 0) {
          break label94;
        }
        i = 1;
        int n = getChildCount();
        j = 0;
        label52:
        if (j >= n) {
          return;
        }
        localObject = getChildAt(j);
        if (localObject != mSlideableView) {
          break label99;
        }
      }
    }
    label94:
    label99:
    do
    {
      j += 1;
      break label52;
      i = leftMargin;
      break;
      i = 0;
      break label43;
      int k = (int)((1.0F - mParallaxOffset) * mParallaxBy);
      mParallaxOffset = paramFloat;
      int m = k - (int)((1.0F - paramFloat) * mParallaxBy);
      k = m;
      if (bool) {
        k = -m;
      }
      ((View)localObject).offsetLeftAndRight(k);
    } while (i == 0);
    if (bool) {}
    for (float f = mParallaxOffset - 1.0F;; f = 1.0F - mParallaxOffset)
    {
      dimChildView((View)localObject, f, mCoveredFadeColor);
      break;
    }
  }
  
  private static boolean viewIsOpaque(View paramView)
  {
    if (ViewCompat.isOpaque(paramView)) {}
    do
    {
      return true;
      if (Build.VERSION.SDK_INT >= 18) {
        return false;
      }
      paramView = paramView.getBackground();
      if (paramView == null) {
        break;
      }
    } while (paramView.getOpacity() == -1);
    return false;
    return false;
  }
  
  protected boolean checkLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    return ((paramLayoutParams instanceof LayoutParams)) && (super.checkLayoutParams(paramLayoutParams));
  }
  
  public boolean closePane()
  {
    return closePane(mSlideableView, 0);
  }
  
  public void computeScroll()
  {
    if (mDragHelper.continueSettling(true))
    {
      if (!mCanSlide) {
        mDragHelper.abort();
      }
    }
    else {
      return;
    }
    ViewCompat.postInvalidateOnAnimation(this);
  }
  
  public void draw(Canvas paramCanvas)
  {
    super.draw(paramCanvas);
    Drawable localDrawable;
    if (isLayoutRtlSupport())
    {
      localDrawable = mShadowDrawableRight;
      if (getChildCount() <= 1) {
        break label53;
      }
    }
    label53:
    for (View localView = getChildAt(1);; localView = null)
    {
      if ((localView != null) && (localDrawable != null)) {
        break label59;
      }
      return;
      localDrawable = mShadowDrawableLeft;
      break;
    }
    label59:
    int k = localView.getTop();
    int m = localView.getBottom();
    int n = localDrawable.getIntrinsicWidth();
    int i;
    int j;
    if (isLayoutRtlSupport())
    {
      i = localView.getRight();
      j = i + n;
    }
    for (;;)
    {
      localDrawable.setBounds(i, k, j, m);
      localDrawable.draw(paramCanvas);
      return;
      j = localView.getLeft();
      i = j - n;
    }
  }
  
  protected boolean drawChild(Canvas paramCanvas, View paramView, long paramLong)
  {
    LayoutParams localLayoutParams = (LayoutParams)paramView.getLayoutParams();
    int i = paramCanvas.save(2);
    boolean bool;
    if ((mCanSlide) && (!slideable) && (mSlideableView != null))
    {
      paramCanvas.getClipBounds(mTmpRect);
      if (isLayoutRtlSupport())
      {
        mTmpRect.left = Math.max(mTmpRect.left, mSlideableView.getRight());
        paramCanvas.clipRect(mTmpRect);
      }
    }
    else
    {
      if (Build.VERSION.SDK_INT < 11) {
        break label140;
      }
      bool = super.drawChild(paramCanvas, paramView, paramLong);
    }
    for (;;)
    {
      paramCanvas.restoreToCount(i);
      return bool;
      mTmpRect.right = Math.min(mTmpRect.right, mSlideableView.getLeft());
      break;
      label140:
      if ((dimWhenOffset) && (mSlideOffset > 0.0F))
      {
        if (!paramView.isDrawingCacheEnabled()) {
          paramView.setDrawingCacheEnabled(true);
        }
        Bitmap localBitmap = paramView.getDrawingCache();
        if (localBitmap != null)
        {
          paramCanvas.drawBitmap(localBitmap, paramView.getLeft(), paramView.getTop(), dimPaint);
          bool = false;
        }
        else
        {
          Log.e("SlidingPaneLayout", "drawChild: child view " + paramView + " returned null drawing cache");
          bool = super.drawChild(paramCanvas, paramView, paramLong);
        }
      }
      else
      {
        if (paramView.isDrawingCacheEnabled()) {
          paramView.setDrawingCacheEnabled(false);
        }
        bool = super.drawChild(paramCanvas, paramView, paramLong);
      }
    }
  }
  
  protected ViewGroup.LayoutParams generateDefaultLayoutParams()
  {
    return new LayoutParams();
  }
  
  public ViewGroup.LayoutParams generateLayoutParams(AttributeSet paramAttributeSet)
  {
    return new LayoutParams(getContext(), paramAttributeSet);
  }
  
  protected ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    if ((paramLayoutParams instanceof ViewGroup.MarginLayoutParams)) {
      return new LayoutParams((ViewGroup.MarginLayoutParams)paramLayoutParams);
    }
    return new LayoutParams(paramLayoutParams);
  }
  
  public int getCoveredFadeColor()
  {
    return mCoveredFadeColor;
  }
  
  public int getParallaxDistance()
  {
    return mParallaxBy;
  }
  
  public int getSliderFadeColor()
  {
    return mSliderFadeColor;
  }
  
  boolean isDimmed(View paramView)
  {
    if (paramView == null) {}
    do
    {
      return false;
      paramView = (LayoutParams)paramView.getLayoutParams();
    } while ((!mCanSlide) || (!dimWhenOffset) || (mSlideOffset <= 0.0F));
    return true;
  }
  
  public boolean isOpen()
  {
    return (!mCanSlide) || (mSlideOffset == 1.0F);
  }
  
  public boolean isSlideable()
  {
    return mCanSlide;
  }
  
  protected void onAttachedToWindow()
  {
    super.onAttachedToWindow();
    mFirstLayout = true;
  }
  
  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    mFirstLayout = true;
    int i = 0;
    int j = mPostedRunnables.size();
    while (i < j)
    {
      ((DisableLayerRunnable)mPostedRunnables.get(i)).run();
      i += 1;
    }
    mPostedRunnables.clear();
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    int k = MotionEventCompat.getActionMasked(paramMotionEvent);
    if ((!mCanSlide) && (k == 0) && (getChildCount() > 1))
    {
      View localView = getChildAt(1);
      if (localView != null) {
        if (mDragHelper.isViewUnder(localView, (int)paramMotionEvent.getX(), (int)paramMotionEvent.getY())) {
          break label101;
        }
      }
    }
    label101:
    for (boolean bool = true;; bool = false)
    {
      mPreservedOpenState = bool;
      if ((mCanSlide) && ((!mIsUnableToDrag) || (k == 0))) {
        break;
      }
      mDragHelper.cancel();
      return super.onInterceptTouchEvent(paramMotionEvent);
    }
    if ((k == 3) || (k == 1))
    {
      mDragHelper.cancel();
      return false;
    }
    int j = 0;
    int i = j;
    switch (k)
    {
    default: 
      i = j;
    }
    while ((mDragHelper.shouldInterceptTouchEvent(paramMotionEvent)) || (i != 0))
    {
      return true;
      mIsUnableToDrag = false;
      float f1 = paramMotionEvent.getX();
      float f2 = paramMotionEvent.getY();
      mInitialMotionX = f1;
      mInitialMotionY = f2;
      i = j;
      if (mDragHelper.isViewUnder(mSlideableView, (int)f1, (int)f2))
      {
        i = j;
        if (isDimmed(mSlideableView))
        {
          i = 1;
          continue;
          f2 = paramMotionEvent.getX();
          f1 = paramMotionEvent.getY();
          f2 = Math.abs(f2 - mInitialMotionX);
          f1 = Math.abs(f1 - mInitialMotionY);
          i = j;
          if (f2 > mDragHelper.getTouchSlop())
          {
            i = j;
            if (f1 > f2)
            {
              mDragHelper.cancel();
              mIsUnableToDrag = true;
              return false;
            }
          }
        }
      }
    }
    return false;
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    boolean bool = isLayoutRtlSupport();
    int k;
    label35:
    label46:
    int n;
    int m;
    if (bool)
    {
      mDragHelper.setEdgeTrackingEnabled(2);
      k = paramInt3 - paramInt1;
      if (!bool) {
        break label148;
      }
      paramInt1 = getPaddingRight();
      if (!bool) {
        break label156;
      }
      paramInt3 = getPaddingLeft();
      n = getPaddingTop();
      m = getChildCount();
      paramInt4 = paramInt1;
      if (mFirstLayout) {
        if ((!mCanSlide) || (!mPreservedOpenState)) {
          break label165;
        }
      }
    }
    int i;
    View localView;
    label148:
    label156:
    label165:
    for (float f = 1.0F;; f = 0.0F)
    {
      mSlideOffset = f;
      i = 0;
      paramInt2 = paramInt1;
      paramInt1 = paramInt4;
      paramInt4 = i;
      for (;;)
      {
        if (paramInt4 >= m) {
          break label444;
        }
        localView = getChildAt(paramInt4);
        if (localView.getVisibility() != 8) {
          break;
        }
        paramInt4 += 1;
      }
      mDragHelper.setEdgeTrackingEnabled(1);
      break;
      paramInt1 = getPaddingLeft();
      break label35;
      paramInt3 = getPaddingRight();
      break label46;
    }
    LayoutParams localLayoutParams = (LayoutParams)localView.getLayoutParams();
    int i1 = localView.getMeasuredWidth();
    int j = 0;
    if (slideable)
    {
      i = leftMargin;
      int i2 = rightMargin;
      i2 = Math.min(paramInt1, k - paramInt3 - mOverhangSize) - paramInt2 - (i + i2);
      mSlideRange = i2;
      if (bool)
      {
        i = rightMargin;
        label255:
        if (paramInt2 + i + i2 + i1 / 2 <= k - paramInt3) {
          break label380;
        }
        paramBoolean = true;
        label277:
        dimWhenOffset = paramBoolean;
        i2 = (int)(i2 * mSlideOffset);
        paramInt2 += i2 + i;
        mSlideOffset = (i2 / mSlideRange);
        i = j;
        label319:
        if (!bool) {
          break label428;
        }
        j = k - paramInt2 + i;
        i = j - i1;
      }
    }
    for (;;)
    {
      localView.layout(i, n, j, n + localView.getMeasuredHeight());
      paramInt1 += localView.getWidth();
      break;
      i = leftMargin;
      break label255;
      label380:
      paramBoolean = false;
      break label277;
      if ((mCanSlide) && (mParallaxBy != 0))
      {
        i = (int)((1.0F - mSlideOffset) * mParallaxBy);
        paramInt2 = paramInt1;
        break label319;
      }
      paramInt2 = paramInt1;
      i = j;
      break label319;
      label428:
      i = paramInt2 - i;
      j = i + i1;
    }
    label444:
    if (mFirstLayout)
    {
      if (!mCanSlide) {
        break label519;
      }
      if (mParallaxBy != 0) {
        parallaxOtherViews(mSlideOffset);
      }
      if (mSlideableView.getLayoutParams()).dimWhenOffset) {
        dimChildView(mSlideableView, mSlideOffset, mSliderFadeColor);
      }
    }
    for (;;)
    {
      updateObscuredViewsVisibility(mSlideableView);
      mFirstLayout = false;
      return;
      label519:
      paramInt1 = 0;
      while (paramInt1 < m)
      {
        dimChildView(getChildAt(paramInt1), 0.0F, mSliderFadeColor);
        paramInt1 += 1;
      }
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int m = View.MeasureSpec.getMode(paramInt1);
    int i = View.MeasureSpec.getSize(paramInt1);
    int j = View.MeasureSpec.getMode(paramInt2);
    paramInt2 = View.MeasureSpec.getSize(paramInt2);
    int k;
    int n;
    label88:
    float f1;
    boolean bool1;
    int i3;
    int i4;
    int i1;
    label141:
    View localView;
    LayoutParams localLayoutParams;
    int i2;
    if (m != 1073741824) {
      if (isInEditMode()) {
        if (m == Integer.MIN_VALUE)
        {
          k = i;
          paramInt1 = paramInt2;
          n = j;
          i = 0;
          paramInt2 = -1;
          switch (n)
          {
          default: 
            f1 = 0.0F;
            bool1 = false;
            i3 = k - getPaddingLeft() - getPaddingRight();
            m = i3;
            i4 = getChildCount();
            if (i4 > 2) {
              Log.e("SlidingPaneLayout", "onMeasure: More than two child views are not supported.");
            }
            mSlideableView = null;
            i1 = 0;
            if (i1 >= i4) {
              break label654;
            }
            localView = getChildAt(i1);
            localLayoutParams = (LayoutParams)localView.getLayoutParams();
            if (localView.getVisibility() == 8)
            {
              dimWhenOffset = false;
              i2 = m;
              j = i;
              bool2 = bool1;
            }
            break;
          }
        }
      }
    }
    float f2;
    do
    {
      i1 += 1;
      bool1 = bool2;
      i = j;
      m = i2;
      break label141;
      n = j;
      paramInt1 = paramInt2;
      k = i;
      if (m != 0) {
        break;
      }
      k = 300;
      n = j;
      paramInt1 = paramInt2;
      break;
      throw new IllegalStateException("Width must have an exact value or MATCH_PARENT");
      n = j;
      paramInt1 = paramInt2;
      k = i;
      if (j != 0) {
        break;
      }
      if (isInEditMode())
      {
        n = j;
        paramInt1 = paramInt2;
        k = i;
        if (j != 0) {
          break;
        }
        n = Integer.MIN_VALUE;
        paramInt1 = 300;
        k = i;
        break;
      }
      throw new IllegalStateException("Height must not be UNSPECIFIED");
      paramInt2 = paramInt1 - getPaddingTop() - getPaddingBottom();
      i = paramInt2;
      break label88;
      paramInt2 = paramInt1 - getPaddingTop() - getPaddingBottom();
      break label88;
      f2 = f1;
      if (weight <= 0.0F) {
        break label397;
      }
      f2 = f1 + weight;
      bool2 = bool1;
      j = i;
      f1 = f2;
      i2 = m;
    } while (width == 0);
    label397:
    paramInt1 = leftMargin + rightMargin;
    if (width == -2)
    {
      paramInt1 = View.MeasureSpec.makeMeasureSpec(i3 - paramInt1, Integer.MIN_VALUE);
      label430:
      if (height != -2) {
        break label611;
      }
      j = View.MeasureSpec.makeMeasureSpec(paramInt2, Integer.MIN_VALUE);
      label449:
      localView.measure(paramInt1, j);
      j = localView.getMeasuredWidth();
      i2 = localView.getMeasuredHeight();
      paramInt1 = i;
      if (n == Integer.MIN_VALUE)
      {
        paramInt1 = i;
        if (i2 > i) {
          paramInt1 = Math.min(i2, paramInt2);
        }
      }
      i = m - j;
      if (i >= 0) {
        break label648;
      }
    }
    label611:
    label648:
    for (boolean bool2 = true;; bool2 = false)
    {
      slideable = bool2;
      bool1 |= bool2;
      bool2 = bool1;
      j = paramInt1;
      f1 = f2;
      i2 = i;
      if (!slideable) {
        break;
      }
      mSlideableView = localView;
      bool2 = bool1;
      j = paramInt1;
      f1 = f2;
      i2 = i;
      break;
      if (width == -1)
      {
        paramInt1 = View.MeasureSpec.makeMeasureSpec(i3 - paramInt1, 1073741824);
        break label430;
      }
      paramInt1 = View.MeasureSpec.makeMeasureSpec(width, 1073741824);
      break label430;
      if (height == -1)
      {
        j = View.MeasureSpec.makeMeasureSpec(paramInt2, 1073741824);
        break label449;
      }
      j = View.MeasureSpec.makeMeasureSpec(height, 1073741824);
      break label449;
    }
    label654:
    if ((bool1) || (f1 > 0.0F))
    {
      i1 = i3 - mOverhangSize;
      j = 0;
      if (j < i4)
      {
        localView = getChildAt(j);
        if (localView.getVisibility() == 8) {}
        for (;;)
        {
          j += 1;
          break;
          localLayoutParams = (LayoutParams)localView.getLayoutParams();
          if (localView.getVisibility() != 8)
          {
            if ((width == 0) && (weight > 0.0F))
            {
              paramInt1 = 1;
              label751:
              if (paramInt1 == 0) {
                break label841;
              }
              n = 0;
              label758:
              if ((!bool1) || (localView == mSlideableView)) {
                break label901;
              }
              if ((width >= 0) || ((n <= i1) && (weight <= 0.0F))) {
                continue;
              }
              if (paramInt1 == 0) {
                break label886;
              }
              if (height != -2) {
                break label851;
              }
              paramInt1 = View.MeasureSpec.makeMeasureSpec(paramInt2, Integer.MIN_VALUE);
            }
            for (;;)
            {
              localView.measure(View.MeasureSpec.makeMeasureSpec(i1, 1073741824), paramInt1);
              break;
              paramInt1 = 0;
              break label751;
              label841:
              n = localView.getMeasuredWidth();
              break label758;
              label851:
              if (height == -1)
              {
                paramInt1 = View.MeasureSpec.makeMeasureSpec(paramInt2, 1073741824);
              }
              else
              {
                paramInt1 = View.MeasureSpec.makeMeasureSpec(height, 1073741824);
                continue;
                label886:
                paramInt1 = View.MeasureSpec.makeMeasureSpec(localView.getMeasuredHeight(), 1073741824);
              }
            }
            label901:
            if (weight > 0.0F)
            {
              if (width == 0) {
                if (height == -2) {
                  paramInt1 = View.MeasureSpec.makeMeasureSpec(paramInt2, Integer.MIN_VALUE);
                }
              }
              for (;;)
              {
                if (!bool1) {
                  break label1036;
                }
                i2 = i3 - (leftMargin + rightMargin);
                int i5 = View.MeasureSpec.makeMeasureSpec(i2, 1073741824);
                if (n == i2) {
                  break;
                }
                localView.measure(i5, paramInt1);
                break;
                if (height == -1)
                {
                  paramInt1 = View.MeasureSpec.makeMeasureSpec(paramInt2, 1073741824);
                }
                else
                {
                  paramInt1 = View.MeasureSpec.makeMeasureSpec(height, 1073741824);
                  continue;
                  paramInt1 = View.MeasureSpec.makeMeasureSpec(localView.getMeasuredHeight(), 1073741824);
                }
              }
              label1036:
              i2 = Math.max(0, m);
              localView.measure(View.MeasureSpec.makeMeasureSpec(n + (int)(weight * i2 / f1), 1073741824), paramInt1);
            }
          }
        }
      }
    }
    setMeasuredDimension(k, getPaddingTop() + i + getPaddingBottom());
    mCanSlide = bool1;
    if ((mDragHelper.getViewDragState() != 0) && (!bool1)) {
      mDragHelper.abort();
    }
  }
  
  protected void onRestoreInstanceState(Parcelable paramParcelable)
  {
    paramParcelable = (SavedState)paramParcelable;
    super.onRestoreInstanceState(paramParcelable.getSuperState());
    if (isOpen) {
      openPane();
    }
    for (;;)
    {
      mPreservedOpenState = isOpen;
      return;
      closePane();
    }
  }
  
  protected Parcelable onSaveInstanceState()
  {
    SavedState localSavedState = new SavedState(super.onSaveInstanceState());
    if (isSlideable()) {}
    for (boolean bool = isOpen();; bool = mPreservedOpenState)
    {
      isOpen = bool;
      return localSavedState;
    }
  }
  
  protected void onSizeChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onSizeChanged(paramInt1, paramInt2, paramInt3, paramInt4);
    if (paramInt1 != paramInt3) {
      mFirstLayout = true;
    }
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    boolean bool1;
    if (!mCanSlide) {
      bool1 = super.onTouchEvent(paramMotionEvent);
    }
    float f1;
    float f2;
    do
    {
      int i;
      boolean bool2;
      float f3;
      float f4;
      do
      {
        do
        {
          return bool1;
          mDragHelper.processTouchEvent(paramMotionEvent);
          i = paramMotionEvent.getAction();
          bool2 = true;
          switch (i & 0xFF)
          {
          default: 
            return true;
          case 0: 
            f1 = paramMotionEvent.getX();
            f2 = paramMotionEvent.getY();
            mInitialMotionX = f1;
            mInitialMotionY = f2;
            return true;
          }
          bool1 = bool2;
        } while (!isDimmed(mSlideableView));
        f1 = paramMotionEvent.getX();
        f2 = paramMotionEvent.getY();
        f3 = f1 - mInitialMotionX;
        f4 = f2 - mInitialMotionY;
        i = mDragHelper.getTouchSlop();
        bool1 = bool2;
      } while (f3 * f3 + f4 * f4 >= i * i);
      bool1 = bool2;
    } while (!mDragHelper.isViewUnder(mSlideableView, (int)f1, (int)f2));
    closePane(mSlideableView, 0);
    return true;
  }
  
  public boolean openPane()
  {
    return openPane(mSlideableView, 0);
  }
  
  public void requestChildFocus(View paramView1, View paramView2)
  {
    super.requestChildFocus(paramView1, paramView2);
    if ((!isInTouchMode()) && (!mCanSlide)) {
      if (paramView1 != mSlideableView) {
        break label36;
      }
    }
    label36:
    for (boolean bool = true;; bool = false)
    {
      mPreservedOpenState = bool;
      return;
    }
  }
  
  void setAllChildrenVisible()
  {
    int i = 0;
    int j = getChildCount();
    while (i < j)
    {
      View localView = getChildAt(i);
      if (localView.getVisibility() == 4) {
        localView.setVisibility(0);
      }
      i += 1;
    }
  }
  
  public void setCoveredFadeColor(int paramInt)
  {
    mCoveredFadeColor = paramInt;
  }
  
  public void setPanelSlideListener(PanelSlideListener paramPanelSlideListener)
  {
    mPanelSlideListener = paramPanelSlideListener;
  }
  
  public void setParallaxDistance(int paramInt)
  {
    mParallaxBy = paramInt;
    requestLayout();
  }
  
  @Deprecated
  public void setShadowDrawable(Drawable paramDrawable)
  {
    setShadowDrawableLeft(paramDrawable);
  }
  
  public void setShadowDrawableLeft(Drawable paramDrawable)
  {
    mShadowDrawableLeft = paramDrawable;
  }
  
  public void setShadowDrawableRight(Drawable paramDrawable)
  {
    mShadowDrawableRight = paramDrawable;
  }
  
  @Deprecated
  public void setShadowResource(int paramInt)
  {
    setShadowDrawable(getResources().getDrawable(paramInt));
  }
  
  public void setShadowResourceLeft(int paramInt)
  {
    setShadowDrawableLeft(getResources().getDrawable(paramInt));
  }
  
  public void setShadowResourceRight(int paramInt)
  {
    setShadowDrawableRight(getResources().getDrawable(paramInt));
  }
  
  public void setSliderFadeColor(int paramInt)
  {
    mSliderFadeColor = paramInt;
  }
  
  boolean smoothSlideTo(float paramFloat, int paramInt)
  {
    if (!mCanSlide) {}
    for (;;)
    {
      return false;
      boolean bool = isLayoutRtlSupport();
      LayoutParams localLayoutParams = (LayoutParams)mSlideableView.getLayoutParams();
      int i;
      int j;
      if (bool)
      {
        paramInt = getPaddingRight();
        i = rightMargin;
        j = mSlideableView.getWidth();
      }
      for (paramInt = (int)(getWidth() - (paramInt + i + mSlideRange * paramFloat + j)); mDragHelper.smoothSlideViewTo(mSlideableView, paramInt, mSlideableView.getTop()); paramInt = (int)(getPaddingLeft() + leftMargin + mSlideRange * paramFloat))
      {
        setAllChildrenVisible();
        ViewCompat.postInvalidateOnAnimation(this);
        return true;
      }
    }
  }
  
  void updateObscuredViewsVisibility(View paramView)
  {
    boolean bool = isLayoutRtlSupport();
    int i;
    int j;
    label31:
    int i4;
    int i5;
    int i6;
    int m;
    int n;
    int i1;
    int k;
    if (bool)
    {
      i = getWidth() - getPaddingRight();
      if (!bool) {
        break label123;
      }
      j = getPaddingLeft();
      i4 = getPaddingTop();
      i5 = getHeight();
      i6 = getPaddingBottom();
      if ((paramView == null) || (!viewIsOpaque(paramView))) {
        break label136;
      }
      m = paramView.getLeft();
      n = paramView.getRight();
      i1 = paramView.getTop();
      k = paramView.getBottom();
    }
    int i2;
    View localView;
    for (;;)
    {
      i2 = 0;
      int i7 = getChildCount();
      if (i2 < i7)
      {
        localView = getChildAt(i2);
        if (localView != paramView) {
          break label151;
        }
      }
      return;
      i = getPaddingLeft();
      break;
      label123:
      j = getWidth() - getPaddingRight();
      break label31;
      label136:
      k = 0;
      i1 = 0;
      n = 0;
      m = 0;
    }
    label151:
    if (bool)
    {
      i3 = j;
      label159:
      int i8 = Math.max(i3, localView.getLeft());
      int i9 = Math.max(i4, localView.getTop());
      if (!bool) {
        break label271;
      }
      i3 = i;
      label191:
      i3 = Math.min(i3, localView.getRight());
      int i10 = Math.min(i5 - i6, localView.getBottom());
      if ((i8 < m) || (i9 < i1) || (i3 > n) || (i10 > k)) {
        break label277;
      }
    }
    label271:
    label277:
    for (int i3 = 4;; i3 = 0)
    {
      localView.setVisibility(i3);
      i2 += 1;
      break;
      i3 = i;
      break label159;
      i3 = j;
      break label191;
    }
  }
  
  private class DisableLayerRunnable
    implements Runnable
  {
    final View mChildView;
    
    DisableLayerRunnable(View paramView)
    {
      mChildView = paramView;
    }
    
    public void run()
    {
      if (mChildView.getParent() == SlidingPaneLayout.this)
      {
        ViewCompat.setLayerType(mChildView, 0, null);
        SlidingPaneLayout.this.invalidateChildRegion(mChildView);
      }
      mPostedRunnables.remove(this);
    }
  }
  
  public static class LayoutParams
    extends ViewGroup.MarginLayoutParams
  {
    private static final int[] ATTRS = { 16843137 };
    Paint dimPaint;
    boolean dimWhenOffset;
    boolean slideable;
    public float weight = 0.0F;
    
    public LayoutParams()
    {
      super(-1);
    }
    
    public LayoutParams(Context paramContext, AttributeSet paramAttributeSet)
    {
      super(paramAttributeSet);
      paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, ATTRS);
      weight = paramContext.getFloat(0, 0.0F);
      paramContext.recycle();
    }
    
    public LayoutParams(ViewGroup.LayoutParams paramLayoutParams)
    {
      super();
    }
    
    public LayoutParams(ViewGroup.MarginLayoutParams paramMarginLayoutParams)
    {
      super();
    }
  }
  
  public static abstract interface PanelSlideListener {}
  
  static class SavedState
    extends View.BaseSavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public SlidingPaneLayout.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new SlidingPaneLayout.SavedState(paramAnonymousParcel, null);
      }
      
      public SlidingPaneLayout.SavedState[] newArray(int paramAnonymousInt)
      {
        return new SlidingPaneLayout.SavedState[paramAnonymousInt];
      }
    };
    boolean isOpen;
    
    private SavedState(Parcel paramParcel)
    {
      super();
      if (paramParcel.readInt() != 0) {}
      for (boolean bool = true;; bool = false)
      {
        isOpen = bool;
        return;
      }
    }
    
    SavedState(Parcelable paramParcelable)
    {
      super();
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      if (isOpen) {}
      for (paramInt = 1;; paramInt = 0)
      {
        paramParcel.writeInt(paramInt);
        return;
      }
    }
  }
  
  static abstract interface SlidingPanelLayoutImpl
  {
    public abstract void invalidateChildRegion(SlidingPaneLayout paramSlidingPaneLayout, View paramView);
  }
  
  static class SlidingPanelLayoutImplBase
    implements SlidingPaneLayout.SlidingPanelLayoutImpl
  {
    SlidingPanelLayoutImplBase() {}
    
    public void invalidateChildRegion(SlidingPaneLayout paramSlidingPaneLayout, View paramView)
    {
      ViewCompat.postInvalidateOnAnimation(paramSlidingPaneLayout, paramView.getLeft(), paramView.getTop(), paramView.getRight(), paramView.getBottom());
    }
  }
  
  static class SlidingPanelLayoutImplJB
    extends SlidingPaneLayout.SlidingPanelLayoutImplBase
  {
    private Method mGetDisplayList;
    private Field mRecreateDisplayList;
    
    SlidingPanelLayoutImplJB()
    {
      try
      {
        mGetDisplayList = View.class.getDeclaredMethod("getDisplayList", (Class[])null);
      }
      catch (NoSuchMethodException localNoSuchMethodException)
      {
        for (;;)
        {
          try
          {
            mRecreateDisplayList = View.class.getDeclaredField("mRecreateDisplayList");
            mRecreateDisplayList.setAccessible(true);
            return;
          }
          catch (NoSuchFieldException localNoSuchFieldException)
          {
            Log.e("SlidingPaneLayout", "Couldn't fetch mRecreateDisplayList field; dimming will be slow.", localNoSuchFieldException);
          }
          localNoSuchMethodException = localNoSuchMethodException;
          Log.e("SlidingPaneLayout", "Couldn't fetch getDisplayList method; dimming won't work right.", localNoSuchMethodException);
        }
      }
    }
    
    public void invalidateChildRegion(SlidingPaneLayout paramSlidingPaneLayout, View paramView)
    {
      if ((mGetDisplayList != null) && (mRecreateDisplayList != null)) {
        try
        {
          mRecreateDisplayList.setBoolean(paramView, true);
          mGetDisplayList.invoke(paramView, (Object[])null);
          super.invalidateChildRegion(paramSlidingPaneLayout, paramView);
          return;
        }
        catch (Exception localException)
        {
          for (;;)
          {
            Log.e("SlidingPaneLayout", "Error refreshing display list state", localException);
          }
        }
      }
      paramView.invalidate();
    }
  }
  
  static class SlidingPanelLayoutImplJBMR1
    extends SlidingPaneLayout.SlidingPanelLayoutImplBase
  {
    SlidingPanelLayoutImplJBMR1() {}
    
    public void invalidateChildRegion(SlidingPaneLayout paramSlidingPaneLayout, View paramView)
    {
      ViewCompat.setLayerPaint(paramView, getLayoutParamsdimPaint);
    }
  }
}
