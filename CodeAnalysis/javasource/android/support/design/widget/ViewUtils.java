package android.support.design.widget;

import android.os.Build.VERSION;

class ViewUtils
{
  static final ValueAnimatorCompat.Creator DEFAULT_ANIMATOR_CREATOR = new ValueAnimatorCompat.Creator()
  {
    public ValueAnimatorCompat createAnimator()
    {
      if (Build.VERSION.SDK_INT >= 12) {}
      for (Object localObject = new ValueAnimatorCompatImplHoneycombMr1();; localObject = new ValueAnimatorCompatImplEclairMr1()) {
        return new ValueAnimatorCompat((ValueAnimatorCompat.Impl)localObject);
      }
    }
  };
  private static final ViewUtilsImpl IMPL = new ViewUtilsImplBase(null);
  
  static
  {
    if (Build.VERSION.SDK_INT >= 21)
    {
      IMPL = new ViewUtilsImplLollipop(null);
      return;
    }
  }
  
  static ValueAnimatorCompat createAnimator()
  {
    return DEFAULT_ANIMATOR_CREATOR.createAnimator();
  }
  
  private static abstract interface ViewUtilsImpl {}
  
  private static class ViewUtilsImplBase
    implements ViewUtils.ViewUtilsImpl
  {
    private ViewUtilsImplBase() {}
  }
  
  private static class ViewUtilsImplLollipop
    implements ViewUtils.ViewUtilsImpl
  {
    private ViewUtilsImplLollipop() {}
  }
}
