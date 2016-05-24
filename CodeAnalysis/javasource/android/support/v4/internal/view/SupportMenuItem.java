package android.support.v4.internal.view;

import android.support.v4.view.ActionProvider;
import android.support.v4.view.MenuItemCompat.OnActionExpandListener;
import android.view.MenuItem;
import android.view.View;

public abstract interface SupportMenuItem
  extends MenuItem
{
  public abstract boolean collapseActionView();
  
  public abstract boolean expandActionView();
  
  public abstract View getActionView();
  
  public abstract ActionProvider getSupportActionProvider();
  
  public abstract boolean isActionViewExpanded();
  
  public abstract MenuItem setActionView(int paramInt);
  
  public abstract MenuItem setActionView(View paramView);
  
  public abstract void setShowAsAction(int paramInt);
  
  public abstract MenuItem setShowAsActionFlags(int paramInt);
  
  public abstract SupportMenuItem setSupportActionProvider(ActionProvider paramActionProvider);
  
  public abstract SupportMenuItem setSupportOnActionExpandListener(MenuItemCompat.OnActionExpandListener paramOnActionExpandListener);
}
