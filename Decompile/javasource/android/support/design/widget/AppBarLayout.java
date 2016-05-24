package android.support.design.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.design.R.styleable;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.WindowInsetsCompat;
import android.support.v4.widget.ScrollerCompat;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.Interpolator;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import java.lang.ref.WeakReference;
import java.util.List;

@CoordinatorLayout.DefaultBehavior(Behavior.class)
public class AppBarLayout
  extends LinearLayout
{
  private int mDownPreScrollRange;
  private int mDownScrollRange;
  boolean mHaveChildWithInterpolator;
  private WindowInsetsCompat mLastInsets;
  private final List<WeakReference<OnOffsetChangedListener>> mListeners;
  private float mTargetElevation;
  private int mTotalScrollRange;
  
  private void setWindowInsets(WindowInsetsCompat paramWindowInsetsCompat)
  {
    mTotalScrollRange = -1;
    mLastInsets = paramWindowInsetsCompat;
    int i = 0;
    int j = getChildCount();
    for (;;)
    {
      if (i < j)
      {
        paramWindowInsetsCompat = ViewCompat.dispatchApplyWindowInsets(getChildAt(i), paramWindowInsetsCompat);
        if (!paramWindowInsetsCompat.isConsumed()) {}
      }
      else
      {
        return;
      }
      i += 1;
    }
  }
  
  protected boolean checkLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    return paramLayoutParams instanceof LayoutParams;
  }
  
  protected LayoutParams generateDefaultLayoutParams()
  {
    return new LayoutParams(-1, -2);
  }
  
  public LayoutParams generateLayoutParams(AttributeSet paramAttributeSet)
  {
    return new LayoutParams(getContext(), paramAttributeSet);
  }
  
  protected LayoutParams generateLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    if ((paramLayoutParams instanceof LinearLayout.LayoutParams)) {
      return new LayoutParams((LinearLayout.LayoutParams)paramLayoutParams);
    }
    if ((paramLayoutParams instanceof ViewGroup.MarginLayoutParams)) {
      return new LayoutParams((ViewGroup.MarginLayoutParams)paramLayoutParams);
    }
    return new LayoutParams(paramLayoutParams);
  }
  
  final int getDownNestedPreScrollRange()
  {
    if (mDownPreScrollRange != -1) {
      return mDownPreScrollRange;
    }
    int k = 0;
    int j = getChildCount() - 1;
    if (j >= 0)
    {
      View localView = getChildAt(j);
      LayoutParams localLayoutParams = (LayoutParams)localView.getLayoutParams();
      int i;
      if (ViewCompat.isLaidOut(localView))
      {
        i = localView.getHeight();
        label57:
        int m = mScrollFlags;
        if ((m & 0x5) != 5) {
          break label113;
        }
        if ((m & 0x8) == 0) {
          break label106;
        }
        i = k + ViewCompat.getMinimumHeight(localView);
      }
      label106:
      label113:
      do
      {
        for (;;)
        {
          j -= 1;
          k = i;
          break;
          i = localView.getMeasuredHeight();
          break label57;
          i = k + i;
        }
        i = k;
      } while (k <= 0);
    }
    mDownPreScrollRange = k;
    return k;
  }
  
  final int getDownNestedScrollRange()
  {
    if (mDownScrollRange != -1) {
      return mDownScrollRange;
    }
    int j = 0;
    int i = 0;
    int m = getChildCount();
    while (i < m)
    {
      View localView = getChildAt(i);
      LayoutParams localLayoutParams = (LayoutParams)localView.getLayoutParams();
      if (ViewCompat.isLaidOut(localView)) {}
      for (int k = localView.getHeight();; k = localView.getMeasuredHeight())
      {
        int n = mScrollFlags;
        if ((n & 0x1) == 0) {
          break label109;
        }
        j += k;
        if ((n & 0x2) == 0) {
          break;
        }
        return j - ViewCompat.getMinimumHeight(localView);
      }
      i += 1;
    }
    label109:
    mDownScrollRange = j;
    return j;
  }
  
  final int getMinimumHeightForVisibleOverlappingContent()
  {
    int j = 0;
    int i;
    int k;
    if (mLastInsets != null)
    {
      i = mLastInsets.getSystemWindowInsetTop();
      k = ViewCompat.getMinimumHeight(this);
      if (k == 0) {
        break label39;
      }
      j = k * 2 + i;
    }
    label39:
    do
    {
      return j;
      i = 0;
      break;
      k = getChildCount();
    } while (k < 1);
    return ViewCompat.getMinimumHeight(getChildAt(k - 1)) * 2 + i;
  }
  
  public float getTargetElevation()
  {
    return mTargetElevation;
  }
  
  public final int getTotalScrollRange()
  {
    if (mTotalScrollRange != -1) {
      return mTotalScrollRange;
    }
    int i = 0;
    int j = 0;
    int n = getChildCount();
    int k = i;
    View localView;
    int m;
    if (j < n)
    {
      localView = getChildAt(j);
      LayoutParams localLayoutParams = (LayoutParams)localView.getLayoutParams();
      if (!ViewCompat.isLaidOut(localView)) {
        break label125;
      }
      m = localView.getHeight();
      label63:
      int i1 = mScrollFlags;
      k = i;
      if ((i1 & 0x1) != 0)
      {
        i += m;
        if ((i1 & 0x2) == 0) {
          break label135;
        }
        k = i - ViewCompat.getMinimumHeight(localView);
      }
    }
    if (mLastInsets != null) {}
    for (i = mLastInsets.getSystemWindowInsetTop();; i = 0)
    {
      i = k - i;
      mTotalScrollRange = i;
      return i;
      label125:
      m = localView.getMeasuredHeight();
      break label63;
      label135:
      j += 1;
      break;
    }
  }
  
  final int getUpNestedPreScrollRange()
  {
    return getTotalScrollRange();
  }
  
  final boolean hasChildWithInterpolator()
  {
    return mHaveChildWithInterpolator;
  }
  
  final boolean hasScrollableChildren()
  {
    return getTotalScrollRange() != 0;
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
    mTotalScrollRange = -1;
    mDownPreScrollRange = -1;
    mDownPreScrollRange = -1;
    mHaveChildWithInterpolator = false;
    paramInt1 = 0;
    paramInt2 = getChildCount();
    for (;;)
    {
      if (paramInt1 < paramInt2)
      {
        if (((LayoutParams)getChildAt(paramInt1).getLayoutParams()).getScrollInterpolator() != null) {
          mHaveChildWithInterpolator = true;
        }
      }
      else {
        return;
      }
      paramInt1 += 1;
    }
  }
  
  public void setOrientation(int paramInt)
  {
    if (paramInt != 1) {
      throw new IllegalArgumentException("AppBarLayout is always vertical and does not support horizontal orientation");
    }
    super.setOrientation(paramInt);
  }
  
  public void setTargetElevation(float paramFloat)
  {
    mTargetElevation = paramFloat;
  }
  
  public static class Behavior
    extends ViewOffsetBehavior<AppBarLayout>
  {
    private ValueAnimatorCompat mAnimator;
    private Runnable mFlingRunnable;
    private int mOffsetDelta;
    private int mOffsetToChildIndexOnLayout;
    private boolean mOffsetToChildIndexOnLayoutIsMinHeight;
    private float mOffsetToChildIndexOnLayoutPerc;
    private ScrollerCompat mScroller;
    private boolean mSkipNestedPreScroll;
    
    private void animateOffsetTo(final CoordinatorLayout paramCoordinatorLayout, final AppBarLayout paramAppBarLayout, int paramInt)
    {
      if (mAnimator == null)
      {
        mAnimator = ViewUtils.createAnimator();
        mAnimator.setInterpolator(AnimationUtils.DECELERATE_INTERPOLATOR);
        mAnimator.setUpdateListener(new ValueAnimatorCompat.AnimatorUpdateListener()
        {
          public void onAnimationUpdate(ValueAnimatorCompat paramAnonymousValueAnimatorCompat)
          {
            setAppBarTopBottomOffset(paramCoordinatorLayout, paramAppBarLayout, paramAnonymousValueAnimatorCompat.getAnimatedIntValue());
          }
        });
      }
      for (;;)
      {
        mAnimator.setIntValues(getTopBottomOffsetForScrollingSibling(), paramInt);
        mAnimator.start();
        return;
        mAnimator.cancel();
      }
    }
    
    private void dispatchOffsetUpdates(AppBarLayout paramAppBarLayout)
    {
      List localList = mListeners;
      int i = 0;
      int j = localList.size();
      if (i < j)
      {
        Object localObject = (WeakReference)localList.get(i);
        if (localObject != null) {}
        for (localObject = (AppBarLayout.OnOffsetChangedListener)((WeakReference)localObject).get();; localObject = null)
        {
          if (localObject != null) {
            ((AppBarLayout.OnOffsetChangedListener)localObject).onOffsetChanged(paramAppBarLayout, getTopAndBottomOffset());
          }
          i += 1;
          break;
        }
      }
    }
    
    private boolean fling(CoordinatorLayout paramCoordinatorLayout, AppBarLayout paramAppBarLayout, int paramInt1, int paramInt2, float paramFloat)
    {
      if (mFlingRunnable != null) {
        paramAppBarLayout.removeCallbacks(mFlingRunnable);
      }
      if (mScroller == null) {
        mScroller = ScrollerCompat.create(paramAppBarLayout.getContext());
      }
      mScroller.fling(0, getTopBottomOffsetForScrollingSibling(), 0, Math.round(paramFloat), 0, 0, paramInt1, paramInt2);
      if (mScroller.computeScrollOffset())
      {
        mFlingRunnable = new FlingRunnable(paramCoordinatorLayout, paramAppBarLayout);
        ViewCompat.postOnAnimation(paramAppBarLayout, mFlingRunnable);
        return true;
      }
      mFlingRunnable = null;
      return false;
    }
    
    private int interpolateOffset(AppBarLayout paramAppBarLayout, int paramInt)
    {
      int k = Math.abs(paramInt);
      int i = 0;
      int m = paramAppBarLayout.getChildCount();
      for (;;)
      {
        int j = paramInt;
        if (i < m)
        {
          View localView = paramAppBarLayout.getChildAt(i);
          AppBarLayout.LayoutParams localLayoutParams = (AppBarLayout.LayoutParams)localView.getLayoutParams();
          Interpolator localInterpolator = localLayoutParams.getScrollInterpolator();
          if ((k < localView.getTop()) || (k > localView.getBottom())) {
            break label173;
          }
          j = paramInt;
          if (localInterpolator != null)
          {
            i = 0;
            m = localLayoutParams.getScrollFlags();
            if ((m & 0x1) != 0)
            {
              j = 0 + localView.getHeight();
              i = j;
              if ((m & 0x2) != 0) {
                i = j - ViewCompat.getMinimumHeight(localView);
              }
            }
            j = paramInt;
            if (i > 0)
            {
              j = localView.getTop();
              i = Math.round(i * localInterpolator.getInterpolation((k - j) / i));
              j = Integer.signum(paramInt) * (localView.getTop() + i);
            }
          }
        }
        return j;
        label173:
        i += 1;
      }
    }
    
    private int scroll(CoordinatorLayout paramCoordinatorLayout, AppBarLayout paramAppBarLayout, int paramInt1, int paramInt2, int paramInt3)
    {
      return setAppBarTopBottomOffset(paramCoordinatorLayout, paramAppBarLayout, getTopBottomOffsetForScrollingSibling() - paramInt1, paramInt2, paramInt3);
    }
    
    final int getTopBottomOffsetForScrollingSibling()
    {
      return getTopAndBottomOffset() + mOffsetDelta;
    }
    
    public boolean onLayoutChild(CoordinatorLayout paramCoordinatorLayout, AppBarLayout paramAppBarLayout, int paramInt)
    {
      boolean bool = super.onLayoutChild(paramCoordinatorLayout, paramAppBarLayout, paramInt);
      if (mOffsetToChildIndexOnLayout >= 0)
      {
        paramCoordinatorLayout = paramAppBarLayout.getChildAt(mOffsetToChildIndexOnLayout);
        paramInt = -paramCoordinatorLayout.getBottom();
        if (!mOffsetToChildIndexOnLayoutIsMinHeight) {
          break label64;
        }
        paramInt += ViewCompat.getMinimumHeight(paramCoordinatorLayout);
      }
      for (;;)
      {
        setTopAndBottomOffset(paramInt);
        mOffsetToChildIndexOnLayout = -1;
        dispatchOffsetUpdates(paramAppBarLayout);
        return bool;
        label64:
        paramInt += Math.round(paramCoordinatorLayout.getHeight() * mOffsetToChildIndexOnLayoutPerc);
      }
    }
    
    public boolean onNestedFling(CoordinatorLayout paramCoordinatorLayout, AppBarLayout paramAppBarLayout, View paramView, float paramFloat1, float paramFloat2, boolean paramBoolean)
    {
      boolean bool = false;
      if (!paramBoolean) {
        paramBoolean = fling(paramCoordinatorLayout, paramAppBarLayout, -paramAppBarLayout.getTotalScrollRange(), 0, -paramFloat2);
      }
      int i;
      do
      {
        return paramBoolean;
        if (paramFloat2 >= 0.0F) {
          break;
        }
        i = -paramAppBarLayout.getTotalScrollRange() + paramAppBarLayout.getDownNestedPreScrollRange();
        paramBoolean = bool;
      } while (getTopBottomOffsetForScrollingSibling() > i);
      int j;
      do
      {
        paramBoolean = bool;
        if (getTopBottomOffsetForScrollingSibling() == i) {
          break;
        }
        animateOffsetTo(paramCoordinatorLayout, paramAppBarLayout, i);
        return true;
        j = -paramAppBarLayout.getUpNestedPreScrollRange();
        i = j;
      } while (getTopBottomOffsetForScrollingSibling() >= j);
      return false;
    }
    
    public void onNestedPreScroll(CoordinatorLayout paramCoordinatorLayout, AppBarLayout paramAppBarLayout, View paramView, int paramInt1, int paramInt2, int[] paramArrayOfInt)
    {
      if ((paramInt2 != 0) && (!mSkipNestedPreScroll))
      {
        if (paramInt2 >= 0) {
          break label50;
        }
        paramInt1 = -paramAppBarLayout.getTotalScrollRange();
      }
      for (int i = paramInt1 + paramAppBarLayout.getDownNestedPreScrollRange();; i = 0)
      {
        paramArrayOfInt[1] = scroll(paramCoordinatorLayout, paramAppBarLayout, paramInt2, paramInt1, i);
        return;
        label50:
        paramInt1 = -paramAppBarLayout.getUpNestedPreScrollRange();
      }
    }
    
    public void onNestedScroll(CoordinatorLayout paramCoordinatorLayout, AppBarLayout paramAppBarLayout, View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      if (paramInt4 < 0)
      {
        scroll(paramCoordinatorLayout, paramAppBarLayout, paramInt4, -paramAppBarLayout.getDownNestedScrollRange(), 0);
        mSkipNestedPreScroll = true;
        return;
      }
      mSkipNestedPreScroll = false;
    }
    
    public void onRestoreInstanceState(CoordinatorLayout paramCoordinatorLayout, AppBarLayout paramAppBarLayout, Parcelable paramParcelable)
    {
      if ((paramParcelable instanceof SavedState))
      {
        paramParcelable = (SavedState)paramParcelable;
        super.onRestoreInstanceState(paramCoordinatorLayout, paramAppBarLayout, paramParcelable.getSuperState());
        mOffsetToChildIndexOnLayout = firstVisibleChildIndex;
        mOffsetToChildIndexOnLayoutPerc = firstVisibileChildPercentageShown;
        mOffsetToChildIndexOnLayoutIsMinHeight = firstVisibileChildAtMinimumHeight;
        return;
      }
      super.onRestoreInstanceState(paramCoordinatorLayout, paramAppBarLayout, paramParcelable);
      mOffsetToChildIndexOnLayout = -1;
    }
    
    public Parcelable onSaveInstanceState(CoordinatorLayout paramCoordinatorLayout, AppBarLayout paramAppBarLayout)
    {
      Parcelable localParcelable = super.onSaveInstanceState(paramCoordinatorLayout, paramAppBarLayout);
      int j = getTopAndBottomOffset();
      int i = 0;
      int k = paramAppBarLayout.getChildCount();
      while (i < k)
      {
        paramCoordinatorLayout = paramAppBarLayout.getChildAt(i);
        int m = paramCoordinatorLayout.getBottom() + j;
        if ((paramCoordinatorLayout.getTop() + j <= 0) && (m >= 0))
        {
          paramAppBarLayout = new SavedState(localParcelable);
          firstVisibleChildIndex = i;
          if (m == ViewCompat.getMinimumHeight(paramCoordinatorLayout)) {}
          for (boolean bool = true;; bool = false)
          {
            firstVisibileChildAtMinimumHeight = bool;
            firstVisibileChildPercentageShown = (m / paramCoordinatorLayout.getHeight());
            return paramAppBarLayout;
          }
        }
        i += 1;
      }
      return localParcelable;
    }
    
    public boolean onStartNestedScroll(CoordinatorLayout paramCoordinatorLayout, AppBarLayout paramAppBarLayout, View paramView1, View paramView2, int paramInt)
    {
      if (((paramInt & 0x2) != 0) && (paramAppBarLayout.hasScrollableChildren()) && (paramCoordinatorLayout.getHeight() - paramView2.getHeight() <= paramAppBarLayout.getHeight())) {}
      for (boolean bool = true;; bool = false)
      {
        if ((bool) && (mAnimator != null)) {
          mAnimator.cancel();
        }
        return bool;
      }
    }
    
    public void onStopNestedScroll(CoordinatorLayout paramCoordinatorLayout, AppBarLayout paramAppBarLayout, View paramView)
    {
      mSkipNestedPreScroll = false;
    }
    
    final int setAppBarTopBottomOffset(CoordinatorLayout paramCoordinatorLayout, AppBarLayout paramAppBarLayout, int paramInt)
    {
      return setAppBarTopBottomOffset(paramCoordinatorLayout, paramAppBarLayout, paramInt, Integer.MIN_VALUE, Integer.MAX_VALUE);
    }
    
    final int setAppBarTopBottomOffset(CoordinatorLayout paramCoordinatorLayout, AppBarLayout paramAppBarLayout, int paramInt1, int paramInt2, int paramInt3)
    {
      int k = getTopBottomOffsetForScrollingSibling();
      int j = 0;
      int i = j;
      if (paramInt2 != 0)
      {
        i = j;
        if (k >= paramInt2)
        {
          i = j;
          if (k <= paramInt3)
          {
            paramInt2 = MathUtils.constrain(paramInt1, paramInt2, paramInt3);
            i = j;
            if (k != paramInt2) {
              if (!paramAppBarLayout.hasChildWithInterpolator()) {
                break label123;
              }
            }
          }
        }
      }
      label123:
      for (paramInt1 = interpolateOffset(paramAppBarLayout, paramInt2);; paramInt1 = paramInt2)
      {
        boolean bool = setTopAndBottomOffset(paramInt1);
        i = k - paramInt2;
        mOffsetDelta = (paramInt2 - paramInt1);
        if ((!bool) && (paramAppBarLayout.hasChildWithInterpolator())) {
          paramCoordinatorLayout.dispatchDependentViewsChanged(paramAppBarLayout);
        }
        dispatchOffsetUpdates(paramAppBarLayout);
        return i;
      }
    }
    
    private class FlingRunnable
      implements Runnable
    {
      private final AppBarLayout mLayout;
      private final CoordinatorLayout mParent;
      
      FlingRunnable(CoordinatorLayout paramCoordinatorLayout, AppBarLayout paramAppBarLayout)
      {
        mParent = paramCoordinatorLayout;
        mLayout = paramAppBarLayout;
      }
      
      public void run()
      {
        if ((mLayout != null) && (mScroller != null) && (mScroller.computeScrollOffset()))
        {
          setAppBarTopBottomOffset(mParent, mLayout, mScroller.getCurrY());
          ViewCompat.postOnAnimation(mLayout, this);
        }
      }
    }
    
    protected static class SavedState
      extends View.BaseSavedState
    {
      public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
      {
        public AppBarLayout.Behavior.SavedState createFromParcel(Parcel paramAnonymousParcel)
        {
          return new AppBarLayout.Behavior.SavedState(paramAnonymousParcel);
        }
        
        public AppBarLayout.Behavior.SavedState[] newArray(int paramAnonymousInt)
        {
          return new AppBarLayout.Behavior.SavedState[paramAnonymousInt];
        }
      };
      boolean firstVisibileChildAtMinimumHeight;
      float firstVisibileChildPercentageShown;
      int firstVisibleChildIndex;
      
      public SavedState(Parcel paramParcel)
      {
        super();
        firstVisibleChildIndex = paramParcel.readInt();
        firstVisibileChildPercentageShown = paramParcel.readFloat();
        if (paramParcel.readByte() != 0) {}
        for (boolean bool = true;; bool = false)
        {
          firstVisibileChildAtMinimumHeight = bool;
          return;
        }
      }
      
      public SavedState(Parcelable paramParcelable)
      {
        super();
      }
      
      public void writeToParcel(Parcel paramParcel, int paramInt)
      {
        super.writeToParcel(paramParcel, paramInt);
        paramParcel.writeInt(firstVisibleChildIndex);
        paramParcel.writeFloat(firstVisibileChildPercentageShown);
        if (firstVisibileChildAtMinimumHeight) {}
        for (paramInt = 1;; paramInt = 0)
        {
          paramParcel.writeByte((byte)paramInt);
          return;
        }
      }
    }
  }
  
  public static class LayoutParams
    extends LinearLayout.LayoutParams
  {
    int mScrollFlags = 1;
    Interpolator mScrollInterpolator;
    
    public LayoutParams(int paramInt1, int paramInt2)
    {
      super(paramInt2);
    }
    
    public LayoutParams(Context paramContext, AttributeSet paramAttributeSet)
    {
      super(paramAttributeSet);
      paramAttributeSet = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.AppBarLayout_LayoutParams);
      mScrollFlags = paramAttributeSet.getInt(R.styleable.AppBarLayout_LayoutParams_layout_scrollFlags, 0);
      if (paramAttributeSet.hasValue(R.styleable.AppBarLayout_LayoutParams_layout_scrollInterpolator)) {
        mScrollInterpolator = android.view.animation.AnimationUtils.loadInterpolator(paramContext, paramAttributeSet.getResourceId(R.styleable.AppBarLayout_LayoutParams_layout_scrollInterpolator, 0));
      }
      paramAttributeSet.recycle();
    }
    
    public LayoutParams(ViewGroup.LayoutParams paramLayoutParams)
    {
      super();
    }
    
    public LayoutParams(ViewGroup.MarginLayoutParams paramMarginLayoutParams)
    {
      super();
    }
    
    public LayoutParams(LinearLayout.LayoutParams paramLayoutParams)
    {
      super();
    }
    
    public int getScrollFlags()
    {
      return mScrollFlags;
    }
    
    public Interpolator getScrollInterpolator()
    {
      return mScrollInterpolator;
    }
  }
  
  public static abstract interface OnOffsetChangedListener
  {
    public abstract void onOffsetChanged(AppBarLayout paramAppBarLayout, int paramInt);
  }
}
