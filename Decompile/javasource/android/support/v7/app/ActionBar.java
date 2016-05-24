package android.support.v7.app;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.support.v7.appcompat.R.styleable;
import android.support.v7.view.ActionMode;
import android.support.v7.view.ActionMode.Callback;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;

public abstract class ActionBar
{
  public ActionBar() {}
  
  public boolean collapseActionView()
  {
    return false;
  }
  
  public void dispatchMenuVisibilityChanged(boolean paramBoolean) {}
  
  public abstract int getDisplayOptions();
  
  public abstract int getHeight();
  
  public int getHideOffset()
  {
    return 0;
  }
  
  public Context getThemedContext()
  {
    return null;
  }
  
  public abstract void hide();
  
  public boolean invalidateOptionsMenu()
  {
    return false;
  }
  
  public abstract boolean isShowing();
  
  public void onConfigurationChanged(Configuration paramConfiguration) {}
  
  public boolean onKeyShortcut(int paramInt, KeyEvent paramKeyEvent)
  {
    return false;
  }
  
  public void setDefaultDisplayHomeAsUpEnabled(boolean paramBoolean) {}
  
  public abstract void setDisplayHomeAsUpEnabled(boolean paramBoolean);
  
  public abstract void setDisplayOptions(int paramInt);
  
  public abstract void setDisplayShowHomeEnabled(boolean paramBoolean);
  
  public void setElevation(float paramFloat)
  {
    if (paramFloat != 0.0F) {
      throw new UnsupportedOperationException("Setting a non-zero elevation is not supported in this action bar configuration.");
    }
  }
  
  public void setHideOnContentScrollEnabled(boolean paramBoolean)
  {
    if (paramBoolean) {
      throw new UnsupportedOperationException("Hide on content scroll is not supported in this action bar configuration.");
    }
  }
  
  public void setHomeButtonEnabled(boolean paramBoolean) {}
  
  public void setShowHideAnimationEnabled(boolean paramBoolean) {}
  
  public void setWindowTitle(CharSequence paramCharSequence) {}
  
  public abstract void show();
  
  public ActionMode startActionMode(ActionMode.Callback paramCallback)
  {
    return null;
  }
  
  public static class LayoutParams
    extends ViewGroup.MarginLayoutParams
  {
    public int gravity = 0;
    
    public LayoutParams(int paramInt1, int paramInt2)
    {
      super(paramInt2);
      gravity = 8388627;
    }
    
    public LayoutParams(Context paramContext, AttributeSet paramAttributeSet)
    {
      super(paramAttributeSet);
      paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.ActionBarLayout);
      gravity = paramContext.getInt(R.styleable.ActionBarLayout_android_layout_gravity, 0);
      paramContext.recycle();
    }
    
    public LayoutParams(LayoutParams paramLayoutParams)
    {
      super();
      gravity = gravity;
    }
    
    public LayoutParams(ViewGroup.LayoutParams paramLayoutParams)
    {
      super();
    }
  }
  
  public static abstract interface OnMenuVisibilityListener
  {
    public abstract void onMenuVisibilityChanged(boolean paramBoolean);
  }
  
  public static abstract class Tab
  {
    public Tab() {}
    
    public abstract CharSequence getContentDescription();
    
    public abstract View getCustomView();
    
    public abstract Drawable getIcon();
    
    public abstract CharSequence getText();
    
    public abstract void select();
  }
}
