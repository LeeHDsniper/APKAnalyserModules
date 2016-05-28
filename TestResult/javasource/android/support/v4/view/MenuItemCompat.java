package android.support.v4.view;

import android.os.Build.VERSION;
import android.support.v4.internal.view.SupportMenuItem;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;

public class MenuItemCompat
{
  static final MenuVersionImpl IMPL = new BaseMenuVersionImpl();
  
  static
  {
    int i = Build.VERSION.SDK_INT;
    if (i >= 14)
    {
      IMPL = new IcsMenuVersionImpl();
      return;
    }
    if (i >= 11)
    {
      IMPL = new HoneycombMenuVersionImpl();
      return;
    }
  }
  
  public static boolean collapseActionView(MenuItem paramMenuItem)
  {
    if ((paramMenuItem instanceof SupportMenuItem)) {
      return ((SupportMenuItem)paramMenuItem).collapseActionView();
    }
    return IMPL.collapseActionView(paramMenuItem);
  }
  
  public static boolean expandActionView(MenuItem paramMenuItem)
  {
    if ((paramMenuItem instanceof SupportMenuItem)) {
      return ((SupportMenuItem)paramMenuItem).expandActionView();
    }
    return IMPL.expandActionView(paramMenuItem);
  }
  
  public static View getActionView(MenuItem paramMenuItem)
  {
    if ((paramMenuItem instanceof SupportMenuItem)) {
      return ((SupportMenuItem)paramMenuItem).getActionView();
    }
    return IMPL.getActionView(paramMenuItem);
  }
  
  public static boolean isActionViewExpanded(MenuItem paramMenuItem)
  {
    if ((paramMenuItem instanceof SupportMenuItem)) {
      return ((SupportMenuItem)paramMenuItem).isActionViewExpanded();
    }
    return IMPL.isActionViewExpanded(paramMenuItem);
  }
  
  public static MenuItem setActionProvider(MenuItem paramMenuItem, ActionProvider paramActionProvider)
  {
    if ((paramMenuItem instanceof SupportMenuItem)) {
      return ((SupportMenuItem)paramMenuItem).setSupportActionProvider(paramActionProvider);
    }
    Log.w("MenuItemCompat", "setActionProvider: item does not implement SupportMenuItem; ignoring");
    return paramMenuItem;
  }
  
  public static MenuItem setActionView(MenuItem paramMenuItem, int paramInt)
  {
    if ((paramMenuItem instanceof SupportMenuItem)) {
      return ((SupportMenuItem)paramMenuItem).setActionView(paramInt);
    }
    return IMPL.setActionView(paramMenuItem, paramInt);
  }
  
  public static MenuItem setActionView(MenuItem paramMenuItem, View paramView)
  {
    if ((paramMenuItem instanceof SupportMenuItem)) {
      return ((SupportMenuItem)paramMenuItem).setActionView(paramView);
    }
    return IMPL.setActionView(paramMenuItem, paramView);
  }
  
  public static MenuItem setOnActionExpandListener(MenuItem paramMenuItem, OnActionExpandListener paramOnActionExpandListener)
  {
    if ((paramMenuItem instanceof SupportMenuItem)) {
      return ((SupportMenuItem)paramMenuItem).setSupportOnActionExpandListener(paramOnActionExpandListener);
    }
    return IMPL.setOnActionExpandListener(paramMenuItem, paramOnActionExpandListener);
  }
  
  public static void setShowAsAction(MenuItem paramMenuItem, int paramInt)
  {
    if ((paramMenuItem instanceof SupportMenuItem))
    {
      ((SupportMenuItem)paramMenuItem).setShowAsAction(paramInt);
      return;
    }
    IMPL.setShowAsAction(paramMenuItem, paramInt);
  }
  
  static class BaseMenuVersionImpl
    implements MenuItemCompat.MenuVersionImpl
  {
    BaseMenuVersionImpl() {}
    
    public boolean collapseActionView(MenuItem paramMenuItem)
    {
      return false;
    }
    
    public boolean expandActionView(MenuItem paramMenuItem)
    {
      return false;
    }
    
    public View getActionView(MenuItem paramMenuItem)
    {
      return null;
    }
    
    public boolean isActionViewExpanded(MenuItem paramMenuItem)
    {
      return false;
    }
    
    public MenuItem setActionView(MenuItem paramMenuItem, int paramInt)
    {
      return paramMenuItem;
    }
    
    public MenuItem setActionView(MenuItem paramMenuItem, View paramView)
    {
      return paramMenuItem;
    }
    
    public MenuItem setOnActionExpandListener(MenuItem paramMenuItem, MenuItemCompat.OnActionExpandListener paramOnActionExpandListener)
    {
      return paramMenuItem;
    }
    
    public void setShowAsAction(MenuItem paramMenuItem, int paramInt) {}
  }
  
