package android.support.v7.widget;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build.VERSION;
import android.support.v7.internal.view.menu.ActionMenuItemView;
import android.support.v7.internal.view.menu.MenuBuilder;
import android.support.v7.internal.view.menu.MenuBuilder.Callback;
import android.support.v7.internal.view.menu.MenuBuilder.ItemInvoker;
import android.support.v7.internal.view.menu.MenuItemImpl;
import android.support.v7.internal.view.menu.MenuPresenter.Callback;
import android.support.v7.internal.view.menu.MenuView;
import android.support.v7.internal.widget.ViewUtils;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.ContextThemeWrapper;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewDebug.ExportedProperty;
import android.view.ViewGroup.LayoutParams;
import android.view.accessibility.AccessibilityEvent;

public class ActionMenuView
  extends LinearLayoutCompat
  implements MenuBuilder.ItemInvoker, MenuView
{
  private MenuPresenter.Callback mActionMenuPresenterCallback;
  private Context mContext;
  private boolean mFormatItems;
  private int mFormatItemsWidth;
  private int mGeneratedItemPadding;
  private MenuBuilder mMenu;
  private MenuBuilder.Callback mMenuBuilderCallback;
  private int mMinCellSize;
  private OnMenuItemClickListener mOnMenuItemClickListener;
  private Context mPopupContext;
  private int mPopupTheme;
  private ActionMenuPresenter mPresenter;
  private boolean mReserveOverflow;
  
  public ActionMenuView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public ActionMenuView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    mContext = paramContext;
    setBaselineAligned(false);
    float f = getResourcesgetDisplayMetricsdensity;
    mMinCellSize = ((int)(56.0F * f));
    mGeneratedItemPadding = ((int)(4.0F * f));
    mPopupContext = paramContext;
    mPopupTheme = 0;
  }
  
  static int measureChildForCells(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    LayoutParams localLayoutParams = (LayoutParams)paramView.getLayoutParams();
    int j = View.MeasureSpec.makeMeasureSpec(View.MeasureSpec.getSize(paramInt3) - paramInt4, View.MeasureSpec.getMode(paramInt3));
    ActionMenuItemView localActionMenuItemView;
    if ((paramView instanceof ActionMenuItemView))
    {
      localActionMenuItemView = (ActionMenuItemView)paramView;
      if ((localActionMenuItemView == null) || (!localActionMenuItemView.hasText())) {
        break label182;
      }
      paramInt4 = 1;
      label54:
      int i = 0;
      paramInt3 = i;
      if (paramInt2 > 0) {
        if (paramInt4 != 0)
        {
          paramInt3 = i;
          if (paramInt2 < 2) {}
        }
        else
        {
          paramView.measure(View.MeasureSpec.makeMeasureSpec(paramInt1 * paramInt2, Integer.MIN_VALUE), j);
          i = paramView.getMeasuredWidth();
          paramInt3 = i / paramInt1;
          paramInt2 = paramInt3;
          if (i % paramInt1 != 0) {
            paramInt2 = paramInt3 + 1;
          }
          paramInt3 = paramInt2;
          if (paramInt4 != 0)
          {
            paramInt3 = paramInt2;
            if (paramInt2 < 2) {
              paramInt3 = 2;
            }
          }
        }
      }
      if ((isOverflowButton) || (paramInt4 == 0)) {
        break label188;
      }
    }
    label182:
    label188:
    for (boolean bool = true;; bool = false)
    {
      expandable = bool;
      cellsUsed = paramInt3;
      paramView.measure(View.MeasureSpec.makeMeasureSpec(paramInt3 * paramInt1, 1073741824), j);
      return paramInt3;
      localActionMenuItemView = null;
      break;
      paramInt4 = 0;
      break label54;
    }
  }
  
  private void onMeasureExactFormat(int paramInt1, int paramInt2)
  {
    int i8 = View.MeasureSpec.getMode(paramInt2);
    paramInt1 = View.MeasureSpec.getSize(paramInt1);
    int i7 = View.MeasureSpec.getSize(paramInt2);
    int i = getPaddingLeft();
    int j = getPaddingRight();
    int i13 = getPaddingTop() + getPaddingBottom();
    int i9 = getChildMeasureSpec(paramInt2, i13, -2);
    int i10 = paramInt1 - (i + j);
    paramInt1 = i10 / mMinCellSize;
    paramInt2 = mMinCellSize;
    if (paramInt1 == 0)
    {
      setMeasuredDimension(i10, 0);
      return;
    }
    int i11 = mMinCellSize + i10 % paramInt2 / paramInt1;
    i = 0;
    int m = 0;
    int k = 0;
    int n = 0;
    j = 0;
    long l1 = 0L;
    int i12 = getChildCount();
    int i1 = 0;
    Object localObject;
    long l2;
    int i2;
    int i3;
    LayoutParams localLayoutParams;
    label272:
    int i4;
    int i5;
    int i6;
    while (i1 < i12)
    {
      localObject = getChildAt(i1);
      if (((View)localObject).getVisibility() == 8)
      {
        l2 = l1;
        i2 = j;
        i1 += 1;
        j = i2;
        l1 = l2;
      }
      else
      {
        boolean bool = localObject instanceof ActionMenuItemView;
        i3 = n + 1;
        if (bool) {
          ((View)localObject).setPadding(mGeneratedItemPadding, 0, mGeneratedItemPadding, 0);
        }
        localLayoutParams = (LayoutParams)((View)localObject).getLayoutParams();
        expanded = false;
        extraPixels = 0;
        cellsUsed = 0;
        expandable = false;
        leftMargin = 0;
        rightMargin = 0;
        if ((bool) && (((ActionMenuItemView)localObject).hasText()))
        {
          bool = true;
          preventEdgeOffset = bool;
          if (!isOverflowButton) {
            break label430;
          }
        }
        label430:
        for (paramInt2 = 1;; paramInt2 = paramInt1)
        {
          int i14 = measureChildForCells((View)localObject, i11, paramInt2, i9, i13);
          i4 = Math.max(m, i14);
          paramInt2 = k;
          if (expandable) {
            paramInt2 = k + 1;
          }
          if (isOverflowButton) {
            j = 1;
          }
          i5 = paramInt1 - i14;
          i6 = Math.max(i, ((View)localObject).getMeasuredHeight());
          paramInt1 = i5;
          k = paramInt2;
          i2 = j;
          m = i4;
          i = i6;
          l2 = l1;
          n = i3;
          if (i14 != 1) {
            break;
          }
          l2 = l1 | 1 << i1;
          paramInt1 = i5;
          k = paramInt2;
          i2 = j;
          m = i4;
          i = i6;
          n = i3;
          break;
          bool = false;
          break label272;
        }
      }
    }
    long l3;
    if ((j != 0) && (n == 2))
    {
      i1 = 1;
      paramInt2 = 0;
      i2 = paramInt1;
      l2 = l1;
      if (k <= 0) {
        break label641;
      }
      l2 = l1;
      if (i2 <= 0) {
        break label641;
      }
      i3 = Integer.MAX_VALUE;
      l3 = 0L;
      i6 = 0;
      i4 = 0;
      label485:
      if (i4 >= i12) {
        break label623;
      }
      localObject = (LayoutParams)getChildAt(i4).getLayoutParams();
      if (expandable) {
        break label551;
      }
      l2 = l3;
      paramInt1 = i6;
      i5 = i3;
    }
    for (;;)
    {
      i4 += 1;
      i3 = i5;
      i6 = paramInt1;
      l3 = l2;
      break label485;
      i1 = 0;
      break;
      label551:
      if (cellsUsed < i3)
      {
        i5 = cellsUsed;
        l2 = 1 << i4;
        paramInt1 = 1;
      }
      else
      {
        i5 = i3;
        paramInt1 = i6;
        l2 = l3;
        if (cellsUsed == i3)
        {
          l2 = l3 | 1 << i4;
          paramInt1 = i6 + 1;
          i5 = i3;
        }
      }
    }
    label623:
    l1 |= l3;
    if (i6 > i2)
    {
      l2 = l1;
      label641:
      if ((j != 0) || (n != 1)) {
        break label1004;
      }
      paramInt1 = 1;
      label654:
      j = paramInt2;
      if (i2 <= 0) {
        break label1160;
      }
      j = paramInt2;
      if (l2 == 0L) {
        break label1160;
      }
      if ((i2 >= n - 1) && (paramInt1 == 0))
      {
        j = paramInt2;
        if (m <= 1) {
          break label1160;
        }
      }
      float f3 = Long.bitCount(l2);
      float f2 = f3;
      if (paramInt1 == 0)
      {
        float f1 = f3;
        if ((1L & l2) != 0L)
        {
          f1 = f3;
          if (!getChildAt0getLayoutParamspreventEdgeOffset) {
            f1 = f3 - 0.5F;
          }
        }
        f2 = f1;
        if ((1 << i12 - 1 & l2) != 0L)
        {
          f2 = f1;
          if (!getChildAt1getLayoutParamspreventEdgeOffset) {
            f2 = f1 - 0.5F;
          }
        }
      }
      if (f2 <= 0.0F) {
        break label1009;
      }
      j = (int)(i2 * i11 / f2);
      label814:
      k = 0;
      label817:
      if (k >= i12) {
        break label1157;
      }
      if ((1 << k & l2) != 0L) {
        break label1015;
      }
      paramInt1 = paramInt2;
    }
    for (;;)
    {
      k += 1;
      paramInt2 = paramInt1;
      break label817;
      paramInt1 = 0;
      if (paramInt1 < i12)
      {
        localObject = getChildAt(paramInt1);
        localLayoutParams = (LayoutParams)((View)localObject).getLayoutParams();
        if ((1 << paramInt1 & l3) == 0L)
        {
          paramInt2 = i2;
          l2 = l1;
          if (cellsUsed == i3 + 1)
          {
            l2 = l1 | 1 << paramInt1;
            paramInt2 = i2;
          }
        }
        for (;;)
        {
          paramInt1 += 1;
          i2 = paramInt2;
          l1 = l2;
          break;
          if ((i1 != 0) && (preventEdgeOffset) && (i2 == 1)) {
            ((View)localObject).setPadding(mGeneratedItemPadding + i11, 0, mGeneratedItemPadding, 0);
          }
          cellsUsed += 1;
          expanded = true;
          paramInt2 = i2 - 1;
          l2 = l1;
        }
      }
      paramInt2 = 1;
      break;
      label1004:
      paramInt1 = 0;
      break label654;
      label1009:
      j = 0;
      break label814;
      label1015:
      localObject = getChildAt(k);
      localLayoutParams = (LayoutParams)((View)localObject).getLayoutParams();
      if ((localObject instanceof ActionMenuItemView))
      {
        extraPixels = j;
        expanded = true;
        if ((k == 0) && (!preventEdgeOffset)) {
          leftMargin = (-j / 2);
        }
        paramInt1 = 1;
      }
      else if (isOverflowButton)
      {
        extraPixels = j;
        expanded = true;
        rightMargin = (-j / 2);
        paramInt1 = 1;
      }
      else
      {
        if (k != 0) {
          leftMargin = (j / 2);
        }
        paramInt1 = paramInt2;
        if (k != i12 - 1)
        {
          rightMargin = (j / 2);
          paramInt1 = paramInt2;
        }
      }
    }
    label1157:
    j = paramInt2;
    label1160:
    if (j != 0)
    {
      paramInt1 = 0;
      if (paramInt1 < i12)
      {
        localObject = getChildAt(paramInt1);
        localLayoutParams = (LayoutParams)((View)localObject).getLayoutParams();
        if (!expanded) {}
        for (;;)
        {
          paramInt1 += 1;
          break;
          ((View)localObject).measure(View.MeasureSpec.makeMeasureSpec(cellsUsed * i11 + extraPixels, 1073741824), i9);
        }
      }
    }
    paramInt1 = i7;
    if (i8 != 1073741824) {
      paramInt1 = i;
    }
    setMeasuredDimension(i10, paramInt1);
  }
  
  protected boolean checkLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    return (paramLayoutParams != null) && ((paramLayoutParams instanceof LayoutParams));
  }
  
  public void dismissPopupMenus()
  {
    if (mPresenter != null) {
      mPresenter.dismissPopupMenus();
    }
  }
  
  public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    return false;
  }
  
  protected LayoutParams generateDefaultLayoutParams()
  {
    LayoutParams localLayoutParams = new LayoutParams(-2, -2);
    gravity = 16;
    return localLayoutParams;
  }
  
  public LayoutParams generateLayoutParams(AttributeSet paramAttributeSet)
  {
    return new LayoutParams(getContext(), paramAttributeSet);
  }
  
  protected LayoutParams generateLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    if (paramLayoutParams != null)
    {
      if ((paramLayoutParams instanceof LayoutParams)) {}
      for (paramLayoutParams = new LayoutParams((LayoutParams)paramLayoutParams);; paramLayoutParams = new LayoutParams(paramLayoutParams))
      {
        if (gravity <= 0) {
          gravity = 16;
        }
        return paramLayoutParams;
      }
    }
    return generateDefaultLayoutParams();
  }
  
  public LayoutParams generateOverflowButtonLayoutParams()
  {
    LayoutParams localLayoutParams = generateDefaultLayoutParams();
    isOverflowButton = true;
    return localLayoutParams;
  }
  
  public Menu getMenu()
  {
    ActionMenuPresenter localActionMenuPresenter;
    if (mMenu == null)
    {
      localObject = getContext();
      mMenu = new MenuBuilder((Context)localObject);
      mMenu.setCallback(new MenuBuilderCallback(null));
      mPresenter = new ActionMenuPresenter((Context)localObject);
      mPresenter.setReserveOverflow(true);
      localActionMenuPresenter = mPresenter;
      if (mActionMenuPresenterCallback == null) {
        break label110;
      }
    }
    label110:
    for (Object localObject = mActionMenuPresenterCallback;; localObject = new ActionMenuPresenterCallback(null))
    {
      localActionMenuPresenter.setCallback((MenuPresenter.Callback)localObject);
      mMenu.addMenuPresenter(mPresenter, mPopupContext);
      mPresenter.setMenuView(this);
      return mMenu;
    }
  }
  
  public int getPopupTheme()
  {
    return mPopupTheme;
  }
  
  public int getWindowAnimations()
  {
    return 0;
  }
  
  protected boolean hasSupportDividerBeforeChildAt(int paramInt)
  {
    boolean bool2;
    if (paramInt == 0) {
      bool2 = false;
    }
    View localView2;
    boolean bool1;
    do
    {
      do
      {
        return bool2;
        View localView1 = getChildAt(paramInt - 1);
        localView2 = getChildAt(paramInt);
        bool2 = false;
        bool1 = bool2;
        if (paramInt < getChildCount())
        {
          bool1 = bool2;
          if ((localView1 instanceof ActionMenuChildView)) {
            bool1 = false | ((ActionMenuChildView)localView1).needsDividerAfter();
          }
        }
        bool2 = bool1;
      } while (paramInt <= 0);
      bool2 = bool1;
    } while (!(localView2 instanceof ActionMenuChildView));
    return bool1 | ((ActionMenuChildView)localView2).needsDividerBefore();
  }
  
  public boolean hideOverflowMenu()
  {
    return (mPresenter != null) && (mPresenter.hideOverflowMenu());
  }
  
  public void initialize(MenuBuilder paramMenuBuilder)
  {
    mMenu = paramMenuBuilder;
  }
  
  public boolean invokeItem(MenuItemImpl paramMenuItemImpl)
  {
    return mMenu.performItemAction(paramMenuItemImpl, 0);
  }
  
  public boolean isOverflowMenuShowPending()
  {
    return (mPresenter != null) && (mPresenter.isOverflowMenuShowPending());
  }
  
  public boolean isOverflowMenuShowing()
  {
    return (mPresenter != null) && (mPresenter.isOverflowMenuShowing());
  }
  
  public boolean isOverflowReserved()
  {
    return mReserveOverflow;
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    if (Build.VERSION.SDK_INT >= 8) {
      super.onConfigurationChanged(paramConfiguration);
    }
    if (mPresenter != null)
    {
      mPresenter.updateMenuView(false);
      if (mPresenter.isOverflowMenuShowing())
      {
        mPresenter.hideOverflowMenu();
        mPresenter.showOverflowMenu();
      }
    }
  }
  
  public void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    dismissPopupMenus();
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (!mFormatItems)
    {
      super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
      return;
    }
    int i2 = getChildCount();
    int i1 = (paramInt4 - paramInt2) / 2;
    int i3 = getDividerWidth();
    int j = 0;
    paramInt4 = 0;
    paramInt2 = paramInt3 - paramInt1 - getPaddingRight() - getPaddingLeft();
    int k = 0;
    paramBoolean = ViewUtils.isLayoutRtl(this);
    int i = 0;
    View localView;
    LayoutParams localLayoutParams;
    if (i < i2)
    {
      localView = getChildAt(i);
      if (localView.getVisibility() == 8) {}
      for (;;)
      {
        i += 1;
        break;
        localLayoutParams = (LayoutParams)localView.getLayoutParams();
        if (isOverflowButton)
        {
          m = localView.getMeasuredWidth();
          k = m;
          if (hasSupportDividerBeforeChildAt(i)) {
            k = m + i3;
          }
          int i4 = localView.getMeasuredHeight();
          int n;
          if (paramBoolean)
          {
            m = getPaddingLeft() + leftMargin;
            n = m + k;
          }
          for (;;)
          {
            int i5 = i1 - i4 / 2;
            localView.layout(m, i5, n, i5 + i4);
            paramInt2 -= k;
            k = 1;
            break;
            n = getWidth() - getPaddingRight() - rightMargin;
            m = n - k;
          }
        }
        int m = localView.getMeasuredWidth() + leftMargin + rightMargin;
        j += m;
        m = paramInt2 - m;
        paramInt2 = j;
        if (hasSupportDividerBeforeChildAt(i)) {
          paramInt2 = j + i3;
        }
        paramInt4 += 1;
        j = paramInt2;
        paramInt2 = m;
      }
    }
    if ((i2 == 1) && (k == 0))
    {
      localView = getChildAt(0);
      paramInt2 = localView.getMeasuredWidth();
      paramInt4 = localView.getMeasuredHeight();
      paramInt1 = (paramInt3 - paramInt1) / 2 - paramInt2 / 2;
      paramInt3 = i1 - paramInt4 / 2;
      localView.layout(paramInt1, paramInt3, paramInt1 + paramInt2, paramInt3 + paramInt4);
      return;
    }
    if (k != 0)
    {
      paramInt1 = 0;
      label383:
      paramInt1 = paramInt4 - paramInt1;
      if (paramInt1 <= 0) {
        break label481;
      }
      paramInt1 = paramInt2 / paramInt1;
      label396:
      paramInt4 = Math.max(0, paramInt1);
      if (!paramBoolean) {
        break label552;
      }
      paramInt2 = getWidth() - getPaddingRight();
      paramInt1 = 0;
      label419:
      if (paramInt1 < i2)
      {
        localView = getChildAt(paramInt1);
        localLayoutParams = (LayoutParams)localView.getLayoutParams();
        paramInt3 = paramInt2;
        if (localView.getVisibility() != 8) {
          if (!isOverflowButton) {
            break label486;
          }
        }
      }
    }
    for (paramInt3 = paramInt2;; paramInt3 = paramInt2 - (leftMargin + paramInt3 + paramInt4))
    {
      paramInt1 += 1;
      paramInt2 = paramInt3;
      break label419;
      break;
      paramInt1 = 1;
      break label383;
      label481:
      paramInt1 = 0;
      break label396;
      label486:
      paramInt2 -= rightMargin;
      paramInt3 = localView.getMeasuredWidth();
      i = localView.getMeasuredHeight();
      j = i1 - i / 2;
      localView.layout(paramInt2 - paramInt3, j, paramInt2, j + i);
    }
    label552:
    paramInt2 = getPaddingLeft();
    paramInt1 = 0;
    label559:
    if (paramInt1 < i2)
    {
      localView = getChildAt(paramInt1);
      localLayoutParams = (LayoutParams)localView.getLayoutParams();
      paramInt3 = paramInt2;
      if (localView.getVisibility() != 8) {
        if (!isOverflowButton) {
          break label616;
        }
      }
    }
    for (paramInt3 = paramInt2;; paramInt3 = paramInt2 + (rightMargin + paramInt3 + paramInt4))
    {
      paramInt1 += 1;
      paramInt2 = paramInt3;
      break label559;
      break;
      label616:
      paramInt2 += leftMargin;
      paramInt3 = localView.getMeasuredWidth();
      i = localView.getMeasuredHeight();
      j = i1 - i / 2;
      localView.layout(paramInt2, j, paramInt2 + paramInt3, j + i);
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    boolean bool2 = mFormatItems;
    if (View.MeasureSpec.getMode(paramInt1) == 1073741824) {}
    int j;
    for (boolean bool1 = true;; bool1 = false)
    {
      mFormatItems = bool1;
      if (bool2 != mFormatItems) {
        mFormatItemsWidth = 0;
      }
      i = View.MeasureSpec.getSize(paramInt1);
      if ((mFormatItems) && (mMenu != null) && (i != mFormatItemsWidth))
      {
        mFormatItemsWidth = i;
        mMenu.onItemsChanged(true);
      }
      j = getChildCount();
      if ((!mFormatItems) || (j <= 0)) {
        break;
      }
      onMeasureExactFormat(paramInt1, paramInt2);
      return;
    }
    int i = 0;
    while (i < j)
    {
      LayoutParams localLayoutParams = (LayoutParams)getChildAt(i).getLayoutParams();
      rightMargin = 0;
      leftMargin = 0;
      i += 1;
    }
    super.onMeasure(paramInt1, paramInt2);
  }
  
  public MenuBuilder peekMenu()
  {
    return mMenu;
  }
  
  public void setExpandedActionViewsExclusive(boolean paramBoolean)
  {
    mPresenter.setExpandedActionViewsExclusive(paramBoolean);
  }
  
  public void setMenuCallbacks(MenuPresenter.Callback paramCallback, MenuBuilder.Callback paramCallback1)
  {
    mActionMenuPresenterCallback = paramCallback;
    mMenuBuilderCallback = paramCallback1;
  }
  
  public void setOnMenuItemClickListener(OnMenuItemClickListener paramOnMenuItemClickListener)
  {
    mOnMenuItemClickListener = paramOnMenuItemClickListener;
  }
  
  public void setOverflowReserved(boolean paramBoolean)
  {
    mReserveOverflow = paramBoolean;
  }
  
  public void setPopupTheme(int paramInt)
  {
    if (mPopupTheme != paramInt)
    {
      mPopupTheme = paramInt;
      if (paramInt == 0) {
        mPopupContext = mContext;
      }
    }
    else
    {
      return;
    }
    mPopupContext = new ContextThemeWrapper(mContext, paramInt);
  }
  
  public void setPresenter(ActionMenuPresenter paramActionMenuPresenter)
  {
    mPresenter = paramActionMenuPresenter;
    mPresenter.setMenuView(this);
  }
  
  public boolean showOverflowMenu()
  {
    return (mPresenter != null) && (mPresenter.showOverflowMenu());
  }
  
  public static abstract interface ActionMenuChildView
  {
    public abstract boolean needsDividerAfter();
    
    public abstract boolean needsDividerBefore();
  }
  
  private class ActionMenuPresenterCallback
    implements MenuPresenter.Callback
  {
    private ActionMenuPresenterCallback() {}
    
    public void onCloseMenu(MenuBuilder paramMenuBuilder, boolean paramBoolean) {}
    
    public boolean onOpenSubMenu(MenuBuilder paramMenuBuilder)
    {
      return false;
    }
  }
  
  public static class LayoutParams
    extends LinearLayoutCompat.LayoutParams
  {
    @ViewDebug.ExportedProperty
    public int cellsUsed;
    @ViewDebug.ExportedProperty
    public boolean expandable;
    boolean expanded;
    @ViewDebug.ExportedProperty
    public int extraPixels;
    @ViewDebug.ExportedProperty
    public boolean isOverflowButton;
    @ViewDebug.ExportedProperty
    public boolean preventEdgeOffset;
    
    public LayoutParams(int paramInt1, int paramInt2)
    {
      super(paramInt2);
      isOverflowButton = false;
    }
    
    public LayoutParams(Context paramContext, AttributeSet paramAttributeSet)
    {
      super(paramAttributeSet);
    }
    
    public LayoutParams(LayoutParams paramLayoutParams)
    {
      super();
      isOverflowButton = isOverflowButton;
    }
    
    public LayoutParams(ViewGroup.LayoutParams paramLayoutParams)
    {
      super();
    }
  }
  
  private class MenuBuilderCallback
    implements MenuBuilder.Callback
  {
    private MenuBuilderCallback() {}
    
    public boolean onMenuItemSelected(MenuBuilder paramMenuBuilder, MenuItem paramMenuItem)
    {
      return (mOnMenuItemClickListener != null) && (mOnMenuItemClickListener.onMenuItemClick(paramMenuItem));
    }
    
    public void onMenuModeChange(MenuBuilder paramMenuBuilder)
    {
      if (mMenuBuilderCallback != null) {
        mMenuBuilderCallback.onMenuModeChange(paramMenuBuilder);
      }
    }
  }
  
  public static abstract interface OnMenuItemClickListener
  {
    public abstract boolean onMenuItemClick(MenuItem paramMenuItem);
  }
}
