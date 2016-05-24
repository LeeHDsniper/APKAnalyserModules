package android.support.v4.view;

import android.view.View;
import android.view.View.OnApplyWindowInsetsListener;
import android.view.WindowInsets;

class ViewCompatLollipop
{
  public static WindowInsetsCompat dispatchApplyWindowInsets(View paramView, WindowInsetsCompat paramWindowInsetsCompat)
  {
    Object localObject = paramWindowInsetsCompat;
    if ((paramWindowInsetsCompat instanceof WindowInsetsCompatApi21))
    {
      WindowInsets localWindowInsets = ((WindowInsetsCompatApi21)paramWindowInsetsCompat).unwrap();
      paramView = paramView.dispatchApplyWindowInsets(localWindowInsets);
      localObject = paramWindowInsetsCompat;
      if (paramView != localWindowInsets) {
        localObject = new WindowInsetsCompatApi21(paramView);
      }
    }
    return localObject;
  }
  
  public static float getElevation(View paramView)
  {
    return paramView.getElevation();
  }
  
  public static float getTranslationZ(View paramView)
  {
    return paramView.getTranslationZ();
  }
  
  public static float getZ(View paramView)
  {
    return paramView.getZ();
  }
  
  public static WindowInsetsCompat onApplyWindowInsets(View paramView, WindowInsetsCompat paramWindowInsetsCompat)
  {
    Object localObject = paramWindowInsetsCompat;
    if ((paramWindowInsetsCompat instanceof WindowInsetsCompatApi21))
    {
      WindowInsets localWindowInsets = ((WindowInsetsCompatApi21)paramWindowInsetsCompat).unwrap();
      paramView = paramView.onApplyWindowInsets(localWindowInsets);
      localObject = paramWindowInsetsCompat;
      if (paramView != localWindowInsets) {
        localObject = new WindowInsetsCompatApi21(paramView);
      }
    }
    return localObject;
  }
  
  public static void requestApplyInsets(View paramView)
  {
    paramView.requestApplyInsets();
  }
  
  public static void setElevation(View paramView, float paramFloat)
  {
    paramView.setElevation(paramFloat);
  }
  
  public static void setOnApplyWindowInsetsListener(View paramView, OnApplyWindowInsetsListener paramOnApplyWindowInsetsListener)
  {
    paramView.setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener()
    {
      public WindowInsets onApplyWindowInsets(View paramAnonymousView, WindowInsets paramAnonymousWindowInsets)
      {
        paramAnonymousWindowInsets = new WindowInsetsCompatApi21(paramAnonymousWindowInsets);
        return ((WindowInsetsCompatApi21)val$listener.onApplyWindowInsets(paramAnonymousView, paramAnonymousWindowInsets)).unwrap();
      }
    });
  }
  
  public static void stopNestedScroll(View paramView)
  {
    paramView.stopNestedScroll();
  }
}
