package android.support.v4.app;

public abstract class FragmentTransaction
{
  public FragmentTransaction() {}
  
  public abstract FragmentTransaction add(int paramInt, Fragment paramFragment);
  
  public abstract FragmentTransaction add(int paramInt, Fragment paramFragment, String paramString);
  
  public abstract FragmentTransaction add(Fragment paramFragment, String paramString);
  
  public abstract FragmentTransaction addToBackStack(String paramString);
  
  public abstract FragmentTransaction attach(Fragment paramFragment);
  
  public abstract int commit();
  
  public abstract int commitAllowingStateLoss();
  
  public abstract FragmentTransaction detach(Fragment paramFragment);
  
  public abstract FragmentTransaction remove(Fragment paramFragment);
  
  public abstract FragmentTransaction replace(int paramInt, Fragment paramFragment);
  
  public abstract FragmentTransaction replace(int paramInt, Fragment paramFragment, String paramString);
  
  public abstract FragmentTransaction setCustomAnimations(int paramInt1, int paramInt2);
}
