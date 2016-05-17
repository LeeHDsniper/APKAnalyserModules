package android.support.v4.view;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.os.SystemClock;
import android.support.v4.os.ParcelableCompat;
import android.support.v4.os.ParcelableCompatCreatorCallbacks;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.support.v4.widget.EdgeEffectCompat;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.FocusFinder;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.SoundEffectConstants;
import android.view.VelocityTracker;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.View.MeasureSpec;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.animation.Interpolator;
import android.widget.Scroller;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class ViewPager
  extends ViewGroup
{
  private static final int CLOSE_ENOUGH = 2;
  private static final Comparator<ItemInfo> COMPARATOR = new Comparator()
  {
    public int compare(ViewPager.ItemInfo paramAnonymousItemInfo1, ViewPager.ItemInfo paramAnonymousItemInfo2)
    {
      return position - position;
    }
  };
  private static final boolean DEBUG = false;
  private static final int DEFAULT_GUTTER_SIZE = 16;
  private static final int DEFAULT_OFFSCREEN_PAGES = 1;
  private static final int DRAW_ORDER_DEFAULT = 0;
  private static final int DRAW_ORDER_FORWARD = 1;
  private static final int DRAW_ORDER_REVERSE = 2;
  private static final int INVALID_POINTER = -1;
  private static final int[] LAYOUT_ATTRS = { 16842931 };
  private static final int MAX_SETTLE_DURATION = 600;
  private static final int MIN_DISTANCE_FOR_FLING = 25;
  private static final int MIN_FLING_VELOCITY = 400;
  public static final int SCROLL_STATE_DRAGGING = 1;
  public static final int SCROLL_STATE_IDLE = 0;
  public static final int SCROLL_STATE_SETTLING = 2;
  private static final String TAG = "ViewPager";
  private static final boolean USE_CACHE = false;
  private static final Interpolator sInterpolator = new Interpolator()
  {
    public float getInterpolation(float paramAnonymousFloat)
    {
      paramAnonymousFloat -= 1.0F;
      return paramAnonymousFloat * paramAnonymousFloat * paramAnonymousFloat * paramAnonymousFloat * paramAnonymousFloat + 1.0F;
    }
  };
  private static final ViewPositionComparator sPositionComparator = new ViewPositionComparator();
  private int mActivePointerId = -1;
  private PagerAdapter mAdapter;
  private OnAdapterChangeListener mAdapterChangeListener;
  private int mBottomPageBounds;
  private boolean mCalledSuper;
  private int mChildHeightMeasureSpec;
  private int mChildWidthMeasureSpec;
  private int mCloseEnough;
  private int mCurItem;
  private int mDecorChildCount;
  private int mDefaultGutterSize;
  private int mDrawingOrder;
  private ArrayList<View> mDrawingOrderedChildren;
  private boolean mEdgeEffectEnabled;
  private final Runnable mEndScrollRunnable = new Runnable()
  {
    public void run()
    {
      ViewPager.this.setScrollState(0);
      populate();
    }
  };
  private int mExpectedAdapterCount;
  private long mFakeDragBeginTime;
  private boolean mFakeDragging;
  private boolean mFirstLayout = true;
  private float mFirstOffset = -3.4028235E38F;
  private int mFlingDistance;
  private int mGutterSize;
  private boolean mIgnoreGutter;
  private boolean mInLayout;
  private float mInitialMotionX;
  private float mInitialMotionY;
  private OnPageChangeListener mInternalPageChangeListener;
  private boolean mIsBeingDragged;
  private boolean mIsUnableToDrag;
  private final ArrayList<ItemInfo> mItems = new ArrayList();
  private float mLastMotionX;
  private float mLastMotionY;
  private float mLastOffset = Float.MAX_VALUE;
  private EdgeEffectCompat mLeftEdge;
  private Drawable mMarginDrawable;
  private int mMaximumVelocity;
  private int mMinimumVelocity;
  private boolean mNeedCalculatePageOffsets = false;
  private PagerObserver mObserver;
  private int mOffscreenPageLimit = 1;
  private OnPageChangeListener mOnPageChangeListener;
  private int mPageMargin;
  private PageTransformer mPageTransformer;
  private boolean mPopulatePending;
  private Parcelable mRestoredAdapterState = null;
  private ClassLoader mRestoredClassLoader = null;
  private int mRestoredCurItem = -1;
  private EdgeEffectCompat mRightEdge;
  private int mScrollState = 0;
  private Scroller mScroller;
  private boolean mScrollingCacheEnabled;
  private Method mSetChildrenDrawingOrderEnabled;
  private final ItemInfo mTempItem = new ItemInfo();
  private final Rect mTempRect = new Rect();
  private int mTopPageBounds;
  private int mTouchSlop;
  private VelocityTracker mVelocityTracker;
  
  public ViewPager(Context paramContext)
  {
    super(paramContext);
    initViewPager();
  }
  
  public ViewPager(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    initViewPager();
  }
  
  private void calculatePageOffsets(ItemInfo paramItemInfo1, int paramInt, ItemInfo paramItemInfo2)
  {
    int m = mAdapter.getCount();
    int i = getClientWidth();
    float f2;
    if (i > 0)
    {
      f2 = mPageMargin / i;
      if (paramItemInfo2 == null) {
        break label409;
      }
      i = position;
      if (i < position)
      {
        j = 0;
        f1 = offset + widthFactor + f2;
        i += 1;
      }
    }
    else
    {
      for (;;)
      {
        if ((i > position) || (j >= mItems.size())) {
          break label409;
        }
        for (paramItemInfo2 = (ItemInfo)mItems.get(j);; paramItemInfo2 = (ItemInfo)mItems.get(j))
        {
          f3 = f1;
          k = i;
          if (i <= position) {
            break;
          }
          f3 = f1;
          k = i;
          if (j >= mItems.size() - 1) {
            break;
          }
          j += 1;
        }
        f2 = 0.0F;
        break;
        while (k < position)
        {
          f3 += mAdapter.getPageWidth(k) + f2;
          k += 1;
        }
        offset = f3;
        f1 = f3 + (widthFactor + f2);
        i = k + 1;
      }
    }
    if (i > position)
    {
      j = mItems.size() - 1;
      f1 = offset;
      i -= 1;
      while ((i >= position) && (j >= 0))
      {
        for (paramItemInfo2 = (ItemInfo)mItems.get(j);; paramItemInfo2 = (ItemInfo)mItems.get(j))
        {
          f3 = f1;
          k = i;
          if (i >= position) {
            break;
          }
          f3 = f1;
          k = i;
          if (j <= 0) {
            break;
          }
          j -= 1;
        }
        while (k > position)
        {
          f3 -= mAdapter.getPageWidth(k) + f2;
          k -= 1;
        }
        f1 = f3 - (widthFactor + f2);
        offset = f1;
        i = k - 1;
      }
    }
    label409:
    int k = mItems.size();
    float f3 = offset;
    i = position - 1;
    if (position == 0)
    {
      f1 = offset;
      mFirstOffset = f1;
      if (position != m - 1) {
        break label550;
      }
      f1 = offset + widthFactor - 1.0F;
      label475:
      mLastOffset = f1;
      j = paramInt - 1;
      f1 = f3;
    }
    for (;;)
    {
      if (j < 0) {
        break label603;
      }
      paramItemInfo2 = (ItemInfo)mItems.get(j);
      for (;;)
      {
        if (i > position)
        {
          f1 -= mAdapter.getPageWidth(i) + f2;
          i -= 1;
          continue;
          f1 = -3.4028235E38F;
          break;
          label550:
          f1 = Float.MAX_VALUE;
          break label475;
        }
      }
      f1 -= widthFactor + f2;
      offset = f1;
      if (position == 0) {
        mFirstOffset = f1;
      }
      j -= 1;
      i -= 1;
    }
    label603:
    float f1 = offset + widthFactor + f2;
    i = position + 1;
    int j = paramInt + 1;
    paramInt = i;
    i = j;
    while (i < k)
    {
      paramItemInfo1 = (ItemInfo)mItems.get(i);
      while (paramInt < position)
      {
        f1 += mAdapter.getPageWidth(paramInt) + f2;
        paramInt += 1;
      }
      if (position == m - 1) {
        mLastOffset = (widthFactor + f1 - 1.0F);
      }
      offset = f1;
      f1 += widthFactor + f2;
      i += 1;
      paramInt += 1;
    }
    mNeedCalculatePageOffsets = false;
  }
  
  private void completeScroll(boolean paramBoolean)
  {
    if (mScrollState == 2) {}
    int j;
    for (int i = 1;; i = 0)
    {
      if (i != 0)
      {
        setScrollingCacheEnabled(false);
        mScroller.abortAnimation();
        j = getScrollX();
        k = getScrollY();
        int m = mScroller.getCurrX();
        int n = mScroller.getCurrY();
        if ((j != m) || (k != n)) {
          scrollTo(m, n);
        }
      }
      mPopulatePending = false;
      int k = 0;
      j = i;
      i = k;
      while (i < mItems.size())
      {
        ItemInfo localItemInfo = (ItemInfo)mItems.get(i);
        if (scrolling)
        {
          j = 1;
          scrolling = false;
        }
        i += 1;
      }
    }
    if (j != 0)
    {
      if (paramBoolean) {
        ViewCompat.postOnAnimation(this, mEndScrollRunnable);
      }
    }
    else {
      return;
    }
    mEndScrollRunnable.run();
  }
  
  private int determineTargetPage(int paramInt1, float paramFloat, int paramInt2, int paramInt3)
  {
    if ((Math.abs(paramInt3) > mFlingDistance) && (Math.abs(paramInt2) > mMinimumVelocity))
    {
      if (paramInt2 > 0) {}
      for (;;)
      {
        paramInt2 = paramInt1;
        if (mItems.size() > 0)
        {
          ItemInfo localItemInfo1 = (ItemInfo)mItems.get(0);
          ItemInfo localItemInfo2 = (ItemInfo)mItems.get(mItems.size() - 1);
          paramInt2 = Math.max(position, Math.min(paramInt1, position));
        }
        return paramInt2;
        paramInt1 += 1;
      }
    }
    if (paramInt1 >= mCurItem) {}
    for (float f = 0.4F;; f = 0.6F)
    {
      paramInt1 = (int)(paramInt1 + paramFloat + f);
      break;
    }
  }
  
  private void enableLayers(boolean paramBoolean)
  {
    int k = getChildCount();
    int i = 0;
    if (i < k)
    {
      if (paramBoolean) {}
      for (int j = 2;; j = 0)
      {
        ViewCompat.setLayerType(getChildAt(i), j, null);
        i += 1;
        break;
      }
    }
  }
  
  private void endDrag()
  {
    mIsBeingDragged = false;
    mIsUnableToDrag = false;
    if (mVelocityTracker != null)
    {
      mVelocityTracker.recycle();
      mVelocityTracker = null;
    }
  }
  
  private Rect getChildRectInPagerCoordinates(Rect paramRect, View paramView)
  {
    Rect localRect = paramRect;
    if (paramRect == null) {
      localRect = new Rect();
    }
    if (paramView == null) {
      localRect.set(0, 0, 0, 0);
    }
    for (;;)
    {
      return localRect;
      left = paramView.getLeft();
      right = paramView.getRight();
      top = paramView.getTop();
      bottom = paramView.getBottom();
      for (paramRect = paramView.getParent(); ((paramRect instanceof ViewGroup)) && (paramRect != this); paramRect = paramRect.getParent())
      {
        paramRect = (ViewGroup)paramRect;
        left += paramRect.getLeft();
        right += paramRect.getRight();
        top += paramRect.getTop();
        bottom += paramRect.getBottom();
      }
    }
  }
  
  private int getClientWidth()
  {
    return getMeasuredWidth() - getPaddingLeft() - getPaddingRight();
  }
  
  private ItemInfo infoForCurrentScrollPosition()
  {
    float f2 = 0.0F;
    int i = getClientWidth();
    float f1;
    int k;
    float f3;
    float f4;
    int j;
    Object localObject2;
    if (i > 0)
    {
      f1 = getScrollX() / i;
      if (i > 0) {
        f2 = mPageMargin / i;
      }
      k = -1;
      f3 = 0.0F;
      f4 = 0.0F;
      j = 1;
      localObject2 = null;
      i = 0;
    }
    for (;;)
    {
      Object localObject3 = localObject2;
      int m;
      Object localObject1;
      if (i < mItems.size())
      {
        localObject3 = (ItemInfo)mItems.get(i);
        m = i;
        localObject1 = localObject3;
        if (j == 0)
        {
          m = i;
          localObject1 = localObject3;
          if (position != k + 1)
          {
            localObject1 = mTempItem;
            offset = (f3 + f4 + f2);
            position = (k + 1);
            widthFactor = mAdapter.getPageWidth(position);
            m = i - 1;
          }
        }
        f3 = offset;
        f4 = widthFactor;
        if (j == 0)
        {
          localObject3 = localObject2;
          if (f1 < f3) {}
        }
        else
        {
          if ((f1 >= f4 + f3 + f2) && (m != mItems.size() - 1)) {
            break label232;
          }
          localObject3 = localObject1;
        }
      }
      return localObject3;
      f1 = 0.0F;
      break;
      label232:
      j = 0;
      k = position;
      f4 = widthFactor;
      i = m + 1;
      localObject2 = localObject1;
    }
  }
  
  private boolean isGutterDrag(float paramFloat1, float paramFloat2)
  {
    return ((paramFloat1 < mGutterSize) && (paramFloat2 > 0.0F)) || ((paramFloat1 > getWidth() - mGutterSize) && (paramFloat2 < 0.0F));
  }
  
  private void onSecondaryPointerUp(MotionEvent paramMotionEvent)
  {
    int i = MotionEventCompat.getActionIndex(paramMotionEvent);
    if (MotionEventCompat.getPointerId(paramMotionEvent, i) == mActivePointerId) {
      if (i != 0) {
        break label56;
      }
    }
    label56:
    for (i = 1;; i = 0)
    {
      mLastMotionX = MotionEventCompat.getX(paramMotionEvent, i);
      mActivePointerId = MotionEventCompat.getPointerId(paramMotionEvent, i);
      if (mVelocityTracker != null) {
        mVelocityTracker.clear();
      }
      return;
    }
  }
  
  private boolean pageScrolled(int paramInt)
  {
    boolean bool = false;
    if (mItems.size() == 0)
    {
      mCalledSuper = false;
      onPageScrolled(0, 0.0F, 0);
      if (!mCalledSuper) {
        throw new IllegalStateException("onPageScrolled did not call superclass implementation");
      }
    }
    else
    {
      ItemInfo localItemInfo = infoForCurrentScrollPosition();
      int j = getClientWidth();
      int k = mPageMargin;
      float f = mPageMargin / j;
      int i = position;
      f = (paramInt / j - offset) / (widthFactor + f);
      paramInt = (int)((j + k) * f);
      mCalledSuper = false;
      onPageScrolled(i, f, paramInt);
      if (!mCalledSuper) {
        throw new IllegalStateException("onPageScrolled did not call superclass implementation");
      }
      bool = true;
    }
    return bool;
  }
  
  private boolean performDrag(float paramFloat)
  {
    boolean bool1 = false;
    boolean bool2 = false;
    boolean bool3 = false;
    float f1 = mLastMotionX;
    mLastMotionX = paramFloat;
    float f2 = getScrollX() + (f1 - paramFloat);
    int k = getClientWidth();
    paramFloat = k * mFirstOffset;
    f1 = k * mLastOffset;
    int i = 1;
    int j = 1;
    ItemInfo localItemInfo1 = (ItemInfo)mItems.get(0);
    ItemInfo localItemInfo2 = (ItemInfo)mItems.get(mItems.size() - 1);
    if (position != 0)
    {
      i = 0;
      paramFloat = offset * k;
    }
    if (position != mAdapter.getCount() - 1)
    {
      j = 0;
      f1 = offset * k;
    }
    if (f2 < paramFloat)
    {
      bool1 = bool3;
      if (i != 0)
      {
        bool1 = bool3;
        if (mEdgeEffectEnabled) {
          bool1 = mLeftEdge.onPull(Math.abs(paramFloat - f2) / k);
        }
      }
    }
    for (;;)
    {
      mLastMotionX += paramFloat - (int)paramFloat;
      scrollTo((int)paramFloat, getScrollY());
      pageScrolled((int)paramFloat);
      return bool1;
      paramFloat = f2;
      if (f2 > f1)
      {
        bool1 = bool2;
        if (j != 0)
        {
          bool1 = bool2;
          if (mEdgeEffectEnabled) {
            bool1 = mRightEdge.onPull(Math.abs(f2 - f1) / k);
          }
        }
        paramFloat = f1;
      }
    }
  }
  
  private void recomputeScrollPosition(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if ((paramInt2 > 0) && (!mItems.isEmpty()))
    {
      int i = getPaddingLeft();
      int j = getPaddingRight();
      int k = getPaddingLeft();
      int m = getPaddingRight();
      f = getScrollX() / (paramInt2 - k - m + paramInt4);
      paramInt2 = (int)((paramInt1 - i - j + paramInt3) * f);
      scrollTo(paramInt2, getScrollY());
      if (!mScroller.isFinished())
      {
        paramInt3 = mScroller.getDuration();
        paramInt4 = mScroller.timePassed();
        localItemInfo = infoForPosition(mCurItem);
        mScroller.startScroll(paramInt2, 0, (int)(offset * paramInt1), 0, paramInt3 - paramInt4);
      }
      return;
    }
    ItemInfo localItemInfo = infoForPosition(mCurItem);
    if (localItemInfo != null) {}
    for (float f = Math.min(offset, mLastOffset);; f = 0.0F)
    {
      paramInt1 = (int)((paramInt1 - getPaddingLeft() - getPaddingRight()) * f);
      if (paramInt1 == getScrollX()) {
        break;
      }
      completeScroll(false);
      scrollTo(paramInt1, getScrollY());
      return;
    }
  }
  
  private void removeNonDecorViews()
  {
    int j;
    for (int i = 0; i < getChildCount(); i = j + 1)
    {
      j = i;
      if (!getChildAtgetLayoutParamsisDecor)
      {
        removeViewAt(i);
        j = i - 1;
      }
    }
  }
  
  private void scrollToItem(int paramInt1, boolean paramBoolean1, int paramInt2, boolean paramBoolean2)
  {
    ItemInfo localItemInfo = infoForPosition(paramInt1);
    int i = 0;
    if (localItemInfo != null) {
      i = (int)(getClientWidth() * Math.max(mFirstOffset, Math.min(offset, mLastOffset)));
    }
    if (paramBoolean1)
    {
      smoothScrollTo(i, 0, paramInt2);
      if ((paramBoolean2) && (mOnPageChangeListener != null)) {
        mOnPageChangeListener.onPageSelected(paramInt1);
      }
      if ((paramBoolean2) && (mInternalPageChangeListener != null)) {
        mInternalPageChangeListener.onPageSelected(paramInt1);
      }
      return;
    }
    if ((paramBoolean2) && (mOnPageChangeListener != null)) {
      mOnPageChangeListener.onPageSelected(paramInt1);
    }
    if ((paramBoolean2) && (mInternalPageChangeListener != null)) {
      mInternalPageChangeListener.onPageSelected(paramInt1);
    }
    completeScroll(false);
    scrollTo(i, 0);
  }
  
  private void setScrollState(int paramInt)
  {
    if (mScrollState == paramInt) {
      return;
    }
    mScrollState = paramInt;
    if (mPageTransformer != null) {
      if (paramInt == 0) {
        break label50;
      }
    }
    label50:
    for (boolean bool = true;; bool = false)
    {
      enableLayers(bool);
      if (mOnPageChangeListener == null) {
        break;
      }
      mOnPageChangeListener.onPageScrollStateChanged(paramInt);
      return;
    }
  }
  
  private void setScrollingCacheEnabled(boolean paramBoolean)
  {
    if (mScrollingCacheEnabled != paramBoolean) {
      mScrollingCacheEnabled = paramBoolean;
    }
  }
  
  private void sortChildDrawingOrder()
  {
    if (mDrawingOrder != 0)
    {
      if (mDrawingOrderedChildren == null) {
        mDrawingOrderedChildren = new ArrayList();
      }
      for (;;)
      {
        int j = getChildCount();
        int i = 0;
        while (i < j)
        {
          View localView = getChildAt(i);
          mDrawingOrderedChildren.add(localView);
          i += 1;
        }
        mDrawingOrderedChildren.clear();
      }
      Collections.sort(mDrawingOrderedChildren, sPositionComparator);
    }
  }
  
  public void addFocusables(ArrayList<View> paramArrayList, int paramInt1, int paramInt2)
  {
    int j = paramArrayList.size();
    int k = getDescendantFocusability();
    if (k != 393216)
    {
      int i = 0;
      while (i < getChildCount())
      {
        View localView = getChildAt(i);
        if (localView.getVisibility() == 0)
        {
          ItemInfo localItemInfo = infoForChild(localView);
          if ((localItemInfo != null) && (position == mCurItem)) {
            localView.addFocusables(paramArrayList, paramInt1, paramInt2);
          }
        }
        i += 1;
      }
    }
    if (((k == 262144) && (j != paramArrayList.size())) || (!isFocusable())) {}
    while ((((paramInt2 & 0x1) == 1) && (isInTouchMode()) && (!isFocusableInTouchMode())) || (paramArrayList == null)) {
      return;
    }
    paramArrayList.add(this);
  }
  
  ItemInfo addNewItem(int paramInt1, int paramInt2)
  {
    ItemInfo localItemInfo = new ItemInfo();
    position = paramInt1;
    object = mAdapter.instantiateItem(this, paramInt1);
    widthFactor = mAdapter.getPageWidth(paramInt1);
    if ((paramInt2 < 0) || (paramInt2 >= mItems.size()))
    {
      mItems.add(localItemInfo);
      return localItemInfo;
    }
    mItems.add(paramInt2, localItemInfo);
    return localItemInfo;
  }
  
  public void addTouchables(ArrayList<View> paramArrayList)
  {
    int i = 0;
    while (i < getChildCount())
    {
      View localView = getChildAt(i);
      if (localView.getVisibility() == 0)
      {
        ItemInfo localItemInfo = infoForChild(localView);
        if ((localItemInfo != null) && (position == mCurItem)) {
          localView.addTouchables(paramArrayList);
        }
      }
      i += 1;
    }
  }
  
  public void addView(View paramView, int paramInt, ViewGroup.LayoutParams paramLayoutParams)
  {
    ViewGroup.LayoutParams localLayoutParams = paramLayoutParams;
    if (!checkLayoutParams(paramLayoutParams)) {
      localLayoutParams = generateLayoutParams(paramLayoutParams);
    }
    paramLayoutParams = (LayoutParams)localLayoutParams;
    isDecor |= paramView instanceof Decor;
    if (mInLayout)
    {
      if ((paramLayoutParams != null) && (isDecor)) {
        throw new IllegalStateException("Cannot add pager decor view during layout");
      }
      needsMeasure = true;
      addViewInLayout(paramView, paramInt, localLayoutParams);
      return;
    }
    super.addView(paramView, paramInt, localLayoutParams);
  }
  
  public boolean arrowScroll(int paramInt)
  {
    View localView = findFocus();
    Object localObject;
    boolean bool;
    int i;
    int j;
    if (localView == this)
    {
      localObject = null;
      bool = false;
      localView = FocusFinder.getInstance().findNextFocus(this, (View)localObject, paramInt);
      if ((localView == null) || (localView == localObject)) {
        break label343;
      }
      if (paramInt != 17) {
        break label280;
      }
      i = getChildRectInPagerCoordinatesmTempRect, localView).left;
      j = getChildRectInPagerCoordinatesmTempRect, (View)localObject).left;
      if ((localObject == null) || (i < j)) {
        break label270;
      }
      bool = pageLeft();
    }
    for (;;)
    {
      if (bool) {
        playSoundEffect(SoundEffectConstants.getContantForFocusDirection(paramInt));
      }
      return bool;
      localObject = localView;
      if (localView == null) {
        break;
      }
      j = 0;
      StringBuilder localStringBuilder;
      for (localObject = localView.getParent();; localObject = ((ViewParent)localObject).getParent())
      {
        i = j;
        if ((localObject instanceof ViewGroup))
        {
          if (localObject == this) {
            i = 1;
          }
        }
        else
        {
          localObject = localView;
          if (i != 0) {
            break;
          }
          localStringBuilder = new StringBuilder();
          localStringBuilder.append(localView.getClass().getSimpleName());
          for (localObject = localView.getParent(); (localObject instanceof ViewGroup); localObject = ((ViewParent)localObject).getParent()) {
            localStringBuilder.append(" => ").append(localObject.getClass().getSimpleName());
          }
        }
      }
      Log.e("ViewPager", "arrowScroll tried to find focus based on non-child current focused view " + localStringBuilder.toString());
      localObject = null;
      break;
      label270:
      bool = localView.requestFocus();
      continue;
      label280:
      if (paramInt == 66)
      {
        i = getChildRectInPagerCoordinatesmTempRect, localView).left;
        j = getChildRectInPagerCoordinatesmTempRect, (View)localObject).left;
        if ((localObject != null) && (i <= j))
        {
          bool = pageRight();
        }
        else
        {
          bool = localView.requestFocus();
          continue;
          label343:
          if ((paramInt == 17) || (paramInt == 1)) {
            bool = pageLeft();
          } else if ((paramInt == 66) || (paramInt == 2)) {
            bool = pageRight();
          }
        }
      }
    }
  }
  
  public boolean beginFakeDrag()
  {
    if (mIsBeingDragged) {
      return false;
    }
    mFakeDragging = true;
    setScrollState(1);
    mLastMotionX = 0.0F;
    mInitialMotionX = 0.0F;
    if (mVelocityTracker == null) {
      mVelocityTracker = VelocityTracker.obtain();
    }
    for (;;)
    {
      long l = SystemClock.uptimeMillis();
      MotionEvent localMotionEvent = MotionEvent.obtain(l, l, 0, 0.0F, 0.0F, 0);
      mVelocityTracker.addMovement(localMotionEvent);
      localMotionEvent.recycle();
      mFakeDragBeginTime = l;
      return true;
      mVelocityTracker.clear();
    }
  }
  
  protected boolean canScroll(View paramView, boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3)
  {
    if ((paramView instanceof ViewGroup))
    {
      ViewGroup localViewGroup = (ViewGroup)paramView;
      int j = paramView.getScrollX();
      int k = paramView.getScrollY();
      int i = localViewGroup.getChildCount() - 1;
      while (i >= 0)
      {
        View localView = localViewGroup.getChildAt(i);
        if ((paramInt2 + j >= localView.getLeft()) && (paramInt2 + j < localView.getRight()) && (paramInt3 + k >= localView.getTop()) && (paramInt3 + k < localView.getBottom()) && (canScroll(localView, true, paramInt1, paramInt2 + j - localView.getLeft(), paramInt3 + k - localView.getTop()))) {
          return true;
        }
        i -= 1;
      }
    }
    return (paramBoolean) && (ViewCompat.canScrollHorizontally(paramView, -paramInt1));
  }
  
  protected boolean checkLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    return ((paramLayoutParams instanceof LayoutParams)) && (super.checkLayoutParams(paramLayoutParams));
  }
  
  public void computeScroll()
  {
    if ((!mScroller.isFinished()) && (mScroller.computeScrollOffset()))
    {
      int i = getScrollX();
      int j = getScrollY();
      int k = mScroller.getCurrX();
      int m = mScroller.getCurrY();
      if ((i != k) || (j != m))
      {
        scrollTo(k, m);
        if (!pageScrolled(k))
        {
          mScroller.abortAnimation();
          scrollTo(0, m);
        }
      }
      ViewCompat.postInvalidateOnAnimation(this);
      return;
    }
    completeScroll(true);
  }
  
  void dataSetChanged()
  {
    int i4 = mAdapter.getCount();
    mExpectedAdapterCount = i4;
    int i;
    int j;
    int k;
    int m;
    label57:
    Object localObject;
    int i3;
    int n;
    int i1;
    int i2;
    if ((mItems.size() < mOffscreenPageLimit * 2 + 1) && (mItems.size() < i4))
    {
      i = 1;
      j = mCurItem;
      k = 0;
      m = 0;
      if (m >= mItems.size()) {
        break label304;
      }
      localObject = (ItemInfo)mItems.get(m);
      i3 = mAdapter.getItemPosition(object);
      if (i3 != -1) {
        break label133;
      }
      n = j;
      i1 = k;
      i2 = m;
    }
    for (;;)
    {
      m = i2 + 1;
      k = i1;
      j = n;
      break label57;
      i = 0;
      break;
      label133:
      if (i3 == -2)
      {
        mItems.remove(m);
        i3 = m - 1;
        m = k;
        if (k == 0)
        {
          mAdapter.startUpdate(this);
          m = 1;
        }
        mAdapter.destroyItem(this, position, object);
        i = 1;
        i2 = i3;
        i1 = m;
        n = j;
        if (mCurItem == position)
        {
          n = Math.max(0, Math.min(mCurItem, i4 - 1));
          i = 1;
          i2 = i3;
          i1 = m;
        }
      }
      else
      {
        i2 = m;
        i1 = k;
        n = j;
        if (position != i3)
        {
          if (position == mCurItem) {
            j = i3;
          }
          position = i3;
          i = 1;
          i2 = m;
          i1 = k;
          n = j;
        }
      }
    }
    label304:
    if (k != 0) {
      mAdapter.finishUpdate(this);
    }
    Collections.sort(mItems, COMPARATOR);
    if (i != 0)
    {
      k = getChildCount();
      i = 0;
      while (i < k)
      {
        localObject = (LayoutParams)getChildAt(i).getLayoutParams();
        if (!isDecor) {
          widthFactor = 0.0F;
        }
        i += 1;
      }
      setCurrentItemInternal(j, false, true);
      requestLayout();
    }
  }
  
  public boolean dispatchKeyEvent(KeyEvent paramKeyEvent)
  {
    return (super.dispatchKeyEvent(paramKeyEvent)) || (executeKeyEvent(paramKeyEvent));
  }
  
  public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    int j = getChildCount();
    int i = 0;
    while (i < j)
    {
      View localView = getChildAt(i);
      if (localView.getVisibility() == 0)
      {
        ItemInfo localItemInfo = infoForChild(localView);
        if ((localItemInfo != null) && (position == mCurItem) && (localView.dispatchPopulateAccessibilityEvent(paramAccessibilityEvent))) {
          return true;
        }
      }
      i += 1;
    }
    return false;
  }
  
  float distanceInfluenceForSnapDuration(float paramFloat)
  {
    return (float)Math.sin((float)((paramFloat - 0.5F) * 0.4712389167638204D));
  }
  
  public void draw(Canvas paramCanvas)
  {
    super.draw(paramCanvas);
    if (!mEdgeEffectEnabled) {}
    for (;;)
    {
      return;
      int k = 0;
      int i = 0;
      int m = ViewCompat.getOverScrollMode(this);
      boolean bool;
      if ((m == 0) || ((m == 1) && (mAdapter != null) && (mAdapter.getCount() > 1)))
      {
        int j;
        if (!mLeftEdge.isFinished())
        {
          k = paramCanvas.save();
          i = getHeight() - getPaddingTop() - getPaddingBottom();
          m = getWidth();
          paramCanvas.rotate(270.0F);
          paramCanvas.translate(-i + getPaddingTop(), mFirstOffset * m);
          mLeftEdge.setSize(i, m);
          j = false | mLeftEdge.draw(paramCanvas);
          paramCanvas.restoreToCount(k);
        }
        k = j;
        if (!mRightEdge.isFinished())
        {
          m = paramCanvas.save();
          k = getWidth();
          int n = getHeight();
          int i1 = getPaddingTop();
          int i2 = getPaddingBottom();
          paramCanvas.rotate(90.0F);
          paramCanvas.translate(-getPaddingTop(), -(mLastOffset + 1.0F) * k);
          mRightEdge.setSize(n - i1 - i2, k);
          bool = j | mRightEdge.draw(paramCanvas);
          paramCanvas.restoreToCount(m);
        }
      }
      while (bool)
      {
        ViewCompat.postInvalidateOnAnimation(this);
        return;
        mLeftEdge.finish();
        mRightEdge.finish();
      }
    }
  }
  
  protected void drawableStateChanged()
  {
    super.drawableStateChanged();
    Drawable localDrawable = mMarginDrawable;
    if ((localDrawable != null) && (localDrawable.isStateful())) {
      localDrawable.setState(getDrawableState());
    }
  }
  
  public void endFakeDrag()
  {
    if (!mFakeDragging) {
      throw new IllegalStateException("No fake drag in progress. Call beginFakeDrag first.");
    }
    Object localObject = mVelocityTracker;
    ((VelocityTracker)localObject).computeCurrentVelocity(1000, mMaximumVelocity);
    int i = (int)VelocityTrackerCompat.getXVelocity((VelocityTracker)localObject, mActivePointerId);
    mPopulatePending = true;
    int j = getClientWidth();
    int k = getScrollX();
    localObject = infoForCurrentScrollPosition();
    setCurrentItemInternal(determineTargetPage(position, (k / j - offset) / widthFactor, i, (int)(mLastMotionX - mInitialMotionX)), true, true, i);
    endDrag();
    mFakeDragging = false;
  }
  
  public boolean executeKeyEvent(KeyEvent paramKeyEvent)
  {
    if (paramKeyEvent.getAction() == 0) {
      switch (paramKeyEvent.getKeyCode())
      {
      }
    }
    do
    {
      do
      {
        return false;
        return arrowScroll(17);
        return arrowScroll(66);
      } while (Build.VERSION.SDK_INT < 11);
      if (KeyEventCompat.hasNoModifiers(paramKeyEvent)) {
        return arrowScroll(2);
      }
    } while (!KeyEventCompat.hasModifiers(paramKeyEvent, 1));
    return arrowScroll(1);
  }
  
  public void fakeDragBy(float paramFloat)
  {
    if (!mFakeDragging) {
      throw new IllegalStateException("No fake drag in progress. Call beginFakeDrag first.");
    }
    mLastMotionX += paramFloat;
    float f2 = getScrollX() - paramFloat;
    int i = getClientWidth();
    paramFloat = i * mFirstOffset;
    float f1 = i * mLastOffset;
    Object localObject = (ItemInfo)mItems.get(0);
    ItemInfo localItemInfo = (ItemInfo)mItems.get(mItems.size() - 1);
    if (position != 0) {
      paramFloat = offset * i;
    }
    if (position != mAdapter.getCount() - 1) {
      f1 = offset * i;
    }
    if (f2 < paramFloat) {}
    for (;;)
    {
      mLastMotionX += paramFloat - (int)paramFloat;
      scrollTo((int)paramFloat, getScrollY());
      pageScrolled((int)paramFloat);
      long l = SystemClock.uptimeMillis();
      localObject = MotionEvent.obtain(mFakeDragBeginTime, l, 2, mLastMotionX, 0.0F, 0);
      mVelocityTracker.addMovement((MotionEvent)localObject);
      ((MotionEvent)localObject).recycle();
      return;
      paramFloat = f2;
      if (f2 > f1) {
        paramFloat = f1;
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
    return generateDefaultLayoutParams();
  }
  
  public PagerAdapter getAdapter()
  {
    return mAdapter;
  }
  
  protected int getChildDrawingOrder(int paramInt1, int paramInt2)
  {
    if (mDrawingOrder == 2) {}
    for (paramInt1 = paramInt1 - 1 - paramInt2;; paramInt1 = paramInt2) {
      return mDrawingOrderedChildren.get(paramInt1)).getLayoutParams()).childIndex;
    }
  }
  
  public int getCurrentItem()
  {
    return mCurItem;
  }
  
  public int getOffscreenPageLimit()
  {
    return mOffscreenPageLimit;
  }
  
  public int getPageMargin()
  {
    return mPageMargin;
  }
  
  ItemInfo infoForAnyChild(View paramView)
  {
    for (;;)
    {
      ViewParent localViewParent = paramView.getParent();
      if (localViewParent == this) {
        break;
      }
      if ((localViewParent == null) || (!(localViewParent instanceof View))) {
        return null;
      }
      paramView = (View)localViewParent;
    }
    return infoForChild(paramView);
  }
  
  ItemInfo infoForChild(View paramView)
  {
    int i = 0;
    while (i < mItems.size())
    {
      ItemInfo localItemInfo = (ItemInfo)mItems.get(i);
      if (mAdapter.isViewFromObject(paramView, object)) {
        return localItemInfo;
      }
      i += 1;
    }
    return null;
  }
  
  ItemInfo infoForPosition(int paramInt)
  {
    int i = 0;
    while (i < mItems.size())
    {
      ItemInfo localItemInfo = (ItemInfo)mItems.get(i);
      if (position == paramInt) {
        return localItemInfo;
      }
      i += 1;
    }
    return null;
  }
  
  void initViewPager()
  {
    setWillNotDraw(false);
    setDescendantFocusability(262144);
    setFocusable(true);
    Context localContext = getContext();
    mScroller = new Scroller(localContext, sInterpolator);
    ViewConfiguration localViewConfiguration = ViewConfiguration.get(localContext);
    float f = getResourcesgetDisplayMetricsdensity;
    mTouchSlop = ViewConfigurationCompat.getScaledPagingTouchSlop(localViewConfiguration);
    mMinimumVelocity = ((int)(400.0F * f));
    mMaximumVelocity = localViewConfiguration.getScaledMaximumFlingVelocity();
    setEdgeEffectEnabled(false);
    mFlingDistance = ((int)(25.0F * f));
    mCloseEnough = ((int)(2.0F * f));
    mDefaultGutterSize = ((int)(16.0F * f));
    ViewCompat.setAccessibilityDelegate(this, new MyAccessibilityDelegate());
    if (ViewCompat.getImportantForAccessibility(this) == 0) {
      ViewCompat.setImportantForAccessibility(this, 1);
    }
  }
  
  public boolean isFakeDragging()
  {
    return mFakeDragging;
  }
  
  protected void onAttachedToWindow()
  {
    super.onAttachedToWindow();
    mFirstLayout = true;
  }
  
  protected void onDetachedFromWindow()
  {
    removeCallbacks(mEndScrollRunnable);
    super.onDetachedFromWindow();
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    int k;
    int m;
    float f3;
    int j;
    Object localObject;
    float f1;
    int n;
    int i;
    int i1;
    if ((mPageMargin > 0) && (mMarginDrawable != null) && (mItems.size() > 0) && (mAdapter != null))
    {
      k = getScrollX();
      m = getWidth();
      f3 = mPageMargin / m;
      j = 0;
      localObject = (ItemInfo)mItems.get(0);
      f1 = offset;
      n = mItems.size();
      i = position;
      i1 = mItems.get(n - 1)).position;
    }
    for (;;)
    {
      float f2;
      if (i < i1)
      {
        while ((i > position) && (j < n))
        {
          localObject = mItems;
          j += 1;
          localObject = (ItemInfo)((ArrayList)localObject).get(j);
        }
        if (i != position) {
          break label271;
        }
        f2 = (offset + widthFactor) * m;
      }
      label271:
      float f4;
      for (f1 = offset + widthFactor + f3;; f1 += f4 + f3)
      {
        if (mPageMargin + f2 > k)
        {
          mMarginDrawable.setBounds((int)f2, mTopPageBounds, (int)(mPageMargin + f2 + 0.5F), mBottomPageBounds);
          mMarginDrawable.draw(paramCanvas);
        }
        if (f2 <= k + m) {
          break;
        }
        return;
        f4 = mAdapter.getPageWidth(i);
        f2 = (f1 + f4) * m;
      }
      i += 1;
    }
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    int i = paramMotionEvent.getAction() & 0xFF;
    if ((i == 3) || (i == 1))
    {
      mIsBeingDragged = false;
      mIsUnableToDrag = false;
      mActivePointerId = -1;
      if (mVelocityTracker != null)
      {
        mVelocityTracker.recycle();
        mVelocityTracker = null;
      }
      return false;
    }
    if (i != 0)
    {
      if (mIsBeingDragged) {
        return true;
      }
      if (mIsUnableToDrag) {
        return false;
      }
    }
    switch (i)
    {
    }
    for (;;)
    {
      if (mVelocityTracker == null) {
        mVelocityTracker = VelocityTracker.obtain();
      }
      mVelocityTracker.addMovement(paramMotionEvent);
      return mIsBeingDragged;
      i = mActivePointerId;
      if (i != -1)
      {
        i = MotionEventCompat.findPointerIndex(paramMotionEvent, i);
        float f2 = MotionEventCompat.getX(paramMotionEvent, i);
        float f1 = f2 - mLastMotionX;
        float f4 = Math.abs(f1);
        float f3 = MotionEventCompat.getY(paramMotionEvent, i);
        float f5 = Math.abs(f3 - mInitialMotionY);
        if ((f1 != 0.0F) && (!isGutterDrag(mLastMotionX, f1)) && (canScroll(this, false, (int)f1, (int)f2, (int)f3)))
        {
          mLastMotionX = f2;
          mLastMotionY = f3;
          mIsUnableToDrag = true;
          return false;
        }
        if ((f4 > mTouchSlop) && (0.5F * f4 > f5))
        {
          mIsBeingDragged = true;
          setScrollState(1);
          if (f1 > 0.0F)
          {
            f1 = mInitialMotionX + mTouchSlop;
            label305:
            mLastMotionX = f1;
            mLastMotionY = f3;
            setScrollingCacheEnabled(true);
          }
        }
        while ((mIsBeingDragged) && (performDrag(f2)))
        {
          ViewCompat.postInvalidateOnAnimation(this);
          break;
          f1 = mInitialMotionX - mTouchSlop;
          break label305;
          if (f5 > mTouchSlop) {
            mIsUnableToDrag = true;
          }
        }
        f1 = paramMotionEvent.getX();
        mInitialMotionX = f1;
        mLastMotionX = f1;
        f1 = paramMotionEvent.getY();
        mInitialMotionY = f1;
        mLastMotionY = f1;
        mActivePointerId = MotionEventCompat.getPointerId(paramMotionEvent, 0);
        mIsUnableToDrag = false;
        mScroller.computeScrollOffset();
        if ((mScrollState == 2) && (Math.abs(mScroller.getFinalX() - mScroller.getCurrX()) > mCloseEnough))
        {
          mScroller.abortAnimation();
          mPopulatePending = false;
          populate();
          mIsBeingDragged = true;
          setScrollState(1);
        }
        else
        {
          completeScroll(false);
          mIsBeingDragged = false;
          continue;
          onSecondaryPointerUp(paramMotionEvent);
        }
      }
    }
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    int i3 = getChildCount();
    int i5 = paramInt3 - paramInt1;
    int i4 = paramInt4 - paramInt2;
    paramInt2 = getPaddingLeft();
    paramInt1 = getPaddingTop();
    int i = getPaddingRight();
    paramInt4 = getPaddingBottom();
    int i6 = getScrollX();
    int k = 0;
    int m = 0;
    View localView;
    int j;
    LayoutParams localLayoutParams;
    if (m < i3)
    {
      localView = getChildAt(m);
      int i2 = k;
      int i1 = paramInt4;
      j = paramInt2;
      int n = i;
      paramInt3 = paramInt1;
      if (localView.getVisibility() != 8)
      {
        localLayoutParams = (LayoutParams)localView.getLayoutParams();
        i2 = k;
        i1 = paramInt4;
        j = paramInt2;
        n = i;
        paramInt3 = paramInt1;
        if (isDecor)
        {
          paramInt3 = gravity;
          n = gravity;
          switch (paramInt3 & 0x7)
          {
          case 2: 
          case 4: 
          default: 
            paramInt3 = paramInt2;
            j = paramInt2;
            label190:
            switch (n & 0x70)
            {
            default: 
              paramInt2 = paramInt1;
            }
            break;
          }
        }
      }
      for (;;)
      {
        paramInt3 += i6;
        localView.layout(paramInt3, paramInt2, localView.getMeasuredWidth() + paramInt3, localView.getMeasuredHeight() + paramInt2);
        i2 = k + 1;
        paramInt3 = paramInt1;
        n = i;
        i1 = paramInt4;
        m += 1;
        k = i2;
        paramInt4 = i1;
        paramInt2 = j;
        i = n;
        paramInt1 = paramInt3;
        break;
        paramInt3 = paramInt2;
        j = paramInt2 + localView.getMeasuredWidth();
        break label190;
        paramInt3 = Math.max((i5 - localView.getMeasuredWidth()) / 2, paramInt2);
        j = paramInt2;
        break label190;
        paramInt3 = i5 - i - localView.getMeasuredWidth();
        i += localView.getMeasuredWidth();
        j = paramInt2;
        break label190;
        paramInt2 = paramInt1;
        paramInt1 += localView.getMeasuredHeight();
        continue;
        paramInt2 = Math.max((i4 - localView.getMeasuredHeight()) / 2, paramInt1);
        continue;
        paramInt2 = i4 - paramInt4 - localView.getMeasuredHeight();
        paramInt4 += localView.getMeasuredHeight();
      }
    }
    i = i5 - paramInt2 - i;
    paramInt3 = 0;
    while (paramInt3 < i3)
    {
      localView = getChildAt(paramInt3);
      if (localView.getVisibility() != 8)
      {
        localLayoutParams = (LayoutParams)localView.getLayoutParams();
        if (!isDecor)
        {
          ItemInfo localItemInfo = infoForChild(localView);
          if (localItemInfo != null)
          {
            j = paramInt2 + (int)(i * offset);
            if (needsMeasure)
            {
              needsMeasure = false;
              localView.measure(View.MeasureSpec.makeMeasureSpec((int)(i * widthFactor), 1073741824), View.MeasureSpec.makeMeasureSpec(i4 - paramInt1 - paramInt4, 1073741824));
            }
            localView.layout(j, paramInt1, localView.getMeasuredWidth() + j, localView.getMeasuredHeight() + paramInt1);
          }
        }
      }
      paramInt3 += 1;
    }
    mTopPageBounds = paramInt1;
    mBottomPageBounds = (i4 - paramInt4);
    mDecorChildCount = k;
    if (mFirstLayout) {
      scrollToItem(mCurItem, false, 0, false);
    }
    mFirstLayout = false;
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    setMeasuredDimension(getDefaultSize(0, paramInt1), getDefaultSize(0, paramInt2));
    paramInt1 = getMeasuredWidth();
    mGutterSize = Math.min(paramInt1 / 10, mDefaultGutterSize);
    paramInt1 = paramInt1 - getPaddingLeft() - getPaddingRight();
    paramInt2 = getMeasuredHeight() - getPaddingTop() - getPaddingBottom();
    int i5 = getChildCount();
    int k = 0;
    View localView;
    LayoutParams localLayoutParams;
    if (k < i5)
    {
      localView = getChildAt(k);
      i = paramInt2;
      int j = paramInt1;
      int m;
      int i1;
      label179:
      int n;
      if (localView.getVisibility() != 8)
      {
        localLayoutParams = (LayoutParams)localView.getLayoutParams();
        i = paramInt2;
        j = paramInt1;
        if (localLayoutParams != null)
        {
          i = paramInt2;
          j = paramInt1;
          if (isDecor)
          {
            j = gravity & 0x7;
            m = gravity & 0x70;
            i1 = Integer.MIN_VALUE;
            i = Integer.MIN_VALUE;
            if ((m != 48) && (m != 80)) {
              break label350;
            }
            m = 1;
            if ((j != 3) && (j != 5)) {
              break label356;
            }
            n = 1;
            label194:
            if (m == 0) {
              break label362;
            }
            j = 1073741824;
            label204:
            int i3 = paramInt1;
            i1 = paramInt2;
            int i2 = i3;
            int i4;
            if (width != -2)
            {
              i4 = 1073741824;
              j = i4;
              i2 = i3;
              if (width != -1)
              {
                i2 = width;
                j = i4;
              }
            }
            i3 = i1;
            if (height != -2)
            {
              i4 = 1073741824;
              i = i4;
              i3 = i1;
              if (height != -1)
              {
                i3 = height;
                i = i4;
              }
            }
            localView.measure(View.MeasureSpec.makeMeasureSpec(i2, j), View.MeasureSpec.makeMeasureSpec(i3, i));
            if (m == 0) {
              break label382;
            }
            i = paramInt2 - localView.getMeasuredHeight();
            j = paramInt1;
          }
        }
      }
      for (;;)
      {
        k += 1;
        paramInt2 = i;
        paramInt1 = j;
        break;
        label350:
        m = 0;
        break label179;
        label356:
        n = 0;
        break label194;
        label362:
        j = i1;
        if (n == 0) {
          break label204;
        }
        i = 1073741824;
        j = i1;
        break label204;
        label382:
        i = paramInt2;
        j = paramInt1;
        if (n != 0)
        {
          j = paramInt1 - localView.getMeasuredWidth();
          i = paramInt2;
        }
      }
    }
    mChildWidthMeasureSpec = View.MeasureSpec.makeMeasureSpec(paramInt1, 1073741824);
    mChildHeightMeasureSpec = View.MeasureSpec.makeMeasureSpec(paramInt2, 1073741824);
    mInLayout = true;
    populate();
    mInLayout = false;
    int i = getChildCount();
    paramInt2 = 0;
    while (paramInt2 < i)
    {
      localView = getChildAt(paramInt2);
      if (localView.getVisibility() != 8)
      {
        localLayoutParams = (LayoutParams)localView.getLayoutParams();
        if ((localLayoutParams == null) || (!isDecor)) {
          localView.measure(View.MeasureSpec.makeMeasureSpec((int)(paramInt1 * widthFactor), 1073741824), mChildHeightMeasureSpec);
        }
      }
      paramInt2 += 1;
    }
  }
  
  protected void onPageScrolled(int paramInt1, float paramFloat, int paramInt2)
  {
    int i;
    View localView;
    if (mDecorChildCount > 0)
    {
      int i1 = getScrollX();
      i = getPaddingLeft();
      int k = getPaddingRight();
      int i2 = getWidth();
      int i3 = getChildCount();
      int m = 0;
      while (m < i3)
      {
        localView = getChildAt(m);
        LayoutParams localLayoutParams = (LayoutParams)localView.getLayoutParams();
        int j;
        int n;
        if (!isDecor)
        {
          j = k;
          n = i;
          m += 1;
          i = n;
          k = j;
        }
        else
        {
          switch (gravity & 0x7)
          {
          case 2: 
          case 4: 
          default: 
            j = i;
          }
          for (;;)
          {
            int i4 = j + i1 - localView.getLeft();
            n = i;
            j = k;
            if (i4 == 0) {
              break;
            }
            localView.offsetLeftAndRight(i4);
            n = i;
            j = k;
            break;
            j = i;
            i += localView.getWidth();
            continue;
            j = Math.max((i2 - localView.getMeasuredWidth()) / 2, i);
            continue;
            j = i2 - k - localView.getMeasuredWidth();
            k += localView.getMeasuredWidth();
          }
        }
      }
    }
    if (mOnPageChangeListener != null) {
      mOnPageChangeListener.onPageScrolled(paramInt1, paramFloat, paramInt2);
    }
    if (mInternalPageChangeListener != null) {
      mInternalPageChangeListener.onPageScrolled(paramInt1, paramFloat, paramInt2);
    }
    if (mPageTransformer != null)
    {
      paramInt2 = getScrollX();
      i = getChildCount();
      paramInt1 = 0;
      if (paramInt1 < i)
      {
        localView = getChildAt(paramInt1);
        if (getLayoutParamsisDecor) {}
        for (;;)
        {
          paramInt1 += 1;
          break;
          paramFloat = (localView.getLeft() - paramInt2) / getClientWidth();
          mPageTransformer.transformPage(localView, paramFloat);
        }
      }
    }
    mCalledSuper = true;
  }
  
  protected boolean onRequestFocusInDescendants(int paramInt, Rect paramRect)
  {
    int j = getChildCount();
    int i;
    int k;
    if ((paramInt & 0x2) != 0)
    {
      i = 0;
      k = 1;
    }
    while (i != j)
    {
      View localView = getChildAt(i);
      if (localView.getVisibility() == 0)
      {
        ItemInfo localItemInfo = infoForChild(localView);
        if ((localItemInfo != null) && (position == mCurItem) && (localView.requestFocus(paramInt, paramRect)))
        {
          return true;
          i = j - 1;
          k = -1;
          j = -1;
          continue;
        }
      }
      i += k;
    }
    return false;
  }
  
  public void onRestoreInstanceState(Parcelable paramParcelable)
  {
    if (!(paramParcelable instanceof SavedState))
    {
      super.onRestoreInstanceState(paramParcelable);
      return;
    }
    paramParcelable = (SavedState)paramParcelable;
    super.onRestoreInstanceState(paramParcelable.getSuperState());
    if (mAdapter != null)
    {
      mAdapter.restoreState(adapterState, loader);
      setCurrentItemInternal(position, false, true);
      return;
    }
    mRestoredCurItem = position;
    mRestoredAdapterState = adapterState;
    mRestoredClassLoader = loader;
  }
  
  public Parcelable onSaveInstanceState()
  {
    SavedState localSavedState = new SavedState(super.onSaveInstanceState());
    position = mCurItem;
    if (mAdapter != null) {
      adapterState = mAdapter.saveState();
    }
    return localSavedState;
  }
  
  protected void onSizeChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onSizeChanged(paramInt1, paramInt2, paramInt3, paramInt4);
    if (paramInt1 != paramInt3) {
      recomputeScrollPosition(paramInt1, paramInt3, mPageMargin, mPageMargin);
    }
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if (mFakeDragging) {
      return true;
    }
    if ((paramMotionEvent.getAction() == 0) && (paramMotionEvent.getEdgeFlags() != 0)) {
      return false;
    }
    if ((mAdapter == null) || (mAdapter.getCount() == 0)) {
      return false;
    }
    if (mVelocityTracker == null) {
      mVelocityTracker = VelocityTracker.obtain();
    }
    mVelocityTracker.addMovement(paramMotionEvent);
    int n = paramMotionEvent.getAction();
    int m = 0;
    int i = m;
    switch (n & 0xFF)
    {
    default: 
      i = m;
    }
    for (;;)
    {
      if (i != 0) {
        ViewCompat.postInvalidateOnAnimation(this);
      }
      return true;
      mScroller.abortAnimation();
      mPopulatePending = false;
      populate();
      mIsBeingDragged = true;
      setScrollState(1);
      float f1 = paramMotionEvent.getX();
      mInitialMotionX = f1;
      mLastMotionX = f1;
      f1 = paramMotionEvent.getY();
      mInitialMotionY = f1;
      mLastMotionY = f1;
      mActivePointerId = MotionEventCompat.getPointerId(paramMotionEvent, 0);
      i = m;
      continue;
      float f2;
      if (!mIsBeingDragged)
      {
        i = MotionEventCompat.findPointerIndex(paramMotionEvent, mActivePointerId);
        f1 = MotionEventCompat.getX(paramMotionEvent, i);
        float f3 = Math.abs(f1 - mLastMotionX);
        f2 = MotionEventCompat.getY(paramMotionEvent, i);
        float f4 = Math.abs(f2 - mLastMotionY);
        if ((f3 > mTouchSlop) && (f3 > f4))
        {
          mIsBeingDragged = true;
          if (f1 - mInitialMotionX <= 0.0F) {
            break label368;
          }
        }
      }
      label368:
      for (f1 = mInitialMotionX + mTouchSlop;; f1 = mInitialMotionX - mTouchSlop)
      {
        mLastMotionX = f1;
        mLastMotionY = f2;
        setScrollState(1);
        setScrollingCacheEnabled(true);
        i = m;
        if (!mIsBeingDragged) {
          break;
        }
        bool1 = false | performDrag(MotionEventCompat.getX(paramMotionEvent, MotionEventCompat.findPointerIndex(paramMotionEvent, mActivePointerId)));
        break;
      }
      boolean bool1 = m;
      if (mIsBeingDragged)
      {
        Object localObject = mVelocityTracker;
        ((VelocityTracker)localObject).computeCurrentVelocity(1000, mMaximumVelocity);
        int j = (int)VelocityTrackerCompat.getXVelocity((VelocityTracker)localObject, mActivePointerId);
        mPopulatePending = true;
        n = getClientWidth();
        int i1 = getScrollX();
        localObject = infoForCurrentScrollPosition();
        setCurrentItemInternal(determineTargetPage(position, (i1 / n - offset) / widthFactor, j, (int)(MotionEventCompat.getX(paramMotionEvent, MotionEventCompat.findPointerIndex(paramMotionEvent, mActivePointerId)) - mInitialMotionX)), true, true, j);
        mActivePointerId = -1;
        endDrag();
        j = m;
        if (mEdgeEffectEnabled)
        {
          boolean bool2 = mLeftEdge.onRelease() | mRightEdge.onRelease();
          continue;
          bool2 = m;
          if (mIsBeingDragged)
          {
            scrollToItem(mCurItem, true, 0, false);
            mActivePointerId = -1;
            endDrag();
            bool2 = m;
            if (mEdgeEffectEnabled)
            {
              bool2 = mLeftEdge.onRelease() | mRightEdge.onRelease();
              continue;
              int k = MotionEventCompat.getActionIndex(paramMotionEvent);
              mLastMotionX = MotionEventCompat.getX(paramMotionEvent, k);
              mActivePointerId = MotionEventCompat.getPointerId(paramMotionEvent, k);
              k = m;
              continue;
              onSecondaryPointerUp(paramMotionEvent);
              mLastMotionX = MotionEventCompat.getX(paramMotionEvent, MotionEventCompat.findPointerIndex(paramMotionEvent, mActivePointerId));
              k = m;
            }
          }
        }
      }
    }
  }
  
  boolean pageLeft()
  {
    if (mCurItem > 0)
    {
      setCurrentItem(mCurItem - 1, true);
      return true;
    }
    return false;
  }
  
  boolean pageRight()
  {
    if ((mAdapter != null) && (mCurItem < mAdapter.getCount() - 1))
    {
      setCurrentItem(mCurItem + 1, true);
      return true;
    }
    return false;
  }
  
  void populate()
  {
    populate(mCurItem);
  }
  
  void populate(int paramInt)
  {
    Object localObject2 = null;
    int j = 2;
    int i;
    if (mCurItem != paramInt)
    {
      if (mCurItem < paramInt)
      {
        i = 66;
        localObject2 = infoForPosition(mCurItem);
        mCurItem = paramInt;
        j = i;
      }
    }
    else
    {
      if (mAdapter != null) {
        break label64;
      }
      sortChildDrawingOrder();
    }
    label64:
    label375:
    label483:
    label681:
    label694:
    label817:
    label825:
    label938:
    label944:
    label1054:
    label1065:
    label1182:
    label1292:
    label1298:
    for (;;)
    {
      return;
      i = 17;
      break;
      if (mPopulatePending)
      {
        sortChildDrawingOrder();
        return;
      }
      if (getWindowToken() != null)
      {
        mAdapter.startUpdate(this);
        paramInt = mOffscreenPageLimit;
        int i3 = Math.max(0, mCurItem - paramInt);
        int i1 = mAdapter.getCount();
        int i2 = Math.min(i1 - 1, mCurItem + paramInt);
        if (i1 != mExpectedAdapterCount) {
          try
          {
            String str = getResources().getResourceName(getId());
            throw new IllegalStateException("The application's PagerAdapter changed the adapter's contents without calling PagerAdapter#notifyDataSetChanged! Expected adapter item count: " + mExpectedAdapterCount + ", found: " + i1 + " Pager id: " + str + " Pager class: " + getClass() + " Problematic adapter: " + mAdapter.getClass());
          }
          catch (Resources.NotFoundException localNotFoundException)
          {
            for (;;)
            {
              localObject1 = Integer.toHexString(getId());
            }
          }
        }
        Object localObject3 = null;
        paramInt = 0;
        Object localObject1 = localObject3;
        Object localObject4;
        if (paramInt < mItems.size())
        {
          localObject4 = (ItemInfo)mItems.get(paramInt);
          if (position < mCurItem) {
            break label681;
          }
          localObject1 = localObject3;
          if (position == mCurItem) {
            localObject1 = localObject4;
          }
        }
        localObject3 = localObject1;
        if (localObject1 == null)
        {
          localObject3 = localObject1;
          if (i1 > 0) {
            localObject3 = addNewItem(mCurItem, paramInt);
          }
        }
        float f2;
        int n;
        int m;
        int k;
        if (localObject3 != null)
        {
          f2 = 0.0F;
          n = paramInt - 1;
          if (n >= 0)
          {
            localObject1 = (ItemInfo)mItems.get(n);
            float f3 = widthFactor;
            float f4 = getPaddingLeft() / getClientWidth();
            m = mCurItem - 1;
            localObject4 = localObject1;
            k = paramInt;
            if (m >= 0)
            {
              if ((f2 < 2.0F - f3 + f4) || (m >= i3)) {
                break label825;
              }
              if (localObject4 != null) {
                break label694;
              }
            }
            f2 = widthFactor;
            m = k + 1;
            if (f2 < 2.0F)
            {
              if (m >= mItems.size()) {
                break label938;
              }
              localObject1 = (ItemInfo)mItems.get(m);
              f3 = getPaddingRight() / getClientWidth();
              i = mCurItem + 1;
              localObject4 = localObject1;
              if (i < i1)
              {
                if ((f2 < f3 + 2.0F) || (i <= i2)) {
                  break label1065;
                }
                if (localObject4 != null) {
                  break label944;
                }
              }
            }
            calculatePageOffsets((ItemInfo)localObject3, k, (ItemInfo)localObject2);
          }
        }
        else
        {
          localObject2 = mAdapter;
          paramInt = mCurItem;
          if (localObject3 == null) {
            break label1182;
          }
        }
        for (localObject1 = object;; localObject1 = null)
        {
          ((PagerAdapter)localObject2).setPrimaryItem(this, paramInt, localObject1);
          mAdapter.finishUpdate(this);
          i = getChildCount();
          paramInt = 0;
          while (paramInt < i)
          {
            localObject2 = getChildAt(paramInt);
            localObject1 = (LayoutParams)((View)localObject2).getLayoutParams();
            childIndex = paramInt;
            if ((!isDecor) && (widthFactor == 0.0F))
            {
              localObject2 = infoForChild((View)localObject2);
              if (localObject2 != null)
              {
                widthFactor = widthFactor;
                position = position;
              }
            }
            paramInt += 1;
          }
          paramInt += 1;
          break;
          localObject1 = null;
          break label375;
          paramInt = k;
          float f1 = f2;
          localObject1 = localObject4;
          i = n;
          if (m == position)
          {
            paramInt = k;
            f1 = f2;
            localObject1 = localObject4;
            i = n;
            if (!scrolling)
            {
              mItems.remove(n);
              mAdapter.destroyItem(this, m, object);
              i = n - 1;
              paramInt = k - 1;
              if (i < 0) {
                break label817;
              }
              localObject1 = (ItemInfo)mItems.get(i);
            }
          }
          for (f1 = f2;; f1 = f2)
          {
            m -= 1;
            k = paramInt;
            f2 = f1;
            localObject4 = localObject1;
            n = i;
            break;
            localObject1 = null;
          }
          if ((localObject4 != null) && (m == position))
          {
            f1 = f2 + widthFactor;
            i = n - 1;
            if (i >= 0) {}
            for (localObject1 = (ItemInfo)mItems.get(i);; localObject1 = null)
            {
              paramInt = k;
              break;
            }
          }
          f1 = f2 + addNewItem1widthFactor;
          paramInt = k + 1;
          if (n >= 0) {}
          for (localObject1 = (ItemInfo)mItems.get(n);; localObject1 = null)
          {
            i = n;
            break;
          }
          localObject1 = null;
          break label483;
          f1 = f2;
          localObject1 = localObject4;
          paramInt = m;
          if (i == position)
          {
            f1 = f2;
            localObject1 = localObject4;
            paramInt = m;
            if (!scrolling)
            {
              mItems.remove(m);
              mAdapter.destroyItem(this, i, object);
              if (m >= mItems.size()) {
                break label1054;
              }
              localObject1 = (ItemInfo)mItems.get(m);
              paramInt = m;
              f1 = f2;
            }
          }
          for (;;)
          {
            i += 1;
            f2 = f1;
            localObject4 = localObject1;
            m = paramInt;
            break;
            localObject1 = null;
            f1 = f2;
            paramInt = m;
          }
          if ((localObject4 != null) && (i == position))
          {
            f1 = f2 + widthFactor;
            paramInt = m + 1;
            if (paramInt < mItems.size()) {}
            for (localObject1 = (ItemInfo)mItems.get(paramInt);; localObject1 = null) {
              break;
            }
          }
          localObject1 = addNewItem(i, m);
          paramInt = m + 1;
          f1 = f2 + widthFactor;
          if (paramInt < mItems.size()) {}
          for (localObject1 = (ItemInfo)mItems.get(paramInt);; localObject1 = null) {
            break;
          }
        }
        sortChildDrawingOrder();
        if (hasFocus())
        {
          localObject1 = findFocus();
          if (localObject1 != null) {}
          for (localObject1 = infoForAnyChild((View)localObject1);; localObject1 = null)
          {
            if ((localObject1 != null) && (position == mCurItem)) {
              break label1298;
            }
            paramInt = 0;
            for (;;)
            {
              if (paramInt >= getChildCount()) {
                break label1292;
              }
              localObject1 = getChildAt(paramInt);
              localObject2 = infoForChild((View)localObject1);
              if ((localObject2 != null) && (position == mCurItem) && (((View)localObject1).requestFocus(j))) {
                break;
              }
              paramInt += 1;
            }
            break;
          }
        }
      }
    }
  }
  
  public void removeView(View paramView)
  {
    if (mInLayout)
    {
      removeViewInLayout(paramView);
      return;
    }
    super.removeView(paramView);
  }
  
  public void setAdapter(PagerAdapter paramPagerAdapter)
  {
    if (mAdapter != null)
    {
      mAdapter.unregisterDataSetObserver(mObserver);
      mAdapter.startUpdate(this);
      int i = 0;
      while (i < mItems.size())
      {
        localObject = (ItemInfo)mItems.get(i);
        mAdapter.destroyItem(this, position, object);
        i += 1;
      }
      mAdapter.finishUpdate(this);
      mItems.clear();
      removeNonDecorViews();
      mCurItem = 0;
      scrollTo(0, 0);
    }
    Object localObject = mAdapter;
    mAdapter = paramPagerAdapter;
    mExpectedAdapterCount = 0;
    boolean bool;
    if (mAdapter != null)
    {
      if (mObserver == null) {
        mObserver = new PagerObserver(null);
      }
      mAdapter.registerDataSetObserver(mObserver);
      mPopulatePending = false;
      bool = mFirstLayout;
      mFirstLayout = true;
      mExpectedAdapterCount = mAdapter.getCount();
      if (mRestoredCurItem < 0) {
        break label260;
      }
      mAdapter.restoreState(mRestoredAdapterState, mRestoredClassLoader);
      setCurrentItemInternal(mRestoredCurItem, false, true);
      mRestoredCurItem = -1;
      mRestoredAdapterState = null;
      mRestoredClassLoader = null;
    }
    for (;;)
    {
      if ((mAdapterChangeListener != null) && (localObject != paramPagerAdapter)) {
        mAdapterChangeListener.onAdapterChanged((PagerAdapter)localObject, paramPagerAdapter);
      }
      return;
      label260:
      if (!bool) {
        populate();
      } else {
        requestLayout();
      }
    }
  }
  
  void setChildrenDrawingOrderEnabledCompat(boolean paramBoolean)
  {
    if ((Build.VERSION.SDK_INT < 7) || (mSetChildrenDrawingOrderEnabled == null)) {}
    try
    {
      mSetChildrenDrawingOrderEnabled = ViewGroup.class.getDeclaredMethod("setChildrenDrawingOrderEnabled", new Class[] { Boolean.TYPE });
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      for (;;)
      {
        try
        {
          mSetChildrenDrawingOrderEnabled.invoke(this, new Object[] { Boolean.valueOf(paramBoolean) });
          return;
        }
        catch (Exception localException)
        {
          Log.e("ViewPager", "Error changing children drawing order", localException);
        }
        localNoSuchMethodException = localNoSuchMethodException;
        Log.e("ViewPager", "Can't find setChildrenDrawingOrderEnabled", localNoSuchMethodException);
      }
    }
  }
  
  public void setCurrentItem(int paramInt)
  {
    mPopulatePending = false;
    if (!mFirstLayout) {}
    for (boolean bool = true;; bool = false)
    {
      setCurrentItemInternal(paramInt, bool, false);
      return;
    }
  }
  
  public void setCurrentItem(int paramInt, boolean paramBoolean)
  {
    mPopulatePending = false;
    setCurrentItemInternal(paramInt, paramBoolean, false);
  }
  
  void setCurrentItemInternal(int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    setCurrentItemInternal(paramInt, paramBoolean1, paramBoolean2, 0);
  }
  
  void setCurrentItemInternal(int paramInt1, boolean paramBoolean1, boolean paramBoolean2, int paramInt2)
  {
    boolean bool = true;
    if ((mAdapter == null) || (mAdapter.getCount() <= 0))
    {
      setScrollingCacheEnabled(false);
      return;
    }
    if ((!paramBoolean2) && (mCurItem == paramInt1) && (mItems.size() != 0))
    {
      setScrollingCacheEnabled(false);
      return;
    }
    int i;
    if (paramInt1 < 0) {
      i = 0;
    }
    for (;;)
    {
      paramInt1 = mOffscreenPageLimit;
      if ((i <= mCurItem + paramInt1) && (i >= mCurItem - paramInt1)) {
        break;
      }
      paramInt1 = 0;
      while (paramInt1 < mItems.size())
      {
        mItems.get(paramInt1)).scrolling = true;
        paramInt1 += 1;
      }
      i = paramInt1;
      if (paramInt1 >= mAdapter.getCount()) {
        i = mAdapter.getCount() - 1;
      }
    }
    if (mCurItem != i) {}
    for (paramBoolean2 = bool; mFirstLayout; paramBoolean2 = false)
    {
      mCurItem = i;
      if ((paramBoolean2) && (mOnPageChangeListener != null)) {
        mOnPageChangeListener.onPageSelected(i);
      }
      if ((paramBoolean2) && (mInternalPageChangeListener != null)) {
        mInternalPageChangeListener.onPageSelected(i);
      }
      requestLayout();
      return;
    }
    populate(i);
    scrollToItem(i, paramBoolean1, paramInt2, paramBoolean2);
  }
  
  void setEdgeEffectEnabled(boolean paramBoolean)
  {
    Context localContext;
    if (mEdgeEffectEnabled != paramBoolean)
    {
      if (!paramBoolean) {
        break label47;
      }
      localContext = getContext();
      mLeftEdge = new EdgeEffectCompat(localContext);
    }
    for (mRightEdge = new EdgeEffectCompat(localContext);; mRightEdge = null)
    {
      mEdgeEffectEnabled = paramBoolean;
      return;
      label47:
      mLeftEdge = null;
    }
  }
  
  OnPageChangeListener setInternalPageChangeListener(OnPageChangeListener paramOnPageChangeListener)
  {
    OnPageChangeListener localOnPageChangeListener = mInternalPageChangeListener;
    mInternalPageChangeListener = paramOnPageChangeListener;
    return localOnPageChangeListener;
  }
  
  public void setOffscreenPageLimit(int paramInt)
  {
    int i = paramInt;
    if (paramInt < 1)
    {
      Log.w("ViewPager", "Requested offscreen page limit " + paramInt + " too small; defaulting to " + 1);
      i = 1;
    }
    if (i != mOffscreenPageLimit)
    {
      mOffscreenPageLimit = i;
      populate();
    }
  }
  
  void setOnAdapterChangeListener(OnAdapterChangeListener paramOnAdapterChangeListener)
  {
    mAdapterChangeListener = paramOnAdapterChangeListener;
  }
  
  public void setOnPageChangeListener(OnPageChangeListener paramOnPageChangeListener)
  {
    mOnPageChangeListener = paramOnPageChangeListener;
  }
  
  public void setPageMargin(int paramInt)
  {
    int i = mPageMargin;
    mPageMargin = paramInt;
    int j = getWidth();
    recomputeScrollPosition(j, j, paramInt, i);
    requestLayout();
  }
  
  public void setPageMarginDrawable(int paramInt)
  {
    setPageMarginDrawable(getContext().getResources().getDrawable(paramInt));
  }
  
  public void setPageMarginDrawable(Drawable paramDrawable)
  {
    mMarginDrawable = paramDrawable;
    if (paramDrawable != null) {
      refreshDrawableState();
    }
    if (paramDrawable == null) {}
    for (boolean bool = true;; bool = false)
    {
      setWillNotDraw(bool);
      invalidate();
      return;
    }
  }
  
  public void setPageTransformer(boolean paramBoolean, PageTransformer paramPageTransformer)
  {
    int j = 1;
    boolean bool1;
    boolean bool2;
    label28:
    int i;
    if (Build.VERSION.SDK_INT >= 11)
    {
      if (paramPageTransformer == null) {
        break label75;
      }
      bool1 = true;
      if (mPageTransformer == null) {
        break label81;
      }
      bool2 = true;
      if (bool1 == bool2) {
        break label87;
      }
      i = 1;
      label37:
      mPageTransformer = paramPageTransformer;
      setChildrenDrawingOrderEnabledCompat(bool1);
      if (!bool1) {
        break label92;
      }
      if (paramBoolean) {
        j = 2;
      }
    }
    label75:
    label81:
    label87:
    label92:
    for (mDrawingOrder = j;; mDrawingOrder = 0)
    {
      if (i != 0) {
        populate();
      }
      return;
      bool1 = false;
      break;
      bool2 = false;
      break label28;
      i = 0;
      break label37;
    }
  }
  
  void smoothScrollTo(int paramInt1, int paramInt2)
  {
    smoothScrollTo(paramInt1, paramInt2, 0);
  }
  
  void smoothScrollTo(int paramInt1, int paramInt2, int paramInt3)
  {
    if (getChildCount() == 0)
    {
      setScrollingCacheEnabled(false);
      return;
    }
    int i = getScrollX();
    int j = getScrollY();
    int k = paramInt1 - i;
    paramInt2 -= j;
    if ((k == 0) && (paramInt2 == 0))
    {
      completeScroll(false);
      populate();
      setScrollState(0);
      return;
    }
    setScrollingCacheEnabled(true);
    setScrollState(2);
    paramInt1 = getClientWidth();
    int m = paramInt1 / 2;
    float f3 = Math.min(1.0F, 1.0F * Math.abs(k) / paramInt1);
    float f1 = m;
    float f2 = m;
    f3 = distanceInfluenceForSnapDuration(f3);
    paramInt3 = Math.abs(paramInt3);
    if (paramInt3 > 0) {}
    for (paramInt1 = Math.round(1000.0F * Math.abs((f1 + f2 * f3) / paramInt3)) * 4;; paramInt1 = (int)((1.0F + Math.abs(k) / (mPageMargin + f1 * f2)) * 100.0F))
    {
      paramInt1 = Math.min(paramInt1, 600);
      mScroller.startScroll(i, j, k, paramInt2, paramInt1);
      ViewCompat.postInvalidateOnAnimation(this);
      return;
      f1 = paramInt1;
      f2 = mAdapter.getPageWidth(mCurItem);
    }
  }
  
  protected boolean verifyDrawable(Drawable paramDrawable)
  {
    return (super.verifyDrawable(paramDrawable)) || (paramDrawable == mMarginDrawable);
  }
  
  static abstract interface Decor {}
  
  static class ItemInfo
  {
    Object object;
    float offset;
    int position;
    boolean scrolling;
    float widthFactor;
    
    ItemInfo() {}
  }
  
  public static class LayoutParams
    extends ViewGroup.LayoutParams
  {
    int childIndex;
    public int gravity;
    public boolean isDecor;
    boolean needsMeasure;
    int position;
    float widthFactor = 0.0F;
    
    public LayoutParams()
    {
      super(-1);
    }
    
    public LayoutParams(Context paramContext, AttributeSet paramAttributeSet)
    {
      super(paramAttributeSet);
      paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, ViewPager.LAYOUT_ATTRS);
      gravity = paramContext.getInteger(0, 48);
      paramContext.recycle();
    }
  }
  
  class MyAccessibilityDelegate
    extends AccessibilityDelegateCompat
  {
    MyAccessibilityDelegate() {}
    
    public void onInitializeAccessibilityEvent(View paramView, AccessibilityEvent paramAccessibilityEvent)
    {
      super.onInitializeAccessibilityEvent(paramView, paramAccessibilityEvent);
      paramAccessibilityEvent.setClassName(ViewPager.class.getName());
    }
    
    public void onInitializeAccessibilityNodeInfo(View paramView, AccessibilityNodeInfoCompat paramAccessibilityNodeInfoCompat)
    {
      boolean bool = true;
      super.onInitializeAccessibilityNodeInfo(paramView, paramAccessibilityNodeInfoCompat);
      paramAccessibilityNodeInfoCompat.setClassName(ViewPager.class.getName());
      if ((mAdapter != null) && (mAdapter.getCount() > 1)) {}
      for (;;)
      {
        paramAccessibilityNodeInfoCompat.setScrollable(bool);
        if ((mAdapter != null) && (mCurItem >= 0) && (mCurItem < mAdapter.getCount() - 1)) {
          paramAccessibilityNodeInfoCompat.addAction(4096);
        }
        if ((mAdapter != null) && (mCurItem > 0) && (mCurItem < mAdapter.getCount())) {
          paramAccessibilityNodeInfoCompat.addAction(8192);
        }
        return;
        bool = false;
      }
    }
    
    public boolean performAccessibilityAction(View paramView, int paramInt, Bundle paramBundle)
    {
      if (super.performAccessibilityAction(paramView, paramInt, paramBundle)) {
        return true;
      }
      switch (paramInt)
      {
      default: 
        return false;
      case 4096: 
        if ((mAdapter != null) && (mCurItem >= 0) && (mCurItem < mAdapter.getCount() - 1))
        {
          setCurrentItem(mCurItem + 1);
          return true;
        }
        return false;
      }
      if ((mAdapter != null) && (mCurItem > 0) && (mCurItem < mAdapter.getCount()))
      {
        setCurrentItem(mCurItem - 1);
        return true;
      }
      return false;
    }
  }
  
  static abstract interface OnAdapterChangeListener
  {
    public abstract void onAdapterChanged(PagerAdapter paramPagerAdapter1, PagerAdapter paramPagerAdapter2);
  }
  
  public static abstract interface OnPageChangeListener
  {
    public abstract void onPageScrollStateChanged(int paramInt);
    
    public abstract void onPageScrolled(int paramInt1, float paramFloat, int paramInt2);
    
    public abstract void onPageSelected(int paramInt);
  }
  
  public static abstract interface PageTransformer
  {
    public abstract void transformPage(View paramView, float paramFloat);
  }
  
  private class PagerObserver
    extends DataSetObserver
  {
    private PagerObserver() {}
    
    public void onChanged()
    {
      dataSetChanged();
    }
    
    public void onInvalidated()
    {
      dataSetChanged();
    }
  }
  
  public static class SavedState
    extends View.BaseSavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = ParcelableCompat.newCreator(new ParcelableCompatCreatorCallbacks()
    {
      public ViewPager.SavedState createFromParcel(Parcel paramAnonymousParcel, ClassLoader paramAnonymousClassLoader)
      {
        return new ViewPager.SavedState(paramAnonymousParcel, paramAnonymousClassLoader);
      }
      
      public ViewPager.SavedState[] newArray(int paramAnonymousInt)
      {
        return new ViewPager.SavedState[paramAnonymousInt];
      }
    });
    Parcelable adapterState;
    ClassLoader loader;
    int position;
    
    SavedState(Parcel paramParcel, ClassLoader paramClassLoader)
    {
      super();
      ClassLoader localClassLoader = paramClassLoader;
      if (paramClassLoader == null) {
        localClassLoader = getClass().getClassLoader();
      }
      position = paramParcel.readInt();
      adapterState = paramParcel.readParcelable(localClassLoader);
      loader = localClassLoader;
    }
    
    public SavedState(Parcelable paramParcelable)
    {
      super();
    }
    
    public String toString()
    {
      return "FragmentPager.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " position=" + position + "}";
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      paramParcel.writeInt(position);
      paramParcel.writeParcelable(adapterState, paramInt);
    }
  }
  
  public static class SimpleOnPageChangeListener
    implements ViewPager.OnPageChangeListener
  {
    public SimpleOnPageChangeListener() {}
    
    public void onPageScrollStateChanged(int paramInt) {}
    
    public void onPageScrolled(int paramInt1, float paramFloat, int paramInt2) {}
    
    public void onPageSelected(int paramInt) {}
  }
  
  static class ViewPositionComparator
    implements Comparator<View>
  {
    ViewPositionComparator() {}
    
    public int compare(View paramView1, View paramView2)
    {
      paramView1 = (ViewPager.LayoutParams)paramView1.getLayoutParams();
      paramView2 = (ViewPager.LayoutParams)paramView2.getLayoutParams();
      if (isDecor != isDecor)
      {
        if (isDecor) {
          return 1;
        }
        return -1;
      }
      return position - position;
    }
  }
}
