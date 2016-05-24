package android.support.v4.view;

import android.os.Build.VERSION;
import android.view.ViewGroup;

public class ViewGroupCompat
{
  static final ViewGroupCompatImpl IMPL = new ViewGroupCompatStubImpl();
  
  static
  {
    int i = Build.VERSION.SDK_INT;
    if (i >= 21)
    {
      IMPL = new ViewGroupCompatLollipopImpl();
      return;
    }
    if (i >= 18)
    {
      IMPL = new ViewGroupCompatJellybeanMR2Impl();
      return;
    }
    if (i >= 14)
    {
      IMPL = new ViewGroupCompatIcsImpl();
      return;
    }
    if (i >= 11)
    {
      IMPL = new ViewGroupCompatHCImpl();
      return;
    }
  }
  
  public static void setMotionEventSplittingEnabled(ViewGroup paramViewGroup, boolean paramBoolean)
  {
    IMPL.setMotionEventSplittingEnabled(paramViewGroup, paramBoolean);
  }
  
  static class ViewGroupCompatHCImpl
    extends ViewGroupCompat.ViewGroupCompatStubImpl
  {
    ViewGroupCompatHCImpl() {}
    
    public void setMotionEventSplittingEnabled(ViewGroup paramViewGroup, boolean paramBoolean)
    {
      ViewGroupCompatHC.setMotionEventSplittingEnabled(paramViewGroup, paramBoolean);
    }
  }
  
  static class ViewGroupCompatIcsImpl
    extends ViewGroupCompat.ViewGroupCompatHCImpl
  {
    ViewGroupCompatIcsImpl() {}
  }
  
  static abstract interface ViewGroupCompatImpl
  {
    public abstract void setMotionEventSplittingEnabled(ViewGroup paramViewGroup, boolean paramBoolean);
  }
  
  static class ViewGroupCompatJellybeanMR2Impl
    extends ViewGroupCompat.ViewGroupCompatIcsImpl
  {
    ViewGroupCompatJellybeanMR2Impl() {}
  }
  
  static class ViewGroupCompatLollipopImpl
    extends ViewGroupCompat.ViewGroupCompatJellybeanMR2Impl
  {
    ViewGroupCompatLollipopImpl() {}
  }
  
  static class ViewGroupCompatStubImpl
    implements ViewGroupCompat.ViewGroupCompatImpl
  {
    ViewGroupCompatStubImpl() {}
    
    public void setMotionEventSplittingEnabled(ViewGroup paramViewGroup, boolean paramBoolean) {}
  }
}
