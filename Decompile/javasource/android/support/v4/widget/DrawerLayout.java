package android.support.v4.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.os.SystemClock;
import android.support.v4.content.ContextCompat;
import android.support.v4.view.AccessibilityDelegateCompat;
import android.support.v4.view.GravityCompat;
import android.support.v4.view.KeyEventCompat;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewGroupCompat;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import java.util.List;

public class DrawerLayout
  extends ViewGroup
  implements DrawerLayoutImpl
{
  private static final boolean CAN_HIDE_DESCENDANTS;
  static final DrawerLayoutCompatImpl IMPL = new DrawerLayoutCompatImplBase();
  private static final int[] LAYOUT_ATTRS;
  private final ChildAccessibilityDelegate mChildAccessibilityDelegate = new ChildAccessibilityDelegate();
  private boolean mChildrenCanceledTouch;
  private boolean mDisallowInterceptRequested;
  private boolean mDrawStatusBarBackground;
  private int mDrawerState;
  private boolean mFirstLayout = true;
  private boolean mInLayout;
  private float mInitialMotionX;
  private float mInitialMotionY;
  private Object mLastInsets;
  private final ViewDragCallback mLeftCallback;
  private final ViewDragHelper mLeftDragger;
  private DrawerListener mListener;
  private int mLockModeLeft;
  private int mLockModeRight;
  private int mMinDrawerMargin;
  private final ViewDragCallback mRightCallback;
  private final ViewDragHelper mRightDragger;
  private int mScrimColor = -1728053248;
  private float mScrimOpacity;
  private Paint mScrimPaint = new Paint();
  private Drawable mShadowLeft;
  private Drawable mShadowRight;
  private Drawable mStatusBarBackground;
  private CharSequence mTitleLeft;
  private CharSequence mTitleRight;
  
  static
  {
    boolean bool = true;
    LAYOUT_ATTRS = new int[] { 16842931 };
    if (Build.VERSION.SDK_INT >= 19) {}
    for (;;)
    {
      CAN_HIDE_DESCENDANTS = bool;
      if (Build.VERSION.SDK_INT < 21) {
        break;
      }
      IMPL = new DrawerLayoutCompatImplApi21();
      return;
      bool = false;
    }
  }
  
  public DrawerLayout(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public DrawerLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public DrawerLayout(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    setDescendantFocusability(262144);
    float f = getResourcesgetDisplayMetricsdensity;
    mMinDrawerMargin = ((int)(64.0F * f + 0.5F));
    f = 400.0F * f;
    mLeftCallback = new ViewDragCallback(3);
    mRightCallback = new ViewDragCallback(5);
    mLeftDragger = ViewDragHelper.create(this, 1.0F, mLeftCallback);
    mLeftDragger.setEdgeTrackingEnabled(1);
    mLeftDragger.setMinVelocity(f);
    mLeftCallback.setDragger(mLeftDragger);
    mRightDragger = ViewDragHelper.create(this, 1.0F, mRightCallback);
    mRightDragger.setEdgeTrackingEnabled(2);
    mRightDragger.setMinVelocity(f);
    mRightCallback.setDragger(mRightDragger);
    setFocusableInTouchMode(true);
    ViewCompat.setImportantForAccessibility(this, 1);
    ViewCompat.setAccessibilityDelegate(this, new AccessibilityDelegate());
    ViewGroupCompat.setMotionEventSplittingEnabled(this, false);
    if (ViewCompat.getFitsSystemWindows(this))
    {
      IMPL.configureApplyInsets(this);
      mStatusBarBackground = IMPL.getDefaultStatusBarBackground(paramContext);
    }
  }
  
  private View findVisibleDrawer()
  {
    int j = getChildCount();
    int i = 0;
    while (i < j)
    {
      View localView = getChildAt(i);
      if ((isDrawerView(localView)) && (isDrawerVisible(localView))) {
        return localView;
      }
      i += 1;
    }
    return null;
  }
  
  static String gravityToString(int paramInt)
  {
    if ((paramInt & 0x3) == 3) {
      return "LEFT";
    }
    if ((paramInt & 0x5) == 5) {
      return "RIGHT";
    }
    return Integer.toHexString(paramInt);
  }
  
  private static boolean hasOpaqueBackground(View paramView)
  {
    boolean bool2 = false;
    paramView = paramView.getBackground();
    boolean bool1 = bool2;
    if (paramView != null)
    {
      bool1 = bool2;
      if (paramView.getOpacity() == -1) {
        bool1 = true;
      }
    }
    return bool1;
  }
  
  private boolean hasPeekingDrawer()
  {
    int j = getChildCount();
    int i = 0;
    while (i < j)
    {
      if (getChildAtgetLayoutParamsisPeeking) {
        return true;
      }
      i += 1;
    }
    return false;
  }
  
  private boolean hasVisibleDrawer()
  {
    return findVisibleDrawer() != null;
  }
  
  private static boolean includeChildForAccessibility(View paramView)
  {
    return (ViewCompat.getImportantForAccessibility(paramView) != 4) && (ViewCompat.getImportantForAccessibility(paramView) != 2);
  }
  
  private void updateChildrenImportantForAccessibility(View paramView, boolean paramBoolean)
  {
    int j = getChildCount();
    int i = 0;
    if (i < j)
    {
      View localView = getChildAt(i);
      if (((!paramBoolean) && (!isDrawerView(localView))) || ((paramBoolean) && (localView == paramView))) {
        ViewCompat.setImportantForAccessibility(localView, 1);
      }
      for (;;)
      {
        i += 1;
        break;
        ViewCompat.setImportantForAccessibility(localView, 4);
      }
    }
  }
  
  public void addView(View paramView, int paramInt, ViewGroup.LayoutParams paramLayoutParams)
  {
    super.addView(paramView, paramInt, paramLayoutParams);
    if ((findOpenDrawer() != null) || (isDrawerView(paramView))) {
      ViewCompat.setImportantForAccessibility(paramView, 4);
    }
    for (;;)
    {
      if (!CAN_HIDE_DESCENDANTS) {
        ViewCompat.setAccessibilityDelegate(paramView, mChildAccessibilityDelegate);
      }
      return;
      ViewCompat.setImportantForAccessibility(paramView, 1);
    }
  }
  
  void cancelChildViewTouch()
  {
    if (!mChildrenCanceledTouch)
    {
      long l = SystemClock.uptimeMillis();
      MotionEvent localMotionEvent = MotionEvent.obtain(l, l, 3, 0.0F, 0.0F, 0);
      int j = getChildCount();
      int i = 0;
      while (i < j)
      {
        getChildAt(i).dispatchTouchEvent(localMotionEvent);
        i += 1;
      }
      localMotionEvent.recycle();
      mChildrenCanceledTouch = true;
    }
  }
  
  boolean checkDrawerViewAbsoluteGravity(View paramView, int paramInt)
  {
    return (getDrawerViewAbsoluteGravity(paramView) & paramInt) == paramInt;
  }
  
  protected boolean checkLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    return ((paramLayoutParams instanceof LayoutParams)) && (super.checkLayoutParams(paramLayoutParams));
  }
  
  public void closeDrawer(View paramView)
  {
    if (!isDrawerView(paramView)) {
      throw new IllegalArgumentException("View " + paramView + " is not a sliding drawer");
    }
    if (mFirstLayout)
    {
      paramView = (LayoutParams)paramView.getLayoutParams();
      onScreen = 0.0F;
      knownOpen = false;
    }
    for (;;)
    {
      invalidate();
      return;
      if (checkDrawerViewAbsoluteGravity(paramView, 3)) {
        mLeftDragger.smoothSlideViewTo(paramView, -paramView.getWidth(), paramView.getTop());
      } else {
        mRightDragger.smoothSlideViewTo(paramView, getWidth(), paramView.getTop());
      }
    }
  }
  
  public void closeDrawers()
  {
    closeDrawers(false);
  }
  
  void closeDrawers(boolean paramBoolean)
  {
    int i = 0;
    int n = getChildCount();
    int j = 0;
    while (j < n)
    {
      View localView = getChildAt(j);
      LayoutParams localLayoutParams = (LayoutParams)localView.getLayoutParams();
      int k = i;
      if (isDrawerView(localView))
      {
        if ((paramBoolean) && (!isPeeking)) {
          k = i;
        }
      }
      else
      {
        j += 1;
        i = k;
        continue;
      }
      int m = localView.getWidth();
      if (checkDrawerViewAbsoluteGravity(localView, 3)) {
        i |= mLeftDragger.smoothSlideViewTo(localView, -m, localView.getTop());
      }
      for (;;)
      {
        isPeeking = false;
        m = i;
        break;
        i |= mRightDragger.smoothSlideViewTo(localView, getWidth(), localView.getTop());
      }
    }
    mLeftCallback.removeCallbacks();
    mRightCallback.removeCallbacks();
    if (i != 0) {
      invalidate();
    }
  }
  
  public void computeScroll()
  {
    int j = getChildCount();
    float f = 0.0F;
    int i = 0;
    while (i < j)
    {
      f = Math.max(f, getChildAtgetLayoutParamsonScreen);
      i += 1;
    }
    mScrimOpacity = f;
    if ((mLeftDragger.continueSettling(true) | mRightDragger.continueSettling(true))) {
      ViewCompat.postInvalidateOnAnimation(this);
    }
  }
  
  void dispatchOnDrawerClosed(View paramView)
  {
    LayoutParams localLayoutParams = (LayoutParams)paramView.getLayoutParams();
    if (knownOpen)
    {
      knownOpen = false;
      if (mListener != null) {
        mListener.onDrawerClosed(paramView);
      }
      updateChildrenImportantForAccessibility(paramView, false);
      if (hasWindowFocus())
      {
        paramView = getRootView();
        if (paramView != null) {
          paramView.sendAccessibilityEvent(32);
        }
      }
    }
  }
  
  void dispatchOnDrawerOpened(View paramView)
  {
    LayoutParams localLayoutParams = (LayoutParams)paramView.getLayoutParams();
    if (!knownOpen)
    {
      knownOpen = true;
      if (mListener != null) {
        mListener.onDrawerOpened(paramView);
      }
      updateChildrenImportantForAccessibility(paramView, true);
      if (hasWindowFocus()) {
        sendAccessibilityEvent(32);
      }
      paramView.requestFocus();
    }
  }
  
  void dispatchOnDrawerSlide(View paramView, float paramFloat)
  {
    if (mListener != null) {
      mListener.onDrawerSlide(paramView, paramFloat);
    }
  }
  
  protected boolean drawChild(Canvas paramCanvas, View paramView, long paramLong)
  {
    int i2 = getHeight();
    boolean bool1 = isContentView(paramView);
    int i = 0;
    int m = 0;
    int j = getWidth();
    int i3 = paramCanvas.save();
    int k = j;
    if (bool1)
    {
      int i4 = getChildCount();
      k = 0;
      i = m;
      if (k < i4)
      {
        View localView = getChildAt(k);
        m = i;
        int n = j;
        if (localView != paramView)
        {
          m = i;
          n = j;
          if (localView.getVisibility() == 0)
          {
            m = i;
            n = j;
            if (hasOpaqueBackground(localView))
            {
              m = i;
              n = j;
              if (isDrawerView(localView))
              {
                if (localView.getHeight() >= i2) {
                  break label166;
                }
                n = j;
                m = i;
              }
            }
          }
        }
        for (;;)
        {
          k += 1;
          i = m;
          j = n;
          break;
          label166:
          int i1;
          if (checkDrawerViewAbsoluteGravity(localView, 3))
          {
            i1 = localView.getRight();
            m = i;
            n = j;
            if (i1 > i)
            {
              m = i1;
              n = j;
            }
          }
          else
          {
            i1 = localView.getLeft();
            m = i;
            n = j;
            if (i1 < j)
            {
              n = i1;
              m = i;
            }
          }
        }
      }
      paramCanvas.clipRect(i, 0, j, getHeight());
      k = j;
    }
    boolean bool2 = super.drawChild(paramCanvas, paramView, paramLong);
    paramCanvas.restoreToCount(i3);
    if ((mScrimOpacity > 0.0F) && (bool1))
    {
      j = (int)(((mScrimColor & 0xFF000000) >>> 24) * mScrimOpacity);
      m = mScrimColor;
      mScrimPaint.setColor(j << 24 | m & 0xFFFFFF);
      paramCanvas.drawRect(i, 0.0F, k, getHeight(), mScrimPaint);
    }
    do
    {
      return bool2;
      if ((mShadowLeft != null) && (checkDrawerViewAbsoluteGravity(paramView, 3)))
      {
        i = mShadowLeft.getIntrinsicWidth();
        j = paramView.getRight();
        k = mLeftDragger.getEdgeSize();
        f = Math.max(0.0F, Math.min(j / k, 1.0F));
        mShadowLeft.setBounds(j, paramView.getTop(), j + i, paramView.getBottom());
        mShadowLeft.setAlpha((int)(255.0F * f));
        mShadowLeft.draw(paramCanvas);
        return bool2;
      }
    } while ((mShadowRight == null) || (!checkDrawerViewAbsoluteGravity(paramView, 5)));
    i = mShadowRight.getIntrinsicWidth();
    j = paramView.getLeft();
    k = getWidth();
    m = mRightDragger.getEdgeSize();
    float f = Math.max(0.0F, Math.min((k - j) / m, 1.0F));
    mShadowRight.setBounds(j - i, paramView.getTop(), j, paramView.getBottom());
    mShadowRight.setAlpha((int)(255.0F * f));
    mShadowRight.draw(paramCanvas);
    return bool2;
  }
  
  View findDrawerWithGravity(int paramInt)
  {
    int i = GravityCompat.getAbsoluteGravity(paramInt, ViewCompat.getLayoutDirection(this));
    int j = getChildCount();
    paramInt = 0;
    while (paramInt < j)
    {
      View localView = getChildAt(paramInt);
      if ((getDrawerViewAbsoluteGravity(localView) & 0x7) == (i & 0x7)) {
        return localView;
      }
      paramInt += 1;
    }
    return null;
  }
  
  View findOpenDrawer()
  {
    int j = getChildCount();
    int i = 0;
    while (i < j)
    {
      View localView = getChildAt(i);
      if (getLayoutParamsknownOpen) {
        return localView;
      }
      i += 1;
    }
    return null;
  }
  
  protected ViewGroup.LayoutParams generateDefaultLayoutParams()
  {
    return new LayoutParams(-1, -1);
  }
  
  public ViewGroup.LayoutParams generateLayoutParams(AttributeSet paramAttributeSet)
  {
    return new LayoutParams(getContext(), paramAttributeSet);
  }
  
  protected ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    if ((paramLayoutParams instanceof LayoutParams)) {
      return new LayoutParams((LayoutParams)paramLayoutParams);
    }
    if ((paramLayoutParams instanceof ViewGroup.MarginLayoutParams)) {
      return new LayoutParams((ViewGroup.MarginLayoutParams)paramLayoutParams);
    }
    return new LayoutParams(paramLayoutParams);
  }
  
  public int getDrawerLockMode(View paramView)
  {
    int i = getDrawerViewAbsoluteGravity(paramView);
    if (i == 3) {
      return mLockModeLeft;
    }
    if (i == 5) {
      return mLockModeRight;
    }
    return 0;
  }
  
  public CharSequence getDrawerTitle(int paramInt)
  {
    paramInt = GravityCompat.getAbsoluteGravity(paramInt, ViewCompat.getLayoutDirection(this));
    if (paramInt == 3) {
      return mTitleLeft;
    }
    if (paramInt == 5) {
      return mTitleRight;
    }
    return null;
  }
  
  int getDrawerViewAbsoluteGravity(View paramView)
  {
    return GravityCompat.getAbsoluteGravity(getLayoutParamsgravity, ViewCompat.getLayoutDirection(this));
  }
  
  float getDrawerViewOffset(View paramView)
  {
    return getLayoutParamsonScreen;
  }
  
  public Drawable getStatusBarBackgroundDrawable()
  {
    return mStatusBarBackground;
  }
  
  boolean isContentView(View paramView)
  {
    return getLayoutParamsgravity == 0;
  }
  
  boolean isDrawerView(View paramView)
  {
    return (GravityCompat.getAbsoluteGravity(getLayoutParamsgravity, ViewCompat.getLayoutDirection(paramView)) & 0x7) != 0;
  }
  
  public boolean isDrawerVisible(View paramView)
  {
    if (!isDrawerView(paramView)) {
      throw new IllegalArgumentException("View " + paramView + " is not a drawer");
    }
    return getLayoutParamsonScreen > 0.0F;
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
  }
  
  public void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    if ((mDrawStatusBarBackground) && (mStatusBarBackground != null))
    {
      int i = IMPL.getTopInset(mLastInsets);
      if (i > 0)
      {
        mStatusBarBackground.setBounds(0, 0, getWidth(), i);
        mStatusBarBackground.draw(paramCanvas);
      }
    }
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    boolean bool1 = false;
    int i = MotionEventCompat.getActionMasked(paramMotionEvent);
    boolean bool2 = mLeftDragger.shouldInterceptTouchEvent(paramMotionEvent);
    boolean bool3 = mRightDragger.shouldInterceptTouchEvent(paramMotionEvent);
    int k = 0;
    int j = 0;
    switch (i)
    {
    default: 
      i = j;
    }
    for (;;)
    {
      if (((bool2 | bool3)) || (i != 0) || (hasPeekingDrawer()) || (mChildrenCanceledTouch)) {
        bool1 = true;
      }
      return bool1;
      float f1 = paramMotionEvent.getX();
      float f2 = paramMotionEvent.getY();
      mInitialMotionX = f1;
      mInitialMotionY = f2;
      i = k;
      if (mScrimOpacity > 0.0F)
      {
        paramMotionEvent = mLeftDragger.findTopChildUnder((int)f1, (int)f2);
        i = k;
        if (paramMotionEvent != null)
        {
          i = k;
          if (isContentView(paramMotionEvent)) {
            i = 1;
          }
        }
      }
      mDisallowInterceptRequested = false;
      mChildrenCanceledTouch = false;
      continue;
      i = j;
      if (mLeftDragger.checkTouchSlop(3))
      {
        mLeftCallback.removeCallbacks();
        mRightCallback.removeCallbacks();
        i = j;
        continue;
        closeDrawers(true);
        mDisallowInterceptRequested = false;
        mChildrenCanceledTouch = false;
        i = j;
      }
    }
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if ((paramInt == 4) && (hasVisibleDrawer()))
    {
      KeyEventCompat.startTracking(paramKeyEvent);
      return true;
    }
    return super.onKeyDown(paramInt, paramKeyEvent);
  }
  
  public boolean onKeyUp(int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramInt == 4)
    {
      paramKeyEvent = findVisibleDrawer();
      if ((paramKeyEvent != null) && (getDrawerLockMode(paramKeyEvent) == 0)) {
        closeDrawers();
      }
      return paramKeyEvent != null;
    }
    return super.onKeyUp(paramInt, paramKeyEvent);
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    mInLayout = true;
    int m = paramInt3 - paramInt1;
    int n = getChildCount();
    paramInt3 = 0;
    if (paramInt3 < n)
    {
      View localView = getChildAt(paramInt3);
      if (localView.getVisibility() == 8) {}
      LayoutParams localLayoutParams;
      for (;;)
      {
        paramInt3 += 1;
        break;
        localLayoutParams = (LayoutParams)localView.getLayoutParams();
        if (!isContentView(localView)) {
          break label113;
        }
        localView.layout(leftMargin, topMargin, leftMargin + localView.getMeasuredWidth(), topMargin + localView.getMeasuredHeight());
      }
      label113:
      int i1 = localView.getMeasuredWidth();
      int i2 = localView.getMeasuredHeight();
      int i;
      float f;
      label165:
      int j;
      if (checkDrawerViewAbsoluteGravity(localView, 3))
      {
        i = -i1 + (int)(i1 * onScreen);
        f = (i1 + i) / i1;
        if (f == onScreen) {
          break label310;
        }
        j = 1;
        label179:
        switch (gravity & 0x70)
        {
        default: 
          localView.layout(i, topMargin, i + i1, topMargin + i2);
          label237:
          if (j != 0) {
            setDrawerViewOffset(localView, f);
          }
          if (onScreen <= 0.0F) {
            break;
          }
        }
      }
      for (paramInt1 = 0; localView.getVisibility() != paramInt1; paramInt1 = 4)
      {
        localView.setVisibility(paramInt1);
        break;
        i = m - (int)(i1 * onScreen);
        f = (m - i) / i1;
        break label165;
        label310:
        j = 0;
        break label179;
        paramInt1 = paramInt4 - paramInt2;
        localView.layout(i, paramInt1 - bottomMargin - localView.getMeasuredHeight(), i + i1, paramInt1 - bottomMargin);
        break label237;
        int i3 = paramInt4 - paramInt2;
        int k = (i3 - i2) / 2;
        if (k < topMargin) {
          paramInt1 = topMargin;
        }
        for (;;)
        {
          localView.layout(i, paramInt1, i + i1, paramInt1 + i2);
          break;
          paramInt1 = k;
          if (k + i2 > i3 - bottomMargin) {
            paramInt1 = i3 - bottomMargin - i2;
          }
        }
      }
    }
    mInLayout = false;
    mFirstLayout = false;
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int i1 = View.MeasureSpec.getMode(paramInt1);
    int n = View.MeasureSpec.getMode(paramInt2);
    int i = View.MeasureSpec.getSize(paramInt1);
    int m = View.MeasureSpec.getSize(paramInt2);
    int j;
    int k;
    if (i1 == 1073741824)
    {
      j = m;
      k = i;
      if (n == 1073741824) {}
    }
    else
    {
      if (!isInEditMode()) {
        break label184;
      }
      if (i1 != Integer.MIN_VALUE) {
        break label149;
      }
      if (n != Integer.MIN_VALUE) {
        break label161;
      }
      k = i;
      j = m;
    }
    label76:
    setMeasuredDimension(k, j);
    label100:
    label115:
    View localView;
    if ((mLastInsets != null) && (ViewCompat.getFitsSystemWindows(this)))
    {
      i = 1;
      n = ViewCompat.getLayoutDirection(this);
      i1 = getChildCount();
      m = 0;
      if (m >= i1) {
        return;
      }
      localView = getChildAt(m);
      if (localView.getVisibility() != 8) {
        break label200;
      }
    }
    for (;;)
    {
      m += 1;
      break label115;
      label149:
      if (i1 != 0) {
        break;
      }
      i = 300;
      break;
      label161:
      j = m;
      k = i;
      if (n != 0) {
        break label76;
      }
      j = 300;
      k = i;
      break label76;
      label184:
      throw new IllegalArgumentException("DrawerLayout must be measured with MeasureSpec.EXACTLY.");
      i = 0;
      break label100;
      label200:
      LayoutParams localLayoutParams = (LayoutParams)localView.getLayoutParams();
      if (i != 0)
      {
        i2 = GravityCompat.getAbsoluteGravity(gravity, n);
        if (!ViewCompat.getFitsSystemWindows(localView)) {
          break label307;
        }
        IMPL.dispatchChildInsets(localView, mLastInsets, i2);
      }
      for (;;)
      {
        if (!isContentView(localView)) {
          break label326;
        }
        localView.measure(View.MeasureSpec.makeMeasureSpec(k - leftMargin - rightMargin, 1073741824), View.MeasureSpec.makeMeasureSpec(j - topMargin - bottomMargin, 1073741824));
        break;
        label307:
        IMPL.applyMarginInsets(localLayoutParams, mLastInsets, i2);
      }
      label326:
      if (!isDrawerView(localView)) {
        break label462;
      }
      int i2 = getDrawerViewAbsoluteGravity(localView) & 0x7;
      if ((0x0 & i2) != 0) {
        throw new IllegalStateException("Child drawer has absolute gravity " + gravityToString(i2) + " but this " + "DrawerLayout" + " already has a " + "drawer view along that edge");
      }
      localView.measure(getChildMeasureSpec(paramInt1, mMinDrawerMargin + leftMargin + rightMargin, width), getChildMeasureSpec(paramInt2, topMargin + bottomMargin, height));
    }
    label462:
    throw new IllegalStateException("Child " + localView + " at index " + m + " does not have a valid layout_gravity - must be Gravity.LEFT, " + "Gravity.RIGHT or Gravity.NO_GRAVITY");
  }
  
  protected void onRestoreInstanceState(Parcelable paramParcelable)
  {
    paramParcelable = (SavedState)paramParcelable;
    super.onRestoreInstanceState(paramParcelable.getSuperState());
    if (openDrawerGravity != 0)
    {
      View localView = findDrawerWithGravity(openDrawerGravity);
      if (localView != null) {
        openDrawer(localView);
      }
    }
    setDrawerLockMode(lockModeLeft, 3);
    setDrawerLockMode(lockModeRight, 5);
  }
  
  protected Parcelable onSaveInstanceState()
  {
    SavedState localSavedState = new SavedState(super.onSaveInstanceState());
    View localView = findOpenDrawer();
    if (localView != null) {
      openDrawerGravity = getLayoutParamsgravity;
    }
    lockModeLeft = mLockModeLeft;
    lockModeRight = mLockModeRight;
    return localSavedState;
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    mLeftDragger.processTouchEvent(paramMotionEvent);
    mRightDragger.processTouchEvent(paramMotionEvent);
    float f1;
    float f2;
    switch (paramMotionEvent.getAction() & 0xFF)
    {
    case 2: 
    default: 
      return true;
    case 0: 
      f1 = paramMotionEvent.getX();
      f2 = paramMotionEvent.getY();
      mInitialMotionX = f1;
      mInitialMotionY = f2;
      mDisallowInterceptRequested = false;
      mChildrenCanceledTouch = false;
      return true;
    case 1: 
      f2 = paramMotionEvent.getX();
      f1 = paramMotionEvent.getY();
      boolean bool2 = true;
      paramMotionEvent = mLeftDragger.findTopChildUnder((int)f2, (int)f1);
      boolean bool1 = bool2;
      if (paramMotionEvent != null)
      {
        bool1 = bool2;
        if (isContentView(paramMotionEvent))
        {
          f2 -= mInitialMotionX;
          f1 -= mInitialMotionY;
          int i = mLeftDragger.getTouchSlop();
          bool1 = bool2;
          if (f2 * f2 + f1 * f1 < i * i)
          {
            paramMotionEvent = findOpenDrawer();
            bool1 = bool2;
            if (paramMotionEvent != null) {
              if (getDrawerLockMode(paramMotionEvent) != 2) {
                break label217;
              }
            }
          }
        }
      }
      label217:
      for (bool1 = true;; bool1 = false)
      {
        closeDrawers(bool1);
        mDisallowInterceptRequested = false;
        return true;
      }
    }
    closeDrawers(true);
    mDisallowInterceptRequested = false;
    mChildrenCanceledTouch = false;
    return true;
  }
  
  public void openDrawer(View paramView)
  {
    if (!isDrawerView(paramView)) {
      throw new IllegalArgumentException("View " + paramView + " is not a sliding drawer");
    }
    if (mFirstLayout)
    {
      LayoutParams localLayoutParams = (LayoutParams)paramView.getLayoutParams();
      onScreen = 1.0F;
      knownOpen = true;
      updateChildrenImportantForAccessibility(paramView, true);
    }
    for (;;)
    {
      invalidate();
      return;
      if (checkDrawerViewAbsoluteGravity(paramView, 3)) {
        mLeftDragger.smoothSlideViewTo(paramView, 0, paramView.getTop());
      } else {
        mRightDragger.smoothSlideViewTo(paramView, getWidth() - paramView.getWidth(), paramView.getTop());
      }
    }
  }
  
  public void requestDisallowInterceptTouchEvent(boolean paramBoolean)
  {
    super.requestDisallowInterceptTouchEvent(paramBoolean);
    mDisallowInterceptRequested = paramBoolean;
    if (paramBoolean) {
      closeDrawers(true);
    }
  }
  
  public void requestLayout()
  {
    if (!mInLayout) {
      super.requestLayout();
    }
  }
  
  public void setChildInsets(Object paramObject, boolean paramBoolean)
  {
    mLastInsets = paramObject;
    mDrawStatusBarBackground = paramBoolean;
    if ((!paramBoolean) && (getBackground() == null)) {}
    for (paramBoolean = true;; paramBoolean = false)
    {
      setWillNotDraw(paramBoolean);
      requestLayout();
      return;
    }
  }
  
  public void setDrawerListener(DrawerListener paramDrawerListener)
  {
    mListener = paramDrawerListener;
  }
  
  public void setDrawerLockMode(int paramInt)
  {
    setDrawerLockMode(paramInt, 3);
    setDrawerLockMode(paramInt, 5);
  }
  
  public void setDrawerLockMode(int paramInt1, int paramInt2)
  {
    paramInt2 = GravityCompat.getAbsoluteGravity(paramInt2, ViewCompat.getLayoutDirection(this));
    Object localObject;
    if (paramInt2 == 3)
    {
      mLockModeLeft = paramInt1;
      if (paramInt1 != 0)
      {
        if (paramInt2 != 3) {
          break label74;
        }
        localObject = mLeftDragger;
        label33:
        ((ViewDragHelper)localObject).cancel();
      }
      switch (paramInt1)
      {
      }
    }
    label74:
    do
    {
      do
      {
        return;
        if (paramInt2 != 5) {
          break;
        }
        mLockModeRight = paramInt1;
        break;
        localObject = mRightDragger;
        break label33;
        localObject = findDrawerWithGravity(paramInt2);
      } while (localObject == null);
      openDrawer((View)localObject);
      return;
      localObject = findDrawerWithGravity(paramInt2);
    } while (localObject == null);
    closeDrawer((View)localObject);
  }
  
  void setDrawerViewOffset(View paramView, float paramFloat)
  {
    LayoutParams localLayoutParams = (LayoutParams)paramView.getLayoutParams();
    if (paramFloat == onScreen) {
      return;
    }
    onScreen = paramFloat;
    dispatchOnDrawerSlide(paramView, paramFloat);
  }
  
  public void setScrimColor(int paramInt)
  {
    mScrimColor = paramInt;
    invalidate();
  }
  
  public void setStatusBarBackground(int paramInt)
  {
    if (paramInt != 0) {}
    for (Drawable localDrawable = ContextCompat.getDrawable(getContext(), paramInt);; localDrawable = null)
    {
      mStatusBarBackground = localDrawable;
      invalidate();
      return;
    }
  }
  
  public void setStatusBarBackground(Drawable paramDrawable)
  {
    mStatusBarBackground = paramDrawable;
    invalidate();
  }
  
  public void setStatusBarBackgroundColor(int paramInt)
  {
    mStatusBarBackground = new ColorDrawable(paramInt);
    invalidate();
  }
  
  void updateDrawerState(int paramInt1, int paramInt2, View paramView)
  {
    paramInt1 = mLeftDragger.getViewDragState();
    int i = mRightDragger.getViewDragState();
    LayoutParams localLayoutParams;
    if ((paramInt1 == 1) || (i == 1))
    {
      paramInt1 = 1;
      if ((paramView != null) && (paramInt2 == 0))
      {
        localLayoutParams = (LayoutParams)paramView.getLayoutParams();
        if (onScreen != 0.0F) {
          break label114;
        }
        dispatchOnDrawerClosed(paramView);
      }
    }
    for (;;)
    {
      if (paramInt1 != mDrawerState)
      {
        mDrawerState = paramInt1;
        if (mListener != null) {
          mListener.onDrawerStateChanged(paramInt1);
        }
      }
      return;
      if ((paramInt1 == 2) || (i == 2))
      {
        paramInt1 = 2;
        break;
      }
      paramInt1 = 0;
      break;
      label114:
      if (onScreen == 1.0F) {
        dispatchOnDrawerOpened(paramView);
      }
    }
  }
  
  class AccessibilityDelegate
    extends AccessibilityDelegateCompat
  {
    private final Rect mTmpRect = new Rect();
    
    AccessibilityDelegate() {}
    
    private void addChildrenForAccessibility(AccessibilityNodeInfoCompat paramAccessibilityNodeInfoCompat, ViewGroup paramViewGroup)
    {
      int j = paramViewGroup.getChildCount();
      int i = 0;
      while (i < j)
      {
        View localView = paramViewGroup.getChildAt(i);
        if (DrawerLayout.includeChildForAccessibility(localView)) {
          paramAccessibilityNodeInfoCompat.addChild(localView);
        }
        i += 1;
      }
    }
    
    private void copyNodeInfoNoChildren(AccessibilityNodeInfoCompat paramAccessibilityNodeInfoCompat1, AccessibilityNodeInfoCompat paramAccessibilityNodeInfoCompat2)
    {
      Rect localRect = mTmpRect;
      paramAccessibilityNodeInfoCompat2.getBoundsInParent(localRect);
      paramAccessibilityNodeInfoCompat1.setBoundsInParent(localRect);
      paramAccessibilityNodeInfoCompat2.getBoundsInScreen(localRect);
      paramAccessibilityNodeInfoCompat1.setBoundsInScreen(localRect);
      paramAccessibilityNodeInfoCompat1.setVisibleToUser(paramAccessibilityNodeInfoCompat2.isVisibleToUser());
      paramAccessibilityNodeInfoCompat1.setPackageName(paramAccessibilityNodeInfoCompat2.getPackageName());
      paramAccessibilityNodeInfoCompat1.setClassName(paramAccessibilityNodeInfoCompat2.getClassName());
      paramAccessibilityNodeInfoCompat1.setContentDescription(paramAccessibilityNodeInfoCompat2.getContentDescription());
      paramAccessibilityNodeInfoCompat1.setEnabled(paramAccessibilityNodeInfoCompat2.isEnabled());
      paramAccessibilityNodeInfoCompat1.setClickable(paramAccessibilityNodeInfoCompat2.isClickable());
      paramAccessibilityNodeInfoCompat1.setFocusable(paramAccessibilityNodeInfoCompat2.isFocusable());
      paramAccessibilityNodeInfoCompat1.setFocused(paramAccessibilityNodeInfoCompat2.isFocused());
      paramAccessibilityNodeInfoCompat1.setAccessibilityFocused(paramAccessibilityNodeInfoCompat2.isAccessibilityFocused());
      paramAccessibilityNodeInfoCompat1.setSelected(paramAccessibilityNodeInfoCompat2.isSelected());
      paramAccessibilityNodeInfoCompat1.setLongClickable(paramAccessibilityNodeInfoCompat2.isLongClickable());
      paramAccessibilityNodeInfoCompat1.addAction(paramAccessibilityNodeInfoCompat2.getActions());
    }
    
    public boolean dispatchPopulateAccessibilityEvent(View paramView, AccessibilityEvent paramAccessibilityEvent)
    {
      if (paramAccessibilityEvent.getEventType() == 32)
      {
        paramView = paramAccessibilityEvent.getText();
        paramAccessibilityEvent = DrawerLayout.this.findVisibleDrawer();
        if (paramAccessibilityEvent != null)
        {
          int i = getDrawerViewAbsoluteGravity(paramAccessibilityEvent);
          paramAccessibilityEvent = getDrawerTitle(i);
          if (paramAccessibilityEvent != null) {
            paramView.add(paramAccessibilityEvent);
          }
        }
        return true;
      }
      return super.dispatchPopulateAccessibilityEvent(paramView, paramAccessibilityEvent);
    }
    
    public void onInitializeAccessibilityEvent(View paramView, AccessibilityEvent paramAccessibilityEvent)
    {
      super.onInitializeAccessibilityEvent(paramView, paramAccessibilityEvent);
      paramAccessibilityEvent.setClassName(DrawerLayout.class.getName());
    }
    
    public void onInitializeAccessibilityNodeInfo(View paramView, AccessibilityNodeInfoCompat paramAccessibilityNodeInfoCompat)
    {
      if (DrawerLayout.CAN_HIDE_DESCENDANTS) {
        super.onInitializeAccessibilityNodeInfo(paramView, paramAccessibilityNodeInfoCompat);
      }
      for (;;)
      {
        paramAccessibilityNodeInfoCompat.setClassName(DrawerLayout.class.getName());
        paramAccessibilityNodeInfoCompat.setFocusable(false);
        paramAccessibilityNodeInfoCompat.setFocused(false);
        return;
        AccessibilityNodeInfoCompat localAccessibilityNodeInfoCompat = AccessibilityNodeInfoCompat.obtain(paramAccessibilityNodeInfoCompat);
        super.onInitializeAccessibilityNodeInfo(paramView, localAccessibilityNodeInfoCompat);
        paramAccessibilityNodeInfoCompat.setSource(paramView);
        ViewParent localViewParent = ViewCompat.getParentForAccessibility(paramView);
        if ((localViewParent instanceof View)) {
          paramAccessibilityNodeInfoCompat.setParent((View)localViewParent);
        }
        copyNodeInfoNoChildren(paramAccessibilityNodeInfoCompat, localAccessibilityNodeInfoCompat);
        localAccessibilityNodeInfoCompat.recycle();
        addChildrenForAccessibility(paramAccessibilityNodeInfoCompat, (ViewGroup)paramView);
      }
    }
    
    public boolean onRequestSendAccessibilityEvent(ViewGroup paramViewGroup, View paramView, AccessibilityEvent paramAccessibilityEvent)
    {
      if ((DrawerLayout.CAN_HIDE_DESCENDANTS) || (DrawerLayout.includeChildForAccessibility(paramView))) {
        return super.onRequestSendAccessibilityEvent(paramViewGroup, paramView, paramAccessibilityEvent);
      }
      return false;
    }
  }
  
  final class ChildAccessibilityDelegate
    extends AccessibilityDelegateCompat
  {
    ChildAccessibilityDelegate() {}
    
    public void onInitializeAccessibilityNodeInfo(View paramView, AccessibilityNodeInfoCompat paramAccessibilityNodeInfoCompat)
    {
      super.onInitializeAccessibilityNodeInfo(paramView, paramAccessibilityNodeInfoCompat);
      if (!DrawerLayout.includeChildForAccessibility(paramView)) {
        paramAccessibilityNodeInfoCompat.setParent(null);
      }
    }
  }
  
  static abstract interface DrawerLayoutCompatImpl
  {
    public abstract void applyMarginInsets(ViewGroup.MarginLayoutParams paramMarginLayoutParams, Object paramObject, int paramInt);
    
    public abstract void configureApplyInsets(View paramView);
    
    public abstract void dispatchChildInsets(View paramView, Object paramObject, int paramInt);
    
    public abstract Drawable getDefaultStatusBarBackground(Context paramContext);
    
    public abstract int getTopInset(Object paramObject);
  }
  
  static class DrawerLayoutCompatImplApi21
    implements DrawerLayout.DrawerLayoutCompatImpl
  {
    DrawerLayoutCompatImplApi21() {}
    
    public void applyMarginInsets(ViewGroup.MarginLayoutParams paramMarginLayoutParams, Object paramObject, int paramInt)
    {
      DrawerLayoutCompatApi21.applyMarginInsets(paramMarginLayoutParams, paramObject, paramInt);
    }
    
    public void configureApplyInsets(View paramView)
    {
      DrawerLayoutCompatApi21.configureApplyInsets(paramView);
    }
    
    public void dispatchChildInsets(View paramView, Object paramObject, int paramInt)
    {
      DrawerLayoutCompatApi21.dispatchChildInsets(paramView, paramObject, paramInt);
    }
    
    public Drawable getDefaultStatusBarBackground(Context paramContext)
    {
      return DrawerLayoutCompatApi21.getDefaultStatusBarBackground(paramContext);
    }
    
    public int getTopInset(Object paramObject)
    {
      return DrawerLayoutCompatApi21.getTopInset(paramObject);
    }
  }
  
  static class DrawerLayoutCompatImplBase
    implements DrawerLayout.DrawerLayoutCompatImpl
  {
    DrawerLayoutCompatImplBase() {}
    
    public void applyMarginInsets(ViewGroup.MarginLayoutParams paramMarginLayoutParams, Object paramObject, int paramInt) {}
    
    public void configureApplyInsets(View paramView) {}
    
    public void dispatchChildInsets(View paramView, Object paramObject, int paramInt) {}
    
    public Drawable getDefaultStatusBarBackground(Context paramContext)
    {
      return null;
    }
    
    public int getTopInset(Object paramObject)
    {
      return 0;
    }
  }
  
  public static abstract interface DrawerListener
  {
    public abstract void onDrawerClosed(View paramView);
    
    public abstract void onDrawerOpened(View paramView);
    
    public abstract void onDrawerSlide(View paramView, float paramFloat);
    
    public abstract void onDrawerStateChanged(int paramInt);
  }
  
  public static class LayoutParams
    extends ViewGroup.MarginLayoutParams
  {
    public int gravity = 0;
    boolean isPeeking;
    boolean knownOpen;
    float onScreen;
    
    public LayoutParams(int paramInt1, int paramInt2)
    {
      super(paramInt2);
    }
    
    public LayoutParams(Context paramContext, AttributeSet paramAttributeSet)
    {
      super(paramAttributeSet);
      paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, DrawerLayout.LAYOUT_ATTRS);
      gravity = paramContext.getInt(0, 0);
      paramContext.recycle();
    }
    
    public LayoutParams(LayoutParams paramLayoutParams)
    {
      super();
      gravity = gravity;
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
  
  protected static class SavedState
    extends View.BaseSavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public DrawerLayout.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new DrawerLayout.SavedState(paramAnonymousParcel);
      }
      
      public DrawerLayout.SavedState[] newArray(int paramAnonymousInt)
      {
        return new DrawerLayout.SavedState[paramAnonymousInt];
      }
    };
    int lockModeLeft = 0;
    int lockModeRight = 0;
    int openDrawerGravity = 0;
    
    public SavedState(Parcel paramParcel)
    {
      super();
      openDrawerGravity = paramParcel.readInt();
    }
    
    public SavedState(Parcelable paramParcelable)
    {
      super();
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      paramParcel.writeInt(openDrawerGravity);
    }
  }
  
  private class ViewDragCallback
    extends ViewDragHelper.Callback
  {
    private final int mAbsGravity;
    private ViewDragHelper mDragger;
    private final Runnable mPeekRunnable = new Runnable()
    {
      public void run()
      {
        DrawerLayout.ViewDragCallback.this.peekDrawer();
      }
    };
    
    public ViewDragCallback(int paramInt)
    {
      mAbsGravity = paramInt;
    }
    
    private void closeOtherDrawer()
    {
      int i = 3;
      if (mAbsGravity == 3) {
        i = 5;
      }
      View localView = findDrawerWithGravity(i);
      if (localView != null) {
        closeDrawer(localView);
      }
    }
    
    private void peekDrawer()
    {
      int j = 0;
      int k = mDragger.getEdgeSize();
      int i;
      View localView;
      if (mAbsGravity == 3)
      {
        i = 1;
        if (i == 0) {
          break label149;
        }
        localView = findDrawerWithGravity(3);
        if (localView != null) {
          j = -localView.getWidth();
        }
        j += k;
      }
      for (;;)
      {
        if ((localView != null) && (((i != 0) && (localView.getLeft() < j)) || ((i == 0) && (localView.getLeft() > j) && (getDrawerLockMode(localView) == 0))))
        {
          DrawerLayout.LayoutParams localLayoutParams = (DrawerLayout.LayoutParams)localView.getLayoutParams();
          mDragger.smoothSlideViewTo(localView, j, localView.getTop());
          isPeeking = true;
          invalidate();
          closeOtherDrawer();
          cancelChildViewTouch();
        }
        return;
        i = 0;
        break;
        label149:
        localView = findDrawerWithGravity(5);
        j = getWidth() - k;
      }
    }
    
    public int clampViewPositionHorizontal(View paramView, int paramInt1, int paramInt2)
    {
      if (checkDrawerViewAbsoluteGravity(paramView, 3)) {
        return Math.max(-paramView.getWidth(), Math.min(paramInt1, 0));
      }
      paramInt2 = getWidth();
      return Math.max(paramInt2 - paramView.getWidth(), Math.min(paramInt1, paramInt2));
    }
    
    public int clampViewPositionVertical(View paramView, int paramInt1, int paramInt2)
    {
      return paramView.getTop();
    }
    
    public int getViewHorizontalDragRange(View paramView)
    {
      if (isDrawerView(paramView)) {
        return paramView.getWidth();
      }
      return 0;
    }
    
    public void onEdgeDragStarted(int paramInt1, int paramInt2)
    {
      if ((paramInt1 & 0x1) == 1) {}
      for (View localView = findDrawerWithGravity(3);; localView = findDrawerWithGravity(5))
      {
        if ((localView != null) && (getDrawerLockMode(localView) == 0)) {
          mDragger.captureChildView(localView, paramInt2);
        }
        return;
      }
    }
    
    public boolean onEdgeLock(int paramInt)
    {
      return false;
    }
    
    public void onEdgeTouched(int paramInt1, int paramInt2)
    {
      postDelayed(mPeekRunnable, 160L);
    }
    
    public void onViewCaptured(View paramView, int paramInt)
    {
      getLayoutParamsisPeeking = false;
      closeOtherDrawer();
    }
    
    public void onViewDragStateChanged(int paramInt)
    {
      updateDrawerState(mAbsGravity, paramInt, mDragger.getCapturedView());
    }
    
    public void onViewPositionChanged(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      paramInt2 = paramView.getWidth();
      float f;
      if (checkDrawerViewAbsoluteGravity(paramView, 3))
      {
        f = (paramInt2 + paramInt1) / paramInt2;
        setDrawerViewOffset(paramView, f);
        if (f != 0.0F) {
          break label76;
        }
      }
      label76:
      for (paramInt1 = 4;; paramInt1 = 0)
      {
        paramView.setVisibility(paramInt1);
        invalidate();
        return;
        f = (getWidth() - paramInt1) / paramInt2;
        break;
      }
    }
    
    public void onViewReleased(View paramView, float paramFloat1, float paramFloat2)
    {
      paramFloat2 = getDrawerViewOffset(paramView);
      int j = paramView.getWidth();
      if (checkDrawerViewAbsoluteGravity(paramView, 3))
      {
        if ((paramFloat1 > 0.0F) || ((paramFloat1 == 0.0F) && (paramFloat2 > 0.5F))) {}
        for (i = 0;; i = -j)
        {
          mDragger.settleCapturedViewAt(i, paramView.getTop());
          invalidate();
          return;
        }
      }
      int i = getWidth();
      if ((paramFloat1 < 0.0F) || ((paramFloat1 == 0.0F) && (paramFloat2 > 0.5F))) {
        i -= j;
      }
      for (;;)
      {
        break;
      }
    }
    
    public void removeCallbacks()
    {
      removeCallbacks(mPeekRunnable);
    }
    
    public void setDragger(ViewDragHelper paramViewDragHelper)
    {
      mDragger = paramViewDragHelper;
    }
    
    public boolean tryCaptureView(View paramView, int paramInt)
    {
      return (isDrawerView(paramView)) && (checkDrawerViewAbsoluteGravity(paramView, mAbsGravity)) && (getDrawerLockMode(paramView) == 0);
    }
  }
}
