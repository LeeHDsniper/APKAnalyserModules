package android.support.v7.internal.view;

import android.content.Context;
import android.support.v7.internal.view.menu.MenuBuilder;
import android.support.v7.internal.view.menu.MenuBuilder.Callback;
import android.support.v7.internal.widget.ActionBarContextView;
import android.support.v7.view.ActionMode;
import android.support.v7.view.ActionMode.Callback;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import java.lang.ref.WeakReference;

public class StandaloneActionMode
  extends ActionMode
  implements MenuBuilder.Callback
{
  private ActionMode.Callback mCallback;
  private Context mContext;
  private ActionBarContextView mContextView;
  private WeakReference<View> mCustomView;
  private boolean mFinished;
  private boolean mFocusable;
  private MenuBuilder mMenu;
  
  public StandaloneActionMode(Context paramContext, ActionBarContextView paramActionBarContextView, ActionMode.Callback paramCallback, boolean paramBoolean)
  {
    mContext = paramContext;
    mContextView = paramActionBarContextView;
    mCallback = paramCallback;
    mMenu = new MenuBuilder(paramActionBarContextView.getContext()).setDefaultShowAsAction(1);
    mMenu.setCallback(this);
    mFocusable = paramBoolean;
  }
  
  public void finish()
  {
    if (mFinished) {
      return;
    }
    mFinished = true;
    mContextView.sendAccessibilityEvent(32);
    mCallback.onDestroyActionMode(this);
  }
  
  public View getCustomView()
  {
    if (mCustomView != null) {
      return (View)mCustomView.get();
    }
    return null;
  }
  
  public Menu getMenu()
  {
    return mMenu;
  }
  
  public MenuInflater getMenuInflater()
  {
    return new MenuInflater(mContextView.getContext());
  }
  
  public CharSequence getSubtitle()
  {
    return mContextView.getSubtitle();
  }
  
  public CharSequence getTitle()
  {
    return mContextView.getTitle();
  }
  
  public void invalidate()
  {
    mCallback.onPrepareActionMode(this, mMenu);
  }
  
  public boolean isTitleOptional()
  {
    return mContextView.isTitleOptional();
  }
  
  public boolean onMenuItemSelected(MenuBuilder paramMenuBuilder, MenuItem paramMenuItem)
  {
    return mCallback.onActionItemClicked(this, paramMenuItem);
  }
  
  public void onMenuModeChange(MenuBuilder paramMenuBuilder)
  {
    invalidate();
    mContextView.showOverflowMenu();
  }
  
  public void setCustomView(View paramView)
  {
    mContextView.setCustomView(paramView);
    if (paramView != null) {}
    for (paramView = new WeakReference(paramView);; paramView = null)
    {
      mCustomView = paramView;
      return;
    }
  }
  
  public void setSubtitle(int paramInt)
  {
    setSubtitle(mContext.getString(paramInt));
  }
  
  public void setSubtitle(CharSequence paramCharSequence)
  {
    mContextView.setSubtitle(paramCharSequence);
  }
  
  public void setTitle(int paramInt)
  {
    setTitle(mContext.getString(paramInt));
  }
  
  public void setTitle(CharSequence paramCharSequence)
  {
    mContextView.setTitle(paramCharSequence);
  }
  
  public void setTitleOptionalHint(boolean paramBoolean)
  {
    super.setTitleOptionalHint(paramBoolean);
    mContextView.setTitleOptional(paramBoolean);
  }
}
