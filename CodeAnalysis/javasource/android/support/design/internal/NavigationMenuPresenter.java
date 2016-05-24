package android.support.design.internal;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.ConstantState;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.design.R.dimen;
import android.support.design.R.layout;
import android.support.v7.internal.view.menu.MenuBuilder;
import android.support.v7.internal.view.menu.MenuItemImpl;
import android.support.v7.internal.view.menu.MenuPresenter;
import android.support.v7.internal.view.menu.MenuPresenter.Callback;
import android.support.v7.internal.view.menu.SubMenuBuilder;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.Iterator;

public class NavigationMenuPresenter
  implements MenuPresenter, AdapterView.OnItemClickListener
{
  private NavigationMenuAdapter mAdapter;
  private MenuPresenter.Callback mCallback;
  private ColorStateList mIconTintList;
  private int mId;
  private Drawable mItemBackground;
  private LayoutInflater mLayoutInflater;
  private MenuBuilder mMenu;
  private NavigationMenuView mMenuView;
  private int mPaddingSeparator;
  private int mPaddingTopDefault;
  private ColorStateList mTextColor;
  
  public boolean collapseItemActionView(MenuBuilder paramMenuBuilder, MenuItemImpl paramMenuItemImpl)
  {
    return false;
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
    return mId;
  }
  
  public Drawable getItemBackground()
  {
    return mItemBackground;
  }
  
  public ColorStateList getItemTextColor()
  {
    return mTextColor;
  }
  
  public ColorStateList getItemTintList()
  {
    return mIconTintList;
  }
  
  public void initForMenu(Context paramContext, MenuBuilder paramMenuBuilder)
  {
    mLayoutInflater = LayoutInflater.from(paramContext);
    mMenu = paramMenuBuilder;
    paramContext = paramContext.getResources();
    mPaddingTopDefault = paramContext.getDimensionPixelOffset(R.dimen.navigation_padding_top_default);
    mPaddingSeparator = paramContext.getDimensionPixelOffset(R.dimen.navigation_separator_vertical_padding);
  }
  
  public void onCloseMenu(MenuBuilder paramMenuBuilder, boolean paramBoolean)
  {
    if (mCallback != null) {
      mCallback.onCloseMenu(paramMenuBuilder, paramBoolean);
    }
  }
  
  public void onItemClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    paramInt -= mMenuView.getHeaderViewsCount();
    if (paramInt >= 0) {
      mMenu.performItemAction(mAdapter.getItem(paramInt).getMenuItem(), this, 0);
    }
  }
  
  public void onRestoreInstanceState(Parcelable paramParcelable)
  {
    paramParcelable = (Bundle)paramParcelable;
    SparseArray localSparseArray = paramParcelable.getSparseParcelableArray("android:menu:list");
    if (localSparseArray != null) {
      mMenuView.restoreHierarchyState(localSparseArray);
    }
    paramParcelable = paramParcelable.getBundle("android:menu:adapter");
    if (paramParcelable != null) {
      mAdapter.restoreInstanceState(paramParcelable);
    }
  }
  
  public Parcelable onSaveInstanceState()
  {
    Bundle localBundle = new Bundle();
    if (mMenuView != null)
    {
      SparseArray localSparseArray = new SparseArray();
      mMenuView.saveHierarchyState(localSparseArray);
      localBundle.putSparseParcelableArray("android:menu:list", localSparseArray);
    }
    if (mAdapter != null) {
      localBundle.putBundle("android:menu:adapter", mAdapter.createInstanceState());
    }
    return localBundle;
  }
  
  public boolean onSubMenuSelected(SubMenuBuilder paramSubMenuBuilder)
  {
    return false;
  }
  
  public void setItemBackground(Drawable paramDrawable)
  {
    mItemBackground = paramDrawable;
  }
  
  public void setItemIconTintList(ColorStateList paramColorStateList)
  {
    mIconTintList = paramColorStateList;
  }
  
  public void setItemTextColor(ColorStateList paramColorStateList)
  {
    mTextColor = paramColorStateList;
  }
  
  public void updateMenuView(boolean paramBoolean)
  {
    if (mAdapter != null) {
      mAdapter.notifyDataSetChanged();
    }
  }
  
  private class NavigationMenuAdapter
    extends BaseAdapter
  {
    private final ArrayList<NavigationMenuPresenter.NavigationMenuItem> mItems;
    private ColorDrawable mTransparentIcon;
    private boolean mUpdateSuspended;
    
    private void appendTransparentIconIfMissing(int paramInt1, int paramInt2)
    {
      while (paramInt1 < paramInt2)
      {
        MenuItemImpl localMenuItemImpl = ((NavigationMenuPresenter.NavigationMenuItem)mItems.get(paramInt1)).getMenuItem();
        if (localMenuItemImpl.getIcon() == null)
        {
          if (mTransparentIcon == null) {
            mTransparentIcon = new ColorDrawable(17170445);
          }
          localMenuItemImpl.setIcon(mTransparentIcon);
        }
        paramInt1 += 1;
      }
    }
    
    private void prepareMenuItems()
    {
      if (mUpdateSuspended) {}
      int i1;
      int k;
      int m;
      int n;
      Object localObject;
      int j;
      int i3;
      int i;
      for (;;)
      {
        return;
        mItems.clear();
        i1 = -1;
        k = 0;
        m = 0;
        n = 0;
        int i4 = this$0.mMenu.getVisibleItems().size();
        while (n < i4)
        {
          localObject = (MenuItemImpl)this$0.mMenu.getVisibleItems().get(n);
          if (!((MenuItemImpl)localObject).hasSubMenu()) {
            break label296;
          }
          SubMenu localSubMenu = ((MenuItemImpl)localObject).getSubMenu();
          j = m;
          i2 = i1;
          i3 = k;
          if (localSubMenu.hasVisibleItems())
          {
            if (n != 0) {
              mItems.add(NavigationMenuPresenter.NavigationMenuItem.separator(this$0.mPaddingSeparator, 0));
            }
            mItems.add(NavigationMenuPresenter.NavigationMenuItem.of((MenuItemImpl)localObject));
            i = 0;
            int i5 = mItems.size();
            i2 = 0;
            i3 = localSubMenu.size();
            while (i2 < i3)
            {
              localObject = localSubMenu.getItem(i2);
              j = i;
              if (((MenuItem)localObject).isVisible())
              {
                j = i;
                if (i == 0)
                {
                  j = i;
                  if (((MenuItem)localObject).getIcon() != null) {
                    j = 1;
                  }
                }
                mItems.add(NavigationMenuPresenter.NavigationMenuItem.of((MenuItemImpl)localObject));
              }
              i2 += 1;
              i = j;
            }
            j = m;
            i2 = i1;
            i3 = k;
            if (i != 0)
            {
              appendTransparentIconIfMissing(i5, mItems.size());
              i3 = k;
              i2 = i1;
              j = m;
            }
          }
          n += 1;
          m = j;
          i1 = i2;
          k = i3;
        }
      }
      label296:
      int i2 = ((MenuItemImpl)localObject).getGroupId();
      if (i2 != i1)
      {
        m = mItems.size();
        if (((MenuItemImpl)localObject).getIcon() != null)
        {
          k = 1;
          label329:
          j = k;
          i = m;
          if (n != 0)
          {
            i = m + 1;
            mItems.add(NavigationMenuPresenter.NavigationMenuItem.separator(this$0.mPaddingSeparator, this$0.mPaddingSeparator));
            j = k;
          }
        }
      }
      for (;;)
      {
        if ((j != 0) && (((MenuItemImpl)localObject).getIcon() == null)) {
          ((MenuItemImpl)localObject).setIcon(17170445);
        }
        mItems.add(NavigationMenuPresenter.NavigationMenuItem.of((MenuItemImpl)localObject));
        i3 = i;
        break;
        k = 0;
        break label329;
        j = m;
        i = k;
        if (m == 0)
        {
          j = m;
          i = k;
          if (((MenuItemImpl)localObject).getIcon() != null)
          {
            j = 1;
            appendTransparentIconIfMissing(k, mItems.size());
            i = k;
          }
        }
      }
    }
    
    public boolean areAllItemsEnabled()
    {
      return false;
    }
    
    public Bundle createInstanceState()
    {
      Bundle localBundle = new Bundle();
      ArrayList localArrayList = new ArrayList();
      Iterator localIterator = mItems.iterator();
      while (localIterator.hasNext())
      {
        MenuItemImpl localMenuItemImpl = ((NavigationMenuPresenter.NavigationMenuItem)localIterator.next()).getMenuItem();
        if ((localMenuItemImpl != null) && (localMenuItemImpl.isChecked())) {
          localArrayList.add(Integer.valueOf(localMenuItemImpl.getItemId()));
        }
      }
      localBundle.putIntegerArrayList("android:menu:checked", localArrayList);
      return localBundle;
    }
    
    public int getCount()
    {
      return mItems.size();
    }
    
    public NavigationMenuPresenter.NavigationMenuItem getItem(int paramInt)
    {
      return (NavigationMenuPresenter.NavigationMenuItem)mItems.get(paramInt);
    }
    
    public long getItemId(int paramInt)
    {
      return paramInt;
    }
    
    public int getItemViewType(int paramInt)
    {
      NavigationMenuPresenter.NavigationMenuItem localNavigationMenuItem = getItem(paramInt);
      if (localNavigationMenuItem.isSeparator()) {
        return 2;
      }
      if (localNavigationMenuItem.getMenuItem().hasSubMenu()) {
        return 1;
      }
      return 0;
    }
    
    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      NavigationMenuPresenter.NavigationMenuItem localNavigationMenuItem = getItem(paramInt);
      switch (getItemViewType(paramInt))
      {
      default: 
        return paramView;
      case 0: 
        localView = paramView;
        if (paramView == null) {
          localView = this$0.mLayoutInflater.inflate(R.layout.design_navigation_item, paramViewGroup, false);
        }
        paramViewGroup = (NavigationMenuItemView)localView;
        paramViewGroup.setIconTintList(this$0.mIconTintList);
        paramViewGroup.setTextColor(this$0.mTextColor);
        if (this$0.mItemBackground != null) {}
        for (paramView = this$0.mItemBackground.getConstantState().newDrawable();; paramView = null)
        {
          paramViewGroup.setBackgroundDrawable(paramView);
          paramViewGroup.initialize(localNavigationMenuItem.getMenuItem(), 0);
          return localView;
        }
      case 1: 
        localView = paramView;
        if (paramView == null) {
          localView = this$0.mLayoutInflater.inflate(R.layout.design_navigation_item_subheader, paramViewGroup, false);
        }
        ((TextView)localView).setText(localNavigationMenuItem.getMenuItem().getTitle());
        return localView;
      }
      View localView = paramView;
      if (paramView == null) {
        localView = this$0.mLayoutInflater.inflate(R.layout.design_navigation_item_separator, paramViewGroup, false);
      }
      localView.setPadding(0, localNavigationMenuItem.getPaddingTop(), 0, localNavigationMenuItem.getPaddingBottom());
      return localView;
    }
    
    public int getViewTypeCount()
    {
      return 3;
    }
    
    public boolean isEnabled(int paramInt)
    {
      return getItem(paramInt).isEnabled();
    }
    
    public void notifyDataSetChanged()
    {
      prepareMenuItems();
      super.notifyDataSetChanged();
    }
    
    public void restoreInstanceState(Bundle paramBundle)
    {
      paramBundle = paramBundle.getIntegerArrayList("android:menu:checked");
      if (paramBundle != null)
      {
        mUpdateSuspended = true;
        Iterator localIterator = mItems.iterator();
        while (localIterator.hasNext())
        {
          MenuItemImpl localMenuItemImpl = ((NavigationMenuPresenter.NavigationMenuItem)localIterator.next()).getMenuItem();
          if ((localMenuItemImpl != null) && (paramBundle.contains(Integer.valueOf(localMenuItemImpl.getItemId())))) {
            localMenuItemImpl.setChecked(true);
          }
        }
        mUpdateSuspended = false;
        prepareMenuItems();
      }
    }
  }
  
  private static class NavigationMenuItem
  {
    private final MenuItemImpl mMenuItem;
    private final int mPaddingBottom;
    private final int mPaddingTop;
    
    private NavigationMenuItem(MenuItemImpl paramMenuItemImpl, int paramInt1, int paramInt2)
    {
      mMenuItem = paramMenuItemImpl;
      mPaddingTop = paramInt1;
      mPaddingBottom = paramInt2;
    }
    
    public static NavigationMenuItem of(MenuItemImpl paramMenuItemImpl)
    {
      return new NavigationMenuItem(paramMenuItemImpl, 0, 0);
    }
    
    public static NavigationMenuItem separator(int paramInt1, int paramInt2)
    {
      return new NavigationMenuItem(null, paramInt1, paramInt2);
    }
    
    public MenuItemImpl getMenuItem()
    {
      return mMenuItem;
    }
    
    public int getPaddingBottom()
    {
      return mPaddingBottom;
    }
    
    public int getPaddingTop()
    {
      return mPaddingTop;
    }
    
    public boolean isEnabled()
    {
      return (mMenuItem != null) && (!mMenuItem.hasSubMenu()) && (mMenuItem.isEnabled());
    }
    
    public boolean isSeparator()
    {
      return mMenuItem == null;
    }
  }
}
