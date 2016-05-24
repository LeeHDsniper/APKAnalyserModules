package android.support.v7.widget;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v4.view.GravityCompat;
import android.support.v4.view.MarginLayoutParamsCompat;
import android.support.v4.view.MenuItemCompat;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.ViewCompat;
import android.support.v7.app.ActionBar.LayoutParams;
import android.support.v7.appcompat.R.attr;
import android.support.v7.appcompat.R.styleable;
import android.support.v7.internal.view.SupportMenuInflater;
import android.support.v7.internal.view.menu.MenuBuilder;
import android.support.v7.internal.view.menu.MenuBuilder.Callback;
import android.support.v7.internal.view.menu.MenuItemImpl;
import android.support.v7.internal.view.menu.MenuPresenter;
import android.support.v7.internal.view.menu.MenuPresenter.Callback;
import android.support.v7.internal.view.menu.SubMenuBuilder;
import android.support.v7.internal.widget.DecorToolbar;
import android.support.v7.internal.widget.RtlSpacingHelper;
import android.support.v7.internal.widget.TintManager;
import android.support.v7.internal.widget.TintTypedArray;
import android.support.v7.internal.widget.ToolbarWidgetWrapper;
import android.support.v7.internal.widget.ViewUtils;
import android.support.v7.view.CollapsibleActionView;
import android.text.TextUtils;
import android.text.TextUtils.TruncateAt;
import android.util.AttributeSet;
import android.view.ContextThemeWrapper;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;

