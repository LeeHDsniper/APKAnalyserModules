package android.support.v7.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.database.Observable;
import android.graphics.Canvas;
import android.graphics.PointF;
import android.graphics.Rect;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v4.os.TraceCompat;
import android.support.v4.util.ArrayMap;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.NestedScrollingChild;
import android.support.v4.view.NestedScrollingChildHelper;
import android.support.v4.view.ScrollingView;
import android.support.v4.view.VelocityTrackerCompat;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewConfigurationCompat;
import android.support.v4.view.accessibility.AccessibilityEventCompat;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.CollectionInfoCompat;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.CollectionItemInfoCompat;
import android.support.v4.view.accessibility.AccessibilityRecordCompat;
import android.support.v4.widget.EdgeEffectCompat;
import android.support.v4.widget.ScrollerCompat;
import android.support.v7.recyclerview.R.styleable;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.util.SparseIntArray;
import android.util.TypedValue;
import android.view.FocusFinder;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.View.MeasureSpec;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.animation.Interpolator;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class RecyclerView
  extends ViewGroup
  implements NestedScrollingChild, ScrollingView
{
  private static final boolean FORCE_INVALIDATE_DISPLAY_LIST;
  private static final Class<?>[] LAYOUT_MANAGER_CONSTRUCTOR_SIGNATURE;
  private static final Interpolator sQuinticInterpolator;
  private RecyclerViewAccessibilityDelegate mAccessibilityDelegate;
  private final AccessibilityManager mAccessibilityManager;
  private OnItemTouchListener mActiveOnItemTouchListener;
  private Adapter mAdapter;
  AdapterHelper mAdapterHelper;
  private boolean mAdapterUpdateDuringMeasure;
  private EdgeEffectCompat mBottomGlow;
  private ChildDrawingOrderCallback mChildDrawingOrderCallback;
  ChildHelper mChildHelper;
  private boolean mClipToPadding;
  private boolean mDataSetHasChangedAfterLayout = false;
  private boolean mEatRequestLayout;
  private int mEatenAccessibilityChangeFlags;
  private boolean mFirstLayoutComplete;
  private boolean mHasFixedSize;
  private int mInitialTouchX;
  private int mInitialTouchY;
  private boolean mIsAttached;
  ItemAnimator mItemAnimator = new DefaultItemAnimator();
  private RecyclerView.ItemAnimator.ItemAnimatorListener mItemAnimatorListener = new ItemAnimatorRestoreListener(null);
  private Runnable mItemAnimatorRunner = new Runnable()
  {
    public void run()
    {
      if (mItemAnimator != null) {
        mItemAnimator.runPendingAnimations();
      }
      RecyclerView.access$502(RecyclerView.this, false);
    }
  };
  private final ArrayList<ItemDecoration> mItemDecorations = new ArrayList();
  boolean mItemsAddedOrRemoved = false;
  boolean mItemsChanged = false;
  private int mLastTouchX;
  private int mLastTouchY;
  private LayoutManager mLayout;
  private int mLayoutOrScrollCounter = 0;
  private boolean mLayoutRequestEaten;
  private EdgeEffectCompat mLeftGlow;
  private final int mMaxFlingVelocity;
  private final int mMinFlingVelocity;
  private final int[] mMinMaxLayoutPositions = new int[2];
  private final int[] mNestedOffsets = new int[2];
  private final RecyclerViewDataObserver mObserver = new RecyclerViewDataObserver(null);
  private List<OnChildAttachStateChangeListener> mOnChildAttachStateListeners;
  private final ArrayList<OnItemTouchListener> mOnItemTouchListeners = new ArrayList();
  private SavedState mPendingSavedState;
  private final boolean mPostUpdatesOnAnimation;
  private boolean mPostedAnimatorRunner = false;
  final Recycler mRecycler = new Recycler();
  private RecyclerListener mRecyclerListener;
  private EdgeEffectCompat mRightGlow;
  private final int[] mScrollConsumed = new int[2];
  private float mScrollFactor = Float.MIN_VALUE;
  private OnScrollListener mScrollListener;
  private List<OnScrollListener> mScrollListeners;
  private final int[] mScrollOffset = new int[2];
  private int mScrollPointerId = -1;
  private int mScrollState = 0;
  private final NestedScrollingChildHelper mScrollingChildHelper;
  final State mState = new State();
  private final Rect mTempRect = new Rect();
  private EdgeEffectCompat mTopGlow;
  private int mTouchSlop;
  private final Runnable mUpdateChildViewsRunnable = new Runnable()
  {
    public void run()
    {
      if (!mFirstLayoutComplete) {}
      do
      {
        return;
        if (mDataSetHasChangedAfterLayout)
        {
          TraceCompat.beginSection("RV FullInvalidate");
          dispatchLayout();
          TraceCompat.endSection();
          return;
        }
      } while (!mAdapterHelper.hasPendingUpdates());
      TraceCompat.beginSection("RV PartialInvalidate");
      eatRequestLayout();
      mAdapterHelper.preProcess();
      if (!mLayoutRequestEaten) {
        rebindUpdatedViewHolders();
      }
      resumeRequestLayout(true);
      TraceCompat.endSection();
    }
  };
  private VelocityTracker mVelocityTracker;
  private final ViewFlinger mViewFlinger = new ViewFlinger();
  
  static
  {
    if ((Build.VERSION.SDK_INT == 18) || (Build.VERSION.SDK_INT == 19) || (Build.VERSION.SDK_INT == 20)) {}
    for (boolean bool = true;; bool = false)
    {
      FORCE_INVALIDATE_DISPLAY_LIST = bool;
      LAYOUT_MANAGER_CONSTRUCTOR_SIGNATURE = new Class[] { Context.class, AttributeSet.class, Integer.TYPE, Integer.TYPE };
      sQuinticInterpolator = new Interpolator()
      {
        public float getInterpolation(float paramAnonymousFloat)
        {
          paramAnonymousFloat -= 1.0F;
          return paramAnonymousFloat * paramAnonymousFloat * paramAnonymousFloat * paramAnonymousFloat * paramAnonymousFloat + 1.0F;
        }
      };
      return;
    }
  }
  
  public RecyclerView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public RecyclerView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public RecyclerView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    setFocusableInTouchMode(true);
    if (Build.VERSION.SDK_INT >= 16) {}
    for (boolean bool1 = true;; bool1 = false)
    {
      mPostUpdatesOnAnimation = bool1;
      Object localObject = ViewConfiguration.get(paramContext);
      mTouchSlop = ((ViewConfiguration)localObject).getScaledTouchSlop();
      mMinFlingVelocity = ((ViewConfiguration)localObject).getScaledMinimumFlingVelocity();
      mMaxFlingVelocity = ((ViewConfiguration)localObject).getScaledMaximumFlingVelocity();
      bool1 = bool2;
      if (ViewCompat.getOverScrollMode(this) == 2) {
        bool1 = true;
      }
      setWillNotDraw(bool1);
      mItemAnimator.setListener(mItemAnimatorListener);
      initAdapterManager();
      initChildrenHelper();
      if (ViewCompat.getImportantForAccessibility(this) == 0) {
        ViewCompat.setImportantForAccessibility(this, 1);
      }
      mAccessibilityManager = ((AccessibilityManager)getContext().getSystemService("accessibility"));
      setAccessibilityDelegateCompat(new RecyclerViewAccessibilityDelegate(this));
      if (paramAttributeSet != null)
      {
        localObject = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.RecyclerView, paramInt, 0);
        String str = ((TypedArray)localObject).getString(R.styleable.RecyclerView_layoutManager);
        ((TypedArray)localObject).recycle();
        createLayoutManager(paramContext, str, paramAttributeSet, paramInt, 0);
      }
      mScrollingChildHelper = new NestedScrollingChildHelper(this);
      setNestedScrollingEnabled(true);
      return;
    }
  }
  
  private void addAnimatingView(ViewHolder paramViewHolder)
  {
    View localView = itemView;
    if (localView.getParent() == this) {}
    for (int i = 1;; i = 0)
    {
      mRecycler.unscrapView(getChildViewHolder(localView));
      if (!paramViewHolder.isTmpDetached()) {
        break;
      }
      mChildHelper.attachViewToParent(localView, -1, localView.getLayoutParams(), true);
      return;
    }
    if (i == 0)
    {
      mChildHelper.addView(localView, true);
      return;
    }
    mChildHelper.hide(localView);
  }
  
  private void animateAppearance(ViewHolder paramViewHolder, Rect paramRect, int paramInt1, int paramInt2)
  {
    View localView = itemView;
    if ((paramRect != null) && ((left != paramInt1) || (top != paramInt2)))
    {
      paramViewHolder.setIsRecyclable(false);
      if (mItemAnimator.animateMove(paramViewHolder, left, top, paramInt1, paramInt2)) {
        postAnimationRunner();
      }
    }
    do
    {
      return;
      paramViewHolder.setIsRecyclable(false);
    } while (!mItemAnimator.animateAdd(paramViewHolder));
    postAnimationRunner();
  }
  
  private void animateChange(ViewHolder paramViewHolder1, ViewHolder paramViewHolder2)
  {
    paramViewHolder1.setIsRecyclable(false);
    addAnimatingView(paramViewHolder1);
    mShadowedHolder = paramViewHolder2;
    mRecycler.unscrapView(paramViewHolder1);
    int k = itemView.getLeft();
    int m = itemView.getTop();
    int i;
    int j;
    if ((paramViewHolder2 == null) || (paramViewHolder2.shouldIgnore()))
    {
      i = k;
      j = m;
    }
    for (;;)
    {
      if (mItemAnimator.animateChange(paramViewHolder1, paramViewHolder2, k, m, i, j)) {
        postAnimationRunner();
      }
      return;
      i = itemView.getLeft();
      j = itemView.getTop();
      paramViewHolder2.setIsRecyclable(false);
      mShadowingHolder = paramViewHolder1;
    }
  }
  
  private void animateDisappearance(ItemHolderInfo paramItemHolderInfo)
  {
    View localView = holder.itemView;
    addAnimatingView(holder);
    int i = left;
    int j = top;
    int k = localView.getLeft();
    int m = localView.getTop();
    if ((!holder.isRemoved()) && ((i != k) || (j != m)))
    {
      holder.setIsRecyclable(false);
      localView.layout(k, m, localView.getWidth() + k, localView.getHeight() + m);
      if (mItemAnimator.animateMove(holder, i, j, k, m)) {
        postAnimationRunner();
      }
    }
    do
    {
      return;
      holder.setIsRecyclable(false);
    } while (!mItemAnimator.animateRemove(holder));
    postAnimationRunner();
  }
  
  private void cancelTouch()
  {
    if (mVelocityTracker != null) {
      mVelocityTracker.clear();
    }
    stopNestedScroll();
    releaseGlows();
    setScrollState(0);
  }
  
  private void considerReleasingGlowsOnScroll(int paramInt1, int paramInt2)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (mLeftGlow != null)
    {
      bool1 = bool2;
      if (!mLeftGlow.isFinished())
      {
        bool1 = bool2;
        if (paramInt1 > 0) {
          bool1 = mLeftGlow.onRelease();
        }
      }
    }
    bool2 = bool1;
    if (mRightGlow != null)
    {
      bool2 = bool1;
      if (!mRightGlow.isFinished())
      {
        bool2 = bool1;
        if (paramInt1 < 0) {
          bool2 = bool1 | mRightGlow.onRelease();
        }
      }
    }
    bool1 = bool2;
    if (mTopGlow != null)
    {
      bool1 = bool2;
      if (!mTopGlow.isFinished())
      {
        bool1 = bool2;
        if (paramInt2 > 0) {
          bool1 = bool2 | mTopGlow.onRelease();
        }
      }
    }
    bool2 = bool1;
    if (mBottomGlow != null)
    {
      bool2 = bool1;
      if (!mBottomGlow.isFinished())
      {
        bool2 = bool1;
        if (paramInt2 < 0) {
          bool2 = bool1 | mBottomGlow.onRelease();
        }
      }
    }
    if (bool2) {
      ViewCompat.postInvalidateOnAnimation(this);
    }
  }
  
  private void consumePendingUpdateOperations()
  {
    mUpdateChildViewsRunnable.run();
  }
  
  private void createLayoutManager(Context paramContext, String paramString, AttributeSet paramAttributeSet, int paramInt1, int paramInt2)
  {
    if (paramString != null)
    {
      paramString = paramString.trim();
      if (paramString.length() != 0)
      {
        String str = getFullClassName(paramContext, paramString);
        try
        {
          if (isInEditMode()) {}
          Class localClass;
          for (paramString = getClass().getClassLoader();; paramString = paramContext.getClassLoader())
          {
            localClass = paramString.loadClass(str).asSubclass(LayoutManager.class);
            paramString = null;
            try
            {
              Constructor localConstructor = localClass.getConstructor(LAYOUT_MANAGER_CONSTRUCTOR_SIGNATURE);
              paramString = new Object[] { paramContext, paramAttributeSet, Integer.valueOf(paramInt1), Integer.valueOf(paramInt2) };
              paramContext = localConstructor;
            }
            catch (NoSuchMethodException localNoSuchMethodException)
            {
              try
              {
                paramContext = localClass.getConstructor(new Class[0]);
              }
              catch (NoSuchMethodException paramContext)
              {
                paramContext.initCause(localNoSuchMethodException);
                throw new IllegalStateException(paramAttributeSet.getPositionDescription() + ": Error creating LayoutManager " + str, paramContext);
              }
            }
            paramContext.setAccessible(true);
            setLayoutManager((LayoutManager)paramContext.newInstance(paramString));
            return;
          }
          return;
        }
        catch (ClassNotFoundException paramContext)
        {
          throw new IllegalStateException(paramAttributeSet.getPositionDescription() + ": Unable to find LayoutManager " + str, paramContext);
        }
        catch (InvocationTargetException paramContext)
        {
          throw new IllegalStateException(paramAttributeSet.getPositionDescription() + ": Could not instantiate the LayoutManager: " + str, paramContext);
        }
        catch (InstantiationException paramContext)
        {
          throw new IllegalStateException(paramAttributeSet.getPositionDescription() + ": Could not instantiate the LayoutManager: " + str, paramContext);
        }
        catch (IllegalAccessException paramContext)
        {
          throw new IllegalStateException(paramAttributeSet.getPositionDescription() + ": Cannot access non-public constructor " + str, paramContext);
        }
        catch (ClassCastException paramContext)
        {
          throw new IllegalStateException(paramAttributeSet.getPositionDescription() + ": Class is not a LayoutManager " + str, paramContext);
        }
      }
    }
  }
  
  private void defaultOnMeasure(int paramInt1, int paramInt2)
  {
    int j = View.MeasureSpec.getMode(paramInt1);
    int i = View.MeasureSpec.getMode(paramInt2);
    paramInt1 = View.MeasureSpec.getSize(paramInt1);
    paramInt2 = View.MeasureSpec.getSize(paramInt2);
    switch (j)
    {
    default: 
      paramInt1 = ViewCompat.getMinimumWidth(this);
      switch (i)
      {
      default: 
        paramInt2 = ViewCompat.getMinimumHeight(this);
      }
      break;
    }
    for (;;)
    {
      setMeasuredDimension(paramInt1, paramInt2);
      return;
      break;
    }
  }
  
  private boolean didChildRangeChange(int paramInt1, int paramInt2)
  {
    boolean bool2 = false;
    int j = mChildHelper.getChildCount();
    boolean bool1;
    if (j == 0) {
      if (paramInt1 == 0)
      {
        bool1 = bool2;
        if (paramInt2 == 0) {}
      }
      else
      {
        bool1 = true;
      }
    }
    int i;
    do
    {
      return bool1;
      i = 0;
      bool1 = bool2;
    } while (i >= j);
    ViewHolder localViewHolder = getChildViewHolderInt(mChildHelper.getChildAt(i));
    if (localViewHolder.shouldIgnore()) {}
    int k;
    do
    {
      i += 1;
      break;
      k = localViewHolder.getLayoutPosition();
    } while ((k >= paramInt1) && (k <= paramInt2));
    return true;
  }
  
  private void dispatchChildAttached(View paramView)
  {
    ViewHolder localViewHolder = getChildViewHolderInt(paramView);
    onChildAttachedToWindow(paramView);
    if ((mAdapter != null) && (localViewHolder != null)) {
      mAdapter.onViewAttachedToWindow(localViewHolder);
    }
    if (mOnChildAttachStateListeners != null)
    {
      int i = mOnChildAttachStateListeners.size() - 1;
      while (i >= 0)
      {
        ((OnChildAttachStateChangeListener)mOnChildAttachStateListeners.get(i)).onChildViewAttachedToWindow(paramView);
        i -= 1;
      }
    }
  }
  
  private void dispatchChildDetached(View paramView)
  {
    ViewHolder localViewHolder = getChildViewHolderInt(paramView);
    onChildDetachedFromWindow(paramView);
    if ((mAdapter != null) && (localViewHolder != null)) {
      mAdapter.onViewDetachedFromWindow(localViewHolder);
    }
    if (mOnChildAttachStateListeners != null)
    {
      int i = mOnChildAttachStateListeners.size() - 1;
      while (i >= 0)
      {
        ((OnChildAttachStateChangeListener)mOnChildAttachStateListeners.get(i)).onChildViewDetachedFromWindow(paramView);
        i -= 1;
      }
    }
  }
  
  private void dispatchContentChangedIfNecessary()
  {
    int i = mEatenAccessibilityChangeFlags;
    mEatenAccessibilityChangeFlags = 0;
    if ((i != 0) && (mAccessibilityManager != null) && (mAccessibilityManager.isEnabled()))
    {
      AccessibilityEvent localAccessibilityEvent = AccessibilityEvent.obtain();
      localAccessibilityEvent.setEventType(2048);
      AccessibilityEventCompat.setContentChangeTypes(localAccessibilityEvent, i);
      sendAccessibilityEventUnchecked(localAccessibilityEvent);
    }
  }
  
  private boolean dispatchOnItemTouch(MotionEvent paramMotionEvent)
  {
    int i = paramMotionEvent.getAction();
    int j;
    if (mActiveOnItemTouchListener != null)
    {
      if (i == 0) {
        mActiveOnItemTouchListener = null;
      }
    }
    else
    {
      if (i == 0) {
        break label108;
      }
      j = mOnItemTouchListeners.size();
      i = 0;
    }
    while (i < j)
    {
      OnItemTouchListener localOnItemTouchListener = (OnItemTouchListener)mOnItemTouchListeners.get(i);
      if (localOnItemTouchListener.onInterceptTouchEvent(this, paramMotionEvent))
      {
        mActiveOnItemTouchListener = localOnItemTouchListener;
        do
        {
          return true;
          mActiveOnItemTouchListener.onTouchEvent(this, paramMotionEvent);
        } while ((i != 3) && (i != 1));
        mActiveOnItemTouchListener = null;
        return true;
      }
      i += 1;
    }
    label108:
    return false;
  }
  
  private boolean dispatchOnItemTouchIntercept(MotionEvent paramMotionEvent)
  {
    int j = paramMotionEvent.getAction();
    if ((j == 3) || (j == 0)) {
      mActiveOnItemTouchListener = null;
    }
    int k = mOnItemTouchListeners.size();
    int i = 0;
    while (i < k)
    {
      OnItemTouchListener localOnItemTouchListener = (OnItemTouchListener)mOnItemTouchListeners.get(i);
      if ((localOnItemTouchListener.onInterceptTouchEvent(this, paramMotionEvent)) && (j != 3))
      {
        mActiveOnItemTouchListener = localOnItemTouchListener;
        return true;
      }
      i += 1;
    }
    return false;
  }
  
  private void findMinMaxChildLayoutPositions(int[] paramArrayOfInt)
  {
    int i2 = mChildHelper.getChildCount();
    if (i2 == 0)
    {
      paramArrayOfInt[0] = 0;
      paramArrayOfInt[1] = 0;
      return;
    }
    int j = Integer.MAX_VALUE;
    int m = Integer.MIN_VALUE;
    int k = 0;
    if (k < i2)
    {
      ViewHolder localViewHolder = getChildViewHolderInt(mChildHelper.getChildAt(k));
      int i1;
      if (localViewHolder.shouldIgnore())
      {
        i1 = j;
        j = m;
      }
      for (;;)
      {
        k += 1;
        m = j;
        j = i1;
        break;
        int n = localViewHolder.getLayoutPosition();
        int i = j;
        if (n < j) {
          i = n;
        }
        j = m;
        i1 = i;
        if (n > m)
        {
          j = n;
          i1 = i;
        }
      }
    }
    paramArrayOfInt[0] = j;
    paramArrayOfInt[1] = m;
  }
  
  private int getAdapterPositionFor(ViewHolder paramViewHolder)
  {
    if ((paramViewHolder.hasAnyOfTheFlags(524)) || (!paramViewHolder.isBound())) {
      return -1;
    }
    return mAdapterHelper.applyPendingUpdatesToPosition(mPosition);
  }
  
  static ViewHolder getChildViewHolderInt(View paramView)
  {
    if (paramView == null) {
      return null;
    }
    return getLayoutParamsmViewHolder;
  }
  
  private String getFullClassName(Context paramContext, String paramString)
  {
    if (paramString.charAt(0) == '.') {
      paramContext = paramContext.getPackageName() + paramString;
    }
    do
    {
      return paramContext;
      paramContext = paramString;
    } while (paramString.contains("."));
    return RecyclerView.class.getPackage().getName() + '.' + paramString;
  }
  
  private float getScrollFactor()
  {
    if (mScrollFactor == Float.MIN_VALUE)
    {
      TypedValue localTypedValue = new TypedValue();
      if (getContext().getTheme().resolveAttribute(16842829, localTypedValue, true)) {
        mScrollFactor = localTypedValue.getDimension(getContext().getResources().getDisplayMetrics());
      }
    }
    else
    {
      return mScrollFactor;
    }
    return 0.0F;
  }
  
  private void initChildrenHelper()
  {
    mChildHelper = new ChildHelper(new ChildHelper.Callback()
    {
      public void addView(View paramAnonymousView, int paramAnonymousInt)
      {
        RecyclerView.this.addView(paramAnonymousView, paramAnonymousInt);
        RecyclerView.this.dispatchChildAttached(paramAnonymousView);
      }
      
      public void attachViewToParent(View paramAnonymousView, int paramAnonymousInt, ViewGroup.LayoutParams paramAnonymousLayoutParams)
      {
        RecyclerView.ViewHolder localViewHolder = RecyclerView.getChildViewHolderInt(paramAnonymousView);
        if (localViewHolder != null)
        {
          if ((!localViewHolder.isTmpDetached()) && (!localViewHolder.shouldIgnore())) {
            throw new IllegalArgumentException("Called attach on a child which is not detached: " + localViewHolder);
          }
          localViewHolder.clearTmpDetachFlag();
        }
        RecyclerView.this.attachViewToParent(paramAnonymousView, paramAnonymousInt, paramAnonymousLayoutParams);
      }
      
      public void detachViewFromParent(int paramAnonymousInt)
      {
        Object localObject = getChildAt(paramAnonymousInt);
        if (localObject != null)
        {
          localObject = RecyclerView.getChildViewHolderInt((View)localObject);
          if (localObject != null)
          {
            if ((((RecyclerView.ViewHolder)localObject).isTmpDetached()) && (!((RecyclerView.ViewHolder)localObject).shouldIgnore())) {
              throw new IllegalArgumentException("called detach on an already detached child " + localObject);
            }
            ((RecyclerView.ViewHolder)localObject).addFlags(256);
          }
        }
        RecyclerView.this.detachViewFromParent(paramAnonymousInt);
      }
      
      public View getChildAt(int paramAnonymousInt)
      {
        return RecyclerView.this.getChildAt(paramAnonymousInt);
      }
      
      public int getChildCount()
      {
        return RecyclerView.this.getChildCount();
      }
      
      public RecyclerView.ViewHolder getChildViewHolder(View paramAnonymousView)
      {
        return RecyclerView.getChildViewHolderInt(paramAnonymousView);
      }
      
      public int indexOfChild(View paramAnonymousView)
      {
        return RecyclerView.this.indexOfChild(paramAnonymousView);
      }
      
      public void removeAllViews()
      {
        int j = getChildCount();
        int i = 0;
        while (i < j)
        {
          RecyclerView.this.dispatchChildDetached(getChildAt(i));
          i += 1;
        }
        RecyclerView.this.removeAllViews();
      }
      
      public void removeViewAt(int paramAnonymousInt)
      {
        View localView = RecyclerView.this.getChildAt(paramAnonymousInt);
        if (localView != null) {
          RecyclerView.this.dispatchChildDetached(localView);
        }
        RecyclerView.this.removeViewAt(paramAnonymousInt);
      }
    });
  }
  
  private void jumpToPositionForSmoothScroller(int paramInt)
  {
    if (mLayout == null) {
      return;
    }
    mLayout.scrollToPosition(paramInt);
    awakenScrollBars();
  }
  
  private void onEnterLayoutOrScroll()
  {
    mLayoutOrScrollCounter += 1;
  }
  
  private void onExitLayoutOrScroll()
  {
    mLayoutOrScrollCounter -= 1;
    if (mLayoutOrScrollCounter < 1)
    {
      mLayoutOrScrollCounter = 0;
      dispatchContentChangedIfNecessary();
    }
  }
  
  private void onPointerUp(MotionEvent paramMotionEvent)
  {
    int i = MotionEventCompat.getActionIndex(paramMotionEvent);
    if (MotionEventCompat.getPointerId(paramMotionEvent, i) == mScrollPointerId) {
      if (i != 0) {
        break label75;
      }
    }
    label75:
    for (i = 1;; i = 0)
    {
      mScrollPointerId = MotionEventCompat.getPointerId(paramMotionEvent, i);
      int j = (int)(MotionEventCompat.getX(paramMotionEvent, i) + 0.5F);
      mLastTouchX = j;
      mInitialTouchX = j;
      i = (int)(MotionEventCompat.getY(paramMotionEvent, i) + 0.5F);
      mLastTouchY = i;
      mInitialTouchY = i;
      return;
    }
  }
  
  private void postAnimationRunner()
  {
    if ((!mPostedAnimatorRunner) && (mIsAttached))
    {
      ViewCompat.postOnAnimation(this, mItemAnimatorRunner);
      mPostedAnimatorRunner = true;
    }
  }
  
  private boolean predictiveItemAnimationsEnabled()
  {
    return (mItemAnimator != null) && (mLayout.supportsPredictiveItemAnimations());
  }
  
  private void processAdapterUpdatesAndSetAnimationFlags()
  {
    boolean bool2 = true;
    if (mDataSetHasChangedAfterLayout)
    {
      mAdapterHelper.reset();
      markKnownViewsInvalid();
      mLayout.onItemsChanged(this);
    }
    int i;
    label89:
    State localState;
    if ((mItemAnimator != null) && (mLayout.supportsPredictiveItemAnimations()))
    {
      mAdapterHelper.preProcess();
      if (((!mItemsAddedOrRemoved) || (mItemsChanged)) && (!mItemsAddedOrRemoved) && ((!mItemsChanged) || (!supportsChangeAnimations()))) {
        break label210;
      }
      i = 1;
      localState = mState;
      if ((!mFirstLayoutComplete) || (mItemAnimator == null) || ((!mDataSetHasChangedAfterLayout) && (i == 0) && (!mLayout.mRequestedSimpleAnimations)) || ((mDataSetHasChangedAfterLayout) && (!mAdapter.hasStableIds()))) {
        break label215;
      }
      bool1 = true;
      label149:
      State.access$1602(localState, bool1);
      localState = mState;
      if ((!mState.mRunSimpleAnimations) || (i == 0) || (mDataSetHasChangedAfterLayout) || (!predictiveItemAnimationsEnabled())) {
        break label220;
      }
    }
    label210:
    label215:
    label220:
    for (boolean bool1 = bool2;; bool1 = false)
    {
      State.access$1402(localState, bool1);
      return;
      mAdapterHelper.consumeUpdatesInOnePass();
      break;
      i = 0;
      break label89;
      bool1 = false;
      break label149;
    }
  }
  
  private void processDisappearingList(ArrayMap<View, Rect> paramArrayMap)
  {
    List localList = mState.mDisappearingViewsInLayoutPass;
    int i = localList.size() - 1;
    if (i >= 0)
    {
      View localView = (View)localList.get(i);
      ViewHolder localViewHolder = getChildViewHolderInt(localView);
      ItemHolderInfo localItemHolderInfo = (ItemHolderInfo)mState.mPreLayoutHolderMap.remove(localViewHolder);
      if (!mState.isPreLayout()) {
        mState.mPostLayoutHolderMap.remove(localViewHolder);
      }
      if (paramArrayMap.remove(localView) != null) {
        mLayout.removeAndRecycleView(localView, mRecycler);
      }
      for (;;)
      {
        i -= 1;
        break;
        if (localItemHolderInfo != null) {
          animateDisappearance(localItemHolderInfo);
        } else {
          animateDisappearance(new ItemHolderInfo(localViewHolder, localView.getLeft(), localView.getTop(), localView.getRight(), localView.getBottom()));
        }
      }
    }
    localList.clear();
  }
  
  private void pullGlows(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    int j = 0;
    int i;
    if (paramFloat2 < 0.0F)
    {
      ensureLeftGlow();
      i = j;
      if (mLeftGlow.onPull(-paramFloat2 / getWidth(), 1.0F - paramFloat3 / getHeight())) {
        i = 1;
      }
      if (paramFloat4 >= 0.0F) {
        break label162;
      }
      ensureTopGlow();
      j = i;
      if (mTopGlow.onPull(-paramFloat4 / getHeight(), paramFloat1 / getWidth())) {
        j = 1;
      }
    }
    for (;;)
    {
      if ((j != 0) || (paramFloat2 != 0.0F) || (paramFloat4 != 0.0F)) {
        ViewCompat.postInvalidateOnAnimation(this);
      }
      return;
      i = j;
      if (paramFloat2 <= 0.0F) {
        break;
      }
      ensureRightGlow();
      i = j;
      if (!mRightGlow.onPull(paramFloat2 / getWidth(), paramFloat3 / getHeight())) {
        break;
      }
      i = 1;
      break;
      label162:
      j = i;
      if (paramFloat4 > 0.0F)
      {
        ensureBottomGlow();
        j = i;
        if (mBottomGlow.onPull(paramFloat4 / getHeight(), 1.0F - paramFloat1 / getWidth())) {
          j = 1;
        }
      }
    }
  }
  
  private void releaseGlows()
  {
    boolean bool2 = false;
    if (mLeftGlow != null) {
      bool2 = mLeftGlow.onRelease();
    }
    boolean bool1 = bool2;
    if (mTopGlow != null) {
      bool1 = bool2 | mTopGlow.onRelease();
    }
    bool2 = bool1;
    if (mRightGlow != null) {
      bool2 = bool1 | mRightGlow.onRelease();
    }
    bool1 = bool2;
    if (mBottomGlow != null) {
      bool1 = bool2 | mBottomGlow.onRelease();
    }
    if (bool1) {
      ViewCompat.postInvalidateOnAnimation(this);
    }
  }
  
  private boolean removeAnimatingView(View paramView)
  {
    eatRequestLayout();
    boolean bool = mChildHelper.removeViewIfHidden(paramView);
    if (bool)
    {
      paramView = getChildViewHolderInt(paramView);
      mRecycler.unscrapView(paramView);
      mRecycler.recycleViewHolderInternal(paramView);
    }
    resumeRequestLayout(false);
    return bool;
  }
  
  private void setAdapterInternal(Adapter paramAdapter, boolean paramBoolean1, boolean paramBoolean2)
  {
    if (mAdapter != null)
    {
      mAdapter.unregisterAdapterDataObserver(mObserver);
      mAdapter.onDetachedFromRecyclerView(this);
    }
    if ((!paramBoolean1) || (paramBoolean2))
    {
      if (mItemAnimator != null) {
        mItemAnimator.endAnimations();
      }
      if (mLayout != null)
      {
        mLayout.removeAndRecycleAllViews(mRecycler);
        mLayout.removeAndRecycleScrapInt(mRecycler);
      }
      mRecycler.clear();
    }
    mAdapterHelper.reset();
    Adapter localAdapter = mAdapter;
    mAdapter = paramAdapter;
    if (paramAdapter != null)
    {
      paramAdapter.registerAdapterDataObserver(mObserver);
      paramAdapter.onAttachedToRecyclerView(this);
    }
    if (mLayout != null) {
      mLayout.onAdapterChanged(localAdapter, mAdapter);
    }
    mRecycler.onAdapterChanged(localAdapter, mAdapter, paramBoolean1);
    State.access$1202(mState, true);
    markKnownViewsInvalid();
  }
  
  private void setDataSetChangedAfterLayout()
  {
    if (mDataSetHasChangedAfterLayout) {
      return;
    }
    mDataSetHasChangedAfterLayout = true;
    int j = mChildHelper.getUnfilteredChildCount();
    int i = 0;
    while (i < j)
    {
      ViewHolder localViewHolder = getChildViewHolderInt(mChildHelper.getUnfilteredChildAt(i));
      if ((localViewHolder != null) && (!localViewHolder.shouldIgnore())) {
        localViewHolder.addFlags(512);
      }
      i += 1;
    }
    mRecycler.setAdapterPositionsAsUnknown();
  }
  
  private void setScrollState(int paramInt)
  {
    if (paramInt == mScrollState) {
      return;
    }
    mScrollState = paramInt;
    if (paramInt != 2) {
      stopScrollersInternal();
    }
    dispatchOnScrollStateChanged(paramInt);
  }
  
  private void stopScrollersInternal()
  {
    mViewFlinger.stop();
    if (mLayout != null) {
      mLayout.stopSmoothScroller();
    }
  }
  
  private boolean supportsChangeAnimations()
  {
    return (mItemAnimator != null) && (mItemAnimator.getSupportsChangeAnimations());
  }
  
  void absorbGlows(int paramInt1, int paramInt2)
  {
    if (paramInt1 < 0)
    {
      ensureLeftGlow();
      mLeftGlow.onAbsorb(-paramInt1);
      if (paramInt2 >= 0) {
        break label69;
      }
      ensureTopGlow();
      mTopGlow.onAbsorb(-paramInt2);
    }
    for (;;)
    {
      if ((paramInt1 != 0) || (paramInt2 != 0)) {
        ViewCompat.postInvalidateOnAnimation(this);
      }
      return;
      if (paramInt1 <= 0) {
        break;
      }
      ensureRightGlow();
      mRightGlow.onAbsorb(paramInt1);
      break;
      label69:
      if (paramInt2 > 0)
      {
        ensureBottomGlow();
        mBottomGlow.onAbsorb(paramInt2);
      }
    }
  }
  
  public void addFocusables(ArrayList<View> paramArrayList, int paramInt1, int paramInt2)
  {
    if ((mLayout == null) || (!mLayout.onAddFocusables(this, paramArrayList, paramInt1, paramInt2))) {
      super.addFocusables(paramArrayList, paramInt1, paramInt2);
    }
  }
  
  public void addItemDecoration(ItemDecoration paramItemDecoration)
  {
    addItemDecoration(paramItemDecoration, -1);
  }
  
  public void addItemDecoration(ItemDecoration paramItemDecoration, int paramInt)
  {
    if (mLayout != null) {
      mLayout.assertNotInLayoutOrScroll("Cannot add item decoration during a scroll  or layout");
    }
    if (mItemDecorations.isEmpty()) {
      setWillNotDraw(false);
    }
    if (paramInt < 0) {
      mItemDecorations.add(paramItemDecoration);
    }
    for (;;)
    {
      markItemDecorInsetsDirty();
      requestLayout();
      return;
      mItemDecorations.add(paramInt, paramItemDecoration);
    }
  }
  
  public void addOnItemTouchListener(OnItemTouchListener paramOnItemTouchListener)
  {
    mOnItemTouchListeners.add(paramOnItemTouchListener);
  }
  
  void assertNotInLayoutOrScroll(String paramString)
  {
    if (isComputingLayout())
    {
      if (paramString == null) {
        throw new IllegalStateException("Cannot call this method while RecyclerView is computing a layout or scrolling");
      }
      throw new IllegalStateException(paramString);
    }
  }
  
  protected boolean checkLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    return ((paramLayoutParams instanceof LayoutParams)) && (mLayout.checkLayoutParams((LayoutParams)paramLayoutParams));
  }
  
  void clearOldPositions()
  {
    int j = mChildHelper.getUnfilteredChildCount();
    int i = 0;
    while (i < j)
    {
      ViewHolder localViewHolder = getChildViewHolderInt(mChildHelper.getUnfilteredChildAt(i));
      if (!localViewHolder.shouldIgnore()) {
        localViewHolder.clearOldPosition();
      }
      i += 1;
    }
    mRecycler.clearOldPositions();
  }
  
  public int computeHorizontalScrollExtent()
  {
    if (mLayout.canScrollHorizontally()) {
      return mLayout.computeHorizontalScrollExtent(mState);
    }
    return 0;
  }
  
  public int computeHorizontalScrollOffset()
  {
    if (mLayout.canScrollHorizontally()) {
      return mLayout.computeHorizontalScrollOffset(mState);
    }
    return 0;
  }
  
  public int computeHorizontalScrollRange()
  {
    if (mLayout.canScrollHorizontally()) {
      return mLayout.computeHorizontalScrollRange(mState);
    }
    return 0;
  }
  
  public int computeVerticalScrollExtent()
  {
    if (mLayout.canScrollVertically()) {
      return mLayout.computeVerticalScrollExtent(mState);
    }
    return 0;
  }
  
  public int computeVerticalScrollOffset()
  {
    if (mLayout.canScrollVertically()) {
      return mLayout.computeVerticalScrollOffset(mState);
    }
    return 0;
  }
  
  public int computeVerticalScrollRange()
  {
    if (mLayout.canScrollVertically()) {
      return mLayout.computeVerticalScrollRange(mState);
    }
    return 0;
  }
  
  void dispatchLayout()
  {
    if (mAdapter == null) {
      Log.e("RecyclerView", "No adapter attached; skipping layout");
    }
    label196:
    label253:
    label305:
    label713:
    label750:
    label760:
    label920:
    label926:
    label932:
    label1031:
    label1288:
    label1471:
    label1541:
    label1588:
    do
    {
      return;
      if (mLayout == null)
      {
        Log.e("RecyclerView", "No layout manager attached; skipping layout");
        return;
      }
      mState.mDisappearingViewsInLayoutPass.clear();
      eatRequestLayout();
      onEnterLayoutOrScroll();
      processAdapterUpdatesAndSetAnimationFlags();
      Object localObject2 = mState;
      Object localObject1;
      if ((mState.mRunSimpleAnimations) && (mItemsChanged) && (supportsChangeAnimations()))
      {
        localObject1 = new ArrayMap();
        mOldChangedHolders = ((ArrayMap)localObject1);
        mItemsChanged = false;
        mItemsAddedOrRemoved = false;
        localObject1 = null;
        State.access$1502(mState, mState.mRunPredictiveAnimations);
        mState.mItemCount = mAdapter.getItemCount();
        findMinMaxChildLayoutPositions(mMinMaxLayoutPositions);
        if (!mState.mRunSimpleAnimations) {
          break label305;
        }
        mState.mPreLayoutHolderMap.clear();
        mState.mPostLayoutHolderMap.clear();
        j = mChildHelper.getChildCount();
        i = 0;
        if (i >= j) {
          break label305;
        }
        localObject2 = getChildViewHolderInt(mChildHelper.getChildAt(i));
        if ((!((ViewHolder)localObject2).shouldIgnore()) && ((!((ViewHolder)localObject2).isInvalid()) || (mAdapter.hasStableIds()))) {
          break label253;
        }
      }
      Object localObject3;
      for (;;)
      {
        i += 1;
        break label196;
        localObject1 = null;
        break;
        localObject3 = itemView;
        mState.mPreLayoutHolderMap.put(localObject2, new ItemHolderInfo((ViewHolder)localObject2, ((View)localObject3).getLeft(), ((View)localObject3).getTop(), ((View)localObject3).getRight(), ((View)localObject3).getBottom()));
      }
      long l;
      boolean bool;
      if (mState.mRunPredictiveAnimations)
      {
        saveOldPositions();
        if (mState.mOldChangedHolders != null)
        {
          j = mChildHelper.getChildCount();
          i = 0;
          while (i < j)
          {
            localObject1 = getChildViewHolderInt(mChildHelper.getChildAt(i));
            if ((((ViewHolder)localObject1).isChanged()) && (!((ViewHolder)localObject1).isRemoved()) && (!((ViewHolder)localObject1).shouldIgnore()))
            {
              l = getChangedHolderKey((ViewHolder)localObject1);
              mState.mOldChangedHolders.put(Long.valueOf(l), localObject1);
              mState.mPreLayoutHolderMap.remove(localObject1);
            }
            i += 1;
          }
        }
        bool = mState.mStructureChanged;
        State.access$1202(mState, false);
        mLayout.onLayoutChildren(mRecycler, mState);
        State.access$1202(mState, bool);
        localObject2 = new ArrayMap();
        i = 0;
        while (i < mChildHelper.getChildCount())
        {
          int m = 0;
          localObject1 = mChildHelper.getChildAt(i);
          if (getChildViewHolderInt((View)localObject1).shouldIgnore())
          {
            i += 1;
          }
          else
          {
            j = 0;
            for (;;)
            {
              int k = m;
              if (j < mState.mPreLayoutHolderMap.size())
              {
                if (mState.mPreLayoutHolderMap.keyAt(j)).itemView == localObject1) {
                  k = 1;
                }
              }
              else
              {
                if (k != 0) {
                  break;
                }
                ((ArrayMap)localObject2).put(localObject1, new Rect(((View)localObject1).getLeft(), ((View)localObject1).getTop(), ((View)localObject1).getRight(), ((View)localObject1).getBottom()));
                break;
              }
              j += 1;
            }
          }
        }
        clearOldPositions();
        mAdapterHelper.consumePostponedUpdates();
        mState.mItemCount = mAdapter.getItemCount();
        State.access$1002(mState, 0);
        State.access$1502(mState, false);
        mLayout.onLayoutChildren(mRecycler, mState);
        State.access$1202(mState, false);
        mPendingSavedState = null;
        localObject1 = mState;
        if ((!mState.mRunSimpleAnimations) || (mItemAnimator == null)) {
          break label920;
        }
        bool = true;
        State.access$1602((State)localObject1, bool);
        if (!mState.mRunSimpleAnimations) {
          break label1588;
        }
        if (mState.mOldChangedHolders == null) {
          break label926;
        }
        localObject1 = new ArrayMap();
        j = mChildHelper.getChildCount();
        i = 0;
        if (i >= j) {
          break label1031;
        }
        localObject3 = getChildViewHolderInt(mChildHelper.getChildAt(i));
        if (!((ViewHolder)localObject3).shouldIgnore()) {
          break label932;
        }
      }
      Object localObject4;
      for (;;)
      {
        i += 1;
        break label760;
        clearOldPositions();
        mAdapterHelper.consumeUpdatesInOnePass();
        localObject2 = localObject1;
        if (mState.mOldChangedHolders == null) {
          break;
        }
        j = mChildHelper.getChildCount();
        i = 0;
        for (;;)
        {
          localObject2 = localObject1;
          if (i >= j) {
            break;
          }
          localObject2 = getChildViewHolderInt(mChildHelper.getChildAt(i));
          if ((((ViewHolder)localObject2).isChanged()) && (!((ViewHolder)localObject2).isRemoved()) && (!((ViewHolder)localObject2).shouldIgnore()))
          {
            l = getChangedHolderKey((ViewHolder)localObject2);
            mState.mOldChangedHolders.put(Long.valueOf(l), localObject2);
            mState.mPreLayoutHolderMap.remove(localObject2);
          }
          i += 1;
        }
        bool = false;
        break label713;
        localObject1 = null;
        break label750;
        localObject4 = itemView;
        l = getChangedHolderKey((ViewHolder)localObject3);
        if ((localObject1 != null) && (mState.mOldChangedHolders.get(Long.valueOf(l)) != null)) {
          ((ArrayMap)localObject1).put(Long.valueOf(l), localObject3);
        } else {
          mState.mPostLayoutHolderMap.put(localObject3, new ItemHolderInfo((ViewHolder)localObject3, ((View)localObject4).getLeft(), ((View)localObject4).getTop(), ((View)localObject4).getRight(), ((View)localObject4).getBottom()));
        }
      }
      processDisappearingList((ArrayMap)localObject2);
      int i = mState.mPreLayoutHolderMap.size() - 1;
      while (i >= 0)
      {
        localObject3 = (ViewHolder)mState.mPreLayoutHolderMap.keyAt(i);
        if (!mState.mPostLayoutHolderMap.containsKey(localObject3))
        {
          localObject3 = (ItemHolderInfo)mState.mPreLayoutHolderMap.valueAt(i);
          mState.mPreLayoutHolderMap.removeAt(i);
          localObject4 = holder.itemView;
          mRecycler.unscrapView(holder);
          animateDisappearance((ItemHolderInfo)localObject3);
        }
        i -= 1;
      }
      i = mState.mPostLayoutHolderMap.size();
      if (i > 0)
      {
        i -= 1;
        if (i >= 0)
        {
          localObject4 = (ViewHolder)mState.mPostLayoutHolderMap.keyAt(i);
          ItemHolderInfo localItemHolderInfo = (ItemHolderInfo)mState.mPostLayoutHolderMap.valueAt(i);
          if ((mState.mPreLayoutHolderMap.isEmpty()) || (!mState.mPreLayoutHolderMap.containsKey(localObject4)))
          {
            mState.mPostLayoutHolderMap.removeAt(i);
            if (localObject2 == null) {
              break label1288;
            }
          }
          for (localObject3 = (Rect)((ArrayMap)localObject2).get(itemView);; localObject3 = null)
          {
            animateAppearance((ViewHolder)localObject4, (Rect)localObject3, left, top);
            i -= 1;
            break;
          }
        }
      }
      int j = mState.mPostLayoutHolderMap.size();
      i = 0;
      while (i < j)
      {
        localObject2 = (ViewHolder)mState.mPostLayoutHolderMap.keyAt(i);
        localObject3 = (ItemHolderInfo)mState.mPostLayoutHolderMap.valueAt(i);
        localObject4 = (ItemHolderInfo)mState.mPreLayoutHolderMap.get(localObject2);
        if ((localObject4 != null) && (localObject3 != null) && ((left != left) || (top != top)))
        {
          ((ViewHolder)localObject2).setIsRecyclable(false);
          if (mItemAnimator.animateMove((ViewHolder)localObject2, left, top, left, top)) {
            postAnimationRunner();
          }
        }
        i += 1;
      }
      if (mState.mOldChangedHolders != null)
      {
        i = mState.mOldChangedHolders.size();
        i -= 1;
        if (i < 0) {
          break label1588;
        }
        l = ((Long)mState.mOldChangedHolders.keyAt(i)).longValue();
        localObject2 = (ViewHolder)mState.mOldChangedHolders.get(Long.valueOf(l));
        localObject3 = itemView;
        if (!((ViewHolder)localObject2).shouldIgnore()) {
          break label1541;
        }
      }
      for (;;)
      {
        i -= 1;
        break label1471;
        i = 0;
        break;
        if ((mRecycler.mChangedScrap != null) && (mRecycler.mChangedScrap.contains(localObject2))) {
          animateChange((ViewHolder)localObject2, (ViewHolder)((ArrayMap)localObject1).get(Long.valueOf(l)));
        }
      }
      resumeRequestLayout(false);
      mLayout.removeAndRecycleScrapInt(mRecycler);
      State.access$1902(mState, mState.mItemCount);
      mDataSetHasChangedAfterLayout = false;
      State.access$1602(mState, false);
      State.access$1402(mState, false);
      onExitLayoutOrScroll();
      LayoutManager.access$1702(mLayout, false);
      if (mRecycler.mChangedScrap != null) {
        mRecycler.mChangedScrap.clear();
      }
      mState.mOldChangedHolders = null;
    } while (!didChildRangeChange(mMinMaxLayoutPositions[0], mMinMaxLayoutPositions[1]));
    dispatchOnScrolled(0, 0);
  }
  
  public boolean dispatchNestedFling(float paramFloat1, float paramFloat2, boolean paramBoolean)
  {
    return mScrollingChildHelper.dispatchNestedFling(paramFloat1, paramFloat2, paramBoolean);
  }
  
  public boolean dispatchNestedPreFling(float paramFloat1, float paramFloat2)
  {
    return mScrollingChildHelper.dispatchNestedPreFling(paramFloat1, paramFloat2);
  }
  
  public boolean dispatchNestedPreScroll(int paramInt1, int paramInt2, int[] paramArrayOfInt1, int[] paramArrayOfInt2)
  {
    return mScrollingChildHelper.dispatchNestedPreScroll(paramInt1, paramInt2, paramArrayOfInt1, paramArrayOfInt2);
  }
  
  public boolean dispatchNestedScroll(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int[] paramArrayOfInt)
  {
    return mScrollingChildHelper.dispatchNestedScroll(paramInt1, paramInt2, paramInt3, paramInt4, paramArrayOfInt);
  }
  
  void dispatchOnScrollStateChanged(int paramInt)
  {
    if (mLayout != null) {
      mLayout.onScrollStateChanged(paramInt);
    }
    onScrollStateChanged(paramInt);
    if (mScrollListener != null) {
      mScrollListener.onScrollStateChanged(this, paramInt);
    }
    if (mScrollListeners != null)
    {
      int i = mScrollListeners.size() - 1;
      while (i >= 0)
      {
        ((OnScrollListener)mScrollListeners.get(i)).onScrollStateChanged(this, paramInt);
        i -= 1;
      }
    }
  }
  
  void dispatchOnScrolled(int paramInt1, int paramInt2)
  {
    int i = getScrollX();
    int j = getScrollY();
    onScrollChanged(i, j, i, j);
    onScrolled(paramInt1, paramInt2);
    if (mScrollListener != null) {
      mScrollListener.onScrolled(this, paramInt1, paramInt2);
    }
    if (mScrollListeners != null)
    {
      i = mScrollListeners.size() - 1;
      while (i >= 0)
      {
        ((OnScrollListener)mScrollListeners.get(i)).onScrolled(this, paramInt1, paramInt2);
        i -= 1;
      }
    }
  }
  
  protected void dispatchRestoreInstanceState(SparseArray<Parcelable> paramSparseArray)
  {
    dispatchThawSelfOnly(paramSparseArray);
  }
  
  protected void dispatchSaveInstanceState(SparseArray<Parcelable> paramSparseArray)
  {
    dispatchFreezeSelfOnly(paramSparseArray);
  }
  
  public void draw(Canvas paramCanvas)
  {
    int k = 1;
    super.draw(paramCanvas);
    int j = mItemDecorations.size();
    int i = 0;
    while (i < j)
    {
      ((ItemDecoration)mItemDecorations.get(i)).onDrawOver(paramCanvas, this, mState);
      i += 1;
    }
    i = 0;
    j = i;
    int m;
    if (mLeftGlow != null)
    {
      j = i;
      if (!mLeftGlow.isFinished())
      {
        m = paramCanvas.save();
        if (!mClipToPadding) {
          break label456;
        }
        i = getPaddingBottom();
        paramCanvas.rotate(270.0F);
        paramCanvas.translate(-getHeight() + i, 0.0F);
        if ((mLeftGlow == null) || (!mLeftGlow.draw(paramCanvas))) {
          break label461;
        }
        j = 1;
        label131:
        paramCanvas.restoreToCount(m);
      }
    }
    i = j;
    if (mTopGlow != null)
    {
      i = j;
      if (!mTopGlow.isFinished())
      {
        m = paramCanvas.save();
        if (mClipToPadding) {
          paramCanvas.translate(getPaddingLeft(), getPaddingTop());
        }
        if ((mTopGlow == null) || (!mTopGlow.draw(paramCanvas))) {
          break label466;
        }
        i = 1;
        label205:
        i = j | i;
        paramCanvas.restoreToCount(m);
      }
    }
    j = i;
    if (mRightGlow != null)
    {
      j = i;
      if (!mRightGlow.isFinished())
      {
        m = paramCanvas.save();
        int n = getWidth();
        if (!mClipToPadding) {
          break label471;
        }
        j = getPaddingTop();
        label260:
        paramCanvas.rotate(90.0F);
        paramCanvas.translate(-j, -n);
        if ((mRightGlow == null) || (!mRightGlow.draw(paramCanvas))) {
          break label476;
        }
        j = 1;
        label298:
        j = i | j;
        paramCanvas.restoreToCount(m);
      }
    }
    i = j;
    if (mBottomGlow != null)
    {
      i = j;
      if (!mBottomGlow.isFinished())
      {
        m = paramCanvas.save();
        paramCanvas.rotate(180.0F);
        if (!mClipToPadding) {
          break label481;
        }
        paramCanvas.translate(-getWidth() + getPaddingRight(), -getHeight() + getPaddingBottom());
        label375:
        if ((mBottomGlow == null) || (!mBottomGlow.draw(paramCanvas))) {
          break label500;
        }
      }
    }
    label456:
    label461:
    label466:
    label471:
    label476:
    label481:
    label500:
    for (i = k;; i = 0)
    {
      i = j | i;
      paramCanvas.restoreToCount(m);
      j = i;
      if (i == 0)
      {
        j = i;
        if (mItemAnimator != null)
        {
          j = i;
          if (mItemDecorations.size() > 0)
          {
            j = i;
            if (mItemAnimator.isRunning()) {
              j = 1;
            }
          }
        }
      }
      if (j != 0) {
        ViewCompat.postInvalidateOnAnimation(this);
      }
      return;
      i = 0;
      break;
      j = 0;
      break label131;
      i = 0;
      break label205;
      j = 0;
      break label260;
      j = 0;
      break label298;
      paramCanvas.translate(-getWidth(), -getHeight());
      break label375;
    }
  }
  
  public boolean drawChild(Canvas paramCanvas, View paramView, long paramLong)
  {
    return super.drawChild(paramCanvas, paramView, paramLong);
  }
  
  void eatRequestLayout()
  {
    if (!mEatRequestLayout)
    {
      mEatRequestLayout = true;
      mLayoutRequestEaten = false;
    }
  }
  
  void ensureBottomGlow()
  {
    if (mBottomGlow != null) {
      return;
    }
    mBottomGlow = new EdgeEffectCompat(getContext());
    if (mClipToPadding)
    {
      mBottomGlow.setSize(getMeasuredWidth() - getPaddingLeft() - getPaddingRight(), getMeasuredHeight() - getPaddingTop() - getPaddingBottom());
      return;
    }
    mBottomGlow.setSize(getMeasuredWidth(), getMeasuredHeight());
  }
  
  void ensureLeftGlow()
  {
    if (mLeftGlow != null) {
      return;
    }
    mLeftGlow = new EdgeEffectCompat(getContext());
    if (mClipToPadding)
    {
      mLeftGlow.setSize(getMeasuredHeight() - getPaddingTop() - getPaddingBottom(), getMeasuredWidth() - getPaddingLeft() - getPaddingRight());
      return;
    }
    mLeftGlow.setSize(getMeasuredHeight(), getMeasuredWidth());
  }
  
  void ensureRightGlow()
  {
    if (mRightGlow != null) {
      return;
    }
    mRightGlow = new EdgeEffectCompat(getContext());
    if (mClipToPadding)
    {
      mRightGlow.setSize(getMeasuredHeight() - getPaddingTop() - getPaddingBottom(), getMeasuredWidth() - getPaddingLeft() - getPaddingRight());
      return;
    }
    mRightGlow.setSize(getMeasuredHeight(), getMeasuredWidth());
  }
  
  void ensureTopGlow()
  {
    if (mTopGlow != null) {
      return;
    }
    mTopGlow = new EdgeEffectCompat(getContext());
    if (mClipToPadding)
    {
      mTopGlow.setSize(getMeasuredWidth() - getPaddingLeft() - getPaddingRight(), getMeasuredHeight() - getPaddingTop() - getPaddingBottom());
      return;
    }
    mTopGlow.setSize(getMeasuredWidth(), getMeasuredHeight());
  }
  
  public View findChildViewUnder(float paramFloat1, float paramFloat2)
  {
    int i = mChildHelper.getChildCount() - 1;
    while (i >= 0)
    {
      View localView = mChildHelper.getChildAt(i);
      float f1 = ViewCompat.getTranslationX(localView);
      float f2 = ViewCompat.getTranslationY(localView);
      if ((paramFloat1 >= localView.getLeft() + f1) && (paramFloat1 <= localView.getRight() + f1) && (paramFloat2 >= localView.getTop() + f2) && (paramFloat2 <= localView.getBottom() + f2)) {
        return localView;
      }
      i -= 1;
    }
    return null;
  }
  
  ViewHolder findViewHolderForPosition(int paramInt, boolean paramBoolean)
  {
    int j = mChildHelper.getUnfilteredChildCount();
    int i = 0;
    while (i < j)
    {
      ViewHolder localViewHolder = getChildViewHolderInt(mChildHelper.getUnfilteredChildAt(i));
      if ((localViewHolder != null) && (!localViewHolder.isRemoved())) {
        if (paramBoolean)
        {
          if (mPosition != paramInt) {}
        }
        else {
          while (localViewHolder.getLayoutPosition() == paramInt) {
            return localViewHolder;
          }
        }
      }
      i += 1;
    }
    return null;
  }
  
  public boolean fling(int paramInt1, int paramInt2)
  {
    if (mLayout == null) {
      Log.e("RecyclerView", "Cannot fling without a LayoutManager set. Call setLayoutManager with a non-null argument.");
    }
    boolean bool2;
    int i;
    do
    {
      return false;
      bool1 = mLayout.canScrollHorizontally();
      bool2 = mLayout.canScrollVertically();
      if (bool1)
      {
        i = paramInt1;
        if (Math.abs(paramInt1) >= mMinFlingVelocity) {}
      }
      else
      {
        i = 0;
      }
      if (bool2)
      {
        paramInt1 = paramInt2;
        if (Math.abs(paramInt2) >= mMinFlingVelocity) {}
      }
      else
      {
        paramInt1 = 0;
      }
    } while (((i == 0) && (paramInt1 == 0)) || (dispatchNestedPreFling(i, paramInt1)));
    if ((bool1) || (bool2)) {}
    for (boolean bool1 = true;; bool1 = false)
    {
      dispatchNestedFling(i, paramInt1, bool1);
      if (!bool1) {
        break;
      }
      paramInt2 = Math.max(-mMaxFlingVelocity, Math.min(i, mMaxFlingVelocity));
      paramInt1 = Math.max(-mMaxFlingVelocity, Math.min(paramInt1, mMaxFlingVelocity));
      mViewFlinger.fling(paramInt2, paramInt1);
      return true;
    }
  }
  
  public View focusSearch(View paramView, int paramInt)
  {
    Object localObject = mLayout.onInterceptFocusSearch(paramView, paramInt);
    if (localObject != null) {
      return localObject;
    }
    View localView = FocusFinder.getInstance().findNextFocus(this, paramView, paramInt);
    localObject = localView;
    if (localView == null)
    {
      localObject = localView;
      if (mAdapter != null)
      {
        localObject = localView;
        if (mLayout != null)
        {
          localObject = localView;
          if (!isComputingLayout())
          {
            eatRequestLayout();
            localObject = mLayout.onFocusSearchFailed(paramView, paramInt, mRecycler, mState);
            resumeRequestLayout(false);
          }
        }
      }
    }
    if (localObject != null) {
      return localObject;
    }
    return super.focusSearch(paramView, paramInt);
  }
  
  protected ViewGroup.LayoutParams generateDefaultLayoutParams()
  {
    if (mLayout == null) {
      throw new IllegalStateException("RecyclerView has no LayoutManager");
    }
    return mLayout.generateDefaultLayoutParams();
  }
  
  public ViewGroup.LayoutParams generateLayoutParams(AttributeSet paramAttributeSet)
  {
    if (mLayout == null) {
      throw new IllegalStateException("RecyclerView has no LayoutManager");
    }
    return mLayout.generateLayoutParams(getContext(), paramAttributeSet);
  }
  
  protected ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    if (mLayout == null) {
      throw new IllegalStateException("RecyclerView has no LayoutManager");
    }
    return mLayout.generateLayoutParams(paramLayoutParams);
  }
  
  public Adapter getAdapter()
  {
    return mAdapter;
  }
  
  public int getBaseline()
  {
    if (mLayout != null) {
      return mLayout.getBaseline();
    }
    return super.getBaseline();
  }
  
  long getChangedHolderKey(ViewHolder paramViewHolder)
  {
    if (mAdapter.hasStableIds()) {
      return paramViewHolder.getItemId();
    }
    return mPosition;
  }
  
  public int getChildAdapterPosition(View paramView)
  {
    paramView = getChildViewHolderInt(paramView);
    if (paramView != null) {
      return paramView.getAdapterPosition();
    }
    return -1;
  }
  
  protected int getChildDrawingOrder(int paramInt1, int paramInt2)
  {
    if (mChildDrawingOrderCallback == null) {
      return super.getChildDrawingOrder(paramInt1, paramInt2);
    }
    return mChildDrawingOrderCallback.onGetChildDrawingOrder(paramInt1, paramInt2);
  }
  
  public int getChildLayoutPosition(View paramView)
  {
    paramView = getChildViewHolderInt(paramView);
    if (paramView != null) {
      return paramView.getLayoutPosition();
    }
    return -1;
  }
  
  @Deprecated
  public int getChildPosition(View paramView)
  {
    return getChildAdapterPosition(paramView);
  }
  
  public ViewHolder getChildViewHolder(View paramView)
  {
    ViewParent localViewParent = paramView.getParent();
    if ((localViewParent != null) && (localViewParent != this)) {
      throw new IllegalArgumentException("View " + paramView + " is not a direct child of " + this);
    }
    return getChildViewHolderInt(paramView);
  }
  
  public RecyclerViewAccessibilityDelegate getCompatAccessibilityDelegate()
  {
    return mAccessibilityDelegate;
  }
  
  public ItemAnimator getItemAnimator()
  {
    return mItemAnimator;
  }
  
  Rect getItemDecorInsetsForChild(View paramView)
  {
    LayoutParams localLayoutParams = (LayoutParams)paramView.getLayoutParams();
    if (!mInsetsDirty) {
      return mDecorInsets;
    }
    Rect localRect = mDecorInsets;
    localRect.set(0, 0, 0, 0);
    int j = mItemDecorations.size();
    int i = 0;
    while (i < j)
    {
      mTempRect.set(0, 0, 0, 0);
      ((ItemDecoration)mItemDecorations.get(i)).getItemOffsets(mTempRect, paramView, this, mState);
      left += mTempRect.left;
      top += mTempRect.top;
      right += mTempRect.right;
      bottom += mTempRect.bottom;
      i += 1;
    }
    mInsetsDirty = false;
    return localRect;
  }
  
  public LayoutManager getLayoutManager()
  {
    return mLayout;
  }
  
  public int getMaxFlingVelocity()
  {
    return mMaxFlingVelocity;
  }
  
  public int getMinFlingVelocity()
  {
    return mMinFlingVelocity;
  }
  
  public RecycledViewPool getRecycledViewPool()
  {
    return mRecycler.getRecycledViewPool();
  }
  
  public int getScrollState()
  {
    return mScrollState;
  }
  
  public boolean hasNestedScrollingParent()
  {
    return mScrollingChildHelper.hasNestedScrollingParent();
  }
  
  public boolean hasPendingAdapterUpdates()
  {
    return (!mFirstLayoutComplete) || (mDataSetHasChangedAfterLayout) || (mAdapterHelper.hasPendingUpdates());
  }
  
  void initAdapterManager()
  {
    mAdapterHelper = new AdapterHelper(new AdapterHelper.Callback()
    {
      void dispatchUpdate(AdapterHelper.UpdateOp paramAnonymousUpdateOp)
      {
        switch (cmd)
        {
        default: 
          return;
        case 0: 
          mLayout.onItemsAdded(RecyclerView.this, positionStart, itemCount);
          return;
        case 1: 
          mLayout.onItemsRemoved(RecyclerView.this, positionStart, itemCount);
          return;
        case 2: 
          mLayout.onItemsUpdated(RecyclerView.this, positionStart, itemCount);
          return;
        }
        mLayout.onItemsMoved(RecyclerView.this, positionStart, itemCount, 1);
      }
      
      public RecyclerView.ViewHolder findViewHolder(int paramAnonymousInt)
      {
        RecyclerView.ViewHolder localViewHolder2 = findViewHolderForPosition(paramAnonymousInt, true);
        RecyclerView.ViewHolder localViewHolder1;
        if (localViewHolder2 == null) {
          localViewHolder1 = null;
        }
        do
        {
          return localViewHolder1;
          localViewHolder1 = localViewHolder2;
        } while (!mChildHelper.isHidden(itemView));
        return null;
      }
      
      public void markViewHoldersUpdated(int paramAnonymousInt1, int paramAnonymousInt2)
      {
        viewRangeUpdate(paramAnonymousInt1, paramAnonymousInt2);
        mItemsChanged = true;
      }
      
      public void offsetPositionsForAdd(int paramAnonymousInt1, int paramAnonymousInt2)
      {
        offsetPositionRecordsForInsert(paramAnonymousInt1, paramAnonymousInt2);
        mItemsAddedOrRemoved = true;
      }
      
      public void offsetPositionsForMove(int paramAnonymousInt1, int paramAnonymousInt2)
      {
        offsetPositionRecordsForMove(paramAnonymousInt1, paramAnonymousInt2);
        mItemsAddedOrRemoved = true;
      }
      
      public void offsetPositionsForRemovingInvisible(int paramAnonymousInt1, int paramAnonymousInt2)
      {
        offsetPositionRecordsForRemove(paramAnonymousInt1, paramAnonymousInt2, true);
        mItemsAddedOrRemoved = true;
        RecyclerView.State.access$1012(mState, paramAnonymousInt2);
      }
      
      public void offsetPositionsForRemovingLaidOutOrNewView(int paramAnonymousInt1, int paramAnonymousInt2)
      {
        offsetPositionRecordsForRemove(paramAnonymousInt1, paramAnonymousInt2, false);
        mItemsAddedOrRemoved = true;
      }
      
      public void onDispatchFirstPass(AdapterHelper.UpdateOp paramAnonymousUpdateOp)
      {
        dispatchUpdate(paramAnonymousUpdateOp);
      }
      
      public void onDispatchSecondPass(AdapterHelper.UpdateOp paramAnonymousUpdateOp)
      {
        dispatchUpdate(paramAnonymousUpdateOp);
      }
    });
  }
  
  void invalidateGlows()
  {
    mBottomGlow = null;
    mTopGlow = null;
    mRightGlow = null;
    mLeftGlow = null;
  }
  
  public boolean isAttachedToWindow()
  {
    return mIsAttached;
  }
  
  public boolean isComputingLayout()
  {
    return mLayoutOrScrollCounter > 0;
  }
  
  public boolean isNestedScrollingEnabled()
  {
    return mScrollingChildHelper.isNestedScrollingEnabled();
  }
  
  void markItemDecorInsetsDirty()
  {
    int j = mChildHelper.getUnfilteredChildCount();
    int i = 0;
    while (i < j)
    {
      mChildHelper.getUnfilteredChildAt(i).getLayoutParams()).mInsetsDirty = true;
      i += 1;
    }
    mRecycler.markItemDecorInsetsDirty();
  }
  
  void markKnownViewsInvalid()
  {
    int j = mChildHelper.getUnfilteredChildCount();
    int i = 0;
    while (i < j)
    {
      ViewHolder localViewHolder = getChildViewHolderInt(mChildHelper.getUnfilteredChildAt(i));
      if ((localViewHolder != null) && (!localViewHolder.shouldIgnore())) {
        localViewHolder.addFlags(6);
      }
      i += 1;
    }
    markItemDecorInsetsDirty();
    mRecycler.markKnownViewsInvalid();
  }
  
  public void offsetChildrenHorizontal(int paramInt)
  {
    int j = mChildHelper.getChildCount();
    int i = 0;
    while (i < j)
    {
      mChildHelper.getChildAt(i).offsetLeftAndRight(paramInt);
      i += 1;
    }
  }
  
  public void offsetChildrenVertical(int paramInt)
  {
    int j = mChildHelper.getChildCount();
    int i = 0;
    while (i < j)
    {
      mChildHelper.getChildAt(i).offsetTopAndBottom(paramInt);
      i += 1;
    }
  }
  
  void offsetPositionRecordsForInsert(int paramInt1, int paramInt2)
  {
    int j = mChildHelper.getUnfilteredChildCount();
    int i = 0;
    while (i < j)
    {
      ViewHolder localViewHolder = getChildViewHolderInt(mChildHelper.getUnfilteredChildAt(i));
      if ((localViewHolder != null) && (!localViewHolder.shouldIgnore()) && (mPosition >= paramInt1))
      {
        localViewHolder.offsetPosition(paramInt2, false);
        State.access$1202(mState, true);
      }
      i += 1;
    }
    mRecycler.offsetPositionRecordsForInsert(paramInt1, paramInt2);
    requestLayout();
  }
  
  void offsetPositionRecordsForMove(int paramInt1, int paramInt2)
  {
    int n = mChildHelper.getUnfilteredChildCount();
    int k;
    int i;
    if (paramInt1 < paramInt2)
    {
      k = paramInt1;
      i = paramInt2;
    }
    ViewHolder localViewHolder;
    for (int j = -1;; j = 1)
    {
      int m = 0;
      for (;;)
      {
        if (m >= n) {
          break label131;
        }
        localViewHolder = getChildViewHolderInt(mChildHelper.getUnfilteredChildAt(m));
        if ((localViewHolder != null) && (mPosition >= k) && (mPosition <= i)) {
          break;
        }
        m += 1;
      }
      k = paramInt2;
      i = paramInt1;
    }
    if (mPosition == paramInt1) {
      localViewHolder.offsetPosition(paramInt2 - paramInt1, false);
    }
    for (;;)
    {
      State.access$1202(mState, true);
      break;
      localViewHolder.offsetPosition(j, false);
    }
    label131:
    mRecycler.offsetPositionRecordsForMove(paramInt1, paramInt2);
    requestLayout();
  }
  
  void offsetPositionRecordsForRemove(int paramInt1, int paramInt2, boolean paramBoolean)
  {
    int j = mChildHelper.getUnfilteredChildCount();
    int i = 0;
    if (i < j)
    {
      ViewHolder localViewHolder = getChildViewHolderInt(mChildHelper.getUnfilteredChildAt(i));
      if ((localViewHolder != null) && (!localViewHolder.shouldIgnore()))
      {
        if (mPosition < paramInt1 + paramInt2) {
          break label83;
        }
        localViewHolder.offsetPosition(-paramInt2, paramBoolean);
        State.access$1202(mState, true);
      }
      for (;;)
      {
        i += 1;
        break;
        label83:
        if (mPosition >= paramInt1)
        {
          localViewHolder.flagRemovedAndOffsetPosition(paramInt1 - 1, -paramInt2, paramBoolean);
          State.access$1202(mState, true);
        }
      }
    }
    mRecycler.offsetPositionRecordsForRemove(paramInt1, paramInt2, paramBoolean);
    requestLayout();
  }
  
  protected void onAttachedToWindow()
  {
    super.onAttachedToWindow();
    mLayoutOrScrollCounter = 0;
    mIsAttached = true;
    mFirstLayoutComplete = false;
    if (mLayout != null) {
      mLayout.dispatchAttachedToWindow(this);
    }
    mPostedAnimatorRunner = false;
  }
  
  public void onChildAttachedToWindow(View paramView) {}
  
  public void onChildDetachedFromWindow(View paramView) {}
  
  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    if (mItemAnimator != null) {
      mItemAnimator.endAnimations();
    }
    mFirstLayoutComplete = false;
    stopScroll();
    mIsAttached = false;
    if (mLayout != null) {
      mLayout.dispatchDetachedFromWindow(this, mRecycler);
    }
    removeCallbacks(mItemAnimatorRunner);
  }
  
  public void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    int j = mItemDecorations.size();
    int i = 0;
    while (i < j)
    {
      ((ItemDecoration)mItemDecorations.get(i)).onDraw(paramCanvas, this, mState);
      i += 1;
    }
  }
  
  public boolean onGenericMotionEvent(MotionEvent paramMotionEvent)
  {
    if (mLayout == null) {}
    label103:
    label106:
    for (;;)
    {
      return false;
      if (((MotionEventCompat.getSource(paramMotionEvent) & 0x2) != 0) && (paramMotionEvent.getAction() == 8))
      {
        float f1;
        if (mLayout.canScrollVertically())
        {
          f1 = -MotionEventCompat.getAxisValue(paramMotionEvent, 9);
          if (!mLayout.canScrollHorizontally()) {
            break label103;
          }
        }
        for (float f2 = MotionEventCompat.getAxisValue(paramMotionEvent, 10);; f2 = 0.0F)
        {
          if ((f1 == 0.0F) && (f2 == 0.0F)) {
            break label106;
          }
          float f3 = getScrollFactor();
          scrollByInternal((int)(f2 * f3), (int)(f1 * f3), paramMotionEvent);
          return false;
          f1 = 0.0F;
          break;
        }
      }
    }
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    if (dispatchOnItemTouchIntercept(paramMotionEvent))
    {
      cancelTouch();
      return true;
    }
    if (mLayout == null) {
      return false;
    }
    boolean bool1 = mLayout.canScrollHorizontally();
    boolean bool2 = mLayout.canScrollVertically();
    if (mVelocityTracker == null) {
      mVelocityTracker = VelocityTracker.obtain();
    }
    mVelocityTracker.addMovement(paramMotionEvent);
    int j = MotionEventCompat.getActionMasked(paramMotionEvent);
    int i = MotionEventCompat.getActionIndex(paramMotionEvent);
    switch (j)
    {
    }
    while (mScrollState == 1)
    {
      return true;
      mScrollPointerId = MotionEventCompat.getPointerId(paramMotionEvent, 0);
      i = (int)(paramMotionEvent.getX() + 0.5F);
      mLastTouchX = i;
      mInitialTouchX = i;
      i = (int)(paramMotionEvent.getY() + 0.5F);
      mLastTouchY = i;
      mInitialTouchY = i;
      if (mScrollState == 2)
      {
        getParent().requestDisallowInterceptTouchEvent(true);
        setScrollState(1);
      }
      i = 0;
      if (bool1) {
        i = 0x0 | 0x1;
      }
      j = i;
      if (bool2) {
        j = i | 0x2;
      }
      startNestedScroll(j);
      continue;
      mScrollPointerId = MotionEventCompat.getPointerId(paramMotionEvent, i);
      j = (int)(MotionEventCompat.getX(paramMotionEvent, i) + 0.5F);
      mLastTouchX = j;
      mInitialTouchX = j;
      i = (int)(MotionEventCompat.getY(paramMotionEvent, i) + 0.5F);
      mLastTouchY = i;
      mInitialTouchY = i;
      continue;
      j = MotionEventCompat.findPointerIndex(paramMotionEvent, mScrollPointerId);
      if (j < 0)
      {
        Log.e("RecyclerView", "Error processing scroll; pointer index for id " + mScrollPointerId + " not found. Did any MotionEvents get skipped?");
        return false;
      }
      i = (int)(MotionEventCompat.getX(paramMotionEvent, j) + 0.5F);
      j = (int)(MotionEventCompat.getY(paramMotionEvent, j) + 0.5F);
      if (mScrollState != 1)
      {
        int m = i - mInitialTouchX;
        int k = j - mInitialTouchY;
        j = 0;
        i = j;
        if (bool1)
        {
          i = j;
          if (Math.abs(m) > mTouchSlop)
          {
            j = mInitialTouchX;
            int n = mTouchSlop;
            if (m >= 0) {
              break label496;
            }
            i = -1;
            label421:
            mLastTouchX = (i * n + j);
            i = 1;
          }
        }
        j = i;
        if (bool2)
        {
          j = i;
          if (Math.abs(k) > mTouchSlop)
          {
            j = mInitialTouchY;
            m = mTouchSlop;
            if (k >= 0) {
              break label501;
            }
          }
        }
        label496:
        label501:
        for (i = -1;; i = 1)
        {
          mLastTouchY = (i * m + j);
          j = 1;
          if (j == 0) {
            break;
          }
          setScrollState(1);
          break;
          i = 1;
          break label421;
        }
        onPointerUp(paramMotionEvent);
        continue;
        mVelocityTracker.clear();
        stopNestedScroll();
        continue;
        cancelTouch();
      }
    }
    return false;
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    eatRequestLayout();
    TraceCompat.beginSection("RV OnLayout");
    dispatchLayout();
    TraceCompat.endSection();
    resumeRequestLayout(false);
    mFirstLayoutComplete = true;
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    if (mAdapterUpdateDuringMeasure)
    {
      eatRequestLayout();
      processAdapterUpdatesAndSetAnimationFlags();
      if (mState.mRunPredictiveAnimations)
      {
        State.access$1502(mState, true);
        mAdapterUpdateDuringMeasure = false;
        resumeRequestLayout(false);
      }
    }
    else
    {
      if (mAdapter == null) {
        break label107;
      }
      mState.mItemCount = mAdapter.getItemCount();
      label65:
      if (mLayout != null) {
        break label118;
      }
      defaultOnMeasure(paramInt1, paramInt2);
    }
    for (;;)
    {
      State.access$1502(mState, false);
      return;
      mAdapterHelper.consumeUpdatesInOnePass();
      State.access$1502(mState, false);
      break;
      label107:
      mState.mItemCount = 0;
      break label65;
      label118:
      mLayout.onMeasure(mRecycler, mState, paramInt1, paramInt2);
    }
  }
  
  protected void onRestoreInstanceState(Parcelable paramParcelable)
  {
    mPendingSavedState = ((SavedState)paramParcelable);
    super.onRestoreInstanceState(mPendingSavedState.getSuperState());
    if ((mLayout != null) && (mPendingSavedState.mLayoutState != null)) {
      mLayout.onRestoreInstanceState(mPendingSavedState.mLayoutState);
    }
  }
  
  protected Parcelable onSaveInstanceState()
  {
    SavedState localSavedState = new SavedState(super.onSaveInstanceState());
    if (mPendingSavedState != null)
    {
      localSavedState.copyFrom(mPendingSavedState);
      return localSavedState;
    }
    if (mLayout != null)
    {
      mLayoutState = mLayout.onSaveInstanceState();
      return localSavedState;
    }
    mLayoutState = null;
    return localSavedState;
  }
  
  public void onScrollStateChanged(int paramInt) {}
  
  public void onScrolled(int paramInt1, int paramInt2) {}
  
  protected void onSizeChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onSizeChanged(paramInt1, paramInt2, paramInt3, paramInt4);
    if ((paramInt1 != paramInt3) || (paramInt2 != paramInt4)) {
      invalidateGlows();
    }
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if (dispatchOnItemTouch(paramMotionEvent))
    {
      cancelTouch();
      return true;
    }
    if (mLayout == null) {
      return false;
    }
    boolean bool1 = mLayout.canScrollHorizontally();
    boolean bool2 = mLayout.canScrollVertically();
    if (mVelocityTracker == null) {
      mVelocityTracker = VelocityTracker.obtain();
    }
    mVelocityTracker.addMovement(paramMotionEvent);
    MotionEvent localMotionEvent = MotionEvent.obtain(paramMotionEvent);
    int j = MotionEventCompat.getActionMasked(paramMotionEvent);
    int i = MotionEventCompat.getActionIndex(paramMotionEvent);
    if (j == 0)
    {
      int[] arrayOfInt = mNestedOffsets;
      mNestedOffsets[1] = 0;
      arrayOfInt[0] = 0;
    }
    localMotionEvent.offsetLocation(mNestedOffsets[0], mNestedOffsets[1]);
    switch (j)
    {
    }
    for (;;)
    {
      localMotionEvent.recycle();
      return true;
      mScrollPointerId = MotionEventCompat.getPointerId(paramMotionEvent, 0);
      i = (int)(paramMotionEvent.getX() + 0.5F);
      mLastTouchX = i;
      mInitialTouchX = i;
      i = (int)(paramMotionEvent.getY() + 0.5F);
      mLastTouchY = i;
      mInitialTouchY = i;
      i = 0;
      if (bool1) {
        i = 0x0 | 0x1;
      }
      j = i;
      if (bool2) {
        j = i | 0x2;
      }
      startNestedScroll(j);
      continue;
      mScrollPointerId = MotionEventCompat.getPointerId(paramMotionEvent, i);
      j = (int)(MotionEventCompat.getX(paramMotionEvent, i) + 0.5F);
      mLastTouchX = j;
      mInitialTouchX = j;
      i = (int)(MotionEventCompat.getY(paramMotionEvent, i) + 0.5F);
      mLastTouchY = i;
      mInitialTouchY = i;
      continue;
      i = MotionEventCompat.findPointerIndex(paramMotionEvent, mScrollPointerId);
      if (i < 0)
      {
        Log.e("RecyclerView", "Error processing scroll; pointer index for id " + mScrollPointerId + " not found. Did any MotionEvents get skipped?");
        return false;
      }
      int i2 = (int)(MotionEventCompat.getX(paramMotionEvent, i) + 0.5F);
      int i3 = (int)(MotionEventCompat.getY(paramMotionEvent, i) + 0.5F);
      int m = mLastTouchX - i2;
      int k = mLastTouchY - i3;
      j = m;
      i = k;
      if (dispatchNestedPreScroll(m, k, mScrollConsumed, mScrollOffset))
      {
        j = m - mScrollConsumed[0];
        i = k - mScrollConsumed[1];
        localMotionEvent.offsetLocation(mScrollOffset[0], mScrollOffset[1]);
        paramMotionEvent = mNestedOffsets;
        paramMotionEvent[0] += mScrollOffset[0];
        paramMotionEvent = mNestedOffsets;
        paramMotionEvent[1] += mScrollOffset[1];
      }
      int n = j;
      m = i;
      if (mScrollState != 1)
      {
        n = 0;
        k = j;
        m = n;
        if (bool1)
        {
          k = j;
          m = n;
          if (Math.abs(j) > mTouchSlop)
          {
            if (j <= 0) {
              break label747;
            }
            k = j - mTouchSlop;
            label598:
            m = 1;
          }
        }
        j = i;
        int i1 = m;
        if (bool2)
        {
          j = i;
          i1 = m;
          if (Math.abs(i) > mTouchSlop)
          {
            if (i <= 0) {
              break label759;
            }
            j = i - mTouchSlop;
            label648:
            i1 = 1;
          }
        }
        n = k;
        m = j;
        if (i1 != 0)
        {
          setScrollState(1);
          m = j;
          n = k;
        }
      }
      if (mScrollState == 1)
      {
        mLastTouchX = (i2 - mScrollOffset[0]);
        mLastTouchY = (i3 - mScrollOffset[1]);
        if (bool1) {
          label716:
          if (!bool2) {
            break label777;
          }
        }
        while (scrollByInternal(n, m, localMotionEvent))
        {
          getParent().requestDisallowInterceptTouchEvent(true);
          break;
          label747:
          k = j + mTouchSlop;
          break label598;
          label759:
          j = i + mTouchSlop;
          break label648;
          n = 0;
          break label716;
          label777:
          m = 0;
        }
        onPointerUp(paramMotionEvent);
        continue;
        mVelocityTracker.computeCurrentVelocity(1000, mMaxFlingVelocity);
        float f1;
        if (bool1)
        {
          f1 = -VelocityTrackerCompat.getXVelocity(mVelocityTracker, mScrollPointerId);
          label824:
          if (!bool2) {
            break label889;
          }
        }
        label889:
        for (float f2 = -VelocityTrackerCompat.getYVelocity(mVelocityTracker, mScrollPointerId);; f2 = 0.0F)
        {
          if (((f1 == 0.0F) && (f2 == 0.0F)) || (!fling((int)f1, (int)f2))) {
            setScrollState(0);
          }
          mVelocityTracker.clear();
          releaseGlows();
          break;
          f1 = 0.0F;
          break label824;
        }
        cancelTouch();
      }
    }
  }
  
  void rebindUpdatedViewHolders()
  {
    int j = mChildHelper.getChildCount();
    int i = 0;
    if (i < j)
    {
      ViewHolder localViewHolder = getChildViewHolderInt(mChildHelper.getChildAt(i));
      if ((localViewHolder == null) || (localViewHolder.shouldIgnore())) {}
      for (;;)
      {
        i += 1;
        break;
        if ((localViewHolder.isRemoved()) || (localViewHolder.isInvalid()))
        {
          requestLayout();
        }
        else if (localViewHolder.needsUpdate())
        {
          int k = mAdapter.getItemViewType(mPosition);
          if (localViewHolder.getItemViewType() != k) {
            break label140;
          }
          if ((!localViewHolder.isChanged()) || (!supportsChangeAnimations())) {
            mAdapter.bindViewHolder(localViewHolder, mPosition);
          } else {
            requestLayout();
          }
        }
      }
      label140:
      requestLayout();
    }
  }
  
  protected void removeDetachedView(View paramView, boolean paramBoolean)
  {
    ViewHolder localViewHolder = getChildViewHolderInt(paramView);
    if (localViewHolder != null)
    {
      if (!localViewHolder.isTmpDetached()) {
        break label32;
      }
      localViewHolder.clearTmpDetachFlag();
    }
    label32:
    while (localViewHolder.shouldIgnore())
    {
      dispatchChildDetached(paramView);
      super.removeDetachedView(paramView, paramBoolean);
      return;
    }
    throw new IllegalArgumentException("Called removeDetachedView with a view which is not flagged as tmp detached." + localViewHolder);
  }
  
  public void removeItemDecoration(ItemDecoration paramItemDecoration)
  {
    if (mLayout != null) {
      mLayout.assertNotInLayoutOrScroll("Cannot remove item decoration during a scroll  or layout");
    }
    mItemDecorations.remove(paramItemDecoration);
    if (mItemDecorations.isEmpty()) {
      if (ViewCompat.getOverScrollMode(this) != 2) {
        break label60;
      }
    }
    label60:
    for (boolean bool = true;; bool = false)
    {
      setWillNotDraw(bool);
      markItemDecorInsetsDirty();
      requestLayout();
      return;
    }
  }
  
  public void requestChildFocus(View paramView1, View paramView2)
  {
    boolean bool = false;
    if ((!mLayout.onRequestChildFocus(this, mState, paramView1, paramView2)) && (paramView2 != null))
    {
      mTempRect.set(0, 0, paramView2.getWidth(), paramView2.getHeight());
      Object localObject = paramView2.getLayoutParams();
      if ((localObject instanceof LayoutParams))
      {
        localObject = (LayoutParams)localObject;
        if (!mInsetsDirty)
        {
          localObject = mDecorInsets;
          Rect localRect = mTempRect;
          left -= left;
          localRect = mTempRect;
          right += right;
          localRect = mTempRect;
          top -= top;
          localRect = mTempRect;
          bottom += bottom;
        }
      }
      offsetDescendantRectToMyCoords(paramView2, mTempRect);
      offsetRectIntoDescendantCoords(paramView1, mTempRect);
      localObject = mTempRect;
      if (!mFirstLayoutComplete) {
        bool = true;
      }
      requestChildRectangleOnScreen(paramView1, (Rect)localObject, bool);
    }
    super.requestChildFocus(paramView1, paramView2);
  }
  
  public boolean requestChildRectangleOnScreen(View paramView, Rect paramRect, boolean paramBoolean)
  {
    return mLayout.requestChildRectangleOnScreen(this, paramView, paramRect, paramBoolean);
  }
  
  public void requestDisallowInterceptTouchEvent(boolean paramBoolean)
  {
    int j = mOnItemTouchListeners.size();
    int i = 0;
    while (i < j)
    {
      ((OnItemTouchListener)mOnItemTouchListeners.get(i)).onRequestDisallowInterceptTouchEvent(paramBoolean);
      i += 1;
    }
    super.requestDisallowInterceptTouchEvent(paramBoolean);
  }
  
  public void requestLayout()
  {
    if (!mEatRequestLayout)
    {
      super.requestLayout();
      return;
    }
    mLayoutRequestEaten = true;
  }
  
  void resumeRequestLayout(boolean paramBoolean)
  {
    if (mEatRequestLayout)
    {
      if ((paramBoolean) && (mLayoutRequestEaten) && (mLayout != null) && (mAdapter != null)) {
        dispatchLayout();
      }
      mEatRequestLayout = false;
      mLayoutRequestEaten = false;
    }
  }
  
  void saveOldPositions()
  {
    int j = mChildHelper.getUnfilteredChildCount();
    int i = 0;
    while (i < j)
    {
      ViewHolder localViewHolder = getChildViewHolderInt(mChildHelper.getUnfilteredChildAt(i));
      if (!localViewHolder.shouldIgnore()) {
        localViewHolder.saveOldPosition();
      }
      i += 1;
    }
  }
  
  public void scrollBy(int paramInt1, int paramInt2)
  {
    if (mLayout == null) {
      Log.e("RecyclerView", "Cannot scroll without a LayoutManager set. Call setLayoutManager with a non-null argument.");
    }
    boolean bool1;
    boolean bool2;
    do
    {
      return;
      bool1 = mLayout.canScrollHorizontally();
      bool2 = mLayout.canScrollVertically();
    } while ((!bool1) && (!bool2));
    if (bool1) {
      if (!bool2) {
        break label67;
      }
    }
    for (;;)
    {
      scrollByInternal(paramInt1, paramInt2, null);
      return;
      paramInt1 = 0;
      break;
      label67:
      paramInt2 = 0;
    }
  }
  
  boolean scrollByInternal(int paramInt1, int paramInt2, MotionEvent paramMotionEvent)
  {
    int j = 0;
    int i2 = 0;
    int m = 0;
    int n = 0;
    int i = 0;
    int i3 = 0;
    int k = 0;
    int i1 = 0;
    consumePendingUpdateOperations();
    if (mAdapter != null)
    {
      eatRequestLayout();
      onEnterLayoutOrScroll();
      TraceCompat.beginSection("RV Scroll");
      i = i3;
      j = i2;
      if (paramInt1 != 0)
      {
        i = mLayout.scrollHorizontallyBy(paramInt1, mRecycler, mState);
        j = paramInt1 - i;
      }
      k = i1;
      m = n;
      if (paramInt2 != 0)
      {
        k = mLayout.scrollVerticallyBy(paramInt2, mRecycler, mState);
        m = paramInt2 - k;
      }
      TraceCompat.endSection();
      if (supportsChangeAnimations())
      {
        i1 = mChildHelper.getChildCount();
        n = 0;
        if (n < i1)
        {
          View localView = mChildHelper.getChildAt(n);
          Object localObject = getChildViewHolder(localView);
          if ((localObject != null) && (mShadowingHolder != null))
          {
            localObject = mShadowingHolder;
            if (localObject == null) {
              break label274;
            }
          }
          label274:
          for (localObject = itemView;; localObject = null)
          {
            if (localObject != null)
            {
              i2 = localView.getLeft();
              i3 = localView.getTop();
              if ((i2 != ((View)localObject).getLeft()) || (i3 != ((View)localObject).getTop())) {
                ((View)localObject).layout(i2, i3, ((View)localObject).getWidth() + i2, ((View)localObject).getHeight() + i3);
              }
            }
            n += 1;
            break;
          }
        }
      }
      onExitLayoutOrScroll();
      resumeRequestLayout(false);
    }
    if (!mItemDecorations.isEmpty()) {
      invalidate();
    }
    if (dispatchNestedScroll(i, k, j, m, mScrollOffset))
    {
      mLastTouchX -= mScrollOffset[0];
      mLastTouchY -= mScrollOffset[1];
      if (paramMotionEvent != null) {
        paramMotionEvent.offsetLocation(mScrollOffset[0], mScrollOffset[1]);
      }
      paramMotionEvent = mNestedOffsets;
      paramMotionEvent[0] += mScrollOffset[0];
      paramMotionEvent = mNestedOffsets;
      paramMotionEvent[1] += mScrollOffset[1];
    }
    for (;;)
    {
      if ((i != 0) || (k != 0)) {
        dispatchOnScrolled(i, k);
      }
      if (!awakenScrollBars()) {
        invalidate();
      }
      if ((i == 0) && (k == 0)) {
        break;
      }
      return true;
      if (ViewCompat.getOverScrollMode(this) != 2)
      {
        if (paramMotionEvent != null) {
          pullGlows(paramMotionEvent.getX(), j, paramMotionEvent.getY(), m);
        }
        considerReleasingGlowsOnScroll(paramInt1, paramInt2);
      }
    }
    return false;
  }
  
  public void scrollTo(int paramInt1, int paramInt2)
  {
    throw new UnsupportedOperationException("RecyclerView does not support scrolling to an absolute position.");
  }
  
  public void scrollToPosition(int paramInt)
  {
    stopScroll();
    if (mLayout == null)
    {
      Log.e("RecyclerView", "Cannot scroll to position a LayoutManager set. Call setLayoutManager with a non-null argument.");
      return;
    }
    mLayout.scrollToPosition(paramInt);
    awakenScrollBars();
  }
  
  public void sendAccessibilityEventUnchecked(AccessibilityEvent paramAccessibilityEvent)
  {
    if (shouldDeferAccessibilityEvent(paramAccessibilityEvent)) {
      return;
    }
    super.sendAccessibilityEventUnchecked(paramAccessibilityEvent);
  }
  
  public void setAccessibilityDelegateCompat(RecyclerViewAccessibilityDelegate paramRecyclerViewAccessibilityDelegate)
  {
    mAccessibilityDelegate = paramRecyclerViewAccessibilityDelegate;
    ViewCompat.setAccessibilityDelegate(this, mAccessibilityDelegate);
  }
  
  public void setAdapter(Adapter paramAdapter)
  {
    setAdapterInternal(paramAdapter, false, true);
    requestLayout();
  }
  
  public void setChildDrawingOrderCallback(ChildDrawingOrderCallback paramChildDrawingOrderCallback)
  {
    if (paramChildDrawingOrderCallback == mChildDrawingOrderCallback) {
      return;
    }
    mChildDrawingOrderCallback = paramChildDrawingOrderCallback;
    if (mChildDrawingOrderCallback != null) {}
    for (boolean bool = true;; bool = false)
    {
      setChildrenDrawingOrderEnabled(bool);
      return;
    }
  }
  
  public void setClipToPadding(boolean paramBoolean)
  {
    if (paramBoolean != mClipToPadding) {
      invalidateGlows();
    }
    mClipToPadding = paramBoolean;
    super.setClipToPadding(paramBoolean);
    if (mFirstLayoutComplete) {
      requestLayout();
    }
  }
  
  public void setHasFixedSize(boolean paramBoolean)
  {
    mHasFixedSize = paramBoolean;
  }
  
  public void setItemAnimator(ItemAnimator paramItemAnimator)
  {
    if (mItemAnimator != null)
    {
      mItemAnimator.endAnimations();
      mItemAnimator.setListener(null);
    }
    mItemAnimator = paramItemAnimator;
    if (mItemAnimator != null) {
      mItemAnimator.setListener(mItemAnimatorListener);
    }
  }
  
  public void setItemViewCacheSize(int paramInt)
  {
    mRecycler.setViewCacheSize(paramInt);
  }
  
  public void setLayoutManager(LayoutManager paramLayoutManager)
  {
    if (paramLayoutManager == mLayout) {
      return;
    }
    if (mLayout != null)
    {
      if (mIsAttached) {
        mLayout.dispatchDetachedFromWindow(this, mRecycler);
      }
      mLayout.setRecyclerView(null);
    }
    mRecycler.clear();
    mChildHelper.removeAllViewsUnfiltered();
    mLayout = paramLayoutManager;
    if (paramLayoutManager != null)
    {
      if (mRecyclerView != null) {
        throw new IllegalArgumentException("LayoutManager " + paramLayoutManager + " is already attached to a RecyclerView: " + mRecyclerView);
      }
      mLayout.setRecyclerView(this);
      if (mIsAttached) {
        mLayout.dispatchAttachedToWindow(this);
      }
    }
    requestLayout();
  }
  
  public void setNestedScrollingEnabled(boolean paramBoolean)
  {
    mScrollingChildHelper.setNestedScrollingEnabled(paramBoolean);
  }
  
  @Deprecated
  public void setOnScrollListener(OnScrollListener paramOnScrollListener)
  {
    mScrollListener = paramOnScrollListener;
  }
  
  public void setRecycledViewPool(RecycledViewPool paramRecycledViewPool)
  {
    mRecycler.setRecycledViewPool(paramRecycledViewPool);
  }
  
  public void setRecyclerListener(RecyclerListener paramRecyclerListener)
  {
    mRecyclerListener = paramRecyclerListener;
  }
  
  public void setScrollingTouchSlop(int paramInt)
  {
    ViewConfiguration localViewConfiguration = ViewConfiguration.get(getContext());
    switch (paramInt)
    {
    default: 
      Log.w("RecyclerView", "setScrollingTouchSlop(): bad argument constant " + paramInt + "; using default value");
    case 0: 
      mTouchSlop = localViewConfiguration.getScaledTouchSlop();
      return;
    }
    mTouchSlop = ViewConfigurationCompat.getScaledPagingTouchSlop(localViewConfiguration);
  }
  
  public void setViewCacheExtension(ViewCacheExtension paramViewCacheExtension)
  {
    mRecycler.setViewCacheExtension(paramViewCacheExtension);
  }
  
  boolean shouldDeferAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    if (isComputingLayout())
    {
      int i = 0;
      if (paramAccessibilityEvent != null) {
        i = AccessibilityEventCompat.getContentChangeTypes(paramAccessibilityEvent);
      }
      int j = i;
      if (i == 0) {
        j = 0;
      }
      mEatenAccessibilityChangeFlags |= j;
      return true;
    }
    return false;
  }
  
  public void smoothScrollBy(int paramInt1, int paramInt2)
  {
    if (mLayout == null) {
      Log.e("RecyclerView", "Cannot smooth scroll without a LayoutManager set. Call setLayoutManager with a non-null argument.");
    }
    do
    {
      return;
      if (!mLayout.canScrollHorizontally()) {
        paramInt1 = 0;
      }
      if (!mLayout.canScrollVertically()) {
        paramInt2 = 0;
      }
    } while ((paramInt1 == 0) && (paramInt2 == 0));
    mViewFlinger.smoothScrollBy(paramInt1, paramInt2);
  }
  
  public void smoothScrollToPosition(int paramInt)
  {
    if (mLayout == null)
    {
      Log.e("RecyclerView", "Cannot smooth scroll without a LayoutManager set. Call setLayoutManager with a non-null argument.");
      return;
    }
    mLayout.smoothScrollToPosition(this, mState, paramInt);
  }
  
  public boolean startNestedScroll(int paramInt)
  {
    return mScrollingChildHelper.startNestedScroll(paramInt);
  }
  
  public void stopNestedScroll()
  {
    mScrollingChildHelper.stopNestedScroll();
  }
  
  public void stopScroll()
  {
    setScrollState(0);
    stopScrollersInternal();
  }
  
  void viewRangeUpdate(int paramInt1, int paramInt2)
  {
    int j = mChildHelper.getUnfilteredChildCount();
    int i = 0;
    if (i < j)
    {
      View localView = mChildHelper.getUnfilteredChildAt(i);
      ViewHolder localViewHolder = getChildViewHolderInt(localView);
      if ((localViewHolder == null) || (localViewHolder.shouldIgnore())) {}
      for (;;)
      {
        i += 1;
        break;
        if ((mPosition >= paramInt1) && (mPosition < paramInt1 + paramInt2))
        {
          localViewHolder.addFlags(2);
          if (supportsChangeAnimations()) {
            localViewHolder.addFlags(64);
          }
          getLayoutParamsmInsetsDirty = true;
        }
      }
    }
    mRecycler.viewRangeUpdate(paramInt1, paramInt2);
  }
  
  public static abstract class Adapter<VH extends RecyclerView.ViewHolder>
  {
    private boolean mHasStableIds = false;
    private final RecyclerView.AdapterDataObservable mObservable = new RecyclerView.AdapterDataObservable();
    
    public Adapter() {}
    
    public final void bindViewHolder(VH paramVH, int paramInt)
    {
      mPosition = paramInt;
      if (hasStableIds()) {
        mItemId = getItemId(paramInt);
      }
      paramVH.setFlags(1, 519);
      TraceCompat.beginSection("RV OnBindView");
      onBindViewHolder(paramVH, paramInt);
      TraceCompat.endSection();
    }
    
    public final VH createViewHolder(ViewGroup paramViewGroup, int paramInt)
    {
      TraceCompat.beginSection("RV CreateView");
      paramViewGroup = onCreateViewHolder(paramViewGroup, paramInt);
      mItemViewType = paramInt;
      TraceCompat.endSection();
      return paramViewGroup;
    }
    
    public abstract int getItemCount();
    
    public long getItemId(int paramInt)
    {
      return -1L;
    }
    
    public int getItemViewType(int paramInt)
    {
      return 0;
    }
    
    public final boolean hasObservers()
    {
      return mObservable.hasObservers();
    }
    
    public final boolean hasStableIds()
    {
      return mHasStableIds;
    }
    
    public final void notifyDataSetChanged()
    {
      mObservable.notifyChanged();
    }
    
    public final void notifyItemRangeRemoved(int paramInt1, int paramInt2)
    {
      mObservable.notifyItemRangeRemoved(paramInt1, paramInt2);
    }
    
    public void onAttachedToRecyclerView(RecyclerView paramRecyclerView) {}
    
    public abstract void onBindViewHolder(VH paramVH, int paramInt);
    
    public abstract VH onCreateViewHolder(ViewGroup paramViewGroup, int paramInt);
    
    public void onDetachedFromRecyclerView(RecyclerView paramRecyclerView) {}
    
    public boolean onFailedToRecycleView(VH paramVH)
    {
      return false;
    }
    
    public void onViewAttachedToWindow(VH paramVH) {}
    
    public void onViewDetachedFromWindow(VH paramVH) {}
    
    public void onViewRecycled(VH paramVH) {}
    
    public void registerAdapterDataObserver(RecyclerView.AdapterDataObserver paramAdapterDataObserver)
    {
      mObservable.registerObserver(paramAdapterDataObserver);
    }
    
    public void setHasStableIds(boolean paramBoolean)
    {
      if (hasObservers()) {
        throw new IllegalStateException("Cannot change whether this adapter has stable IDs while the adapter has registered observers.");
      }
      mHasStableIds = paramBoolean;
    }
    
    public void unregisterAdapterDataObserver(RecyclerView.AdapterDataObserver paramAdapterDataObserver)
    {
      mObservable.unregisterObserver(paramAdapterDataObserver);
    }
  }
  
  static class AdapterDataObservable
    extends Observable<RecyclerView.AdapterDataObserver>
  {
    AdapterDataObservable() {}
    
    public boolean hasObservers()
    {
      return !mObservers.isEmpty();
    }
    
    public void notifyChanged()
    {
      int i = mObservers.size() - 1;
      while (i >= 0)
      {
        ((RecyclerView.AdapterDataObserver)mObservers.get(i)).onChanged();
        i -= 1;
      }
    }
    
    public void notifyItemRangeRemoved(int paramInt1, int paramInt2)
    {
      int i = mObservers.size() - 1;
      while (i >= 0)
      {
        ((RecyclerView.AdapterDataObserver)mObservers.get(i)).onItemRangeRemoved(paramInt1, paramInt2);
        i -= 1;
      }
    }
  }
  
  public static abstract class AdapterDataObserver
  {
    public AdapterDataObserver() {}
    
    public void onChanged() {}
    
    public void onItemRangeRemoved(int paramInt1, int paramInt2) {}
  }
  
  public static abstract interface ChildDrawingOrderCallback
  {
    public abstract int onGetChildDrawingOrder(int paramInt1, int paramInt2);
  }
  
  public static abstract class ItemAnimator
  {
    private long mAddDuration = 120L;
    private long mChangeDuration = 250L;
    private ArrayList<ItemAnimatorFinishedListener> mFinishedListeners = new ArrayList();
    private ItemAnimatorListener mListener = null;
    private long mMoveDuration = 250L;
    private long mRemoveDuration = 120L;
    private boolean mSupportsChangeAnimations = true;
    
    public ItemAnimator() {}
    
    public abstract boolean animateAdd(RecyclerView.ViewHolder paramViewHolder);
    
    public abstract boolean animateChange(RecyclerView.ViewHolder paramViewHolder1, RecyclerView.ViewHolder paramViewHolder2, int paramInt1, int paramInt2, int paramInt3, int paramInt4);
    
    public abstract boolean animateMove(RecyclerView.ViewHolder paramViewHolder, int paramInt1, int paramInt2, int paramInt3, int paramInt4);
    
    public abstract boolean animateRemove(RecyclerView.ViewHolder paramViewHolder);
    
    public final void dispatchAddFinished(RecyclerView.ViewHolder paramViewHolder)
    {
      onAddFinished(paramViewHolder);
      if (mListener != null) {
        mListener.onAddFinished(paramViewHolder);
      }
    }
    
    public final void dispatchAddStarting(RecyclerView.ViewHolder paramViewHolder)
    {
      onAddStarting(paramViewHolder);
    }
    
    public final void dispatchAnimationsFinished()
    {
      int j = mFinishedListeners.size();
      int i = 0;
      while (i < j)
      {
        ((ItemAnimatorFinishedListener)mFinishedListeners.get(i)).onAnimationsFinished();
        i += 1;
      }
      mFinishedListeners.clear();
    }
    
    public final void dispatchChangeFinished(RecyclerView.ViewHolder paramViewHolder, boolean paramBoolean)
    {
      onChangeFinished(paramViewHolder, paramBoolean);
      if (mListener != null) {
        mListener.onChangeFinished(paramViewHolder);
      }
    }
    
    public final void dispatchChangeStarting(RecyclerView.ViewHolder paramViewHolder, boolean paramBoolean)
    {
      onChangeStarting(paramViewHolder, paramBoolean);
    }
    
    public final void dispatchMoveFinished(RecyclerView.ViewHolder paramViewHolder)
    {
      onMoveFinished(paramViewHolder);
      if (mListener != null) {
        mListener.onMoveFinished(paramViewHolder);
      }
    }
    
    public final void dispatchMoveStarting(RecyclerView.ViewHolder paramViewHolder)
    {
      onMoveStarting(paramViewHolder);
    }
    
    public final void dispatchRemoveFinished(RecyclerView.ViewHolder paramViewHolder)
    {
      onRemoveFinished(paramViewHolder);
      if (mListener != null) {
        mListener.onRemoveFinished(paramViewHolder);
      }
    }
    
    public final void dispatchRemoveStarting(RecyclerView.ViewHolder paramViewHolder)
    {
      onRemoveStarting(paramViewHolder);
    }
    
    public abstract void endAnimation(RecyclerView.ViewHolder paramViewHolder);
    
    public abstract void endAnimations();
    
    public long getAddDuration()
    {
      return mAddDuration;
    }
    
    public long getChangeDuration()
    {
      return mChangeDuration;
    }
    
    public long getMoveDuration()
    {
      return mMoveDuration;
    }
    
    public long getRemoveDuration()
    {
      return mRemoveDuration;
    }
    
    public boolean getSupportsChangeAnimations()
    {
      return mSupportsChangeAnimations;
    }
    
    public abstract boolean isRunning();
    
    public void onAddFinished(RecyclerView.ViewHolder paramViewHolder) {}
    
    public void onAddStarting(RecyclerView.ViewHolder paramViewHolder) {}
    
    public void onChangeFinished(RecyclerView.ViewHolder paramViewHolder, boolean paramBoolean) {}
    
    public void onChangeStarting(RecyclerView.ViewHolder paramViewHolder, boolean paramBoolean) {}
    
    public void onMoveFinished(RecyclerView.ViewHolder paramViewHolder) {}
    
    public void onMoveStarting(RecyclerView.ViewHolder paramViewHolder) {}
    
    public void onRemoveFinished(RecyclerView.ViewHolder paramViewHolder) {}
    
    public void onRemoveStarting(RecyclerView.ViewHolder paramViewHolder) {}
    
    public abstract void runPendingAnimations();
    
    void setListener(ItemAnimatorListener paramItemAnimatorListener)
    {
      mListener = paramItemAnimatorListener;
    }
    
    public static abstract interface ItemAnimatorFinishedListener
    {
      public abstract void onAnimationsFinished();
    }
    
    static abstract interface ItemAnimatorListener
    {
      public abstract void onAddFinished(RecyclerView.ViewHolder paramViewHolder);
      
      public abstract void onChangeFinished(RecyclerView.ViewHolder paramViewHolder);
      
      public abstract void onMoveFinished(RecyclerView.ViewHolder paramViewHolder);
      
      public abstract void onRemoveFinished(RecyclerView.ViewHolder paramViewHolder);
    }
  }
  
  private class ItemAnimatorRestoreListener
    implements RecyclerView.ItemAnimator.ItemAnimatorListener
  {
    private ItemAnimatorRestoreListener() {}
    
    public void onAddFinished(RecyclerView.ViewHolder paramViewHolder)
    {
      paramViewHolder.setIsRecyclable(true);
      if (!RecyclerView.ViewHolder.access$5300(paramViewHolder)) {
        RecyclerView.this.removeAnimatingView(itemView);
      }
    }
    
    public void onChangeFinished(RecyclerView.ViewHolder paramViewHolder)
    {
      paramViewHolder.setIsRecyclable(true);
      if ((mShadowedHolder != null) && (mShadowingHolder == null))
      {
        mShadowedHolder = null;
        paramViewHolder.setFlags(-65, RecyclerView.ViewHolder.access$5400(paramViewHolder));
      }
      mShadowingHolder = null;
      if (!RecyclerView.ViewHolder.access$5300(paramViewHolder)) {
        RecyclerView.this.removeAnimatingView(itemView);
      }
    }
    
    public void onMoveFinished(RecyclerView.ViewHolder paramViewHolder)
    {
      paramViewHolder.setIsRecyclable(true);
      if (!RecyclerView.ViewHolder.access$5300(paramViewHolder)) {
        RecyclerView.this.removeAnimatingView(itemView);
      }
    }
    
    public void onRemoveFinished(RecyclerView.ViewHolder paramViewHolder)
    {
      paramViewHolder.setIsRecyclable(true);
      if ((!RecyclerView.this.removeAnimatingView(itemView)) && (paramViewHolder.isTmpDetached())) {
        removeDetachedView(itemView, false);
      }
    }
  }
  
  public static abstract class ItemDecoration
  {
    public ItemDecoration() {}
    
    @Deprecated
    public void getItemOffsets(Rect paramRect, int paramInt, RecyclerView paramRecyclerView)
    {
      paramRect.set(0, 0, 0, 0);
    }
    
    public void getItemOffsets(Rect paramRect, View paramView, RecyclerView paramRecyclerView, RecyclerView.State paramState)
    {
      getItemOffsets(paramRect, ((RecyclerView.LayoutParams)paramView.getLayoutParams()).getViewLayoutPosition(), paramRecyclerView);
    }
    
    @Deprecated
    public void onDraw(Canvas paramCanvas, RecyclerView paramRecyclerView) {}
    
    public void onDraw(Canvas paramCanvas, RecyclerView paramRecyclerView, RecyclerView.State paramState)
    {
      onDraw(paramCanvas, paramRecyclerView);
    }
    
    @Deprecated
    public void onDrawOver(Canvas paramCanvas, RecyclerView paramRecyclerView) {}
    
    public void onDrawOver(Canvas paramCanvas, RecyclerView paramRecyclerView, RecyclerView.State paramState)
    {
      onDrawOver(paramCanvas, paramRecyclerView);
    }
  }
  
  private static class ItemHolderInfo
  {
    int bottom;
    RecyclerView.ViewHolder holder;
    int left;
    int right;
    int top;
    
    ItemHolderInfo(RecyclerView.ViewHolder paramViewHolder, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      holder = paramViewHolder;
      left = paramInt1;
      top = paramInt2;
      right = paramInt3;
      bottom = paramInt4;
    }
  }
  
  public static abstract class LayoutManager
  {
    ChildHelper mChildHelper;
    private boolean mIsAttachedToWindow = false;
    RecyclerView mRecyclerView;
    private boolean mRequestedSimpleAnimations = false;
    RecyclerView.SmoothScroller mSmoothScroller;
    
    public LayoutManager() {}
    
    private void addViewInt(View paramView, int paramInt, boolean paramBoolean)
    {
      RecyclerView.ViewHolder localViewHolder = RecyclerView.getChildViewHolderInt(paramView);
      RecyclerView.LayoutParams localLayoutParams;
      if ((paramBoolean) || (localViewHolder.isRemoved()))
      {
        mRecyclerView.mState.addToDisappearingList(paramView);
        localLayoutParams = (RecyclerView.LayoutParams)paramView.getLayoutParams();
        if ((!localViewHolder.wasReturnedFromScrap()) && (!localViewHolder.isScrap())) {
          break label126;
        }
        if (!localViewHolder.isScrap()) {
          break label118;
        }
        localViewHolder.unScrap();
        label67:
        mChildHelper.attachViewToParent(paramView, paramInt, paramView.getLayoutParams(), false);
      }
      for (;;)
      {
        if (mPendingInvalidate)
        {
          itemView.invalidate();
          mPendingInvalidate = false;
        }
        return;
        mRecyclerView.mState.removeFromDisappearingList(paramView);
        break;
        label118:
        localViewHolder.clearReturnedFromScrapFlag();
        break label67;
        label126:
        if (paramView.getParent() == mRecyclerView)
        {
          int j = mChildHelper.indexOfChild(paramView);
          int i = paramInt;
          if (paramInt == -1) {
            i = mChildHelper.getChildCount();
          }
          if (j == -1) {
            throw new IllegalStateException("Added View has RecyclerView as parent but view is not a real child. Unfiltered index:" + mRecyclerView.indexOfChild(paramView));
          }
          if (j != i) {
            mRecyclerView.mLayout.moveView(j, i);
          }
        }
        else
        {
          mChildHelper.addView(paramView, paramInt, false);
          mInsetsDirty = true;
          if ((mSmoothScroller != null) && (mSmoothScroller.isRunning())) {
            mSmoothScroller.onChildAttachedToWindow(paramView);
          }
        }
      }
    }
    
    private void detachViewInternal(int paramInt, View paramView)
    {
      mChildHelper.detachViewFromParent(paramInt);
    }
    
    public static int getChildMeasureSpec(int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
    {
      int i = Math.max(0, paramInt1 - paramInt2);
      paramInt2 = 0;
      paramInt1 = 0;
      if (paramBoolean) {
        if (paramInt3 >= 0)
        {
          paramInt2 = paramInt3;
          paramInt1 = 1073741824;
        }
      }
      for (;;)
      {
        return View.MeasureSpec.makeMeasureSpec(paramInt2, paramInt1);
        paramInt2 = 0;
        paramInt1 = 0;
        continue;
        if (paramInt3 >= 0)
        {
          paramInt2 = paramInt3;
          paramInt1 = 1073741824;
        }
        else if (paramInt3 == -1)
        {
          paramInt2 = i;
          paramInt1 = 1073741824;
        }
        else if (paramInt3 == -2)
        {
          paramInt2 = i;
          paramInt1 = Integer.MIN_VALUE;
        }
      }
    }
    
    private void onSmoothScrollerStopped(RecyclerView.SmoothScroller paramSmoothScroller)
    {
      if (mSmoothScroller == paramSmoothScroller) {
        mSmoothScroller = null;
      }
    }
    
    private void scrapOrRecycleView(RecyclerView.Recycler paramRecycler, int paramInt, View paramView)
    {
      RecyclerView.ViewHolder localViewHolder = RecyclerView.getChildViewHolderInt(paramView);
      if (localViewHolder.shouldIgnore()) {
        return;
      }
      if ((localViewHolder.isInvalid()) && (!localViewHolder.isRemoved()) && (!localViewHolder.isChanged()) && (!mRecyclerView.mAdapter.hasStableIds()))
      {
        removeViewAt(paramInt);
        paramRecycler.recycleViewHolderInternal(localViewHolder);
        return;
      }
      detachViewAt(paramInt);
      paramRecycler.scrapView(paramView);
    }
    
    public void addDisappearingView(View paramView)
    {
      addDisappearingView(paramView, -1);
    }
    
    public void addDisappearingView(View paramView, int paramInt)
    {
      addViewInt(paramView, paramInt, true);
    }
    
    public void addView(View paramView)
    {
      addView(paramView, -1);
    }
    
    public void addView(View paramView, int paramInt)
    {
      addViewInt(paramView, paramInt, false);
    }
    
    public void assertNotInLayoutOrScroll(String paramString)
    {
      if (mRecyclerView != null) {
        mRecyclerView.assertNotInLayoutOrScroll(paramString);
      }
    }
    
    public void attachView(View paramView, int paramInt)
    {
      attachView(paramView, paramInt, (RecyclerView.LayoutParams)paramView.getLayoutParams());
    }
    
    public void attachView(View paramView, int paramInt, RecyclerView.LayoutParams paramLayoutParams)
    {
      RecyclerView.ViewHolder localViewHolder = RecyclerView.getChildViewHolderInt(paramView);
      if (localViewHolder.isRemoved()) {
        mRecyclerView.mState.addToDisappearingList(paramView);
      }
      for (;;)
      {
        mChildHelper.attachViewToParent(paramView, paramInt, paramLayoutParams, localViewHolder.isRemoved());
        return;
        mRecyclerView.mState.removeFromDisappearingList(paramView);
      }
    }
    
    public void calculateItemDecorationsForChild(View paramView, Rect paramRect)
    {
      if (mRecyclerView == null)
      {
        paramRect.set(0, 0, 0, 0);
        return;
      }
      paramRect.set(mRecyclerView.getItemDecorInsetsForChild(paramView));
    }
    
    public boolean canScrollHorizontally()
    {
      return false;
    }
    
    public boolean canScrollVertically()
    {
      return false;
    }
    
    public boolean checkLayoutParams(RecyclerView.LayoutParams paramLayoutParams)
    {
      return paramLayoutParams != null;
    }
    
    public int computeHorizontalScrollExtent(RecyclerView.State paramState)
    {
      return 0;
    }
    
    public int computeHorizontalScrollOffset(RecyclerView.State paramState)
    {
      return 0;
    }
    
    public int computeHorizontalScrollRange(RecyclerView.State paramState)
    {
      return 0;
    }
    
    public int computeVerticalScrollExtent(RecyclerView.State paramState)
    {
      return 0;
    }
    
    public int computeVerticalScrollOffset(RecyclerView.State paramState)
    {
      return 0;
    }
    
    public int computeVerticalScrollRange(RecyclerView.State paramState)
    {
      return 0;
    }
    
    public void detachAndScrapAttachedViews(RecyclerView.Recycler paramRecycler)
    {
      int i = getChildCount() - 1;
      while (i >= 0)
      {
        scrapOrRecycleView(paramRecycler, i, getChildAt(i));
        i -= 1;
      }
    }
    
    public void detachViewAt(int paramInt)
    {
      detachViewInternal(paramInt, getChildAt(paramInt));
    }
    
    void dispatchAttachedToWindow(RecyclerView paramRecyclerView)
    {
      mIsAttachedToWindow = true;
      onAttachedToWindow(paramRecyclerView);
    }
    
    void dispatchDetachedFromWindow(RecyclerView paramRecyclerView, RecyclerView.Recycler paramRecycler)
    {
      mIsAttachedToWindow = false;
      onDetachedFromWindow(paramRecyclerView, paramRecycler);
    }
    
    public View findViewByPosition(int paramInt)
    {
      int j = getChildCount();
      int i = 0;
      if (i < j)
      {
        View localView = getChildAt(i);
        RecyclerView.ViewHolder localViewHolder = RecyclerView.getChildViewHolderInt(localView);
        if (localViewHolder == null) {}
        while ((localViewHolder.getLayoutPosition() != paramInt) || (localViewHolder.shouldIgnore()) || ((!mRecyclerView.mState.isPreLayout()) && (localViewHolder.isRemoved())))
        {
          i += 1;
          break;
        }
        return localView;
      }
      return null;
    }
    
    public abstract RecyclerView.LayoutParams generateDefaultLayoutParams();
    
    public RecyclerView.LayoutParams generateLayoutParams(Context paramContext, AttributeSet paramAttributeSet)
    {
      return new RecyclerView.LayoutParams(paramContext, paramAttributeSet);
    }
    
    public RecyclerView.LayoutParams generateLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
    {
      if ((paramLayoutParams instanceof RecyclerView.LayoutParams)) {
        return new RecyclerView.LayoutParams((RecyclerView.LayoutParams)paramLayoutParams);
      }
      if ((paramLayoutParams instanceof ViewGroup.MarginLayoutParams)) {
        return new RecyclerView.LayoutParams((ViewGroup.MarginLayoutParams)paramLayoutParams);
      }
      return new RecyclerView.LayoutParams(paramLayoutParams);
    }
    
    public int getBaseline()
    {
      return -1;
    }
    
    public int getBottomDecorationHeight(View paramView)
    {
      return getLayoutParamsmDecorInsets.bottom;
    }
    
    public View getChildAt(int paramInt)
    {
      if (mChildHelper != null) {
        return mChildHelper.getChildAt(paramInt);
      }
      return null;
    }
    
    public int getChildCount()
    {
      if (mChildHelper != null) {
        return mChildHelper.getChildCount();
      }
      return 0;
    }
    
    public boolean getClipToPadding()
    {
      return (mRecyclerView != null) && (mRecyclerView.mClipToPadding);
    }
    
    public int getColumnCountForAccessibility(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
    {
      if ((mRecyclerView == null) || (mRecyclerView.mAdapter == null)) {}
      while (!canScrollHorizontally()) {
        return 1;
      }
      return mRecyclerView.mAdapter.getItemCount();
    }
    
    public int getDecoratedBottom(View paramView)
    {
      return paramView.getBottom() + getBottomDecorationHeight(paramView);
    }
    
    public int getDecoratedLeft(View paramView)
    {
      return paramView.getLeft() - getLeftDecorationWidth(paramView);
    }
    
    public int getDecoratedMeasuredHeight(View paramView)
    {
      Rect localRect = getLayoutParamsmDecorInsets;
      return paramView.getMeasuredHeight() + top + bottom;
    }
    
    public int getDecoratedMeasuredWidth(View paramView)
    {
      Rect localRect = getLayoutParamsmDecorInsets;
      return paramView.getMeasuredWidth() + left + right;
    }
    
    public int getDecoratedRight(View paramView)
    {
      return paramView.getRight() + getRightDecorationWidth(paramView);
    }
    
    public int getDecoratedTop(View paramView)
    {
      return paramView.getTop() - getTopDecorationHeight(paramView);
    }
    
    public View getFocusedChild()
    {
      Object localObject;
      if (mRecyclerView == null) {
        localObject = null;
      }
      View localView;
      do
      {
        return localObject;
        localView = mRecyclerView.getFocusedChild();
        if (localView == null) {
          break;
        }
        localObject = localView;
      } while (!mChildHelper.isHidden(localView));
      return null;
    }
    
    public int getHeight()
    {
      if (mRecyclerView != null) {
        return mRecyclerView.getHeight();
      }
      return 0;
    }
    
    public int getLayoutDirection()
    {
      return ViewCompat.getLayoutDirection(mRecyclerView);
    }
    
    public int getLeftDecorationWidth(View paramView)
    {
      return getLayoutParamsmDecorInsets.left;
    }
    
    public int getPaddingBottom()
    {
      if (mRecyclerView != null) {
        return mRecyclerView.getPaddingBottom();
      }
      return 0;
    }
    
    public int getPaddingLeft()
    {
      if (mRecyclerView != null) {
        return mRecyclerView.getPaddingLeft();
      }
      return 0;
    }
    
    public int getPaddingRight()
    {
      if (mRecyclerView != null) {
        return mRecyclerView.getPaddingRight();
      }
      return 0;
    }
    
    public int getPaddingTop()
    {
      if (mRecyclerView != null) {
        return mRecyclerView.getPaddingTop();
      }
      return 0;
    }
    
    public int getPosition(View paramView)
    {
      return ((RecyclerView.LayoutParams)paramView.getLayoutParams()).getViewLayoutPosition();
    }
    
    public int getRightDecorationWidth(View paramView)
    {
      return getLayoutParamsmDecorInsets.right;
    }
    
    public int getRowCountForAccessibility(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
    {
      if ((mRecyclerView == null) || (mRecyclerView.mAdapter == null)) {}
      while (!canScrollVertically()) {
        return 1;
      }
      return mRecyclerView.mAdapter.getItemCount();
    }
    
    public int getSelectionModeForAccessibility(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
    {
      return 0;
    }
    
    public int getTopDecorationHeight(View paramView)
    {
      return getLayoutParamsmDecorInsets.top;
    }
    
    public int getWidth()
    {
      if (mRecyclerView != null) {
        return mRecyclerView.getWidth();
      }
      return 0;
    }
    
    public boolean isAttachedToWindow()
    {
      return mIsAttachedToWindow;
    }
    
    public boolean isLayoutHierarchical(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
    {
      return false;
    }
    
    public boolean isSmoothScrolling()
    {
      return (mSmoothScroller != null) && (mSmoothScroller.isRunning());
    }
    
    public void layoutDecorated(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      Rect localRect = getLayoutParamsmDecorInsets;
      paramView.layout(left + paramInt1, top + paramInt2, paramInt3 - right, paramInt4 - bottom);
    }
    
    public void measureChildWithMargins(View paramView, int paramInt1, int paramInt2)
    {
      RecyclerView.LayoutParams localLayoutParams = (RecyclerView.LayoutParams)paramView.getLayoutParams();
      Rect localRect = mRecyclerView.getItemDecorInsetsForChild(paramView);
      int i = left;
      int j = right;
      int k = top;
      int m = bottom;
      paramView.measure(getChildMeasureSpec(getWidth(), getPaddingLeft() + getPaddingRight() + leftMargin + rightMargin + (paramInt1 + (i + j)), width, canScrollHorizontally()), getChildMeasureSpec(getHeight(), getPaddingTop() + getPaddingBottom() + topMargin + bottomMargin + (paramInt2 + (k + m)), height, canScrollVertically()));
    }
    
    public void moveView(int paramInt1, int paramInt2)
    {
      View localView = getChildAt(paramInt1);
      if (localView == null) {
        throw new IllegalArgumentException("Cannot move a child from non-existing index:" + paramInt1);
      }
      detachViewAt(paramInt1);
      attachView(localView, paramInt2);
    }
    
    public void offsetChildrenHorizontal(int paramInt)
    {
      if (mRecyclerView != null) {
        mRecyclerView.offsetChildrenHorizontal(paramInt);
      }
    }
    
    public void offsetChildrenVertical(int paramInt)
    {
      if (mRecyclerView != null) {
        mRecyclerView.offsetChildrenVertical(paramInt);
      }
    }
    
    public void onAdapterChanged(RecyclerView.Adapter paramAdapter1, RecyclerView.Adapter paramAdapter2) {}
    
    public boolean onAddFocusables(RecyclerView paramRecyclerView, ArrayList<View> paramArrayList, int paramInt1, int paramInt2)
    {
      return false;
    }
    
    public void onAttachedToWindow(RecyclerView paramRecyclerView) {}
    
    @Deprecated
    public void onDetachedFromWindow(RecyclerView paramRecyclerView) {}
    
    public void onDetachedFromWindow(RecyclerView paramRecyclerView, RecyclerView.Recycler paramRecycler)
    {
      onDetachedFromWindow(paramRecyclerView);
    }
    
    public View onFocusSearchFailed(View paramView, int paramInt, RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
    {
      return null;
    }
    
    public void onInitializeAccessibilityEvent(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, AccessibilityEvent paramAccessibilityEvent)
    {
      boolean bool2 = true;
      paramRecycler = AccessibilityEventCompat.asRecord(paramAccessibilityEvent);
      if ((mRecyclerView == null) || (paramRecycler == null)) {
        return;
      }
      boolean bool1 = bool2;
      if (!ViewCompat.canScrollVertically(mRecyclerView, 1))
      {
        bool1 = bool2;
        if (!ViewCompat.canScrollVertically(mRecyclerView, -1))
        {
          bool1 = bool2;
          if (!ViewCompat.canScrollHorizontally(mRecyclerView, -1)) {
            if (!ViewCompat.canScrollHorizontally(mRecyclerView, 1)) {
              break label111;
            }
          }
        }
      }
      label111:
      for (bool1 = bool2;; bool1 = false)
      {
        paramRecycler.setScrollable(bool1);
        if (mRecyclerView.mAdapter == null) {
          break;
        }
        paramRecycler.setItemCount(mRecyclerView.mAdapter.getItemCount());
        return;
      }
    }
    
    public void onInitializeAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
    {
      onInitializeAccessibilityEvent(mRecyclerView.mRecycler, mRecyclerView.mState, paramAccessibilityEvent);
    }
    
    void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfoCompat paramAccessibilityNodeInfoCompat)
    {
      onInitializeAccessibilityNodeInfo(mRecyclerView.mRecycler, mRecyclerView.mState, paramAccessibilityNodeInfoCompat);
    }
    
    public void onInitializeAccessibilityNodeInfo(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, AccessibilityNodeInfoCompat paramAccessibilityNodeInfoCompat)
    {
      if ((ViewCompat.canScrollVertically(mRecyclerView, -1)) || (ViewCompat.canScrollHorizontally(mRecyclerView, -1)))
      {
        paramAccessibilityNodeInfoCompat.addAction(8192);
        paramAccessibilityNodeInfoCompat.setScrollable(true);
      }
      if ((ViewCompat.canScrollVertically(mRecyclerView, 1)) || (ViewCompat.canScrollHorizontally(mRecyclerView, 1)))
      {
        paramAccessibilityNodeInfoCompat.addAction(4096);
        paramAccessibilityNodeInfoCompat.setScrollable(true);
      }
      paramAccessibilityNodeInfoCompat.setCollectionInfo(AccessibilityNodeInfoCompat.CollectionInfoCompat.obtain(getRowCountForAccessibility(paramRecycler, paramState), getColumnCountForAccessibility(paramRecycler, paramState), isLayoutHierarchical(paramRecycler, paramState), getSelectionModeForAccessibility(paramRecycler, paramState)));
    }
    
    public void onInitializeAccessibilityNodeInfoForItem(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, View paramView, AccessibilityNodeInfoCompat paramAccessibilityNodeInfoCompat)
    {
      int i;
      if (canScrollVertically())
      {
        i = getPosition(paramView);
        if (!canScrollHorizontally()) {
          break label51;
        }
      }
      label51:
      for (int j = getPosition(paramView);; j = 0)
      {
        paramAccessibilityNodeInfoCompat.setCollectionItemInfo(AccessibilityNodeInfoCompat.CollectionItemInfoCompat.obtain(i, 1, j, 1, false, false));
        return;
        i = 0;
        break;
      }
    }
    
    void onInitializeAccessibilityNodeInfoForItem(View paramView, AccessibilityNodeInfoCompat paramAccessibilityNodeInfoCompat)
    {
      RecyclerView.ViewHolder localViewHolder = RecyclerView.getChildViewHolderInt(paramView);
      if ((localViewHolder != null) && (!localViewHolder.isRemoved()) && (!mChildHelper.isHidden(itemView))) {
        onInitializeAccessibilityNodeInfoForItem(mRecyclerView.mRecycler, mRecyclerView.mState, paramView, paramAccessibilityNodeInfoCompat);
      }
    }
    
    public View onInterceptFocusSearch(View paramView, int paramInt)
    {
      return null;
    }
    
    public void onItemsAdded(RecyclerView paramRecyclerView, int paramInt1, int paramInt2) {}
    
    public void onItemsChanged(RecyclerView paramRecyclerView) {}
    
    public void onItemsMoved(RecyclerView paramRecyclerView, int paramInt1, int paramInt2, int paramInt3) {}
    
    public void onItemsRemoved(RecyclerView paramRecyclerView, int paramInt1, int paramInt2) {}
    
    public void onItemsUpdated(RecyclerView paramRecyclerView, int paramInt1, int paramInt2) {}
    
    public void onLayoutChildren(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
    {
      Log.e("RecyclerView", "You must override onLayoutChildren(Recycler recycler, State state) ");
    }
    
    public void onMeasure(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, int paramInt1, int paramInt2)
    {
      mRecyclerView.defaultOnMeasure(paramInt1, paramInt2);
    }
    
    public boolean onRequestChildFocus(RecyclerView paramRecyclerView, RecyclerView.State paramState, View paramView1, View paramView2)
    {
      return onRequestChildFocus(paramRecyclerView, paramView1, paramView2);
    }
    
    @Deprecated
    public boolean onRequestChildFocus(RecyclerView paramRecyclerView, View paramView1, View paramView2)
    {
      return (isSmoothScrolling()) || (paramRecyclerView.isComputingLayout());
    }
    
    public void onRestoreInstanceState(Parcelable paramParcelable) {}
    
    public Parcelable onSaveInstanceState()
    {
      return null;
    }
    
    public void onScrollStateChanged(int paramInt) {}
    
    boolean performAccessibilityAction(int paramInt, Bundle paramBundle)
    {
      return performAccessibilityAction(mRecyclerView.mRecycler, mRecyclerView.mState, paramInt, paramBundle);
    }
    
    public boolean performAccessibilityAction(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, int paramInt, Bundle paramBundle)
    {
      if (mRecyclerView == null) {
        return false;
      }
      int k = 0;
      int m = 0;
      int i = 0;
      int j = 0;
      switch (paramInt)
      {
      default: 
        paramInt = i;
      }
      while ((paramInt != 0) || (j != 0))
      {
        mRecyclerView.scrollBy(j, paramInt);
        return true;
        i = k;
        if (ViewCompat.canScrollVertically(mRecyclerView, -1)) {
          i = -(getHeight() - getPaddingTop() - getPaddingBottom());
        }
        paramInt = i;
        if (ViewCompat.canScrollHorizontally(mRecyclerView, -1))
        {
          j = -(getWidth() - getPaddingLeft() - getPaddingRight());
          paramInt = i;
          continue;
          i = m;
          if (ViewCompat.canScrollVertically(mRecyclerView, 1)) {
            i = getHeight() - getPaddingTop() - getPaddingBottom();
          }
          paramInt = i;
          if (ViewCompat.canScrollHorizontally(mRecyclerView, 1))
          {
            j = getWidth() - getPaddingLeft() - getPaddingRight();
            paramInt = i;
          }
        }
      }
    }
    
    public boolean performAccessibilityActionForItem(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, View paramView, int paramInt, Bundle paramBundle)
    {
      return false;
    }
    
    boolean performAccessibilityActionForItem(View paramView, int paramInt, Bundle paramBundle)
    {
      return performAccessibilityActionForItem(mRecyclerView.mRecycler, mRecyclerView.mState, paramView, paramInt, paramBundle);
    }
    
    public void postOnAnimation(Runnable paramRunnable)
    {
      if (mRecyclerView != null) {
        ViewCompat.postOnAnimation(mRecyclerView, paramRunnable);
      }
    }
    
    public void removeAndRecycleAllViews(RecyclerView.Recycler paramRecycler)
    {
      int i = getChildCount() - 1;
      while (i >= 0)
      {
        if (!RecyclerView.getChildViewHolderInt(getChildAt(i)).shouldIgnore()) {
          removeAndRecycleViewAt(i, paramRecycler);
        }
        i -= 1;
      }
    }
    
    void removeAndRecycleScrapInt(RecyclerView.Recycler paramRecycler)
    {
      int j = paramRecycler.getScrapCount();
      int i = j - 1;
      if (i >= 0)
      {
        View localView = paramRecycler.getScrapViewAt(i);
        RecyclerView.ViewHolder localViewHolder = RecyclerView.getChildViewHolderInt(localView);
        if (localViewHolder.shouldIgnore()) {}
        for (;;)
        {
          i -= 1;
          break;
          localViewHolder.setIsRecyclable(false);
          if (localViewHolder.isTmpDetached()) {
            mRecyclerView.removeDetachedView(localView, false);
          }
          if (mRecyclerView.mItemAnimator != null) {
            mRecyclerView.mItemAnimator.endAnimation(localViewHolder);
          }
          localViewHolder.setIsRecyclable(true);
          paramRecycler.quickRecycleScrapView(localView);
        }
      }
      paramRecycler.clearScrap();
      if (j > 0) {
        mRecyclerView.invalidate();
      }
    }
    
    public void removeAndRecycleView(View paramView, RecyclerView.Recycler paramRecycler)
    {
      removeView(paramView);
      paramRecycler.recycleView(paramView);
    }
    
    public void removeAndRecycleViewAt(int paramInt, RecyclerView.Recycler paramRecycler)
    {
      View localView = getChildAt(paramInt);
      removeViewAt(paramInt);
      paramRecycler.recycleView(localView);
    }
    
    public boolean removeCallbacks(Runnable paramRunnable)
    {
      if (mRecyclerView != null) {
        return mRecyclerView.removeCallbacks(paramRunnable);
      }
      return false;
    }
    
    public void removeView(View paramView)
    {
      mChildHelper.removeView(paramView);
    }
    
    public void removeViewAt(int paramInt)
    {
      if (getChildAt(paramInt) != null) {
        mChildHelper.removeViewAt(paramInt);
      }
    }
    
    public boolean requestChildRectangleOnScreen(RecyclerView paramRecyclerView, View paramView, Rect paramRect, boolean paramBoolean)
    {
      int i2 = getPaddingLeft();
      int m = getPaddingTop();
      int i3 = getWidth() - getPaddingRight();
      int i1 = getHeight();
      int i6 = getPaddingBottom();
      int i4 = paramView.getLeft() + left;
      int n = paramView.getTop() + top;
      int i5 = i4 + paramRect.width();
      int i7 = paramRect.height();
      int i = Math.min(0, i4 - i2);
      int j = Math.min(0, n - m);
      int k = Math.max(0, i5 - i3);
      i1 = Math.max(0, n + i7 - (i1 - i6));
      if (getLayoutDirection() == 1) {
        if (k != 0)
        {
          i = k;
          if (j == 0) {
            break label207;
          }
          label144:
          if ((i == 0) && (j == 0)) {
            break label233;
          }
          if (!paramBoolean) {
            break label222;
          }
          paramRecyclerView.scrollBy(i, j);
        }
      }
      for (;;)
      {
        return true;
        i = Math.max(i, i5 - i3);
        break;
        if (i != 0) {
          break;
        }
        for (;;)
        {
          i = Math.min(i4 - i2, k);
        }
        label207:
        j = Math.min(n - m, i1);
        break label144;
        label222:
        paramRecyclerView.smoothScrollBy(i, j);
      }
      label233:
      return false;
    }
    
    public void requestLayout()
    {
      if (mRecyclerView != null) {
        mRecyclerView.requestLayout();
      }
    }
    
    public void requestSimpleAnimationsInNextLayout()
    {
      mRequestedSimpleAnimations = true;
    }
    
    public int scrollHorizontallyBy(int paramInt, RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
    {
      return 0;
    }
    
    public void scrollToPosition(int paramInt) {}
    
    public int scrollVerticallyBy(int paramInt, RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
    {
      return 0;
    }
    
    void setRecyclerView(RecyclerView paramRecyclerView)
    {
      if (paramRecyclerView == null)
      {
        mRecyclerView = null;
        mChildHelper = null;
        return;
      }
      mRecyclerView = paramRecyclerView;
      mChildHelper = mChildHelper;
    }
    
    public void smoothScrollToPosition(RecyclerView paramRecyclerView, RecyclerView.State paramState, int paramInt)
    {
      Log.e("RecyclerView", "You must override smoothScrollToPosition to support smooth scrolling");
    }
    
    public void startSmoothScroll(RecyclerView.SmoothScroller paramSmoothScroller)
    {
      if ((mSmoothScroller != null) && (paramSmoothScroller != mSmoothScroller) && (mSmoothScroller.isRunning())) {
        mSmoothScroller.stop();
      }
      mSmoothScroller = paramSmoothScroller;
      mSmoothScroller.start(mRecyclerView, this);
    }
    
    void stopSmoothScroller()
    {
      if (mSmoothScroller != null) {
        mSmoothScroller.stop();
      }
    }
    
    public boolean supportsPredictiveItemAnimations()
    {
      return false;
    }
  }
  
  public static class LayoutParams
    extends ViewGroup.MarginLayoutParams
  {
    final Rect mDecorInsets = new Rect();
    boolean mInsetsDirty = true;
    boolean mPendingInvalidate = false;
    RecyclerView.ViewHolder mViewHolder;
    
    public LayoutParams(int paramInt1, int paramInt2)
    {
      super(paramInt2);
    }
    
    public LayoutParams(Context paramContext, AttributeSet paramAttributeSet)
    {
      super(paramAttributeSet);
    }
    
    public LayoutParams(LayoutParams paramLayoutParams)
    {
      super();
    }
    
    public LayoutParams(ViewGroup.LayoutParams paramLayoutParams)
    {
      super();
    }
    
    public LayoutParams(ViewGroup.MarginLayoutParams paramMarginLayoutParams)
    {
      super();
    }
    
    public int getViewLayoutPosition()
    {
      return mViewHolder.getLayoutPosition();
    }
    
    public boolean isItemChanged()
    {
      return mViewHolder.isChanged();
    }
    
    public boolean isItemRemoved()
    {
      return mViewHolder.isRemoved();
    }
  }
  
  public static abstract interface OnChildAttachStateChangeListener
  {
    public abstract void onChildViewAttachedToWindow(View paramView);
    
    public abstract void onChildViewDetachedFromWindow(View paramView);
  }
  
  public static abstract interface OnItemTouchListener
  {
    public abstract boolean onInterceptTouchEvent(RecyclerView paramRecyclerView, MotionEvent paramMotionEvent);
    
    public abstract void onRequestDisallowInterceptTouchEvent(boolean paramBoolean);
    
    public abstract void onTouchEvent(RecyclerView paramRecyclerView, MotionEvent paramMotionEvent);
  }
  
  public static abstract class OnScrollListener
  {
    public OnScrollListener() {}
    
    public void onScrollStateChanged(RecyclerView paramRecyclerView, int paramInt) {}
    
    public void onScrolled(RecyclerView paramRecyclerView, int paramInt1, int paramInt2) {}
  }
  
  public static class RecycledViewPool
  {
    private int mAttachCount = 0;
    private SparseIntArray mMaxScrap = new SparseIntArray();
    private SparseArray<ArrayList<RecyclerView.ViewHolder>> mScrap = new SparseArray();
    
    public RecycledViewPool() {}
    
    private ArrayList<RecyclerView.ViewHolder> getScrapHeapForType(int paramInt)
    {
      ArrayList localArrayList2 = (ArrayList)mScrap.get(paramInt);
      ArrayList localArrayList1 = localArrayList2;
      if (localArrayList2 == null)
      {
        localArrayList2 = new ArrayList();
        mScrap.put(paramInt, localArrayList2);
        localArrayList1 = localArrayList2;
        if (mMaxScrap.indexOfKey(paramInt) < 0)
        {
          mMaxScrap.put(paramInt, 5);
          localArrayList1 = localArrayList2;
        }
      }
      return localArrayList1;
    }
    
    void attach(RecyclerView.Adapter paramAdapter)
    {
      mAttachCount += 1;
    }
    
    public void clear()
    {
      mScrap.clear();
    }
    
    void detach()
    {
      mAttachCount -= 1;
    }
    
    public RecyclerView.ViewHolder getRecycledView(int paramInt)
    {
      ArrayList localArrayList = (ArrayList)mScrap.get(paramInt);
      if ((localArrayList != null) && (!localArrayList.isEmpty()))
      {
        paramInt = localArrayList.size() - 1;
        RecyclerView.ViewHolder localViewHolder = (RecyclerView.ViewHolder)localArrayList.get(paramInt);
        localArrayList.remove(paramInt);
        return localViewHolder;
      }
      return null;
    }
    
    void onAdapterChanged(RecyclerView.Adapter paramAdapter1, RecyclerView.Adapter paramAdapter2, boolean paramBoolean)
    {
      if (paramAdapter1 != null) {
        detach();
      }
      if ((!paramBoolean) && (mAttachCount == 0)) {
        clear();
      }
      if (paramAdapter2 != null) {
        attach(paramAdapter2);
      }
    }
    
    public void putRecycledView(RecyclerView.ViewHolder paramViewHolder)
    {
      int i = paramViewHolder.getItemViewType();
      ArrayList localArrayList = getScrapHeapForType(i);
      if (mMaxScrap.get(i) <= localArrayList.size()) {
        return;
      }
      paramViewHolder.resetInternal();
      localArrayList.add(paramViewHolder);
    }
  }
  
  public final class Recycler
  {
    final ArrayList<RecyclerView.ViewHolder> mAttachedScrap = new ArrayList();
    final ArrayList<RecyclerView.ViewHolder> mCachedViews = new ArrayList();
    private ArrayList<RecyclerView.ViewHolder> mChangedScrap = null;
    private RecyclerView.RecycledViewPool mRecyclerPool;
    private final List<RecyclerView.ViewHolder> mUnmodifiableAttachedScrap = Collections.unmodifiableList(mAttachedScrap);
    private RecyclerView.ViewCacheExtension mViewCacheExtension;
    private int mViewCacheMax = 2;
    
    public Recycler() {}
    
    private void attachAccessibilityDelegate(View paramView)
    {
      if ((mAccessibilityManager != null) && (mAccessibilityManager.isEnabled()))
      {
        if (ViewCompat.getImportantForAccessibility(paramView) == 0) {
          ViewCompat.setImportantForAccessibility(paramView, 1);
        }
        if (!ViewCompat.hasAccessibilityDelegate(paramView)) {
          ViewCompat.setAccessibilityDelegate(paramView, mAccessibilityDelegate.getItemDelegate());
        }
      }
    }
    
    private void invalidateDisplayListInt(RecyclerView.ViewHolder paramViewHolder)
    {
      if ((itemView instanceof ViewGroup)) {
        invalidateDisplayListInt((ViewGroup)itemView, false);
      }
    }
    
    private void invalidateDisplayListInt(ViewGroup paramViewGroup, boolean paramBoolean)
    {
      int i = paramViewGroup.getChildCount() - 1;
      while (i >= 0)
      {
        View localView = paramViewGroup.getChildAt(i);
        if ((localView instanceof ViewGroup)) {
          invalidateDisplayListInt((ViewGroup)localView, true);
        }
        i -= 1;
      }
      if (!paramBoolean) {
        return;
      }
      if (paramViewGroup.getVisibility() == 4)
      {
        paramViewGroup.setVisibility(0);
        paramViewGroup.setVisibility(4);
        return;
      }
      i = paramViewGroup.getVisibility();
      paramViewGroup.setVisibility(4);
      paramViewGroup.setVisibility(i);
    }
    
    void addViewHolderToRecycledViewPool(RecyclerView.ViewHolder paramViewHolder)
    {
      ViewCompat.setAccessibilityDelegate(itemView, null);
      dispatchViewRecycled(paramViewHolder);
      mOwnerRecyclerView = null;
      getRecycledViewPool().putRecycledView(paramViewHolder);
    }
    
    public void clear()
    {
      mAttachedScrap.clear();
      recycleAndClearCachedViews();
    }
    
    void clearOldPositions()
    {
      int j = mCachedViews.size();
      int i = 0;
      while (i < j)
      {
        ((RecyclerView.ViewHolder)mCachedViews.get(i)).clearOldPosition();
        i += 1;
      }
      j = mAttachedScrap.size();
      i = 0;
      while (i < j)
      {
        ((RecyclerView.ViewHolder)mAttachedScrap.get(i)).clearOldPosition();
        i += 1;
      }
      if (mChangedScrap != null)
      {
        j = mChangedScrap.size();
        i = 0;
        while (i < j)
        {
          ((RecyclerView.ViewHolder)mChangedScrap.get(i)).clearOldPosition();
          i += 1;
        }
      }
    }
    
    void clearScrap()
    {
      mAttachedScrap.clear();
    }
    
    public int convertPreLayoutPositionToPostLayout(int paramInt)
    {
      if ((paramInt < 0) || (paramInt >= mState.getItemCount())) {
        throw new IndexOutOfBoundsException("invalid position " + paramInt + ". State " + "item count is " + mState.getItemCount());
      }
      if (!mState.isPreLayout()) {
        return paramInt;
      }
      return mAdapterHelper.findPositionOffset(paramInt);
    }
    
    void dispatchViewRecycled(RecyclerView.ViewHolder paramViewHolder)
    {
      if (mRecyclerListener != null) {
        mRecyclerListener.onViewRecycled(paramViewHolder);
      }
      if (mAdapter != null) {
        mAdapter.onViewRecycled(paramViewHolder);
      }
      if (mState != null) {
        mState.onViewRecycled(paramViewHolder);
      }
    }
    
    RecyclerView.ViewHolder getChangedScrapViewForPosition(int paramInt)
    {
      int j;
      if (mChangedScrap != null)
      {
        j = mChangedScrap.size();
        if (j != 0) {}
      }
      else
      {
        return null;
      }
      int i = 0;
      RecyclerView.ViewHolder localViewHolder;
      while (i < j)
      {
        localViewHolder = (RecyclerView.ViewHolder)mChangedScrap.get(i);
        if ((!localViewHolder.wasReturnedFromScrap()) && (localViewHolder.getLayoutPosition() == paramInt))
        {
          localViewHolder.addFlags(32);
          return localViewHolder;
        }
        i += 1;
      }
      if (mAdapter.hasStableIds())
      {
        paramInt = mAdapterHelper.findPositionOffset(paramInt);
        if ((paramInt > 0) && (paramInt < mAdapter.getItemCount()))
        {
          long l = mAdapter.getItemId(paramInt);
          paramInt = 0;
          while (paramInt < j)
          {
            localViewHolder = (RecyclerView.ViewHolder)mChangedScrap.get(paramInt);
            if ((!localViewHolder.wasReturnedFromScrap()) && (localViewHolder.getItemId() == l))
            {
              localViewHolder.addFlags(32);
              return localViewHolder;
            }
            paramInt += 1;
          }
        }
      }
      return null;
    }
    
    RecyclerView.RecycledViewPool getRecycledViewPool()
    {
      if (mRecyclerPool == null) {
        mRecyclerPool = new RecyclerView.RecycledViewPool();
      }
      return mRecyclerPool;
    }
    
    int getScrapCount()
    {
      return mAttachedScrap.size();
    }
    
    public List<RecyclerView.ViewHolder> getScrapList()
    {
      return mUnmodifiableAttachedScrap;
    }
    
    View getScrapViewAt(int paramInt)
    {
      return mAttachedScrap.get(paramInt)).itemView;
    }
    
    RecyclerView.ViewHolder getScrapViewForId(long paramLong, int paramInt, boolean paramBoolean)
    {
      int i = mAttachedScrap.size() - 1;
      RecyclerView.ViewHolder localViewHolder2;
      RecyclerView.ViewHolder localViewHolder1;
      while (i >= 0)
      {
        localViewHolder2 = (RecyclerView.ViewHolder)mAttachedScrap.get(i);
        if ((localViewHolder2.getItemId() == paramLong) && (!localViewHolder2.wasReturnedFromScrap()))
        {
          if (paramInt == localViewHolder2.getItemViewType())
          {
            localViewHolder2.addFlags(32);
            localViewHolder1 = localViewHolder2;
            if (localViewHolder2.isRemoved())
            {
              localViewHolder1 = localViewHolder2;
              if (!mState.isPreLayout())
              {
                localViewHolder2.setFlags(2, 14);
                localViewHolder1 = localViewHolder2;
              }
            }
            return localViewHolder1;
          }
          if (!paramBoolean)
          {
            mAttachedScrap.remove(i);
            removeDetachedView(itemView, false);
            quickRecycleScrapView(itemView);
          }
        }
        i -= 1;
      }
      i = mCachedViews.size() - 1;
      for (;;)
      {
        if (i < 0) {
          break label245;
        }
        localViewHolder2 = (RecyclerView.ViewHolder)mCachedViews.get(i);
        if (localViewHolder2.getItemId() == paramLong)
        {
          if (paramInt == localViewHolder2.getItemViewType())
          {
            localViewHolder1 = localViewHolder2;
            if (paramBoolean) {
              break;
            }
            mCachedViews.remove(i);
            return localViewHolder2;
          }
          if (!paramBoolean) {
            recycleCachedViewAt(i);
          }
        }
        i -= 1;
      }
      label245:
      return null;
    }
    
    RecyclerView.ViewHolder getScrapViewForPosition(int paramInt1, int paramInt2, boolean paramBoolean)
    {
      int j = mAttachedScrap.size();
      int i = 0;
      Object localObject;
      if (i < j)
      {
        localObject = (RecyclerView.ViewHolder)mAttachedScrap.get(i);
        if ((((RecyclerView.ViewHolder)localObject).wasReturnedFromScrap()) || (((RecyclerView.ViewHolder)localObject).getLayoutPosition() != paramInt1) || (((RecyclerView.ViewHolder)localObject).isInvalid()) || ((!RecyclerView.State.access$1500(mState)) && (((RecyclerView.ViewHolder)localObject).isRemoved()))) {
          break label271;
        }
        if ((paramInt2 != -1) && (((RecyclerView.ViewHolder)localObject).getItemViewType() != paramInt2)) {
          Log.e("RecyclerView", "Scrap view for position " + paramInt1 + " isn't dirty but has" + " wrong view type! (found " + ((RecyclerView.ViewHolder)localObject).getItemViewType() + " but expected " + paramInt2 + ")");
        }
      }
      else
      {
        if (!paramBoolean)
        {
          localObject = mChildHelper.findHiddenNonRemovedView(paramInt1, paramInt2);
          if (localObject != null) {
            mItemAnimator.endAnimation(getChildViewHolder((View)localObject));
          }
        }
        i = mCachedViews.size();
        paramInt2 = 0;
      }
      for (;;)
      {
        if (paramInt2 >= i) {
          break label287;
        }
        localObject = (RecyclerView.ViewHolder)mCachedViews.get(paramInt2);
        if ((!((RecyclerView.ViewHolder)localObject).isInvalid()) && (((RecyclerView.ViewHolder)localObject).getLayoutPosition() == paramInt1))
        {
          if (!paramBoolean) {
            mCachedViews.remove(paramInt2);
          }
          return localObject;
          ((RecyclerView.ViewHolder)localObject).addFlags(32);
          return localObject;
          label271:
          i += 1;
          break;
        }
        paramInt2 += 1;
      }
      label287:
      return null;
    }
    
    public View getViewForPosition(int paramInt)
    {
      return getViewForPosition(paramInt, false);
    }
    
    View getViewForPosition(int paramInt, boolean paramBoolean)
    {
      boolean bool = true;
      if ((paramInt < 0) || (paramInt >= mState.getItemCount())) {
        throw new IndexOutOfBoundsException("Invalid item position " + paramInt + "(" + paramInt + "). Item count:" + mState.getItemCount());
      }
      int j = 0;
      Object localObject2 = null;
      if (mState.isPreLayout())
      {
        localObject2 = getChangedScrapViewForPosition(paramInt);
        if (localObject2 != null) {
          j = 1;
        }
      }
      else
      {
        i = j;
        localObject1 = localObject2;
        if (localObject2 == null)
        {
          localObject2 = getScrapViewForPosition(paramInt, -1, paramBoolean);
          i = j;
          localObject1 = localObject2;
          if (localObject2 != null)
          {
            if (validateViewHolderForOffsetPosition((RecyclerView.ViewHolder)localObject2)) {
              break label333;
            }
            if (!paramBoolean)
            {
              ((RecyclerView.ViewHolder)localObject2).addFlags(4);
              if (!((RecyclerView.ViewHolder)localObject2).isScrap()) {
                break label317;
              }
              removeDetachedView(itemView, false);
              ((RecyclerView.ViewHolder)localObject2).unScrap();
              label190:
              recycleViewHolderInternal((RecyclerView.ViewHolder)localObject2);
            }
            localObject1 = null;
            i = j;
          }
        }
      }
      for (;;)
      {
        k = i;
        localObject2 = localObject1;
        if (localObject1 != null) {
          break label604;
        }
        k = mAdapterHelper.findPositionOffset(paramInt);
        if ((k >= 0) && (k < mAdapter.getItemCount())) {
          break label342;
        }
        throw new IndexOutOfBoundsException("Inconsistency detected. Invalid item position " + paramInt + "(offset:" + k + ")." + "state:" + mState.getItemCount());
        j = 0;
        break;
        label317:
        if (!((RecyclerView.ViewHolder)localObject2).wasReturnedFromScrap()) {
          break label190;
        }
        ((RecyclerView.ViewHolder)localObject2).clearReturnedFromScrapFlag();
        break label190;
        label333:
        i = 1;
        localObject1 = localObject2;
      }
      label342:
      int m = mAdapter.getItemViewType(k);
      j = i;
      localObject2 = localObject1;
      if (mAdapter.hasStableIds())
      {
        localObject1 = getScrapViewForId(mAdapter.getItemId(k), m, paramBoolean);
        j = i;
        localObject2 = localObject1;
        if (localObject1 != null)
        {
          mPosition = k;
          j = 1;
          localObject2 = localObject1;
        }
      }
      Object localObject1 = localObject2;
      if (localObject2 == null)
      {
        localObject1 = localObject2;
        if (mViewCacheExtension != null)
        {
          localObject3 = mViewCacheExtension.getViewForPositionAndType(this, paramInt, m);
          localObject1 = localObject2;
          if (localObject3 != null)
          {
            localObject2 = getChildViewHolder((View)localObject3);
            if (localObject2 == null) {
              throw new IllegalArgumentException("getViewForPositionAndType returned a view which does not have a ViewHolder");
            }
            localObject1 = localObject2;
            if (((RecyclerView.ViewHolder)localObject2).shouldIgnore()) {
              throw new IllegalArgumentException("getViewForPositionAndType returned a view that is ignored. You must call stopIgnoring before returning this view.");
            }
          }
        }
      }
      Object localObject3 = localObject1;
      if (localObject1 == null)
      {
        localObject1 = getRecycledViewPool().getRecycledView(m);
        localObject3 = localObject1;
        if (localObject1 != null)
        {
          ((RecyclerView.ViewHolder)localObject1).resetInternal();
          localObject3 = localObject1;
          if (RecyclerView.FORCE_INVALIDATE_DISPLAY_LIST)
          {
            invalidateDisplayListInt((RecyclerView.ViewHolder)localObject1);
            localObject3 = localObject1;
          }
        }
      }
      int k = j;
      localObject2 = localObject3;
      if (localObject3 == null)
      {
        localObject2 = mAdapter.createViewHolder(RecyclerView.this, m);
        k = j;
      }
      label604:
      int i = 0;
      if ((mState.isPreLayout()) && (((RecyclerView.ViewHolder)localObject2).isBound()))
      {
        mPreLayoutPosition = paramInt;
        localObject1 = itemView.getLayoutParams();
        if (localObject1 != null) {
          break label799;
        }
        localObject1 = (RecyclerView.LayoutParams)generateDefaultLayoutParams();
        itemView.setLayoutParams((ViewGroup.LayoutParams)localObject1);
        label670:
        mViewHolder = ((RecyclerView.ViewHolder)localObject2);
        if ((k == 0) || (i == 0)) {
          break label848;
        }
      }
      label799:
      label848:
      for (paramBoolean = bool;; paramBoolean = false)
      {
        mPendingInvalidate = paramBoolean;
        return itemView;
        if ((((RecyclerView.ViewHolder)localObject2).isBound()) && (!((RecyclerView.ViewHolder)localObject2).needsUpdate()) && (!((RecyclerView.ViewHolder)localObject2).isInvalid())) {
          break;
        }
        i = mAdapterHelper.findPositionOffset(paramInt);
        mOwnerRecyclerView = RecyclerView.this;
        mAdapter.bindViewHolder((RecyclerView.ViewHolder)localObject2, i);
        attachAccessibilityDelegate(itemView);
        j = 1;
        i = j;
        if (!mState.isPreLayout()) {
          break;
        }
        mPreLayoutPosition = paramInt;
        i = j;
        break;
        if (!checkLayoutParams((ViewGroup.LayoutParams)localObject1))
        {
          localObject1 = (RecyclerView.LayoutParams)generateLayoutParams((ViewGroup.LayoutParams)localObject1);
          itemView.setLayoutParams((ViewGroup.LayoutParams)localObject1);
          break label670;
        }
        localObject1 = (RecyclerView.LayoutParams)localObject1;
        break label670;
      }
    }
    
    void markItemDecorInsetsDirty()
    {
      int j = mCachedViews.size();
      int i = 0;
      while (i < j)
      {
        RecyclerView.LayoutParams localLayoutParams = (RecyclerView.LayoutParams)mCachedViews.get(i)).itemView.getLayoutParams();
        if (localLayoutParams != null) {
          mInsetsDirty = true;
        }
        i += 1;
      }
    }
    
    void markKnownViewsInvalid()
    {
      int j;
      int i;
      if ((mAdapter != null) && (mAdapter.hasStableIds()))
      {
        j = mCachedViews.size();
        i = 0;
      }
      while (i < j)
      {
        RecyclerView.ViewHolder localViewHolder = (RecyclerView.ViewHolder)mCachedViews.get(i);
        if (localViewHolder != null) {
          localViewHolder.addFlags(6);
        }
        i += 1;
        continue;
        recycleAndClearCachedViews();
      }
    }
    
    void offsetPositionRecordsForInsert(int paramInt1, int paramInt2)
    {
      int j = mCachedViews.size();
      int i = 0;
      while (i < j)
      {
        RecyclerView.ViewHolder localViewHolder = (RecyclerView.ViewHolder)mCachedViews.get(i);
        if ((localViewHolder != null) && (localViewHolder.getLayoutPosition() >= paramInt1)) {
          localViewHolder.offsetPosition(paramInt2, true);
        }
        i += 1;
      }
    }
    
    void offsetPositionRecordsForMove(int paramInt1, int paramInt2)
    {
      int k;
      int i;
      int j;
      int m;
      label25:
      RecyclerView.ViewHolder localViewHolder;
      if (paramInt1 < paramInt2)
      {
        k = paramInt1;
        i = paramInt2;
        j = -1;
        int n = mCachedViews.size();
        m = 0;
        if (m >= n) {
          return;
        }
        localViewHolder = (RecyclerView.ViewHolder)mCachedViews.get(m);
        if ((localViewHolder != null) && (mPosition >= k) && (mPosition <= i)) {
          break label90;
        }
      }
      for (;;)
      {
        m += 1;
        break label25;
        k = paramInt2;
        i = paramInt1;
        j = 1;
        break;
        label90:
        if (mPosition == paramInt1) {
          localViewHolder.offsetPosition(paramInt2 - paramInt1, false);
        } else {
          localViewHolder.offsetPosition(j, false);
        }
      }
    }
    
    void offsetPositionRecordsForRemove(int paramInt1, int paramInt2, boolean paramBoolean)
    {
      int i = mCachedViews.size() - 1;
      if (i >= 0)
      {
        RecyclerView.ViewHolder localViewHolder = (RecyclerView.ViewHolder)mCachedViews.get(i);
        if (localViewHolder != null)
        {
          if (localViewHolder.getLayoutPosition() < paramInt1 + paramInt2) {
            break label63;
          }
          localViewHolder.offsetPosition(-paramInt2, paramBoolean);
        }
        for (;;)
        {
          i -= 1;
          break;
          label63:
          if (localViewHolder.getLayoutPosition() >= paramInt1)
          {
            localViewHolder.addFlags(8);
            recycleCachedViewAt(i);
          }
        }
      }
    }
    
    void onAdapterChanged(RecyclerView.Adapter paramAdapter1, RecyclerView.Adapter paramAdapter2, boolean paramBoolean)
    {
      clear();
      getRecycledViewPool().onAdapterChanged(paramAdapter1, paramAdapter2, paramBoolean);
    }
    
    void quickRecycleScrapView(View paramView)
    {
      paramView = RecyclerView.getChildViewHolderInt(paramView);
      RecyclerView.ViewHolder.access$4102(paramView, null);
      paramView.clearReturnedFromScrapFlag();
      recycleViewHolderInternal(paramView);
    }
    
    void recycleAndClearCachedViews()
    {
      int i = mCachedViews.size() - 1;
      while (i >= 0)
      {
        recycleCachedViewAt(i);
        i -= 1;
      }
      mCachedViews.clear();
    }
    
    void recycleCachedViewAt(int paramInt)
    {
      addViewHolderToRecycledViewPool((RecyclerView.ViewHolder)mCachedViews.get(paramInt));
      mCachedViews.remove(paramInt);
    }
    
    public void recycleView(View paramView)
    {
      RecyclerView.ViewHolder localViewHolder = RecyclerView.getChildViewHolderInt(paramView);
      if (localViewHolder.isTmpDetached()) {
        removeDetachedView(paramView, false);
      }
      if (localViewHolder.isScrap()) {
        localViewHolder.unScrap();
      }
      for (;;)
      {
        recycleViewHolderInternal(localViewHolder);
        return;
        if (localViewHolder.wasReturnedFromScrap()) {
          localViewHolder.clearReturnedFromScrapFlag();
        }
      }
    }
    
    void recycleViewHolderInternal(RecyclerView.ViewHolder paramViewHolder)
    {
      boolean bool = true;
      if ((paramViewHolder.isScrap()) || (itemView.getParent() != null))
      {
        StringBuilder localStringBuilder = new StringBuilder().append("Scrapped or attached views may not be recycled. isScrap:").append(paramViewHolder.isScrap()).append(" isAttached:");
        if (itemView.getParent() != null) {}
        for (;;)
        {
          throw new IllegalArgumentException(bool);
          bool = false;
        }
      }
      if (paramViewHolder.isTmpDetached()) {
        throw new IllegalArgumentException("Tmp detached view should be removed from RecyclerView before it can be recycled: " + paramViewHolder);
      }
      if (paramViewHolder.shouldIgnore()) {
        throw new IllegalArgumentException("Trying to recycle an ignored view holder. You should first call stopIgnoringView(view) before calling recycle.");
      }
      bool = RecyclerView.ViewHolder.access$4000(paramViewHolder);
      if ((mAdapter != null) && (bool) && (mAdapter.onFailedToRecycleView(paramViewHolder))) {}
      for (int i = 1;; i = 0)
      {
        int j = 0;
        int n = 0;
        int m = 0;
        int k;
        if (i == 0)
        {
          k = m;
          if (!paramViewHolder.isRecyclable()) {}
        }
        else
        {
          i = n;
          if (!paramViewHolder.hasAnyOfTheFlags(78))
          {
            j = mCachedViews.size();
            if ((j == mViewCacheMax) && (j > 0)) {
              recycleCachedViewAt(0);
            }
            i = n;
            if (j < mViewCacheMax)
            {
              mCachedViews.add(paramViewHolder);
              i = 1;
            }
          }
          j = i;
          k = m;
          if (i == 0)
          {
            addViewHolderToRecycledViewPool(paramViewHolder);
            k = 1;
            j = i;
          }
        }
        mState.onViewRecycled(paramViewHolder);
        if ((j == 0) && (k == 0) && (bool)) {
          mOwnerRecyclerView = null;
        }
        return;
      }
    }
    
    void scrapView(View paramView)
    {
      paramView = RecyclerView.getChildViewHolderInt(paramView);
      paramView.setScrapContainer(this);
      if ((!paramView.isChanged()) || (!RecyclerView.this.supportsChangeAnimations()))
      {
        if ((paramView.isInvalid()) && (!paramView.isRemoved()) && (!mAdapter.hasStableIds())) {
          throw new IllegalArgumentException("Called scrap view with an invalid view. Invalid views cannot be reused from scrap, they should rebound from recycler pool.");
        }
        mAttachedScrap.add(paramView);
        return;
      }
      if (mChangedScrap == null) {
        mChangedScrap = new ArrayList();
      }
      mChangedScrap.add(paramView);
    }
    
    void setAdapterPositionsAsUnknown()
    {
      int j = mCachedViews.size();
      int i = 0;
      while (i < j)
      {
        RecyclerView.ViewHolder localViewHolder = (RecyclerView.ViewHolder)mCachedViews.get(i);
        if (localViewHolder != null) {
          localViewHolder.addFlags(512);
        }
        i += 1;
      }
    }
    
    void setRecycledViewPool(RecyclerView.RecycledViewPool paramRecycledViewPool)
    {
      if (mRecyclerPool != null) {
        mRecyclerPool.detach();
      }
      mRecyclerPool = paramRecycledViewPool;
      if (paramRecycledViewPool != null) {
        mRecyclerPool.attach(getAdapter());
      }
    }
    
    void setViewCacheExtension(RecyclerView.ViewCacheExtension paramViewCacheExtension)
    {
      mViewCacheExtension = paramViewCacheExtension;
    }
    
    public void setViewCacheSize(int paramInt)
    {
      mViewCacheMax = paramInt;
      int i = mCachedViews.size() - 1;
      while ((i >= 0) && (mCachedViews.size() > paramInt))
      {
        recycleCachedViewAt(i);
        i -= 1;
      }
    }
    
    void unscrapView(RecyclerView.ViewHolder paramViewHolder)
    {
      if ((!paramViewHolder.isChanged()) || (!RecyclerView.this.supportsChangeAnimations()) || (mChangedScrap == null)) {
        mAttachedScrap.remove(paramViewHolder);
      }
      for (;;)
      {
        RecyclerView.ViewHolder.access$4102(paramViewHolder, null);
        paramViewHolder.clearReturnedFromScrapFlag();
        return;
        mChangedScrap.remove(paramViewHolder);
      }
    }
    
    boolean validateViewHolderForOffsetPosition(RecyclerView.ViewHolder paramViewHolder)
    {
      if (paramViewHolder.isRemoved()) {}
      do
      {
        return true;
        if ((mPosition < 0) || (mPosition >= mAdapter.getItemCount())) {
          throw new IndexOutOfBoundsException("Inconsistency detected. Invalid view holder adapter position" + paramViewHolder);
        }
        if ((!mState.isPreLayout()) && (mAdapter.getItemViewType(mPosition) != paramViewHolder.getItemViewType())) {
          return false;
        }
      } while ((!mAdapter.hasStableIds()) || (paramViewHolder.getItemId() == mAdapter.getItemId(mPosition)));
      return false;
    }
    
    void viewRangeUpdate(int paramInt1, int paramInt2)
    {
      int i = mCachedViews.size() - 1;
      if (i >= 0)
      {
        RecyclerView.ViewHolder localViewHolder = (RecyclerView.ViewHolder)mCachedViews.get(i);
        if (localViewHolder == null) {}
        for (;;)
        {
          i -= 1;
          break;
          int j = localViewHolder.getLayoutPosition();
          if ((j >= paramInt1) && (j < paramInt1 + paramInt2))
          {
            localViewHolder.addFlags(2);
            recycleCachedViewAt(i);
          }
        }
      }
    }
  }
  
  public static abstract interface RecyclerListener
  {
    public abstract void onViewRecycled(RecyclerView.ViewHolder paramViewHolder);
  }
  
  private class RecyclerViewDataObserver
    extends RecyclerView.AdapterDataObserver
  {
    private RecyclerViewDataObserver() {}
    
    public void onChanged()
    {
      assertNotInLayoutOrScroll(null);
      if (mAdapter.hasStableIds())
      {
        RecyclerView.State.access$1202(mState, true);
        RecyclerView.this.setDataSetChangedAfterLayout();
      }
      for (;;)
      {
        if (!mAdapterHelper.hasPendingUpdates()) {
          requestLayout();
        }
        return;
        RecyclerView.State.access$1202(mState, true);
        RecyclerView.this.setDataSetChangedAfterLayout();
      }
    }
    
    public void onItemRangeRemoved(int paramInt1, int paramInt2)
    {
      assertNotInLayoutOrScroll(null);
      if (mAdapterHelper.onItemRangeRemoved(paramInt1, paramInt2)) {
        triggerUpdateProcessor();
      }
    }
    
    void triggerUpdateProcessor()
    {
      if ((mPostUpdatesOnAnimation) && (mHasFixedSize) && (mIsAttached))
      {
        ViewCompat.postOnAnimation(RecyclerView.this, mUpdateChildViewsRunnable);
        return;
      }
      RecyclerView.access$3602(RecyclerView.this, true);
      requestLayout();
    }
  }
  
  static class SavedState
    extends View.BaseSavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public RecyclerView.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new RecyclerView.SavedState(paramAnonymousParcel);
      }
      
      public RecyclerView.SavedState[] newArray(int paramAnonymousInt)
      {
        return new RecyclerView.SavedState[paramAnonymousInt];
      }
    };
    Parcelable mLayoutState;
    
    SavedState(Parcel paramParcel)
    {
      super();
      mLayoutState = paramParcel.readParcelable(RecyclerView.LayoutManager.class.getClassLoader());
    }
    
    SavedState(Parcelable paramParcelable)
    {
      super();
    }
    
    private void copyFrom(SavedState paramSavedState)
    {
      mLayoutState = mLayoutState;
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      paramParcel.writeParcelable(mLayoutState, 0);
    }
  }
  
  public static abstract class SmoothScroller
  {
    private RecyclerView.LayoutManager mLayoutManager;
    private boolean mPendingInitialRun;
    private RecyclerView mRecyclerView;
    private final Action mRecyclingAction = new Action(0, 0);
    private boolean mRunning;
    private int mTargetPosition = -1;
    private View mTargetView;
    
    public SmoothScroller() {}
    
    private void onAnimation(int paramInt1, int paramInt2)
    {
      RecyclerView localRecyclerView = mRecyclerView;
      if ((!mRunning) || (mTargetPosition == -1) || (localRecyclerView == null)) {
        stop();
      }
      mPendingInitialRun = false;
      if (mTargetView != null)
      {
        if (getChildPosition(mTargetView) != mTargetPosition) {
          break label151;
        }
        onTargetFound(mTargetView, mState, mRecyclingAction);
        mRecyclingAction.runIfNecessary(localRecyclerView);
        stop();
      }
      for (;;)
      {
        if (mRunning)
        {
          onSeekTargetStep(paramInt1, paramInt2, mState, mRecyclingAction);
          boolean bool = mRecyclingAction.hasJumpTarget();
          mRecyclingAction.runIfNecessary(localRecyclerView);
          if (bool)
          {
            if (!mRunning) {
              break;
            }
            mPendingInitialRun = true;
            mViewFlinger.postOnAnimation();
          }
        }
        return;
        label151:
        Log.e("RecyclerView", "Passed over target position while smooth scrolling.");
        mTargetView = null;
      }
      stop();
    }
    
    public View findViewByPosition(int paramInt)
    {
      return mRecyclerView.mLayout.findViewByPosition(paramInt);
    }
    
    public int getChildCount()
    {
      return mRecyclerView.mLayout.getChildCount();
    }
    
    public int getChildPosition(View paramView)
    {
      return mRecyclerView.getChildLayoutPosition(paramView);
    }
    
    public RecyclerView.LayoutManager getLayoutManager()
    {
      return mLayoutManager;
    }
    
    public int getTargetPosition()
    {
      return mTargetPosition;
    }
    
    public boolean isPendingInitialRun()
    {
      return mPendingInitialRun;
    }
    
    public boolean isRunning()
    {
      return mRunning;
    }
    
    protected void normalize(PointF paramPointF)
    {
      double d = Math.sqrt(x * x + y * y);
      x = ((float)(x / d));
      y = ((float)(y / d));
    }
    
    protected void onChildAttachedToWindow(View paramView)
    {
      if (getChildPosition(paramView) == getTargetPosition()) {
        mTargetView = paramView;
      }
    }
    
    protected abstract void onSeekTargetStep(int paramInt1, int paramInt2, RecyclerView.State paramState, Action paramAction);
    
    protected abstract void onStart();
    
    protected abstract void onStop();
    
    protected abstract void onTargetFound(View paramView, RecyclerView.State paramState, Action paramAction);
    
    public void setTargetPosition(int paramInt)
    {
      mTargetPosition = paramInt;
    }
    
    void start(RecyclerView paramRecyclerView, RecyclerView.LayoutManager paramLayoutManager)
    {
      mRecyclerView = paramRecyclerView;
      mLayoutManager = paramLayoutManager;
      if (mTargetPosition == -1) {
        throw new IllegalArgumentException("Invalid target position");
      }
      RecyclerView.State.access$4702(mRecyclerView.mState, mTargetPosition);
      mRunning = true;
      mPendingInitialRun = true;
      mTargetView = findViewByPosition(getTargetPosition());
      onStart();
      mRecyclerView.mViewFlinger.postOnAnimation();
    }
    
    protected final void stop()
    {
      if (!mRunning) {
        return;
      }
      onStop();
      RecyclerView.State.access$4702(mRecyclerView.mState, -1);
      mTargetView = null;
      mTargetPosition = -1;
      mPendingInitialRun = false;
      mRunning = false;
      mLayoutManager.onSmoothScrollerStopped(this);
      mLayoutManager = null;
      mRecyclerView = null;
    }
    
    public static class Action
    {
      private boolean changed = false;
      private int consecutiveUpdates = 0;
      private int mDuration;
      private int mDx;
      private int mDy;
      private Interpolator mInterpolator;
      private int mJumpToPosition = -1;
      
      public Action(int paramInt1, int paramInt2)
      {
        this(paramInt1, paramInt2, Integer.MIN_VALUE, null);
      }
      
      public Action(int paramInt1, int paramInt2, int paramInt3, Interpolator paramInterpolator)
      {
        mDx = paramInt1;
        mDy = paramInt2;
        mDuration = paramInt3;
        mInterpolator = paramInterpolator;
      }
      
      private void runIfNecessary(RecyclerView paramRecyclerView)
      {
        if (mJumpToPosition >= 0)
        {
          int i = mJumpToPosition;
          mJumpToPosition = -1;
          paramRecyclerView.jumpToPositionForSmoothScroller(i);
          changed = false;
          return;
        }
        if (changed)
        {
          validate();
          if (mInterpolator == null) {
            if (mDuration == Integer.MIN_VALUE) {
              mViewFlinger.smoothScrollBy(mDx, mDy);
            }
          }
          for (;;)
          {
            consecutiveUpdates += 1;
            if (consecutiveUpdates > 10) {
              Log.e("RecyclerView", "Smooth Scroll action is being updated too frequently. Make sure you are not changing it unless necessary");
            }
            changed = false;
            return;
            mViewFlinger.smoothScrollBy(mDx, mDy, mDuration);
            continue;
            mViewFlinger.smoothScrollBy(mDx, mDy, mDuration, mInterpolator);
          }
        }
        consecutiveUpdates = 0;
      }
      
      private void validate()
      {
        if ((mInterpolator != null) && (mDuration < 1)) {
          throw new IllegalStateException("If you provide an interpolator, you must set a positive duration");
        }
        if (mDuration < 1) {
          throw new IllegalStateException("Scroll duration must be a positive number");
        }
      }
      
      boolean hasJumpTarget()
      {
        return mJumpToPosition >= 0;
      }
      
      public void jumpTo(int paramInt)
      {
        mJumpToPosition = paramInt;
      }
      
      public void update(int paramInt1, int paramInt2, int paramInt3, Interpolator paramInterpolator)
      {
        mDx = paramInt1;
        mDy = paramInt2;
        mDuration = paramInt3;
        mInterpolator = paramInterpolator;
        changed = true;
      }
    }
  }
  
  public static class State
  {
    private SparseArray<Object> mData;
    private int mDeletedInvisibleItemCountSincePreviousLayout = 0;
    final List<View> mDisappearingViewsInLayoutPass = new ArrayList();
    private boolean mInPreLayout = false;
    int mItemCount = 0;
    ArrayMap<Long, RecyclerView.ViewHolder> mOldChangedHolders = new ArrayMap();
    ArrayMap<RecyclerView.ViewHolder, RecyclerView.ItemHolderInfo> mPostLayoutHolderMap = new ArrayMap();
    ArrayMap<RecyclerView.ViewHolder, RecyclerView.ItemHolderInfo> mPreLayoutHolderMap = new ArrayMap();
    private int mPreviousLayoutItemCount = 0;
    private boolean mRunPredictiveAnimations = false;
    private boolean mRunSimpleAnimations = false;
    private boolean mStructureChanged = false;
    private int mTargetPosition = -1;
    
    public State() {}
    
    private void removeFrom(ArrayMap<Long, RecyclerView.ViewHolder> paramArrayMap, RecyclerView.ViewHolder paramViewHolder)
    {
      int i = paramArrayMap.size() - 1;
      for (;;)
      {
        if (i >= 0)
        {
          if (paramViewHolder == paramArrayMap.valueAt(i)) {
            paramArrayMap.removeAt(i);
          }
        }
        else {
          return;
        }
        i -= 1;
      }
    }
    
    void addToDisappearingList(View paramView)
    {
      if (!mDisappearingViewsInLayoutPass.contains(paramView)) {
        mDisappearingViewsInLayoutPass.add(paramView);
      }
    }
    
    public boolean didStructureChange()
    {
      return mStructureChanged;
    }
    
    public int getItemCount()
    {
      if (mInPreLayout) {
        return mPreviousLayoutItemCount - mDeletedInvisibleItemCountSincePreviousLayout;
      }
      return mItemCount;
    }
    
    public int getTargetScrollPosition()
    {
      return mTargetPosition;
    }
    
    public boolean hasTargetScrollPosition()
    {
      return mTargetPosition != -1;
    }
    
    public boolean isPreLayout()
    {
      return mInPreLayout;
    }
    
    void onViewRecycled(RecyclerView.ViewHolder paramViewHolder)
    {
      mPreLayoutHolderMap.remove(paramViewHolder);
      mPostLayoutHolderMap.remove(paramViewHolder);
      if (mOldChangedHolders != null) {
        removeFrom(mOldChangedHolders, paramViewHolder);
      }
      mDisappearingViewsInLayoutPass.remove(itemView);
    }
    
    void removeFromDisappearingList(View paramView)
    {
      mDisappearingViewsInLayoutPass.remove(paramView);
    }
    
    public String toString()
    {
      return "State{mTargetPosition=" + mTargetPosition + ", mPreLayoutHolderMap=" + mPreLayoutHolderMap + ", mPostLayoutHolderMap=" + mPostLayoutHolderMap + ", mData=" + mData + ", mItemCount=" + mItemCount + ", mPreviousLayoutItemCount=" + mPreviousLayoutItemCount + ", mDeletedInvisibleItemCountSincePreviousLayout=" + mDeletedInvisibleItemCountSincePreviousLayout + ", mStructureChanged=" + mStructureChanged + ", mInPreLayout=" + mInPreLayout + ", mRunSimpleAnimations=" + mRunSimpleAnimations + ", mRunPredictiveAnimations=" + mRunPredictiveAnimations + '}';
    }
    
    public boolean willRunPredictiveAnimations()
    {
      return mRunPredictiveAnimations;
    }
  }
  
  public static abstract class ViewCacheExtension
  {
    public abstract View getViewForPositionAndType(RecyclerView.Recycler paramRecycler, int paramInt1, int paramInt2);
  }
  
  private class ViewFlinger
    implements Runnable
  {
    private boolean mEatRunOnAnimationRequest = false;
    private Interpolator mInterpolator = RecyclerView.sQuinticInterpolator;
    private int mLastFlingX;
    private int mLastFlingY;
    private boolean mReSchedulePostAnimationCallback = false;
    private ScrollerCompat mScroller = ScrollerCompat.create(getContext(), RecyclerView.sQuinticInterpolator);
    
    public ViewFlinger() {}
    
    private int computeScrollDuration(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      int j = Math.abs(paramInt1);
      int k = Math.abs(paramInt2);
      int i;
      if (j > k)
      {
        i = 1;
        paramInt3 = (int)Math.sqrt(paramInt3 * paramInt3 + paramInt4 * paramInt4);
        paramInt2 = (int)Math.sqrt(paramInt1 * paramInt1 + paramInt2 * paramInt2);
        if (i == 0) {
          break label140;
        }
      }
      label140:
      for (paramInt1 = getWidth();; paramInt1 = getHeight())
      {
        paramInt4 = paramInt1 / 2;
        float f3 = Math.min(1.0F, 1.0F * paramInt2 / paramInt1);
        float f1 = paramInt4;
        float f2 = paramInt4;
        f3 = distanceInfluenceForSnapDuration(f3);
        if (paramInt3 <= 0) {
          break label151;
        }
        paramInt1 = Math.round(1000.0F * Math.abs((f1 + f2 * f3) / paramInt3)) * 4;
        return Math.min(paramInt1, 2000);
        i = 0;
        break;
      }
      label151:
      if (i != 0) {}
      for (paramInt2 = j;; paramInt2 = k)
      {
        paramInt1 = (int)((paramInt2 / paramInt1 + 1.0F) * 300.0F);
        break;
      }
    }
    
    private void disableRunOnAnimationRequests()
    {
      mReSchedulePostAnimationCallback = false;
      mEatRunOnAnimationRequest = true;
    }
    
    private float distanceInfluenceForSnapDuration(float paramFloat)
    {
      return (float)Math.sin((float)((paramFloat - 0.5F) * 0.4712389167638204D));
    }
    
    private void enableRunOnAnimationRequests()
    {
      mEatRunOnAnimationRequest = false;
      if (mReSchedulePostAnimationCallback) {
        postOnAnimation();
      }
    }
    
    public void fling(int paramInt1, int paramInt2)
    {
      RecyclerView.this.setScrollState(2);
      mLastFlingY = 0;
      mLastFlingX = 0;
      mScroller.fling(0, 0, paramInt1, paramInt2, Integer.MIN_VALUE, Integer.MAX_VALUE, Integer.MIN_VALUE, Integer.MAX_VALUE);
      postOnAnimation();
    }
    
    void postOnAnimation()
    {
      if (mEatRunOnAnimationRequest)
      {
        mReSchedulePostAnimationCallback = true;
        return;
      }
      removeCallbacks(this);
      ViewCompat.postOnAnimation(RecyclerView.this, this);
    }
    
    public void run()
    {
      disableRunOnAnimationRequests();
      RecyclerView.this.consumePendingUpdateOperations();
      ScrollerCompat localScrollerCompat = mScroller;
      RecyclerView.SmoothScroller localSmoothScroller = mLayout.mSmoothScroller;
      int i4;
      int i5;
      int n;
      int i;
      int i3;
      int m;
      int i1;
      int j;
      int i2;
      int k;
      if (localScrollerCompat.computeScrollOffset())
      {
        int i6 = localScrollerCompat.getCurrX();
        int i7 = localScrollerCompat.getCurrY();
        i4 = i6 - mLastFlingX;
        i5 = i7 - mLastFlingY;
        n = 0;
        i = 0;
        i3 = 0;
        m = 0;
        mLastFlingX = i6;
        mLastFlingY = i7;
        i1 = 0;
        j = 0;
        i2 = 0;
        k = 0;
        if (mAdapter != null)
        {
          eatRequestLayout();
          RecyclerView.this.onEnterLayoutOrScroll();
          TraceCompat.beginSection("RV Scroll");
          if (i4 != 0)
          {
            i = mLayout.scrollHorizontallyBy(i4, mRecycler, mState);
            j = i4 - i;
          }
          if (i5 != 0)
          {
            m = mLayout.scrollVerticallyBy(i5, mRecycler, mState);
            k = i5 - m;
          }
          TraceCompat.endSection();
          if (RecyclerView.this.supportsChangeAnimations())
          {
            i1 = mChildHelper.getChildCount();
            n = 0;
            while (n < i1)
            {
              View localView = mChildHelper.getChildAt(n);
              Object localObject = getChildViewHolder(localView);
              if ((localObject != null) && (mShadowingHolder != null))
              {
                localObject = mShadowingHolder.itemView;
                i2 = localView.getLeft();
                i3 = localView.getTop();
                if ((i2 != ((View)localObject).getLeft()) || (i3 != ((View)localObject).getTop())) {
                  ((View)localObject).layout(i2, i3, ((View)localObject).getWidth() + i2, ((View)localObject).getHeight() + i3);
                }
              }
              n += 1;
            }
          }
          RecyclerView.this.onExitLayoutOrScroll();
          resumeRequestLayout(false);
          n = i;
          i1 = j;
          i2 = k;
          i3 = m;
          if (localSmoothScroller != null)
          {
            n = i;
            i1 = j;
            i2 = k;
            i3 = m;
            if (!localSmoothScroller.isPendingInitialRun())
            {
              n = i;
              i1 = j;
              i2 = k;
              i3 = m;
              if (localSmoothScroller.isRunning())
              {
                n = mState.getItemCount();
                if (n != 0) {
                  break label793;
                }
                localSmoothScroller.stop();
                i3 = m;
                i2 = k;
                i1 = j;
                n = i;
              }
            }
          }
        }
        if (!mItemDecorations.isEmpty()) {
          invalidate();
        }
        if (ViewCompat.getOverScrollMode(RecyclerView.this) != 2) {
          RecyclerView.this.considerReleasingGlowsOnScroll(i4, i5);
        }
        if ((i1 != 0) || (i2 != 0))
        {
          k = (int)localScrollerCompat.getCurrVelocity();
          i = 0;
          if (i1 != i6)
          {
            if (i1 >= 0) {
              break label870;
            }
            i = -k;
          }
          label544:
          j = 0;
          if (i2 != i7)
          {
            if (i2 >= 0) {
              break label885;
            }
            j = -k;
          }
          label561:
          if (ViewCompat.getOverScrollMode(RecyclerView.this) != 2) {
            absorbGlows(i, j);
          }
          if (((i != 0) || (i1 == i6) || (localScrollerCompat.getFinalX() == 0)) && ((j != 0) || (i2 == i7) || (localScrollerCompat.getFinalY() == 0))) {
            localScrollerCompat.abortAnimation();
          }
        }
        if ((n != 0) || (i3 != 0)) {
          dispatchOnScrolled(n, i3);
        }
        if (!awakenScrollBars()) {
          invalidate();
        }
        if ((i5 == 0) || (!mLayout.canScrollVertically()) || (i3 != i5)) {
          break label900;
        }
        i = 1;
        label689:
        if ((i4 == 0) || (!mLayout.canScrollHorizontally()) || (n != i4)) {
          break label905;
        }
        j = 1;
        label716:
        if (((i4 != 0) || (i5 != 0)) && (j == 0) && (i == 0)) {
          break label910;
        }
        i = 1;
        label736:
        if ((!localScrollerCompat.isFinished()) && (i != 0)) {
          break label915;
        }
        RecyclerView.this.setScrollState(0);
      }
      for (;;)
      {
        if (localSmoothScroller != null)
        {
          if (localSmoothScroller.isPendingInitialRun()) {
            localSmoothScroller.onAnimation(0, 0);
          }
          if (!mReSchedulePostAnimationCallback) {
            localSmoothScroller.stop();
          }
        }
        enableRunOnAnimationRequests();
        return;
        label793:
        if (localSmoothScroller.getTargetPosition() >= n)
        {
          localSmoothScroller.setTargetPosition(n - 1);
          localSmoothScroller.onAnimation(i4 - j, i5 - k);
          n = i;
          i1 = j;
          i2 = k;
          i3 = m;
          break;
        }
        localSmoothScroller.onAnimation(i4 - j, i5 - k);
        n = i;
        i1 = j;
        i2 = k;
        i3 = m;
        break;
        label870:
        if (i1 > 0)
        {
          i = k;
          break label544;
        }
        i = 0;
        break label544;
        label885:
        if (i2 > 0)
        {
          j = k;
          break label561;
        }
        j = 0;
        break label561;
        label900:
        i = 0;
        break label689;
        label905:
        j = 0;
        break label716;
        label910:
        i = 0;
        break label736;
        label915:
        postOnAnimation();
      }
    }
    
    public void smoothScrollBy(int paramInt1, int paramInt2)
    {
      smoothScrollBy(paramInt1, paramInt2, 0, 0);
    }
    
    public void smoothScrollBy(int paramInt1, int paramInt2, int paramInt3)
    {
      smoothScrollBy(paramInt1, paramInt2, paramInt3, RecyclerView.sQuinticInterpolator);
    }
    
    public void smoothScrollBy(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      smoothScrollBy(paramInt1, paramInt2, computeScrollDuration(paramInt1, paramInt2, paramInt3, paramInt4));
    }
    
    public void smoothScrollBy(int paramInt1, int paramInt2, int paramInt3, Interpolator paramInterpolator)
    {
      if (mInterpolator != paramInterpolator)
      {
        mInterpolator = paramInterpolator;
        mScroller = ScrollerCompat.create(getContext(), paramInterpolator);
      }
      RecyclerView.this.setScrollState(2);
      mLastFlingY = 0;
      mLastFlingX = 0;
      mScroller.startScroll(0, 0, paramInt1, paramInt2, paramInt3);
      postOnAnimation();
    }
    
    public void stop()
    {
      removeCallbacks(this);
      mScroller.abortAnimation();
    }
  }
  
  public static abstract class ViewHolder
  {
    public final View itemView;
    private int mFlags;
    private int mIsRecyclableCount = 0;
    long mItemId = -1L;
    int mItemViewType = -1;
    int mOldPosition = -1;
    RecyclerView mOwnerRecyclerView;
    int mPosition = -1;
    int mPreLayoutPosition = -1;
    private RecyclerView.Recycler mScrapContainer = null;
    ViewHolder mShadowedHolder = null;
    ViewHolder mShadowingHolder = null;
    
    public ViewHolder(View paramView)
    {
      if (paramView == null) {
        throw new IllegalArgumentException("itemView may not be null");
      }
      itemView = paramView;
    }
    
    private boolean doesTransientStatePreventRecycling()
    {
      return ((mFlags & 0x10) == 0) && (ViewCompat.hasTransientState(itemView));
    }
    
    private boolean shouldBeKeptAsChild()
    {
      return (mFlags & 0x10) != 0;
    }
    
    void addFlags(int paramInt)
    {
      mFlags |= paramInt;
    }
    
    void clearOldPosition()
    {
      mOldPosition = -1;
      mPreLayoutPosition = -1;
    }
    
    void clearReturnedFromScrapFlag()
    {
      mFlags &= 0xFFFFFFDF;
    }
    
    void clearTmpDetachFlag()
    {
      mFlags &= 0xFEFF;
    }
    
    void flagRemovedAndOffsetPosition(int paramInt1, int paramInt2, boolean paramBoolean)
    {
      addFlags(8);
      offsetPosition(paramInt2, paramBoolean);
      mPosition = paramInt1;
    }
    
    public final int getAdapterPosition()
    {
      if (mOwnerRecyclerView == null) {
        return -1;
      }
      return mOwnerRecyclerView.getAdapterPositionFor(this);
    }
    
    public final long getItemId()
    {
      return mItemId;
    }
    
    public final int getItemViewType()
    {
      return mItemViewType;
    }
    
    public final int getLayoutPosition()
    {
      if (mPreLayoutPosition == -1) {
        return mPosition;
      }
      return mPreLayoutPosition;
    }
    
    @Deprecated
    public final int getPosition()
    {
      if (mPreLayoutPosition == -1) {
        return mPosition;
      }
      return mPreLayoutPosition;
    }
    
    boolean hasAnyOfTheFlags(int paramInt)
    {
      return (mFlags & paramInt) != 0;
    }
    
    boolean isAdapterPositionUnknown()
    {
      return ((mFlags & 0x200) != 0) || (isInvalid());
    }
    
    boolean isBound()
    {
      return (mFlags & 0x1) != 0;
    }
    
    boolean isChanged()
    {
      return (mFlags & 0x40) != 0;
    }
    
    boolean isInvalid()
    {
      return (mFlags & 0x4) != 0;
    }
    
    public final boolean isRecyclable()
    {
      return ((mFlags & 0x10) == 0) && (!ViewCompat.hasTransientState(itemView));
    }
    
    boolean isRemoved()
    {
      return (mFlags & 0x8) != 0;
    }
    
    boolean isScrap()
    {
      return mScrapContainer != null;
    }
    
    boolean isTmpDetached()
    {
      return (mFlags & 0x100) != 0;
    }
    
    boolean needsUpdate()
    {
      return (mFlags & 0x2) != 0;
    }
    
    void offsetPosition(int paramInt, boolean paramBoolean)
    {
      if (mOldPosition == -1) {
        mOldPosition = mPosition;
      }
      if (mPreLayoutPosition == -1) {
        mPreLayoutPosition = mPosition;
      }
      if (paramBoolean) {
        mPreLayoutPosition += paramInt;
      }
      mPosition += paramInt;
      if (itemView.getLayoutParams() != null) {
        itemView.getLayoutParams()).mInsetsDirty = true;
      }
    }
    
    void resetInternal()
    {
      mFlags = 0;
      mPosition = -1;
      mOldPosition = -1;
      mItemId = -1L;
      mPreLayoutPosition = -1;
      mIsRecyclableCount = 0;
      mShadowedHolder = null;
      mShadowingHolder = null;
    }
    
    void saveOldPosition()
    {
      if (mOldPosition == -1) {
        mOldPosition = mPosition;
      }
    }
    
    void setFlags(int paramInt1, int paramInt2)
    {
      mFlags = (mFlags & (paramInt2 ^ 0xFFFFFFFF) | paramInt1 & paramInt2);
    }
    
    public final void setIsRecyclable(boolean paramBoolean)
    {
      int i;
      if (paramBoolean)
      {
        i = mIsRecyclableCount - 1;
        mIsRecyclableCount = i;
        if (mIsRecyclableCount >= 0) {
          break label64;
        }
        mIsRecyclableCount = 0;
        Log.e("View", "isRecyclable decremented below 0: unmatched pair of setIsRecyable() calls for " + this);
      }
      label64:
      do
      {
        return;
        i = mIsRecyclableCount + 1;
        break;
        if ((!paramBoolean) && (mIsRecyclableCount == 1))
        {
          mFlags |= 0x10;
          return;
        }
      } while ((!paramBoolean) || (mIsRecyclableCount != 0));
      mFlags &= 0xFFFFFFEF;
    }
    
    void setScrapContainer(RecyclerView.Recycler paramRecycler)
    {
      mScrapContainer = paramRecycler;
    }
    
    boolean shouldIgnore()
    {
      return (mFlags & 0x80) != 0;
    }
    
    public String toString()
    {
      StringBuilder localStringBuilder = new StringBuilder("ViewHolder{" + Integer.toHexString(hashCode()) + " position=" + mPosition + " id=" + mItemId + ", oldPos=" + mOldPosition + ", pLpos:" + mPreLayoutPosition);
      if (isScrap()) {
        localStringBuilder.append(" scrap");
      }
      if (isInvalid()) {
        localStringBuilder.append(" invalid");
      }
      if (!isBound()) {
        localStringBuilder.append(" unbound");
      }
      if (needsUpdate()) {
        localStringBuilder.append(" update");
      }
      if (isRemoved()) {
        localStringBuilder.append(" removed");
      }
      if (shouldIgnore()) {
        localStringBuilder.append(" ignored");
      }
      if (isChanged()) {
        localStringBuilder.append(" changed");
      }
      if (isTmpDetached()) {
        localStringBuilder.append(" tmpDetached");
      }
      if (!isRecyclable()) {
        localStringBuilder.append(" not recyclable(" + mIsRecyclableCount + ")");
      }
      if (isAdapterPositionUnknown()) {
        localStringBuilder.append("undefined adapter position");
      }
      if (itemView.getParent() == null) {
        localStringBuilder.append(" no parent");
      }
      localStringBuilder.append("}");
      return localStringBuilder.toString();
    }
    
    void unScrap()
    {
      mScrapContainer.unscrapView(this);
    }
    
    boolean wasReturnedFromScrap()
    {
      return (mFlags & 0x20) != 0;
    }
  }
}
