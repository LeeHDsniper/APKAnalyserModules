package android.support.v7.internal.widget;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.res.Configuration;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.support.v4.view.NestedScrollingParent;
import android.support.v4.view.NestedScrollingParentHelper;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.support.v4.view.ViewPropertyAnimatorListener;
import android.support.v4.view.ViewPropertyAnimatorListenerAdapter;
import android.support.v4.widget.ScrollerCompat;
import android.support.v7.appcompat.R.attr;
import android.support.v7.appcompat.R.id;
import android.support.v7.internal.view.menu.MenuPresenter.Callback;
import android.support.v7.widget.Toolbar;
import android.util.AttributeSet;
import android.view.Menu;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.Window.Callback;

public class ActionBarOverlayLayout
  extends ViewGroup
  implements NestedScrollingParent, DecorContentParent
{
  static final int[] ATTRS = { R.attr.actionBarSize, 16842841 };
  private final int ACTION_BAR_ANIMATE_DELAY = 600;
  private ActionBarContainer mActionBarBottom;
  private int mActionBarHeight;
  private ActionBarContainer mActionBarTop;
  private ActionBarVisibilityCallback mActionBarVisibilityCallback;
  private final Runnable mAddActionBarHideOffset = new Runnable()
  {
    public void run()
    {
      ActionBarOverlayLayout.this.haltActionBarHideOffsetAnimations();
      ActionBarOverlayLayout.access$002(ActionBarOverlayLayout.this, ViewCompat.animate(mActionBarTop).translationY(-mActionBarTop.getHeight()).setListener(mTopAnimatorListener));
      if ((mActionBarBottom != null) && (mActionBarBottom.getVisibility() != 8)) {
        ActionBarOverlayLayout.access$202(ActionBarOverlayLayout.this, ViewCompat.animate(mActionBarBottom).translationY(mActionBarBottom.getHeight()).setListener(mBottomAnimatorListener));
      }
    }
  };
  private boolean mAnimatingForFling;
  private final Rect mBaseContentInsets = new Rect();
  private final Rect mBaseInnerInsets = new Rect();
  private final ViewPropertyAnimatorListener mBottomAnimatorListener = new ViewPropertyAnimatorListenerAdapter()
  {
    public void onAnimationCancel(View paramAnonymousView)
    {
      ActionBarOverlayLayout.access$202(ActionBarOverlayLayout.this, null);
      ActionBarOverlayLayout.access$102(ActionBarOverlayLayout.this, false);
    }
    
    public void onAnimationEnd(View paramAnonymousView)
    {
      ActionBarOverlayLayout.access$202(ActionBarOverlayLayout.this, null);
      ActionBarOverlayLayout.access$102(ActionBarOverlayLayout.this, false);
    }
  };
  private ContentFrameLayout mContent;
  private final Rect mContentInsets = new Rect();
  private ViewPropertyAnimatorCompat mCurrentActionBarBottomAnimator;
  private ViewPropertyAnimatorCompat mCurrentActionBarTopAnimator;
  private DecorToolbar mDecorToolbar;
  private ScrollerCompat mFlingEstimator;
  private boolean mHasNonEmbeddedTabs;
  private boolean mHideOnContentScroll;
  private int mHideOnContentScrollReference;
  private boolean mIgnoreWindowContentOverlay;
  private final Rect mInnerInsets = new Rect();
  private final Rect mLastBaseContentInsets = new Rect();
  private final Rect mLastInnerInsets = new Rect();
  private int mLastSystemUiVisibility;
  private boolean mOverlayMode;
  private final NestedScrollingParentHelper mParentHelper;
  private final Runnable mRemoveActionBarHideOffset = new Runnable()
  {
    public void run()
    {
      ActionBarOverlayLayout.this.haltActionBarHideOffsetAnimations();
      ActionBarOverlayLayout.access$002(ActionBarOverlayLayout.this, ViewCompat.animate(mActionBarTop).translationY(0.0F).setListener(mTopAnimatorListener));
      if ((mActionBarBottom != null) && (mActionBarBottom.getVisibility() != 8)) {
        ActionBarOverlayLayout.access$202(ActionBarOverlayLayout.this, ViewCompat.animate(mActionBarBottom).translationY(0.0F).setListener(mBottomAnimatorListener));
      }
    }
  };
  private final ViewPropertyAnimatorListener mTopAnimatorListener = new ViewPropertyAnimatorListenerAdapter()
  {
    public void onAnimationCancel(View paramAnonymousView)
    {
      ActionBarOverlayLayout.access$002(ActionBarOverlayLayout.this, null);
      ActionBarOverlayLayout.access$102(ActionBarOverlayLayout.this, false);
    }
    
    public void onAnimationEnd(View paramAnonymousView)
    {
      ActionBarOverlayLayout.access$002(ActionBarOverlayLayout.this, null);
      ActionBarOverlayLayout.access$102(ActionBarOverlayLayout.this, false);
    }
  };
  private Drawable mWindowContentOverlay;
  private int mWindowVisibility = 0;
  
  public ActionBarOverlayLayout(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public ActionBarOverlayLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    init(paramContext);
    mParentHelper = new NestedScrollingParentHelper(this);
  }
  
  private void addActionBarHideOffset()
  {
    haltActionBarHideOffsetAnimations();
    mAddActionBarHideOffset.run();
  }
  
  private boolean applyInsets(View paramView, Rect paramRect, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4)
  {
    boolean bool2 = false;
    paramView = (LayoutParams)paramView.getLayoutParams();
    boolean bool1 = bool2;
    if (paramBoolean1)
    {
      bool1 = bool2;
      if (leftMargin != left)
      {
        bool1 = true;
        leftMargin = left;
      }
    }
    paramBoolean1 = bool1;
    if (paramBoolean2)
    {
      paramBoolean1 = bool1;
      if (topMargin != top)
      {
        paramBoolean1 = true;
        topMargin = top;
      }
    }
    paramBoolean2 = paramBoolean1;
    if (paramBoolean4)
    {
      paramBoolean2 = paramBoolean1;
      if (rightMargin != right)
      {
        paramBoolean2 = true;
        rightMargin = right;
      }
    }
    paramBoolean1 = paramBoolean2;
    if (paramBoolean3)
    {
      paramBoolean1 = paramBoolean2;
      if (bottomMargin != bottom)
      {
        paramBoolean1 = true;
        bottomMargin = bottom;
      }
    }
    return paramBoolean1;
  }
  
  private DecorToolbar getDecorToolbar(View paramView)
  {
    if ((paramView instanceof DecorToolbar)) {
      return (DecorToolbar)paramView;
    }
    if ((paramView instanceof Toolbar)) {
      return ((Toolbar)paramView).getWrapper();
    }
    throw new IllegalStateException("Can't make a decor toolbar out of " + paramView.getClass().getSimpleName());
  }
  
  private void haltActionBarHideOffsetAnimations()
  {
    removeCallbacks(mRemoveActionBarHideOffset);
    removeCallbacks(mAddActionBarHideOffset);
    if (mCurrentActionBarTopAnimator != null) {
      mCurrentActionBarTopAnimator.cancel();
    }
    if (mCurrentActionBarBottomAnimator != null) {
      mCurrentActionBarBottomAnimator.cancel();
    }
  }
  
  private void init(Context paramContext)
  {
    boolean bool2 = true;
    TypedArray localTypedArray = getContext().getTheme().obtainStyledAttributes(ATTRS);
    mActionBarHeight = localTypedArray.getDimensionPixelSize(0, 0);
    mWindowContentOverlay = localTypedArray.getDrawable(1);
    if (mWindowContentOverlay == null)
    {
      bool1 = true;
      setWillNotDraw(bool1);
      localTypedArray.recycle();
      if (getApplicationInfotargetSdkVersion >= 19) {
        break label90;
      }
    }
    label90:
    for (boolean bool1 = bool2;; bool1 = false)
    {
      mIgnoreWindowContentOverlay = bool1;
      mFlingEstimator = ScrollerCompat.create(paramContext);
      return;
      bool1 = false;
      break;
    }
  }
  
  private void postAddActionBarHideOffset()
  {
    haltActionBarHideOffsetAnimations();
    postDelayed(mAddActionBarHideOffset, 600L);
  }
  
  private void postRemoveActionBarHideOffset()
  {
    haltActionBarHideOffsetAnimations();
    postDelayed(mRemoveActionBarHideOffset, 600L);
  }
  
  private void removeActionBarHideOffset()
  {
    haltActionBarHideOffsetAnimations();
    mRemoveActionBarHideOffset.run();
  }
  
  private boolean shouldHideActionBarOnFling(float paramFloat1, float paramFloat2)
  {
    boolean bool = false;
    mFlingEstimator.fling(0, 0, 0, (int)paramFloat2, 0, 0, Integer.MIN_VALUE, Integer.MAX_VALUE);
    if (mFlingEstimator.getFinalY() > mActionBarTop.getHeight()) {
      bool = true;
    }
    return bool;
  }
  
  public boolean canShowOverflowMenu()
  {
    pullChildren();
    return mDecorToolbar.canShowOverflowMenu();
  }
  
  protected boolean checkLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    return paramLayoutParams instanceof LayoutParams;
  }
  
  public void dismissPopups()
  {
    pullChildren();
    mDecorToolbar.dismissPopupMenus();
  }
  
  public void draw(Canvas paramCanvas)
  {
    super.draw(paramCanvas);
    if ((mWindowContentOverlay != null) && (!mIgnoreWindowContentOverlay)) {
      if (mActionBarTop.getVisibility() != 0) {
        break label82;
      }
    }
    label82:
    for (int i = (int)(mActionBarTop.getBottom() + ViewCompat.getTranslationY(mActionBarTop) + 0.5F);; i = 0)
    {
      mWindowContentOverlay.setBounds(0, i, getWidth(), mWindowContentOverlay.getIntrinsicHeight() + i);
      mWindowContentOverlay.draw(paramCanvas);
      return;
    }
  }
  
  protected boolean fitSystemWindows(Rect paramRect)
  {
    pullChildren();
    if ((ViewCompat.getWindowSystemUiVisibility(this) & 0x100) != 0) {}
    for (;;)
    {
      boolean bool2 = applyInsets(mActionBarTop, paramRect, true, true, false, true);
      boolean bool1 = bool2;
      if (mActionBarBottom != null) {
        bool1 = bool2 | applyInsets(mActionBarBottom, paramRect, true, false, true, true);
      }
      mBaseInnerInsets.set(paramRect);
      ViewUtils.computeFitSystemWindows(this, mBaseInnerInsets, mBaseContentInsets);
      if (!mLastBaseContentInsets.equals(mBaseContentInsets))
      {
        bool1 = true;
        mLastBaseContentInsets.set(mBaseContentInsets);
      }
      if (bool1) {
        requestLayout();
      }
      return true;
    }
  }
  
  protected LayoutParams generateDefaultLayoutParams()
  {
    return new LayoutParams(-1, -1);
  }
  
  public LayoutParams generateLayoutParams(AttributeSet paramAttributeSet)
  {
    return new LayoutParams(getContext(), paramAttributeSet);
  }
  
  protected ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    return new LayoutParams(paramLayoutParams);
  }
  
  public int getActionBarHideOffset()
  {
    if (mActionBarTop != null) {
      return -(int)ViewCompat.getTranslationY(mActionBarTop);
    }
    return 0;
  }
  
  public int getNestedScrollAxes()
  {
    return mParentHelper.getNestedScrollAxes();
  }
  
  public CharSequence getTitle()
  {
    pullChildren();
    return mDecorToolbar.getTitle();
  }
  
  public boolean hideOverflowMenu()
  {
    pullChildren();
    return mDecorToolbar.hideOverflowMenu();
  }
  
  public void initFeature(int paramInt)
  {
    pullChildren();
    switch (paramInt)
    {
    default: 
      return;
    case 2: 
      mDecorToolbar.initProgress();
      return;
    case 5: 
      mDecorToolbar.initIndeterminateProgress();
      return;
    }
    setOverlayMode(true);
  }
  
  public boolean isInOverlayMode()
  {
    return mOverlayMode;
  }
  
  public boolean isOverflowMenuShowPending()
  {
    pullChildren();
    return mDecorToolbar.isOverflowMenuShowPending();
  }
  
  public boolean isOverflowMenuShowing()
  {
    pullChildren();
    return mDecorToolbar.isOverflowMenuShowing();
  }
  
  protected void onConfigurationChanged(Configuration paramConfiguration)
  {
    if (Build.VERSION.SDK_INT >= 8) {
      super.onConfigurationChanged(paramConfiguration);
    }
    init(getContext());
    ViewCompat.requestApplyInsets(this);
  }
  
  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    haltActionBarHideOffsetAnimations();
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    int i = getChildCount();
    int j = getPaddingLeft();
    getPaddingRight();
    int k = getPaddingTop();
    int m = getPaddingBottom();
    paramInt1 = 0;
    if (paramInt1 < i)
    {
      View localView = getChildAt(paramInt1);
      LayoutParams localLayoutParams;
      int n;
      int i1;
      int i2;
      if (localView.getVisibility() != 8)
      {
        localLayoutParams = (LayoutParams)localView.getLayoutParams();
        n = localView.getMeasuredWidth();
        i1 = localView.getMeasuredHeight();
        i2 = j + leftMargin;
        if (localView != mActionBarBottom) {
          break label141;
        }
      }
      label141:
      for (paramInt3 = paramInt4 - paramInt2 - m - i1 - bottomMargin;; paramInt3 = k + topMargin)
      {
        localView.layout(i2, paramInt3, i2 + n, paramInt3 + i1);
        paramInt1 += 1;
        break;
      }
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    pullChildren();
    int i = 0;
    int i2 = 0;
    measureChildWithMargins(mActionBarTop, paramInt1, 0, paramInt2, 0);
    Object localObject = (LayoutParams)mActionBarTop.getLayoutParams();
    int i3 = Math.max(0, mActionBarTop.getMeasuredWidth() + leftMargin + rightMargin);
    int i1 = Math.max(0, mActionBarTop.getMeasuredHeight() + topMargin + bottomMargin);
    int j = ViewUtils.combineMeasuredStates(0, ViewCompat.getMeasuredState(mActionBarTop));
    int k = j;
    int m = i1;
    int n = i3;
    if (mActionBarBottom != null)
    {
      measureChildWithMargins(mActionBarBottom, paramInt1, 0, paramInt2, 0);
      localObject = (LayoutParams)mActionBarBottom.getLayoutParams();
      n = Math.max(i3, mActionBarBottom.getMeasuredWidth() + leftMargin + rightMargin);
      m = Math.max(i1, mActionBarBottom.getMeasuredHeight() + topMargin + bottomMargin);
      k = ViewUtils.combineMeasuredStates(j, ViewCompat.getMeasuredState(mActionBarBottom));
    }
    if ((ViewCompat.getWindowSystemUiVisibility(this) & 0x100) != 0)
    {
      i1 = 1;
      if (i1 == 0) {
        break label587;
      }
      j = mActionBarHeight;
      i = j;
      if (mHasNonEmbeddedTabs)
      {
        i = j;
        if (mActionBarTop.getTabContainer() != null) {
          i = j + mActionBarHeight;
        }
      }
      label261:
      j = i2;
      if (mDecorToolbar.isSplit())
      {
        j = i2;
        if (mActionBarBottom != null)
        {
          if (i1 == 0) {
            break label610;
          }
          j = mActionBarHeight;
        }
      }
      label299:
      mContentInsets.set(mBaseContentInsets);
      mInnerInsets.set(mBaseInnerInsets);
      if ((mOverlayMode) || (i1 != 0)) {
        break label622;
      }
      localObject = mContentInsets;
      top += i;
      localObject = mContentInsets;
    }
    for (bottom += j;; bottom += j)
    {
      applyInsets(mContent, mContentInsets, true, true, true, true);
      if (!mLastInnerInsets.equals(mInnerInsets))
      {
        mLastInnerInsets.set(mInnerInsets);
        mContent.dispatchFitSystemWindows(mInnerInsets);
      }
      measureChildWithMargins(mContent, paramInt1, 0, paramInt2, 0);
      localObject = (LayoutParams)mContent.getLayoutParams();
      i = Math.max(n, mContent.getMeasuredWidth() + leftMargin + rightMargin);
      j = Math.max(m, mContent.getMeasuredHeight() + topMargin + bottomMargin);
      k = ViewUtils.combineMeasuredStates(k, ViewCompat.getMeasuredState(mContent));
      m = getPaddingLeft();
      n = getPaddingRight();
      j = Math.max(j + (getPaddingTop() + getPaddingBottom()), getSuggestedMinimumHeight());
      setMeasuredDimension(ViewCompat.resolveSizeAndState(Math.max(i + (m + n), getSuggestedMinimumWidth()), paramInt1, k), ViewCompat.resolveSizeAndState(j, paramInt2, k << 16));
      return;
      i1 = 0;
      break;
      label587:
      if (mActionBarTop.getVisibility() == 8) {
        break label261;
      }
      i = mActionBarTop.getMeasuredHeight();
      break label261;
      label610:
      j = mActionBarBottom.getMeasuredHeight();
      break label299;
      label622:
      localObject = mInnerInsets;
      top += i;
      localObject = mInnerInsets;
    }
  }
  
  public boolean onNestedFling(View paramView, float paramFloat1, float paramFloat2, boolean paramBoolean)
  {
    if ((!mHideOnContentScroll) || (!paramBoolean)) {
      return false;
    }
    if (shouldHideActionBarOnFling(paramFloat1, paramFloat2)) {
      addActionBarHideOffset();
    }
    for (;;)
    {
      mAnimatingForFling = true;
      return true;
      removeActionBarHideOffset();
    }
  }
  
  public boolean onNestedPreFling(View paramView, float paramFloat1, float paramFloat2)
  {
    return false;
  }
  
  public void onNestedPreScroll(View paramView, int paramInt1, int paramInt2, int[] paramArrayOfInt) {}
  
  public void onNestedScroll(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    mHideOnContentScrollReference += paramInt2;
    setActionBarHideOffset(mHideOnContentScrollReference);
  }
  
  public void onNestedScrollAccepted(View paramView1, View paramView2, int paramInt)
  {
    mParentHelper.onNestedScrollAccepted(paramView1, paramView2, paramInt);
    mHideOnContentScrollReference = getActionBarHideOffset();
    haltActionBarHideOffsetAnimations();
    if (mActionBarVisibilityCallback != null) {
      mActionBarVisibilityCallback.onContentScrollStarted();
    }
  }
  
  public boolean onStartNestedScroll(View paramView1, View paramView2, int paramInt)
  {
    if (((paramInt & 0x2) == 0) || (mActionBarTop.getVisibility() != 0)) {
      return false;
    }
    return mHideOnContentScroll;
  }
  
  public void onStopNestedScroll(View paramView)
  {
    if ((mHideOnContentScroll) && (!mAnimatingForFling))
    {
      if (mHideOnContentScrollReference > mActionBarTop.getHeight()) {
        break label49;
      }
      postRemoveActionBarHideOffset();
    }
    for (;;)
    {
      if (mActionBarVisibilityCallback != null) {
        mActionBarVisibilityCallback.onContentScrollStopped();
      }
      return;
      label49:
      postAddActionBarHideOffset();
    }
  }
  
  public void onWindowSystemUiVisibilityChanged(int paramInt)
  {
    boolean bool = true;
    if (Build.VERSION.SDK_INT >= 16) {
      super.onWindowSystemUiVisibilityChanged(paramInt);
    }
    pullChildren();
    int k = mLastSystemUiVisibility;
    mLastSystemUiVisibility = paramInt;
    int i;
    int j;
    if ((paramInt & 0x4) == 0)
    {
      i = 1;
      if ((paramInt & 0x100) == 0) {
        break label120;
      }
      j = 1;
      label49:
      if (mActionBarVisibilityCallback != null)
      {
        ActionBarVisibilityCallback localActionBarVisibilityCallback = mActionBarVisibilityCallback;
        if (j != 0) {
          break label125;
        }
        label66:
        localActionBarVisibilityCallback.enableContentAnimations(bool);
        if ((i == 0) && (j != 0)) {
          break label131;
        }
        mActionBarVisibilityCallback.showForSystem();
      }
    }
    for (;;)
    {
      if ((((k ^ paramInt) & 0x100) != 0) && (mActionBarVisibilityCallback != null)) {
        ViewCompat.requestApplyInsets(this);
      }
      return;
      i = 0;
      break;
      label120:
      j = 0;
      break label49;
      label125:
      bool = false;
      break label66;
      label131:
      mActionBarVisibilityCallback.hideForSystem();
    }
  }
  
  protected void onWindowVisibilityChanged(int paramInt)
  {
    super.onWindowVisibilityChanged(paramInt);
    mWindowVisibility = paramInt;
    if (mActionBarVisibilityCallback != null) {
      mActionBarVisibilityCallback.onWindowVisibilityChanged(paramInt);
    }
  }
  
  void pullChildren()
  {
    if (mContent == null)
    {
      mContent = ((ContentFrameLayout)findViewById(R.id.action_bar_activity_content));
      mActionBarTop = ((ActionBarContainer)findViewById(R.id.action_bar_container));
      mDecorToolbar = getDecorToolbar(findViewById(R.id.action_bar));
      mActionBarBottom = ((ActionBarContainer)findViewById(R.id.split_action_bar));
    }
  }
  
  public void setActionBarHideOffset(int paramInt)
  {
    haltActionBarHideOffsetAnimations();
    int i = mActionBarTop.getHeight();
    paramInt = Math.max(0, Math.min(paramInt, i));
    ViewCompat.setTranslationY(mActionBarTop, -paramInt);
    if ((mActionBarBottom != null) && (mActionBarBottom.getVisibility() != 8))
    {
      float f = paramInt / i;
      paramInt = (int)(mActionBarBottom.getHeight() * f);
      ViewCompat.setTranslationY(mActionBarBottom, paramInt);
    }
  }
  
  public void setActionBarVisibilityCallback(ActionBarVisibilityCallback paramActionBarVisibilityCallback)
  {
    mActionBarVisibilityCallback = paramActionBarVisibilityCallback;
    if (getWindowToken() != null)
    {
      mActionBarVisibilityCallback.onWindowVisibilityChanged(mWindowVisibility);
      if (mLastSystemUiVisibility != 0)
      {
        onWindowSystemUiVisibilityChanged(mLastSystemUiVisibility);
        ViewCompat.requestApplyInsets(this);
      }
    }
  }
  
  public void setHasNonEmbeddedTabs(boolean paramBoolean)
  {
    mHasNonEmbeddedTabs = paramBoolean;
  }
  
  public void setHideOnContentScrollEnabled(boolean paramBoolean)
  {
    if (paramBoolean != mHideOnContentScroll)
    {
      mHideOnContentScroll = paramBoolean;
      if (!paramBoolean)
      {
        haltActionBarHideOffsetAnimations();
        setActionBarHideOffset(0);
      }
    }
  }
  
  public void setIcon(int paramInt)
  {
    pullChildren();
    mDecorToolbar.setIcon(paramInt);
  }
  
  public void setIcon(Drawable paramDrawable)
  {
    pullChildren();
    mDecorToolbar.setIcon(paramDrawable);
  }
  
  public void setLogo(int paramInt)
  {
    pullChildren();
    mDecorToolbar.setLogo(paramInt);
  }
  
  public void setMenu(Menu paramMenu, MenuPresenter.Callback paramCallback)
  {
    pullChildren();
    mDecorToolbar.setMenu(paramMenu, paramCallback);
  }
  
  public void setMenuPrepared()
  {
    pullChildren();
    mDecorToolbar.setMenuPrepared();
  }
  
  public void setOverlayMode(boolean paramBoolean)
  {
    mOverlayMode = paramBoolean;
    if ((paramBoolean) && (getContextgetApplicationInfotargetSdkVersion < 19)) {}
    for (paramBoolean = true;; paramBoolean = false)
    {
      mIgnoreWindowContentOverlay = paramBoolean;
      return;
    }
  }
  
  public void setShowingForActionMode(boolean paramBoolean) {}
  
  public void setUiOptions(int paramInt) {}
  
  public void setWindowCallback(Window.Callback paramCallback)
  {
    pullChildren();
    mDecorToolbar.setWindowCallback(paramCallback);
  }
  
  public void setWindowTitle(CharSequence paramCharSequence)
  {
    pullChildren();
    mDecorToolbar.setWindowTitle(paramCharSequence);
  }
  
  public boolean shouldDelayChildPressedState()
  {
    return false;
  }
  
  public boolean showOverflowMenu()
  {
    pullChildren();
    return mDecorToolbar.showOverflowMenu();
  }
  
  public static abstract interface ActionBarVisibilityCallback
  {
    public abstract void enableContentAnimations(boolean paramBoolean);
    
    public abstract void hideForSystem();
    
    public abstract void onContentScrollStarted();
    
    public abstract void onContentScrollStopped();
    
    public abstract void onWindowVisibilityChanged(int paramInt);
    
    public abstract void showForSystem();
  }
  
  public static class LayoutParams
    extends ViewGroup.MarginLayoutParams
  {
    public LayoutParams(int paramInt1, int paramInt2)
    {
      super(paramInt2);
    }
    
    public LayoutParams(Context paramContext, AttributeSet paramAttributeSet)
    {
      super(paramAttributeSet);
    }
    
    public LayoutParams(ViewGroup.LayoutParams paramLayoutParams)
    {
      super();
    }
  }
}
