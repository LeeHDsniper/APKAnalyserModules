package android.support.v7.internal.view.menu;

import android.content.Context;
import android.content.res.Resources;
import android.os.Parcelable;
import android.support.v7.appcompat.R.attr;
import android.support.v7.appcompat.R.dimen;
import android.support.v7.appcompat.R.layout;
import android.support.v7.widget.ListPopupWindow;
import android.util.DisplayMetrics;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnKeyListener;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.PopupWindow.OnDismissListener;
import java.util.ArrayList;

public class MenuPopupHelper
  implements MenuPresenter, View.OnKeyListener, ViewTreeObserver.OnGlobalLayoutListener, AdapterView.OnItemClickListener, PopupWindow.OnDismissListener
{
  static final int ITEM_LAYOUT = R.layout.abc_popup_menu_item_layout;
  private final MenuAdapter mAdapter;
  private View mAnchorView;
  private int mContentWidth;
  private final Context mContext;
  private int mDropDownGravity = 0;
  boolean mForceShowIcon;
  private boolean mHasContentWidth;
  private final LayoutInflater mInflater;
  private ViewGroup mMeasureParent;
  private final MenuBuilder mMenu;
  private final boolean mOverflowOnly;
  private ListPopupWindow mPopup;
  private final int mPopupMaxWidth;
  private final int mPopupStyleAttr;
  private final int mPopupStyleRes;
  private MenuPresenter.Callback mPresenterCallback;
  private ViewTreeObserver mTreeObserver;
  
  public MenuPopupHelper(Context paramContext, MenuBuilder paramMenuBuilder, View paramView)
  {
    this(paramContext, paramMenuBuilder, paramView, false, R.attr.popupMenuStyle);
  }
  
  public MenuPopupHelper(Context paramContext, MenuBuilder paramMenuBuilder, View paramView, boolean paramBoolean, int paramInt)
  {
    this(paramContext, paramMenuBuilder, paramView, paramBoolean, paramInt, 0);
  }
  
  public MenuPopupHelper(Context paramContext, MenuBuilder paramMenuBuilder, View paramView, boolean paramBoolean, int paramInt1, int paramInt2)
  {
    mContext = paramContext;
    mInflater = LayoutInflater.from(paramContext);
    mMenu = paramMenuBuilder;
    mAdapter = new MenuAdapter(mMenu);
    mOverflowOnly = paramBoolean;
    mPopupStyleAttr = paramInt1;
    mPopupStyleRes = paramInt2;
    Resources localResources = paramContext.getResources();
    mPopupMaxWidth = Math.max(getDisplayMetricswidthPixels / 2, localResources.getDimensionPixelSize(R.dimen.abc_config_prefDialogWidth));
    mAnchorView = paramView;
    paramMenuBuilder.addMenuPresenter(this, paramContext);
  }
  
  private int measureContentWidth()
  {
    int i = 0;
    View localView = null;
    int m = 0;
    MenuAdapter localMenuAdapter = mAdapter;
    int i1 = View.MeasureSpec.makeMeasureSpec(0, 0);
    int i2 = View.MeasureSpec.makeMeasureSpec(0, 0);
    int i3 = localMenuAdapter.getCount();
    int j = 0;
    for (;;)
    {
      int k = i;
      if (j < i3)
      {
        n = localMenuAdapter.getItemViewType(j);
        k = m;
        if (n != m)
        {
          k = n;
          localView = null;
        }
        if (mMeasureParent == null) {
          mMeasureParent = new FrameLayout(mContext);
        }
        localView = localMenuAdapter.getView(j, localView, mMeasureParent);
        localView.measure(i1, i2);
        m = localView.getMeasuredWidth();
        if (m >= mPopupMaxWidth) {
          k = mPopupMaxWidth;
        }
      }
      else
      {
        return k;
      }
      int n = i;
      if (m > i) {
        n = m;
      }
      j += 1;
      m = k;
      i = n;
    }
  }
  
  public boolean collapseItemActionView(MenuBuilder paramMenuBuilder, MenuItemImpl paramMenuItemImpl)
  {
    return false;
  }
  
  public void dismiss()
  {
    if (isShowing()) {
      mPopup.dismiss();
    }
  }
  
  public boolean expandItemActionView(MenuBuilder paramMenuBuilder, MenuItemImpl paramMenuItemImpl)
  {
    return false;
  }
  
  public boolean flagActionItems()
  {
    return false;
  }
  
  public int getId()
  {
    return 0;
  }
  
  public ListPopupWindow getPopup()
  {
    return mPopup;
  }
  
  public void initForMenu(Context paramContext, MenuBuilder paramMenuBuilder) {}
  
  public boolean isShowing()
  {
    return (mPopup != null) && (mPopup.isShowing());
  }
  
  public void onCloseMenu(MenuBuilder paramMenuBuilder, boolean paramBoolean)
  {
    if (paramMenuBuilder != mMenu) {}
    do
    {
      return;
      dismiss();
    } while (mPresenterCallback == null);
    mPresenterCallback.onCloseMenu(paramMenuBuilder, paramBoolean);
  }
  
  public void onDismiss()
  {
    mPopup = null;
    mMenu.close();
    if (mTreeObserver != null)
    {
      if (!mTreeObserver.isAlive()) {
        mTreeObserver = mAnchorView.getViewTreeObserver();
      }
      mTreeObserver.removeGlobalOnLayoutListener(this);
      mTreeObserver = null;
    }
  }
  
  public void onGlobalLayout()
  {
    if (isShowing())
    {
      View localView = mAnchorView;
      if ((localView != null) && (localView.isShown())) {
        break label28;
      }
      dismiss();
    }
    label28:
    while (!isShowing()) {
      return;
    }
    mPopup.show();
  }
  
  public void onItemClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    paramAdapterView = mAdapter;
    mAdapterMenu.performItemAction(paramAdapterView.getItem(paramInt), 0);
  }
  
  public boolean onKey(View paramView, int paramInt, KeyEvent paramKeyEvent)
  {
    if ((paramKeyEvent.getAction() == 1) && (paramInt == 82))
    {
      dismiss();
      return true;
    }
    return false;
  }
  
  public void onRestoreInstanceState(Parcelable paramParcelable) {}
  
  public Parcelable onSaveInstanceState()
  {
    return null;
  }
  
  public boolean onSubMenuSelected(SubMenuBuilder paramSubMenuBuilder)
  {
    if (paramSubMenuBuilder.hasVisibleItems())
    {
      MenuPopupHelper localMenuPopupHelper = new MenuPopupHelper(mContext, paramSubMenuBuilder, mAnchorView);
      localMenuPopupHelper.setCallback(mPresenterCallback);
      boolean bool2 = false;
      int j = paramSubMenuBuilder.size();
      int i = 0;
      for (;;)
      {
        boolean bool1 = bool2;
        if (i < j)
        {
          MenuItem localMenuItem = paramSubMenuBuilder.getItem(i);
          if ((localMenuItem.isVisible()) && (localMenuItem.getIcon() != null)) {
            bool1 = true;
          }
        }
        else
        {
          localMenuPopupHelper.setForceShowIcon(bool1);
          if (!localMenuPopupHelper.tryShow()) {
            break;
          }
          if (mPresenterCallback != null) {
            mPresenterCallback.onOpenSubMenu(paramSubMenuBuilder);
          }
          return true;
        }
        i += 1;
      }
    }
    return false;
  }
  
  public void setAnchorView(View paramView)
  {
    mAnchorView = paramView;
  }
  
  public void setCallback(MenuPresenter.Callback paramCallback)
  {
    mPresenterCallback = paramCallback;
  }
  
  public void setForceShowIcon(boolean paramBoolean)
  {
    mForceShowIcon = paramBoolean;
  }
  
  public void setGravity(int paramInt)
  {
    mDropDownGravity = paramInt;
  }
  
  public void show()
  {
    if (!tryShow()) {
      throw new IllegalStateException("MenuPopupHelper cannot be used without an anchor");
    }
  }
  
  public boolean tryShow()
  {
    int i = 0;
    mPopup = new ListPopupWindow(mContext, null, mPopupStyleAttr, mPopupStyleRes);
    mPopup.setOnDismissListener(this);
    mPopup.setOnItemClickListener(this);
    mPopup.setAdapter(mAdapter);
    mPopup.setModal(true);
    View localView = mAnchorView;
    if (localView != null)
    {
      if (mTreeObserver == null) {
        i = 1;
      }
      mTreeObserver = localView.getViewTreeObserver();
      if (i != 0) {
        mTreeObserver.addOnGlobalLayoutListener(this);
      }
      mPopup.setAnchorView(localView);
      mPopup.setDropDownGravity(mDropDownGravity);
      if (!mHasContentWidth)
      {
        mContentWidth = measureContentWidth();
        mHasContentWidth = true;
      }
      mPopup.setContentWidth(mContentWidth);
      mPopup.setInputMethodMode(2);
      mPopup.show();
      mPopup.getListView().setOnKeyListener(this);
      return true;
    }
    return false;
  }
  
  public void updateMenuView(boolean paramBoolean)
  {
    mHasContentWidth = false;
    if (mAdapter != null) {
      mAdapter.notifyDataSetChanged();
    }
  }
  
  private class MenuAdapter
    extends BaseAdapter
  {
    private MenuBuilder mAdapterMenu;
    private int mExpandedIndex = -1;
    
    public MenuAdapter(MenuBuilder paramMenuBuilder)
    {
      mAdapterMenu = paramMenuBuilder;
      findExpandedIndex();
    }
    
    void findExpandedIndex()
    {
      MenuItemImpl localMenuItemImpl = mMenu.getExpandedItem();
      if (localMenuItemImpl != null)
      {
        ArrayList localArrayList = mMenu.getNonActionItems();
        int j = localArrayList.size();
        int i = 0;
        while (i < j)
        {
          if ((MenuItemImpl)localArrayList.get(i) == localMenuItemImpl)
          {
            mExpandedIndex = i;
            return;
          }
          i += 1;
        }
      }
      mExpandedIndex = -1;
    }
    
    public int getCount()
    {
      if (mOverflowOnly) {}
      for (ArrayList localArrayList = mAdapterMenu.getNonActionItems(); mExpandedIndex < 0; localArrayList = mAdapterMenu.getVisibleItems()) {
        return localArrayList.size();
      }
      return localArrayList.size() - 1;
    }
    
    public MenuItemImpl getItem(int paramInt)
    {
      if (mOverflowOnly) {}
      for (ArrayList localArrayList = mAdapterMenu.getNonActionItems();; localArrayList = mAdapterMenu.getVisibleItems())
      {
        int i = paramInt;
        if (mExpandedIndex >= 0)
        {
          i = paramInt;
          if (paramInt >= mExpandedIndex) {
            i = paramInt + 1;
          }
        }
        return (MenuItemImpl)localArrayList.get(i);
      }
    }
    
    public long getItemId(int paramInt)
    {
      return paramInt;
    }
    
    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      View localView = paramView;
      if (paramView == null) {
        localView = mInflater.inflate(MenuPopupHelper.ITEM_LAYOUT, paramViewGroup, false);
      }
      paramView = (MenuView.ItemView)localView;
      if (mForceShowIcon) {
        ((ListMenuItemView)localView).setForceShowIcon(true);
      }
      paramView.initialize(getItem(paramInt), 0);
      return localView;
    }
    
    public void notifyDataSetChanged()
    {
      findExpandedIndex();
      super.notifyDataSetChanged();
    }
  }
}