public class Toolbar
  extends ViewGroup
{
  private MenuPresenter.Callback mActionMenuPresenterCallback;
  private int mButtonGravity;
  private ImageButton mCollapseButtonView;
  private CharSequence mCollapseDescription;
  private Drawable mCollapseIcon;
  private boolean mCollapsible;
  private final RtlSpacingHelper mContentInsets = new RtlSpacingHelper();
  private boolean mEatingHover;
  private boolean mEatingTouch;
  View mExpandedActionView;
  private ExpandedActionViewMenuPresenter mExpandedMenuPresenter;
  private int mGravity = 8388627;
  private ImageView mLogoView;
  private int mMaxButtonHeight;
  private MenuBuilder.Callback mMenuBuilderCallback;
  private ActionMenuView mMenuView;
  private final ActionMenuView.OnMenuItemClickListener mMenuViewItemClickListener = new ActionMenuView.OnMenuItemClickListener()
  {
    public boolean onMenuItemClick(MenuItem paramAnonymousMenuItem)
    {
      if (mOnMenuItemClickListener != null) {
        return mOnMenuItemClickListener.onMenuItemClick(paramAnonymousMenuItem);
      }
      return false;
    }
  };
  private ImageButton mNavButtonView;
  private OnMenuItemClickListener mOnMenuItemClickListener;
  private ActionMenuPresenter mOuterActionMenuPresenter;
  private Context mPopupContext;
  private int mPopupTheme;
  private final Runnable mShowOverflowMenuRunnable = new Runnable()
  {
    public void run()
    {
      showOverflowMenu();
    }
  };
  private CharSequence mSubtitleText;
  private int mSubtitleTextAppearance;
  private int mSubtitleTextColor;
  private TextView mSubtitleTextView;
  private final int[] mTempMargins = new int[2];
  private final ArrayList<View> mTempViews = new ArrayList();
  private final TintManager mTintManager;
  private int mTitleMarginBottom;
  private int mTitleMarginEnd;
  private int mTitleMarginStart;
  private int mTitleMarginTop;
  private CharSequence mTitleText;
  private int mTitleTextAppearance;
  private int mTitleTextColor;
  private TextView mTitleTextView;
  private ToolbarWidgetWrapper mWrapper;
  
  public Toolbar(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public Toolbar(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, R.attr.toolbarStyle);
  }
  
  public Toolbar(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    paramContext = TintTypedArray.obtainStyledAttributes(getContext(), paramAttributeSet, R.styleable.Toolbar, paramInt, 0);
    mTitleTextAppearance = paramContext.getResourceId(R.styleable.Toolbar_titleTextAppearance, 0);
    mSubtitleTextAppearance = paramContext.getResourceId(R.styleable.Toolbar_subtitleTextAppearance, 0);
    mGravity = paramContext.getInteger(R.styleable.Toolbar_android_gravity, mGravity);
    mButtonGravity = 48;
    paramInt = paramContext.getDimensionPixelOffset(R.styleable.Toolbar_titleMargins, 0);
    mTitleMarginBottom = paramInt;
    mTitleMarginTop = paramInt;
    mTitleMarginEnd = paramInt;
    mTitleMarginStart = paramInt;
    paramInt = paramContext.getDimensionPixelOffset(R.styleable.Toolbar_titleMarginStart, -1);
    if (paramInt >= 0) {
      mTitleMarginStart = paramInt;
    }
    paramInt = paramContext.getDimensionPixelOffset(R.styleable.Toolbar_titleMarginEnd, -1);
    if (paramInt >= 0) {
      mTitleMarginEnd = paramInt;
    }
    paramInt = paramContext.getDimensionPixelOffset(R.styleable.Toolbar_titleMarginTop, -1);
    if (paramInt >= 0) {
      mTitleMarginTop = paramInt;
    }
    paramInt = paramContext.getDimensionPixelOffset(R.styleable.Toolbar_titleMarginBottom, -1);
    if (paramInt >= 0) {
      mTitleMarginBottom = paramInt;
    }
    mMaxButtonHeight = paramContext.getDimensionPixelSize(R.styleable.Toolbar_maxButtonHeight, -1);
    paramInt = paramContext.getDimensionPixelOffset(R.styleable.Toolbar_contentInsetStart, Integer.MIN_VALUE);
    int i = paramContext.getDimensionPixelOffset(R.styleable.Toolbar_contentInsetEnd, Integer.MIN_VALUE);
    int j = paramContext.getDimensionPixelSize(R.styleable.Toolbar_contentInsetLeft, 0);
    int k = paramContext.getDimensionPixelSize(R.styleable.Toolbar_contentInsetRight, 0);
    mContentInsets.setAbsolute(j, k);
    if ((paramInt != Integer.MIN_VALUE) || (i != Integer.MIN_VALUE)) {
      mContentInsets.setRelative(paramInt, i);
    }
    mCollapseIcon = paramContext.getDrawable(R.styleable.Toolbar_collapseIcon);
    mCollapseDescription = paramContext.getText(R.styleable.Toolbar_collapseContentDescription);
    paramAttributeSet = paramContext.getText(R.styleable.Toolbar_title);
    if (!TextUtils.isEmpty(paramAttributeSet)) {
      setTitle(paramAttributeSet);
    }
    paramAttributeSet = paramContext.getText(R.styleable.Toolbar_subtitle);
    if (!TextUtils.isEmpty(paramAttributeSet)) {
      setSubtitle(paramAttributeSet);
    }
    mPopupContext = getContext();
    setPopupTheme(paramContext.getResourceId(R.styleable.Toolbar_popupTheme, 0));
    paramAttributeSet = paramContext.getDrawable(R.styleable.Toolbar_navigationIcon);
    if (paramAttributeSet != null) {
      setNavigationIcon(paramAttributeSet);
    }
    paramAttributeSet = paramContext.getText(R.styleable.Toolbar_navigationContentDescription);
    if (!TextUtils.isEmpty(paramAttributeSet)) {
      setNavigationContentDescription(paramAttributeSet);
    }
    paramContext.recycle();
    mTintManager = paramContext.getTintManager();
  }
  
  private void addCustomViewsWithGravity(List<View> paramList, int paramInt)
  {
    int i = 1;
    if (ViewCompat.getLayoutDirection(this) == 1) {}
    int k;
    int j;
    View localView;
    LayoutParams localLayoutParams;
    for (;;)
    {
      k = getChildCount();
      j = GravityCompat.getAbsoluteGravity(paramInt, ViewCompat.getLayoutDirection(this));
      paramList.clear();
      if (i == 0) {
        break;
      }
      paramInt = k - 1;
      while (paramInt >= 0)
      {
        localView = getChildAt(paramInt);
        localLayoutParams = (LayoutParams)localView.getLayoutParams();
        if ((mViewType == 0) && (shouldLayout(localView)) && (getChildHorizontalGravity(gravity) == j)) {
          paramList.add(localView);
        }
        paramInt -= 1;
      }
      i = 0;
    }
    paramInt = 0;
    while (paramInt < k)
    {
      localView = getChildAt(paramInt);
      localLayoutParams = (LayoutParams)localView.getLayoutParams();
      if ((mViewType == 0) && (shouldLayout(localView)) && (getChildHorizontalGravity(gravity) == j)) {
        paramList.add(localView);
      }
      paramInt += 1;
    }
  }
  
  private void addSystemView(View paramView)
  {
    Object localObject = paramView.getLayoutParams();
    if (localObject == null) {
      localObject = generateDefaultLayoutParams();
    }
    for (;;)
    {
      mViewType = 1;
      addView(paramView, (ViewGroup.LayoutParams)localObject);
      return;
      if (!checkLayoutParams((ViewGroup.LayoutParams)localObject)) {
        localObject = generateLayoutParams((ViewGroup.LayoutParams)localObject);
      } else {
        localObject = (LayoutParams)localObject;
      }
    }
  }
  
  private void ensureCollapseButtonView()
  {
    if (mCollapseButtonView == null)
    {
      mCollapseButtonView = new ImageButton(getContext(), null, R.attr.toolbarNavigationButtonStyle);
      mCollapseButtonView.setImageDrawable(mCollapseIcon);
      mCollapseButtonView.setContentDescription(mCollapseDescription);
      LayoutParams localLayoutParams = generateDefaultLayoutParams();
      gravity = (0x800003 | mButtonGravity & 0x70);
      mViewType = 2;
      mCollapseButtonView.setLayoutParams(localLayoutParams);
      mCollapseButtonView.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          collapseActionView();
        }
      });
    }
  }
  
  private void ensureLogoView()
  {
    if (mLogoView == null) {
      mLogoView = new ImageView(getContext());
    }
  }
  
  private void ensureMenu()
  {
    ensureMenuView();
    if (mMenuView.peekMenu() == null)
    {
      MenuBuilder localMenuBuilder = (MenuBuilder)mMenuView.getMenu();
      if (mExpandedMenuPresenter == null) {
        mExpandedMenuPresenter = new ExpandedActionViewMenuPresenter(null);
      }
      mMenuView.setExpandedActionViewsExclusive(true);
      localMenuBuilder.addMenuPresenter(mExpandedMenuPresenter, mPopupContext);
    }
  }
  
  private void ensureMenuView()
  {
    if (mMenuView == null)
    {
      mMenuView = new ActionMenuView(getContext());
      mMenuView.setPopupTheme(mPopupTheme);
      mMenuView.setOnMenuItemClickListener(mMenuViewItemClickListener);
      mMenuView.setMenuCallbacks(mActionMenuPresenterCallback, mMenuBuilderCallback);
      LayoutParams localLayoutParams = generateDefaultLayoutParams();
      gravity = (0x800005 | mButtonGravity & 0x70);
      mMenuView.setLayoutParams(localLayoutParams);
      addSystemView(mMenuView);
    }
  }
  
  private void ensureNavButtonView()
  {
    if (mNavButtonView == null)
    {
      mNavButtonView = new ImageButton(getContext(), null, R.attr.toolbarNavigationButtonStyle);
      LayoutParams localLayoutParams = generateDefaultLayoutParams();
      gravity = (0x800003 | mButtonGravity & 0x70);
      mNavButtonView.setLayoutParams(localLayoutParams);
    }
  }
  
  private int getChildHorizontalGravity(int paramInt)
  {
    int j = ViewCompat.getLayoutDirection(this);
    int i = GravityCompat.getAbsoluteGravity(paramInt, j) & 0x7;
    paramInt = i;
    switch (i)
    {
    case 2: 
    case 4: 
    default: 
      if (j != 1) {
        break;
      }
    }
    for (paramInt = 5;; paramInt = 3) {
      return paramInt;
    }
  }
  
  private int getChildTop(View paramView, int paramInt)
  {
    LayoutParams localLayoutParams = (LayoutParams)paramView.getLayoutParams();
    int j = paramView.getMeasuredHeight();
    int k;
    int m;
    int i;
    if (paramInt > 0)
    {
      paramInt = (j - paramInt) / 2;
      switch (getChildVerticalGravity(gravity))
      {
      default: 
        k = getPaddingTop();
        paramInt = getPaddingBottom();
        m = getHeight();
        i = (m - k - paramInt - j) / 2;
        if (i < topMargin) {
          paramInt = topMargin;
        }
        break;
      }
    }
    for (;;)
    {
      return k + paramInt;
      paramInt = 0;
      break;
      return getPaddingTop() - paramInt;
      return getHeight() - getPaddingBottom() - j - bottomMargin - paramInt;
      j = m - paramInt - j - i - k;
      paramInt = i;
      if (j < bottomMargin) {
        paramInt = Math.max(0, i - (bottomMargin - j));
      }
    }
  }
  
  private int getChildVerticalGravity(int paramInt)
  {
    int i = paramInt & 0x70;
    paramInt = i;
    switch (i)
    {
    default: 
      paramInt = mGravity & 0x70;
    }
    return paramInt;
  }
  
  private int getHorizontalMargins(View paramView)
  {
    paramView = (ViewGroup.MarginLayoutParams)paramView.getLayoutParams();
    return MarginLayoutParamsCompat.getMarginStart(paramView) + MarginLayoutParamsCompat.getMarginEnd(paramView);
  }
  
  private MenuInflater getMenuInflater()
  {
    return new SupportMenuInflater(getContext());
  }
  
  private int getVerticalMargins(View paramView)
  {
    paramView = (ViewGroup.MarginLayoutParams)paramView.getLayoutParams();
    return topMargin + bottomMargin;
  }
  
  private int getViewListMeasuredWidth(List<View> paramList, int[] paramArrayOfInt)
  {
    int m = paramArrayOfInt[0];
    int k = paramArrayOfInt[1];
    int j = 0;
    int n = paramList.size();
    int i = 0;
    while (i < n)
    {
      paramArrayOfInt = (View)paramList.get(i);
      LayoutParams localLayoutParams = (LayoutParams)paramArrayOfInt.getLayoutParams();
      m = leftMargin - m;
      k = rightMargin - k;
      int i1 = Math.max(0, m);
      int i2 = Math.max(0, k);
      m = Math.max(0, -m);
      k = Math.max(0, -k);
      j += paramArrayOfInt.getMeasuredWidth() + i1 + i2;
      i += 1;
    }
    return j;
  }
  
  private int layoutChildLeft(View paramView, int paramInt1, int[] paramArrayOfInt, int paramInt2)
  {
    LayoutParams localLayoutParams = (LayoutParams)paramView.getLayoutParams();
    int i = leftMargin - paramArrayOfInt[0];
    paramInt1 += Math.max(0, i);
    paramArrayOfInt[0] = Math.max(0, -i);
    paramInt2 = getChildTop(paramView, paramInt2);
    i = paramView.getMeasuredWidth();
    paramView.layout(paramInt1, paramInt2, paramInt1 + i, paramView.getMeasuredHeight() + paramInt2);
    return paramInt1 + (rightMargin + i);
  }
  
  private int layoutChildRight(View paramView, int paramInt1, int[] paramArrayOfInt, int paramInt2)
  {
    LayoutParams localLayoutParams = (LayoutParams)paramView.getLayoutParams();
    int i = rightMargin - paramArrayOfInt[1];
    paramInt1 -= Math.max(0, i);
    paramArrayOfInt[1] = Math.max(0, -i);
    paramInt2 = getChildTop(paramView, paramInt2);
    i = paramView.getMeasuredWidth();
    paramView.layout(paramInt1 - i, paramInt2, paramInt1, paramView.getMeasuredHeight() + paramInt2);
    return paramInt1 - (leftMargin + i);
  }
  
  private int measureChildCollapseMargins(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int[] paramArrayOfInt)
  {
    ViewGroup.MarginLayoutParams localMarginLayoutParams = (ViewGroup.MarginLayoutParams)paramView.getLayoutParams();
    int i = leftMargin - paramArrayOfInt[0];
    int j = rightMargin - paramArrayOfInt[1];
    int k = Math.max(0, i) + Math.max(0, j);
    paramArrayOfInt[0] = Math.max(0, -i);
    paramArrayOfInt[1] = Math.max(0, -j);
    paramView.measure(getChildMeasureSpec(paramInt1, getPaddingLeft() + getPaddingRight() + k + paramInt2, width), getChildMeasureSpec(paramInt3, getPaddingTop() + getPaddingBottom() + topMargin + bottomMargin + paramInt4, height));
    return paramView.getMeasuredWidth() + k;
  }
  
  private void measureChildConstrained(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    ViewGroup.MarginLayoutParams localMarginLayoutParams = (ViewGroup.MarginLayoutParams)paramView.getLayoutParams();
    int i = getChildMeasureSpec(paramInt1, getPaddingLeft() + getPaddingRight() + leftMargin + rightMargin + paramInt2, width);
    paramInt2 = getChildMeasureSpec(paramInt3, getPaddingTop() + getPaddingBottom() + topMargin + bottomMargin + paramInt4, height);
    paramInt3 = View.MeasureSpec.getMode(paramInt2);
    paramInt1 = paramInt2;
    if (paramInt3 != 1073741824)
    {
      paramInt1 = paramInt2;
      if (paramInt5 >= 0) {
        if (paramInt3 == 0) {
          break label132;
        }
      }
    }
    label132:
    for (paramInt1 = Math.min(View.MeasureSpec.getSize(paramInt2), paramInt5);; paramInt1 = paramInt5)
    {
      paramInt1 = View.MeasureSpec.makeMeasureSpec(paramInt1, 1073741824);
      paramView.measure(i, paramInt1);
      return;
    }
  }
  
  private void postShowOverflowMenu()
  {
    removeCallbacks(mShowOverflowMenuRunnable);
    post(mShowOverflowMenuRunnable);
  }
  
  private void setChildVisibilityForExpandedActionView(boolean paramBoolean)
  {
    int k = getChildCount();
    int i = 0;
    if (i < k)
    {
      View localView = getChildAt(i);
      if ((getLayoutParamsmViewType != 2) && (localView != mMenuView)) {
        if (!paramBoolean) {
          break label65;
        }
      }
      label65:
      for (int j = 8;; j = 0)
      {
        localView.setVisibility(j);
        i += 1;
        break;
      }
    }
  }
  
  private boolean shouldCollapse()
  {
    if (!mCollapsible) {
      return false;
    }
    int j = getChildCount();
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        break label56;
      }
      View localView = getChildAt(i);
      if ((shouldLayout(localView)) && (localView.getMeasuredWidth() > 0) && (localView.getMeasuredHeight() > 0)) {
        break;
      }
      i += 1;
    }
    label56:
    return true;
  }
  
  private boolean shouldLayout(View paramView)
  {
    return (paramView != null) && (paramView.getParent() == this) && (paramView.getVisibility() != 8);
  }
  
  private void updateChildVisibilityForExpandedActionView(View paramView)
  {
    if ((getLayoutParamsmViewType != 2) && (paramView != mMenuView)) {
      if (mExpandedActionView == null) {
        break label38;
      }
    }
    label38:
    for (int i = 8;; i = 0)
    {
      paramView.setVisibility(i);
      return;
    }
  }
  
  public boolean canShowOverflowMenu()
  {
    return (getVisibility() == 0) && (mMenuView != null) && (mMenuView.isOverflowReserved());
  }
  
  protected boolean checkLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    return (super.checkLayoutParams(paramLayoutParams)) && ((paramLayoutParams instanceof LayoutParams));
  }
  
  public void collapseActionView()
  {
    if (mExpandedMenuPresenter == null) {}
    for (MenuItemImpl localMenuItemImpl = null;; localMenuItemImpl = mExpandedMenuPresenter.mCurrentExpandedItem)
    {
      if (localMenuItemImpl != null) {
        localMenuItemImpl.collapseActionView();
      }
      return;
    }
  }
  
  public void dismissPopupMenus()
  {
    if (mMenuView != null) {
      mMenuView.dismissPopupMenus();
    }
  }
  
  protected LayoutParams generateDefaultLayoutParams()
  {
    return new LayoutParams(-2, -2);
  }
  
  public LayoutParams generateLayoutParams(AttributeSet paramAttributeSet)
  {
    return new LayoutParams(getContext(), paramAttributeSet);
  }
  
  protected LayoutParams generateLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    if ((paramLayoutParams instanceof LayoutParams)) {
      return new LayoutParams((LayoutParams)paramLayoutParams);
    }
    if ((paramLayoutParams instanceof ActionBar.LayoutParams)) {
      return new LayoutParams((ActionBar.LayoutParams)paramLayoutParams);
    }
    if ((paramLayoutParams instanceof ViewGroup.MarginLayoutParams)) {
      return new LayoutParams((ViewGroup.MarginLayoutParams)paramLayoutParams);
    }
    return new LayoutParams(paramLayoutParams);
  }
  
  public int getContentInsetEnd()
  {
    return mContentInsets.getEnd();
  }
  
  public int getContentInsetLeft()
  {
    return mContentInsets.getLeft();
  }
  
  public int getContentInsetRight()
  {
    return mContentInsets.getRight();
  }
  
  public int getContentInsetStart()
  {
    return mContentInsets.getStart();
  }
  
  public Drawable getLogo()
  {
    if (mLogoView != null) {
      return mLogoView.getDrawable();
    }
    return null;
  }
  
  public CharSequence getLogoDescription()
  {
    if (mLogoView != null) {
      return mLogoView.getContentDescription();
    }
    return null;
  }
  
  public Menu getMenu()
  {
    ensureMenu();
    return mMenuView.getMenu();
  }
  
  public CharSequence getNavigationContentDescription()
  {
    if (mNavButtonView != null) {
      return mNavButtonView.getContentDescription();
    }
    return null;
  }
  
  public Drawable getNavigationIcon()
  {
    if (mNavButtonView != null) {
      return mNavButtonView.getDrawable();
    }
    return null;
  }
  
  public int getPopupTheme()
  {
    return mPopupTheme;
  }
  
  public CharSequence getSubtitle()
  {
    return mSubtitleText;
  }
  
  public CharSequence getTitle()
  {
    return mTitleText;
  }
  
  public DecorToolbar getWrapper()
  {
    if (mWrapper == null) {
      mWrapper = new ToolbarWidgetWrapper(this, true);
    }
    return mWrapper;
  }
  
  public boolean hasExpandedActionView()
  {
    return (mExpandedMenuPresenter != null) && (mExpandedMenuPresenter.mCurrentExpandedItem != null);
  }
  
  public boolean hideOverflowMenu()
  {
    return (mMenuView != null) && (mMenuView.hideOverflowMenu());
  }
  
  public boolean isOverflowMenuShowPending()
  {
    return (mMenuView != null) && (mMenuView.isOverflowMenuShowPending());
  }
  
  public boolean isOverflowMenuShowing()
  {
    return (mMenuView != null) && (mMenuView.isOverflowMenuShowing());
  }
  
  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    removeCallbacks(mShowOverflowMenuRunnable);
  }
  
  public boolean onHoverEvent(MotionEvent paramMotionEvent)
  {
    int i = MotionEventCompat.getActionMasked(paramMotionEvent);
    if (i == 9) {
      mEatingHover = false;
    }
    if (!mEatingHover)
    {
      boolean bool = super.onHoverEvent(paramMotionEvent);
      if ((i == 9) && (!bool)) {
        mEatingHover = true;
      }
    }
    if ((i == 10) || (i == 3)) {
      mEatingHover = false;
    }
    return true;
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    int j;
    int i2;
    int i4;
    int n;
    int i3;
    int m;
    int i5;
    int[] arrayOfInt;
    int i1;
    label120:
    label160:
    label200:
    label300:
    label340:
    boolean bool;
    Object localObject1;
    int k;
    label467:
    Object localObject2;
    if (ViewCompat.getLayoutDirection(this) == 1)
    {
      j = 1;
      i2 = getWidth();
      i4 = getHeight();
      n = getPaddingLeft();
      i3 = getPaddingRight();
      m = getPaddingTop();
      i5 = getPaddingBottom();
      paramInt3 = n;
      paramInt4 = i2 - i3;
      arrayOfInt = mTempMargins;
      arrayOfInt[1] = 0;
      arrayOfInt[0] = 0;
      i1 = ViewCompat.getMinimumHeight(this);
      paramInt1 = paramInt3;
      paramInt2 = paramInt4;
      if (shouldLayout(mNavButtonView))
      {
        if (j == 0) {
          break label901;
        }
        paramInt2 = layoutChildRight(mNavButtonView, paramInt4, arrayOfInt, i1);
        paramInt1 = paramInt3;
      }
      paramInt3 = paramInt1;
      paramInt4 = paramInt2;
      if (shouldLayout(mCollapseButtonView))
      {
        if (j == 0) {
          break label922;
        }
        paramInt4 = layoutChildRight(mCollapseButtonView, paramInt2, arrayOfInt, i1);
        paramInt3 = paramInt1;
      }
      paramInt2 = paramInt3;
      paramInt1 = paramInt4;
      if (shouldLayout(mMenuView))
      {
        if (j == 0) {
          break label943;
        }
        paramInt2 = layoutChildLeft(mMenuView, paramInt3, arrayOfInt, i1);
        paramInt1 = paramInt4;
      }
      arrayOfInt[0] = Math.max(0, getContentInsetLeft() - paramInt2);
      arrayOfInt[1] = Math.max(0, getContentInsetRight() - (i2 - i3 - paramInt1));
      paramInt3 = Math.max(paramInt2, getContentInsetLeft());
      paramInt4 = Math.min(paramInt1, i2 - i3 - getContentInsetRight());
      paramInt1 = paramInt3;
      paramInt2 = paramInt4;
      if (shouldLayout(mExpandedActionView))
      {
        if (j == 0) {
          break label964;
        }
        paramInt2 = layoutChildRight(mExpandedActionView, paramInt4, arrayOfInt, i1);
        paramInt1 = paramInt3;
      }
      paramInt3 = paramInt1;
      paramInt4 = paramInt2;
      if (shouldLayout(mLogoView))
      {
        if (j == 0) {
          break label985;
        }
        paramInt4 = layoutChildRight(mLogoView, paramInt2, arrayOfInt, i1);
        paramInt3 = paramInt1;
      }
      paramBoolean = shouldLayout(mTitleTextView);
      bool = shouldLayout(mSubtitleTextView);
      paramInt1 = 0;
      if (paramBoolean)
      {
        localObject1 = (LayoutParams)mTitleTextView.getLayoutParams();
        paramInt1 = 0 + (topMargin + mTitleTextView.getMeasuredHeight() + bottomMargin);
      }
      k = paramInt1;
      if (bool)
      {
        localObject1 = (LayoutParams)mSubtitleTextView.getLayoutParams();
        k = paramInt1 + (topMargin + mSubtitleTextView.getMeasuredHeight() + bottomMargin);
      }
      if (!paramBoolean)
      {
        paramInt2 = paramInt3;
        paramInt1 = paramInt4;
        if (!bool) {}
      }
      else
      {
        if (!paramBoolean) {
          break label1006;
        }
        localObject1 = mTitleTextView;
        if (!bool) {
          break label1015;
        }
        localObject2 = mSubtitleTextView;
        label478:
        localObject1 = (LayoutParams)((View)localObject1).getLayoutParams();
        localObject2 = (LayoutParams)((View)localObject2).getLayoutParams();
        if (((!paramBoolean) || (mTitleTextView.getMeasuredWidth() <= 0)) && ((!bool) || (mSubtitleTextView.getMeasuredWidth() <= 0))) {
          break label1024;
        }
        i = 1;
        label530:
        switch (mGravity & 0x70)
        {
        default: 
          paramInt2 = (i4 - m - i5 - k) / 2;
          if (paramInt2 < topMargin + mTitleMarginTop)
          {
            paramInt1 = topMargin + mTitleMarginTop;
            label603:
            paramInt1 = m + paramInt1;
            label608:
            if (j == 0) {
              break label1132;
            }
            if (i == 0) {
              break label1127;
            }
          }
          break;
        }
      }
    }
    label901:
    label922:
    label943:
    label964:
    label985:
    label1006:
    label1015:
    label1024:
    label1127:
    for (paramInt2 = mTitleMarginStart;; paramInt2 = 0)
    {
      paramInt2 -= arrayOfInt[1];
      paramInt4 -= Math.max(0, paramInt2);
      arrayOfInt[1] = Math.max(0, -paramInt2);
      k = paramInt4;
      paramInt2 = paramInt4;
      j = k;
      m = paramInt1;
      if (paramBoolean)
      {
        localObject1 = (LayoutParams)mTitleTextView.getLayoutParams();
        j = k - mTitleTextView.getMeasuredWidth();
        m = paramInt1 + mTitleTextView.getMeasuredHeight();
        mTitleTextView.layout(j, paramInt1, k, m);
        j -= mTitleMarginEnd;
        m += bottomMargin;
      }
      k = paramInt2;
      if (bool)
      {
        localObject1 = (LayoutParams)mSubtitleTextView.getLayoutParams();
        paramInt1 = m + topMargin;
        k = mSubtitleTextView.getMeasuredWidth();
        m = paramInt1 + mSubtitleTextView.getMeasuredHeight();
        mSubtitleTextView.layout(paramInt2 - k, paramInt1, paramInt2, m);
        k = paramInt2 - mTitleMarginEnd;
        paramInt1 = bottomMargin;
      }
      paramInt2 = paramInt3;
      paramInt1 = paramInt4;
      if (i != 0)
      {
        paramInt1 = Math.min(j, k);
        paramInt2 = paramInt3;
      }
      addCustomViewsWithGravity(mTempViews, 3);
      paramInt4 = mTempViews.size();
      paramInt3 = 0;
      while (paramInt3 < paramInt4)
      {
        paramInt2 = layoutChildLeft((View)mTempViews.get(paramInt3), paramInt2, arrayOfInt, i1);
        paramInt3 += 1;
      }
      j = 0;
      break;
      paramInt1 = layoutChildLeft(mNavButtonView, paramInt3, arrayOfInt, i1);
      paramInt2 = paramInt4;
      break label120;
      paramInt3 = layoutChildLeft(mCollapseButtonView, paramInt1, arrayOfInt, i1);
      paramInt4 = paramInt2;
      break label160;
      paramInt1 = layoutChildRight(mMenuView, paramInt4, arrayOfInt, i1);
      paramInt2 = paramInt3;
      break label200;
      paramInt1 = layoutChildLeft(mExpandedActionView, paramInt3, arrayOfInt, i1);
      paramInt2 = paramInt4;
      break label300;
      paramInt3 = layoutChildLeft(mLogoView, paramInt1, arrayOfInt, i1);
      paramInt4 = paramInt2;
      break label340;
      localObject1 = mSubtitleTextView;
      break label467;
      localObject2 = mTitleTextView;
      break label478;
      i = 0;
      break label530;
      paramInt1 = getPaddingTop() + topMargin + mTitleMarginTop;
      break label608;
      k = i4 - i5 - k - paramInt2 - m;
      paramInt1 = paramInt2;
      if (k >= bottomMargin + mTitleMarginBottom) {
        break label603;
      }
      paramInt1 = Math.max(0, paramInt2 - (bottomMargin + mTitleMarginBottom - k));
      break label603;
      paramInt1 = i4 - i5 - bottomMargin - mTitleMarginBottom - k;
      break label608;
    }
    label1132:
    if (i != 0) {}
    for (paramInt2 = mTitleMarginStart;; paramInt2 = 0)
    {
      j = paramInt2 - arrayOfInt[0];
      paramInt2 = paramInt3 + Math.max(0, j);
      arrayOfInt[0] = Math.max(0, -j);
      k = paramInt2;
      paramInt3 = paramInt2;
      j = k;
      m = paramInt1;
      if (paramBoolean)
      {
        localObject1 = (LayoutParams)mTitleTextView.getLayoutParams();
        j = k + mTitleTextView.getMeasuredWidth();
        m = paramInt1 + mTitleTextView.getMeasuredHeight();
        mTitleTextView.layout(k, paramInt1, j, m);
        j += mTitleMarginEnd;
        m += bottomMargin;
      }
      k = paramInt3;
      if (bool)
      {
        localObject1 = (LayoutParams)mSubtitleTextView.getLayoutParams();
        paramInt1 = m + topMargin;
        k = paramInt3 + mSubtitleTextView.getMeasuredWidth();
        m = paramInt1 + mSubtitleTextView.getMeasuredHeight();
        mSubtitleTextView.layout(paramInt3, paramInt1, k, m);
        k += mTitleMarginEnd;
        paramInt1 = bottomMargin;
      }
      paramInt1 = paramInt4;
      if (i == 0) {
        break;
      }
      paramInt2 = Math.max(j, k);
      paramInt1 = paramInt4;
      break;
    }
    addCustomViewsWithGravity(mTempViews, 5);
    int i = mTempViews.size();
    paramInt4 = 0;
    paramInt3 = paramInt1;
    paramInt1 = paramInt4;
    while (paramInt1 < i)
    {
      paramInt3 = layoutChildRight((View)mTempViews.get(paramInt1), paramInt3, arrayOfInt, i1);
      paramInt1 += 1;
    }
    addCustomViewsWithGravity(mTempViews, 1);
    paramInt1 = getViewListMeasuredWidth(mTempViews, arrayOfInt);
    paramInt4 = n + (i2 - n - i3) / 2 - paramInt1 / 2;
    i = paramInt4 + paramInt1;
    if (paramInt4 < paramInt2) {
      paramInt1 = paramInt2;
    }
    for (;;)
    {
      paramInt3 = mTempViews.size();
      paramInt2 = 0;
      while (paramInt2 < paramInt3)
      {
        paramInt1 = layoutChildLeft((View)mTempViews.get(paramInt2), paramInt1, arrayOfInt, i1);
        paramInt2 += 1;
      }
      paramInt1 = paramInt4;
      if (i > paramInt3) {
        paramInt1 = paramInt4 - (i - paramInt3);
      }
    }
    mTempViews.clear();
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int m = 0;
    int k = 0;
    int[] arrayOfInt = mTempMargins;
    int n;
    label524:
    View localView;
    if (ViewUtils.isLayoutRtl(this))
    {
      i2 = 1;
      i1 = 0;
      n = 0;
      if (shouldLayout(mNavButtonView))
      {
        measureChildConstrained(mNavButtonView, paramInt1, 0, paramInt2, 0, mMaxButtonHeight);
        n = mNavButtonView.getMeasuredWidth() + getHorizontalMargins(mNavButtonView);
        m = Math.max(0, mNavButtonView.getMeasuredHeight() + getVerticalMargins(mNavButtonView));
        k = ViewUtils.combineMeasuredStates(0, ViewCompat.getMeasuredState(mNavButtonView));
      }
      i = k;
      j = m;
      if (shouldLayout(mCollapseButtonView))
      {
        measureChildConstrained(mCollapseButtonView, paramInt1, 0, paramInt2, 0, mMaxButtonHeight);
        n = mCollapseButtonView.getMeasuredWidth() + getHorizontalMargins(mCollapseButtonView);
        j = Math.max(m, mCollapseButtonView.getMeasuredHeight() + getVerticalMargins(mCollapseButtonView));
        i = ViewUtils.combineMeasuredStates(k, ViewCompat.getMeasuredState(mCollapseButtonView));
      }
      k = getContentInsetStart();
      i3 = 0 + Math.max(k, n);
      arrayOfInt[i2] = Math.max(0, k - n);
      n = 0;
      k = i;
      m = j;
      if (shouldLayout(mMenuView))
      {
        measureChildConstrained(mMenuView, paramInt1, i3, paramInt2, 0, mMaxButtonHeight);
        n = mMenuView.getMeasuredWidth() + getHorizontalMargins(mMenuView);
        m = Math.max(j, mMenuView.getMeasuredHeight() + getVerticalMargins(mMenuView));
        k = ViewUtils.combineMeasuredStates(i, ViewCompat.getMeasuredState(mMenuView));
      }
      i = getContentInsetEnd();
      i2 = i3 + Math.max(i, n);
      arrayOfInt[i1] = Math.max(0, i - n);
      i1 = i2;
      i = k;
      j = m;
      if (shouldLayout(mExpandedActionView))
      {
        i1 = i2 + measureChildCollapseMargins(mExpandedActionView, paramInt1, i2, paramInt2, 0, arrayOfInt);
        j = Math.max(m, mExpandedActionView.getMeasuredHeight() + getVerticalMargins(mExpandedActionView));
        i = ViewUtils.combineMeasuredStates(k, ViewCompat.getMeasuredState(mExpandedActionView));
      }
      k = i1;
      m = i;
      n = j;
      if (shouldLayout(mLogoView))
      {
        k = i1 + measureChildCollapseMargins(mLogoView, paramInt1, i1, paramInt2, 0, arrayOfInt);
        n = Math.max(j, mLogoView.getMeasuredHeight() + getVerticalMargins(mLogoView));
        m = ViewUtils.combineMeasuredStates(i, ViewCompat.getMeasuredState(mLogoView));
      }
      i3 = getChildCount();
      j = 0;
      i1 = n;
      i = m;
      n = k;
      if (j >= i3) {
        break label664;
      }
      localView = getChildAt(j);
      k = n;
      m = i;
      i2 = i1;
      if (getLayoutParamsmViewType == 0)
      {
        if (shouldLayout(localView)) {
          break label613;
        }
        i2 = i1;
        m = i;
        k = n;
      }
    }
    for (;;)
    {
      j += 1;
      n = k;
      i = m;
      i1 = i2;
      break label524;
      i2 = 0;
      i1 = 1;
      break;
      label613:
      k = n + measureChildCollapseMargins(localView, paramInt1, n, paramInt2, 0, arrayOfInt);
      i2 = Math.max(i1, localView.getMeasuredHeight() + getVerticalMargins(localView));
      m = ViewUtils.combineMeasuredStates(i, ViewCompat.getMeasuredState(localView));
    }
    label664:
    m = 0;
    k = 0;
    int i4 = mTitleMarginTop + mTitleMarginBottom;
    int i5 = mTitleMarginStart + mTitleMarginEnd;
    int j = i;
    if (shouldLayout(mTitleTextView))
    {
      measureChildCollapseMargins(mTitleTextView, paramInt1, n + i5, paramInt2, i4, arrayOfInt);
      m = mTitleTextView.getMeasuredWidth() + getHorizontalMargins(mTitleTextView);
      k = mTitleTextView.getMeasuredHeight() + getVerticalMargins(mTitleTextView);
      j = ViewUtils.combineMeasuredStates(i, ViewCompat.getMeasuredState(mTitleTextView));
    }
    int i2 = j;
    int i3 = k;
    int i = m;
    if (shouldLayout(mSubtitleTextView))
    {
      i = Math.max(m, measureChildCollapseMargins(mSubtitleTextView, paramInt1, n + i5, paramInt2, k + i4, arrayOfInt));
      i3 = k + (mSubtitleTextView.getMeasuredHeight() + getVerticalMargins(mSubtitleTextView));
      i2 = ViewUtils.combineMeasuredStates(j, ViewCompat.getMeasuredState(mSubtitleTextView));
    }
    j = Math.max(i1, i3);
    int i1 = getPaddingLeft();
    i3 = getPaddingRight();
    k = getPaddingTop();
    m = getPaddingBottom();
    i = ViewCompat.resolveSizeAndState(Math.max(n + i + (i1 + i3), getSuggestedMinimumWidth()), paramInt1, 0xFF000000 & i2);
    paramInt1 = ViewCompat.resolveSizeAndState(Math.max(j + (k + m), getSuggestedMinimumHeight()), paramInt2, i2 << 16);
    if (shouldCollapse()) {
      paramInt1 = 0;
    }
    setMeasuredDimension(i, paramInt1);
  }
  
  protected void onRestoreInstanceState(Parcelable paramParcelable)
  {
    SavedState localSavedState = (SavedState)paramParcelable;
    super.onRestoreInstanceState(localSavedState.getSuperState());
    if (mMenuView != null) {}
    for (paramParcelable = mMenuView.peekMenu();; paramParcelable = null)
    {
      if ((expandedMenuItemId != 0) && (mExpandedMenuPresenter != null) && (paramParcelable != null))
      {
        paramParcelable = paramParcelable.findItem(expandedMenuItemId);
        if (paramParcelable != null) {
          MenuItemCompat.expandActionView(paramParcelable);
        }
      }
      if (isOverflowOpen) {
        postShowOverflowMenu();
      }
      return;
    }
  }
  
  public void onRtlPropertiesChanged(int paramInt)
  {
    boolean bool = true;
    if (Build.VERSION.SDK_INT >= 17) {
      super.onRtlPropertiesChanged(paramInt);
    }
    RtlSpacingHelper localRtlSpacingHelper = mContentInsets;
    if (paramInt == 1) {}
    for (;;)
    {
      localRtlSpacingHelper.setDirection(bool);
      return;
      bool = false;
    }
  }
  
  protected Parcelable onSaveInstanceState()
  {
    SavedState localSavedState = new SavedState(super.onSaveInstanceState());
    if ((mExpandedMenuPresenter != null) && (mExpandedMenuPresenter.mCurrentExpandedItem != null)) {
      expandedMenuItemId = mExpandedMenuPresenter.mCurrentExpandedItem.getItemId();
    }
    isOverflowOpen = isOverflowMenuShowing();
    return localSavedState;
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    int i = MotionEventCompat.getActionMasked(paramMotionEvent);
    if (i == 0) {
      mEatingTouch = false;
    }
    if (!mEatingTouch)
    {
      boolean bool = super.onTouchEvent(paramMotionEvent);
      if ((i == 0) && (!bool)) {
        mEatingTouch = true;
      }
    }
    if ((i == 1) || (i == 3)) {
      mEatingTouch = false;
    }
    return true;
  }
  
  public void setCollapsible(boolean paramBoolean)
  {
    mCollapsible = paramBoolean;
    requestLayout();
  }
  
  public void setContentInsetsRelative(int paramInt1, int paramInt2)
  {
    mContentInsets.setRelative(paramInt1, paramInt2);
  }
  
  public void setLogo(int paramInt)
  {
    setLogo(mTintManager.getDrawable(paramInt));
  }
  
  public void setLogo(Drawable paramDrawable)
  {
    if (paramDrawable != null)
    {
      ensureLogoView();
      if (mLogoView.getParent() == null)
      {
        addSystemView(mLogoView);
        updateChildVisibilityForExpandedActionView(mLogoView);
      }
    }
    for (;;)
    {
      if (mLogoView != null) {
        mLogoView.setImageDrawable(paramDrawable);
      }
      return;
      if ((mLogoView != null) && (mLogoView.getParent() != null)) {
        removeView(mLogoView);
      }
    }
  }
  
  public void setLogoDescription(int paramInt)
  {
    setLogoDescription(getContext().getText(paramInt));
  }
  
  public void setLogoDescription(CharSequence paramCharSequence)
  {
    if (!TextUtils.isEmpty(paramCharSequence)) {
      ensureLogoView();
    }
    if (mLogoView != null) {
      mLogoView.setContentDescription(paramCharSequence);
    }
  }
  
  public void setMenu(MenuBuilder paramMenuBuilder, ActionMenuPresenter paramActionMenuPresenter)
  {
    if ((paramMenuBuilder == null) && (mMenuView == null)) {}
    MenuBuilder localMenuBuilder;
    do
    {
      return;
      ensureMenuView();
      localMenuBuilder = mMenuView.peekMenu();
    } while (localMenuBuilder == paramMenuBuilder);
    if (localMenuBuilder != null)
    {
      localMenuBuilder.removeMenuPresenter(mOuterActionMenuPresenter);
      localMenuBuilder.removeMenuPresenter(mExpandedMenuPresenter);
    }
    if (mExpandedMenuPresenter == null) {
      mExpandedMenuPresenter = new ExpandedActionViewMenuPresenter(null);
    }
    paramActionMenuPresenter.setExpandedActionViewsExclusive(true);
    if (paramMenuBuilder != null)
    {
      paramMenuBuilder.addMenuPresenter(paramActionMenuPresenter, mPopupContext);
      paramMenuBuilder.addMenuPresenter(mExpandedMenuPresenter, mPopupContext);
    }
    for (;;)
    {
      mMenuView.setPopupTheme(mPopupTheme);
      mMenuView.setPresenter(paramActionMenuPresenter);
      mOuterActionMenuPresenter = paramActionMenuPresenter;
      return;
      paramActionMenuPresenter.initForMenu(mPopupContext, null);
      mExpandedMenuPresenter.initForMenu(mPopupContext, null);
      paramActionMenuPresenter.updateMenuView(true);
      mExpandedMenuPresenter.updateMenuView(true);
    }
  }
  
  public void setMenuCallbacks(MenuPresenter.Callback paramCallback, MenuBuilder.Callback paramCallback1)
  {
    mActionMenuPresenterCallback = paramCallback;
    mMenuBuilderCallback = paramCallback1;
  }
  
  public void setNavigationContentDescription(int paramInt)
  {
    if (paramInt != 0) {}
    for (CharSequence localCharSequence = getContext().getText(paramInt);; localCharSequence = null)
    {
      setNavigationContentDescription(localCharSequence);
      return;
    }
  }
  
  public void setNavigationContentDescription(CharSequence paramCharSequence)
  {
    if (!TextUtils.isEmpty(paramCharSequence)) {
      ensureNavButtonView();
    }
    if (mNavButtonView != null) {
      mNavButtonView.setContentDescription(paramCharSequence);
    }
  }
  
  public void setNavigationIcon(int paramInt)
  {
    setNavigationIcon(mTintManager.getDrawable(paramInt));
  }
  
  public void setNavigationIcon(Drawable paramDrawable)
  {
    if (paramDrawable != null)
    {
      ensureNavButtonView();
      if (mNavButtonView.getParent() == null)
      {
        addSystemView(mNavButtonView);
        updateChildVisibilityForExpandedActionView(mNavButtonView);
      }
    }
    for (;;)
    {
      if (mNavButtonView != null) {
        mNavButtonView.setImageDrawable(paramDrawable);
      }
      return;
      if ((mNavButtonView != null) && (mNavButtonView.getParent() != null)) {
        removeView(mNavButtonView);
      }
    }
  }
  
  public void setNavigationOnClickListener(View.OnClickListener paramOnClickListener)
  {
    ensureNavButtonView();
    mNavButtonView.setOnClickListener(paramOnClickListener);
  }
  
  public void setOnMenuItemClickListener(OnMenuItemClickListener paramOnMenuItemClickListener)
  {
    mOnMenuItemClickListener = paramOnMenuItemClickListener;
  }
  
  public void setPopupTheme(int paramInt)
  {
    if (mPopupTheme != paramInt)
    {
      mPopupTheme = paramInt;
      if (paramInt == 0) {
        mPopupContext = getContext();
      }
    }
    else
    {
      return;
    }
    mPopupContext = new ContextThemeWrapper(getContext(), paramInt);
  }
  
  public void setSubtitle(int paramInt)
  {
    setSubtitle(getContext().getText(paramInt));
  }
  
  public void setSubtitle(CharSequence paramCharSequence)
  {
    if (!TextUtils.isEmpty(paramCharSequence))
    {
      if (mSubtitleTextView == null)
      {
        Context localContext = getContext();
        mSubtitleTextView = new TextView(localContext);
        mSubtitleTextView.setSingleLine();
        mSubtitleTextView.setEllipsize(TextUtils.TruncateAt.END);
        if (mSubtitleTextAppearance != 0) {
          mSubtitleTextView.setTextAppearance(localContext, mSubtitleTextAppearance);
        }
        if (mSubtitleTextColor != 0) {
          mSubtitleTextView.setTextColor(mSubtitleTextColor);
        }
      }
      if (mSubtitleTextView.getParent() == null)
      {
        addSystemView(mSubtitleTextView);
        updateChildVisibilityForExpandedActionView(mSubtitleTextView);
      }
    }
    for (;;)
    {
      if (mSubtitleTextView != null) {
        mSubtitleTextView.setText(paramCharSequence);
      }
      mSubtitleText = paramCharSequence;
      return;
      if ((mSubtitleTextView != null) && (mSubtitleTextView.getParent() != null)) {
        removeView(mSubtitleTextView);
      }
    }
  }
  
  public void setSubtitleTextAppearance(Context paramContext, int paramInt)
  {
    mSubtitleTextAppearance = paramInt;
    if (mSubtitleTextView != null) {
      mSubtitleTextView.setTextAppearance(paramContext, paramInt);
    }
  }
  
  public void setSubtitleTextColor(int paramInt)
  {
    mSubtitleTextColor = paramInt;
    if (mSubtitleTextView != null) {
      mSubtitleTextView.setTextColor(paramInt);
    }
  }
  
  public void setTitle(int paramInt)
  {
    setTitle(getContext().getText(paramInt));
  }
  
  public void setTitle(CharSequence paramCharSequence)
  {
    if (!TextUtils.isEmpty(paramCharSequence))
    {
      if (mTitleTextView == null)
      {
        Context localContext = getContext();
        mTitleTextView = new TextView(localContext);
        mTitleTextView.setSingleLine();
        mTitleTextView.setEllipsize(TextUtils.TruncateAt.END);
        if (mTitleTextAppearance != 0) {
          mTitleTextView.setTextAppearance(localContext, mTitleTextAppearance);
        }
        if (mTitleTextColor != 0) {
          mTitleTextView.setTextColor(mTitleTextColor);
        }
      }
      if (mTitleTextView.getParent() == null)
      {
        addSystemView(mTitleTextView);
        updateChildVisibilityForExpandedActionView(mTitleTextView);
      }
    }
    for (;;)
    {
      if (mTitleTextView != null) {
        mTitleTextView.setText(paramCharSequence);
      }
      mTitleText = paramCharSequence;
      return;
      if ((mTitleTextView != null) && (mTitleTextView.getParent() != null)) {
        removeView(mTitleTextView);
      }
    }
  }
  
  public void setTitleTextAppearance(Context paramContext, int paramInt)
  {
    mTitleTextAppearance = paramInt;
    if (mTitleTextView != null) {
      mTitleTextView.setTextAppearance(paramContext, paramInt);
    }
  }
  
  public void setTitleTextColor(int paramInt)
  {
    mTitleTextColor = paramInt;
    if (mTitleTextView != null) {
      mTitleTextView.setTextColor(paramInt);
    }
  }
  
  public boolean showOverflowMenu()
  {
    return (mMenuView != null) && (mMenuView.showOverflowMenu());
  }
  
  private class ExpandedActionViewMenuPresenter
    implements MenuPresenter
  {
    MenuItemImpl mCurrentExpandedItem;
    MenuBuilder mMenu;
    
    private ExpandedActionViewMenuPresenter() {}
    
    public boolean collapseItemActionView(MenuBuilder paramMenuBuilder, MenuItemImpl paramMenuItemImpl)
    {
      if ((mExpandedActionView instanceof CollapsibleActionView)) {
        ((CollapsibleActionView)mExpandedActionView).onActionViewCollapsed();
      }
      removeView(mExpandedActionView);
      removeView(mCollapseButtonView);
      mExpandedActionView = null;
      Toolbar.this.setChildVisibilityForExpandedActionView(false);
      mCurrentExpandedItem = null;
      requestLayout();
      paramMenuItemImpl.setActionViewExpanded(false);
      return true;
    }
    
    public boolean expandItemActionView(MenuBuilder paramMenuBuilder, MenuItemImpl paramMenuItemImpl)
    {
      Toolbar.this.ensureCollapseButtonView();
      if (mCollapseButtonView.getParent() != Toolbar.this) {
        addView(mCollapseButtonView);
      }
      mExpandedActionView = paramMenuItemImpl.getActionView();
      mCurrentExpandedItem = paramMenuItemImpl;
      if (mExpandedActionView.getParent() != Toolbar.this)
      {
        paramMenuBuilder = generateDefaultLayoutParams();
        gravity = (0x800003 | mButtonGravity & 0x70);
        mViewType = 2;
        mExpandedActionView.setLayoutParams(paramMenuBuilder);
        addView(mExpandedActionView);
      }
      Toolbar.this.setChildVisibilityForExpandedActionView(true);
      requestLayout();
      paramMenuItemImpl.setActionViewExpanded(true);
      if ((mExpandedActionView instanceof CollapsibleActionView)) {
        ((CollapsibleActionView)mExpandedActionView).onActionViewExpanded();
      }
      return true;
    }
    
    public boolean flagActionItems()
    {
      return false;
    }
    
    public int getId()
    {
      return 0;
    }
    
    public void initForMenu(Context paramContext, MenuBuilder paramMenuBuilder)
    {
      if ((mMenu != null) && (mCurrentExpandedItem != null)) {
        mMenu.collapseItemActionView(mCurrentExpandedItem);
      }
      mMenu = paramMenuBuilder;
    }
    
    public void onCloseMenu(MenuBuilder paramMenuBuilder, boolean paramBoolean) {}
    
    public void onRestoreInstanceState(Parcelable paramParcelable) {}
    
    public Parcelable onSaveInstanceState()
    {
      return null;
    }
    
    public boolean onSubMenuSelected(SubMenuBuilder paramSubMenuBuilder)
    {
      return false;
    }
    
    public void updateMenuView(boolean paramBoolean)
    {
      int k;
      int j;
      int m;
      int i;
      if (mCurrentExpandedItem != null)
      {
        k = 0;
        j = k;
        if (mMenu != null)
        {
          m = mMenu.size();
          i = 0;
        }
      }
      for (;;)
      {
        j = k;
        if (i < m)
        {
          if (mMenu.getItem(i) == mCurrentExpandedItem) {
            j = 1;
          }
        }
        else
        {
          if (j == 0) {
            collapseItemActionView(mMenu, mCurrentExpandedItem);
          }
          return;
        }
        i += 1;
      }
    }
  }
  
  public static class LayoutParams
    extends ActionBar.LayoutParams
  {
    int mViewType = 0;
    
    public LayoutParams(int paramInt1, int paramInt2)
    {
      super(paramInt2);
      gravity = 8388627;
    }
    
    public LayoutParams(Context paramContext, AttributeSet paramAttributeSet)
    {
      super(paramAttributeSet);
    }
    
    public LayoutParams(ActionBar.LayoutParams paramLayoutParams)
    {
      super();
    }
    
    public LayoutParams(LayoutParams paramLayoutParams)
    {
      super();
      mViewType = mViewType;
    }
    
    public LayoutParams(ViewGroup.LayoutParams paramLayoutParams)
    {
      super();
    }
    
    public LayoutParams(ViewGroup.MarginLayoutParams paramMarginLayoutParams)
    {
      super();
      copyMarginsFromCompat(paramMarginLayoutParams);
    }
    
    void copyMarginsFromCompat(ViewGroup.MarginLayoutParams paramMarginLayoutParams)
    {
      leftMargin = leftMargin;
      topMargin = topMargin;
      rightMargin = rightMargin;
      bottomMargin = bottomMargin;
    }
  }
  
  public static abstract interface OnMenuItemClickListener
  {
    public abstract boolean onMenuItemClick(MenuItem paramMenuItem);
  }
  
  public static class SavedState
    extends View.BaseSavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public Toolbar.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new Toolbar.SavedState(paramAnonymousParcel);
      }
      
      public Toolbar.SavedState[] newArray(int paramAnonymousInt)
      {
        return new Toolbar.SavedState[paramAnonymousInt];
      }
    };
    int expandedMenuItemId;
    boolean isOverflowOpen;
    
    public SavedState(Parcel paramParcel)
    {
      super();
      expandedMenuItemId = paramParcel.readInt();
      if (paramParcel.readInt() != 0) {}
      for (boolean bool = true;; bool = false)
      {
        isOverflowOpen = bool;
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
      paramParcel.writeInt(expandedMenuItemId);
      if (isOverflowOpen) {}
      for (paramInt = 1;; paramInt = 0)
      {
        paramParcel.writeInt(paramInt);
        return;
      }
    }
  }
}
