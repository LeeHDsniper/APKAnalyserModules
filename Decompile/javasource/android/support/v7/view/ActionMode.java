package android.support.v7.view;

import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;

public abstract class ActionMode
{
  private Object mTag;
  private boolean mTitleOptionalHint;
  
  public ActionMode() {}
  
  public abstract void finish();
  
  public abstract View getCustomView();
  
  public abstract Menu getMenu();
  
  public abstract MenuInflater getMenuInflater();
  
  public abstract CharSequence getSubtitle();
  
  public Object getTag()
  {
    return mTag;
  }
  
  public abstract CharSequence getTitle();
  
  public boolean getTitleOptionalHint()
  {
    return mTitleOptionalHint;
  }
  
  public abstract void invalidate();
  
  public boolean isTitleOptional()
  {
    return false;
  }
  
  public abstract void setCustomView(View paramView);
  
  public abstract void setSubtitle(int paramInt);
  
  public abstract void setSubtitle(CharSequence paramCharSequence);
  
  public void setTag(Object paramObject)
  {
    mTag = paramObject;
  }
  
  public abstract void setTitle(int paramInt);
  
  public abstract void setTitle(CharSequence paramCharSequence);
  
  public void setTitleOptionalHint(boolean paramBoolean)
  {
    mTitleOptionalHint = paramBoolean;
  }
  
  public static abstract interface Callback
  {
    public abstract boolean onActionItemClicked(ActionMode paramActionMode, MenuItem paramMenuItem);
    
    public abstract boolean onCreateActionMode(ActionMode paramActionMode, Menu paramMenu);
    
    public abstract void onDestroyActionMode(ActionMode paramActionMode);
    
    public abstract boolean onPrepareActionMode(ActionMode paramActionMode, Menu paramMenu);
  }
}
