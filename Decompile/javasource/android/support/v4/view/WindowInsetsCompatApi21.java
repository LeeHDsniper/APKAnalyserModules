package android.support.v4.view;

import android.view.WindowInsets;

class WindowInsetsCompatApi21
  extends WindowInsetsCompat
{
  private final WindowInsets mSource;
  
  WindowInsetsCompatApi21(WindowInsets paramWindowInsets)
  {
    mSource = paramWindowInsets;
  }
  
  public int getSystemWindowInsetBottom()
  {
    return mSource.getSystemWindowInsetBottom();
  }
  
  public int getSystemWindowInsetLeft()
  {
    return mSource.getSystemWindowInsetLeft();
  }
  
  public int getSystemWindowInsetRight()
  {
    return mSource.getSystemWindowInsetRight();
  }
  
  public int getSystemWindowInsetTop()
  {
    return mSource.getSystemWindowInsetTop();
  }
  
  public boolean isConsumed()
  {
    return mSource.isConsumed();
  }
  
  public WindowInsetsCompat replaceSystemWindowInsets(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    return new WindowInsetsCompatApi21(mSource.replaceSystemWindowInsets(paramInt1, paramInt2, paramInt3, paramInt4));
  }
  
  WindowInsets unwrap()
  {
    return mSource;
  }
}
