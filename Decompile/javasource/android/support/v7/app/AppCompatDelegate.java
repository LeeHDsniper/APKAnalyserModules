package android.support.v7.app;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.Configuration;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.MenuInflater;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;

public abstract class AppCompatDelegate
{
  AppCompatDelegate() {}
  
  public static AppCompatDelegate create(Activity paramActivity, AppCompatCallback paramAppCompatCallback)
  {
    return create(paramActivity, paramActivity.getWindow(), paramAppCompatCallback);
  }
  
  public static AppCompatDelegate create(Dialog paramDialog, AppCompatCallback paramAppCompatCallback)
  {
    return create(paramDialog.getContext(), paramDialog.getWindow(), paramAppCompatCallback);
  }
  
  private static AppCompatDelegate create(Context paramContext, Window paramWindow, AppCompatCallback paramAppCompatCallback)
  {
    int i = Build.VERSION.SDK_INT;
    if (i >= 14) {
      return new AppCompatDelegateImplV14(paramContext, paramWindow, paramAppCompatCallback);
    }
    if (i >= 11) {
      return new AppCompatDelegateImplV11(paramContext, paramWindow, paramAppCompatCallback);
    }
    return new AppCompatDelegateImplV7(paramContext, paramWindow, paramAppCompatCallback);
  }
  
  public abstract void addContentView(View paramView, ViewGroup.LayoutParams paramLayoutParams);
  
  public abstract MenuInflater getMenuInflater();
  
  public abstract ActionBar getSupportActionBar();
  
  public abstract void installViewFactory();
  
  public abstract void invalidateOptionsMenu();
  
  public abstract void onConfigurationChanged(Configuration paramConfiguration);
  
  public abstract void onCreate(Bundle paramBundle);
  
  public abstract void onDestroy();
  
  public abstract void onPostCreate(Bundle paramBundle);
  
  public abstract void onPostResume();
  
  public abstract void onStop();
  
  public abstract boolean requestWindowFeature(int paramInt);
  
  public abstract void setContentView(int paramInt);
  
  public abstract void setContentView(View paramView);
  
  public abstract void setContentView(View paramView, ViewGroup.LayoutParams paramLayoutParams);
  
  public abstract void setSupportActionBar(Toolbar paramToolbar);
  
  public abstract void setTitle(CharSequence paramCharSequence);
}
