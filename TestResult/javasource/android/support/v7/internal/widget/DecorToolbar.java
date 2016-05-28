package android.support.v7.internal.widget;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.support.v7.internal.view.menu.MenuBuilder.Callback;
import android.support.v7.internal.view.menu.MenuPresenter.Callback;
import android.view.Menu;
import android.view.ViewGroup;
import android.view.Window.Callback;

public abstract interface DecorToolbar
{
  public abstract void animateToVisibility(int paramInt);
  
  public abstract boolean canShowOverflowMenu();
  
  public abstract void collapseActionView();
  
  public abstract void dismissPopupMenus();
  
  public abstract Context getContext();
  
  public abstract int getDisplayOptions();
  
  public abstract int getHeight();
  
  public abstract Menu getMenu();
  
  public abstract int getNavigationMode();
  
  public abstract CharSequence getTitle();
  
  public abstract ViewGroup getViewGroup();
  
  public abstract int getVisibility();
  
  public abstract boolean hasExpandedActionView();
  
  public abstract boolean hideOverflowMenu();
  
  public abstract void initIndeterminateProgress();
  
  public abstract void initProgress();
  
  public abstract boolean isOverflowMenuShowPending();
  
  public abstract boolean isOverflowMenuShowing();
  
  public abstract boolean isSplit();
  
  public abstract void setCollapsible(boolean paramBoolean);
  
  public abstract void setDisplayOptions(int paramInt);
  
  public abstract void setEmbeddedTabView(ScrollingTabContainerView paramScrollingTabContainerView);
  
  public abstract void setHomeButtonEnabled(boolean paramBoolean);
  
  public abstract void setIcon(int paramInt);
  
  public abstract void setIcon(Drawable paramDrawable);
  
  public abstract void setLogo(int paramInt);
  
  public abstract void setMenu(Menu paramMenu, MenuPresenter.Callback paramCallback);
  
  public abstract void setMenuCallbacks(MenuPresenter.Callback paramCallback, MenuBuilder.Callback paramCallback1);
  
  public abstract void setMenuPrepared();
  
  public abstract void setVisibility(int paramInt);
  
  public abstract void setWindowCallback(Window.Callback paramCallback);
  
  public abstract void setWindowTitle(CharSequence paramCharSequence);
  
  public abstract boolean showOverflowMenu();
}
