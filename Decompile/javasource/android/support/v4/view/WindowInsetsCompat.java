package android.support.v4.view;

public class WindowInsetsCompat
{
  WindowInsetsCompat() {}
  
  public int getSystemWindowInsetBottom()
  {
    return 0;
  }
  
  public int getSystemWindowInsetLeft()
  {
    return 0;
  }
  
  public int getSystemWindowInsetRight()
  {
    return 0;
  }
  
  public int getSystemWindowInsetTop()
  {
    return 0;
  }
  
  public boolean isConsumed()
  {
    return false;
  }
  
  public WindowInsetsCompat replaceSystemWindowInsets(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    return this;
  }
}
