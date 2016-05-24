package android.support.v4.app;

import android.os.Bundle;
import java.util.List;

public abstract class FragmentManager
{
  public FragmentManager() {}
  
  public abstract void addOnBackStackChangedListener(OnBackStackChangedListener paramOnBackStackChangedListener);
  
  public abstract FragmentTransaction beginTransaction();
  
  public abstract boolean executePendingTransactions();
  
  public abstract Fragment findFragmentById(int paramInt);
  
  public abstract Fragment findFragmentByTag(String paramString);
  
  public abstract int getBackStackEntryCount();
  
  public abstract Fragment getFragment(Bundle paramBundle, String paramString);
  
  public abstract List<Fragment> getFragments();
  
  public abstract boolean isDestroyed();
  
  public abstract void popBackStack();
  
  public abstract void popBackStack(int paramInt1, int paramInt2);
  
  public abstract boolean popBackStackImmediate();
  
  public abstract void putFragment(Bundle paramBundle, String paramString, Fragment paramFragment);
  
  public abstract Fragment.SavedState saveFragmentInstanceState(Fragment paramFragment);
  
  public static abstract interface OnBackStackChangedListener
  {
    public abstract void onBackStackChanged();
  }
}