  static class HoneycombMenuVersionImpl
    implements MenuItemCompat.MenuVersionImpl
  {
    HoneycombMenuVersionImpl() {}
    
    public boolean collapseActionView(MenuItem paramMenuItem)
    {
      return false;
    }
    
    public boolean expandActionView(MenuItem paramMenuItem)
    {
      return false;
    }
    
    public View getActionView(MenuItem paramMenuItem)
    {
      return MenuItemCompatHoneycomb.getActionView(paramMenuItem);
    }
    
    public boolean isActionViewExpanded(MenuItem paramMenuItem)
    {
      return false;
    }
    
    public MenuItem setActionView(MenuItem paramMenuItem, int paramInt)
    {
      return MenuItemCompatHoneycomb.setActionView(paramMenuItem, paramInt);
    }
    
    public MenuItem setActionView(MenuItem paramMenuItem, View paramView)
    {
      return MenuItemCompatHoneycomb.setActionView(paramMenuItem, paramView);
    }
    
    public MenuItem setOnActionExpandListener(MenuItem paramMenuItem, MenuItemCompat.OnActionExpandListener paramOnActionExpandListener)
    {
      return paramMenuItem;
    }
    
    public void setShowAsAction(MenuItem paramMenuItem, int paramInt)
    {
      MenuItemCompatHoneycomb.setShowAsAction(paramMenuItem, paramInt);
    }
  }
  
  static class IcsMenuVersionImpl
    extends MenuItemCompat.HoneycombMenuVersionImpl
  {
    IcsMenuVersionImpl() {}
    
    public boolean collapseActionView(MenuItem paramMenuItem)
    {
      return MenuItemCompatIcs.collapseActionView(paramMenuItem);
    }
    
    public boolean expandActionView(MenuItem paramMenuItem)
    {
      return MenuItemCompatIcs.expandActionView(paramMenuItem);
    }
    
    public boolean isActionViewExpanded(MenuItem paramMenuItem)
    {
      return MenuItemCompatIcs.isActionViewExpanded(paramMenuItem);
    }
    
    public MenuItem setOnActionExpandListener(MenuItem paramMenuItem, final MenuItemCompat.OnActionExpandListener paramOnActionExpandListener)
    {
      if (paramOnActionExpandListener == null) {
        return MenuItemCompatIcs.setOnActionExpandListener(paramMenuItem, null);
      }
      MenuItemCompatIcs.setOnActionExpandListener(paramMenuItem, new MenuItemCompatIcs.SupportActionExpandProxy()
      {
        public boolean onMenuItemActionCollapse(MenuItem paramAnonymousMenuItem)
        {
          return paramOnActionExpandListener.onMenuItemActionCollapse(paramAnonymousMenuItem);
        }
        
        public boolean onMenuItemActionExpand(MenuItem paramAnonymousMenuItem)
        {
          return paramOnActionExpandListener.onMenuItemActionExpand(paramAnonymousMenuItem);
        }
      });
    }
  }
  
  static abstract interface MenuVersionImpl
  {
    public abstract boolean collapseActionView(MenuItem paramMenuItem);
    
    public abstract boolean expandActionView(MenuItem paramMenuItem);
    
    public abstract View getActionView(MenuItem paramMenuItem);
    
    public abstract boolean isActionViewExpanded(MenuItem paramMenuItem);
    
    public abstract MenuItem setActionView(MenuItem paramMenuItem, int paramInt);
    
    public abstract MenuItem setActionView(MenuItem paramMenuItem, View paramView);
    
    public abstract MenuItem setOnActionExpandListener(MenuItem paramMenuItem, MenuItemCompat.OnActionExpandListener paramOnActionExpandListener);
    
    public abstract void setShowAsAction(MenuItem paramMenuItem, int paramInt);
  }
  
  public static abstract interface OnActionExpandListener
  {
    public abstract boolean onMenuItemActionCollapse(MenuItem paramMenuItem);
    
    public abstract boolean onMenuItemActionExpand(MenuItem paramMenuItem);
  }
}
