package android.support.v4.view;

import android.os.Build.VERSION;
import android.view.LayoutInflater;

public class LayoutInflaterCompat
{
  static final LayoutInflaterCompatImpl IMPL = new LayoutInflaterCompatImplBase();
  
  static
  {
    int i = Build.VERSION.SDK_INT;
    if (i >= 21)
    {
      IMPL = new LayoutInflaterCompatImplV21();
      return;
    }
    if (i >= 11)
    {
      IMPL = new LayoutInflaterCompatImplV11();
      return;
    }
  }
  
  public static void setFactory(LayoutInflater paramLayoutInflater, LayoutInflaterFactory paramLayoutInflaterFactory)
  {
    IMPL.setFactory(paramLayoutInflater, paramLayoutInflaterFactory);
  }
  
  static abstract interface LayoutInflaterCompatImpl
  {
    public abstract void setFactory(LayoutInflater paramLayoutInflater, LayoutInflaterFactory paramLayoutInflaterFactory);
  }
  
  static class LayoutInflaterCompatImplBase
    implements LayoutInflaterCompat.LayoutInflaterCompatImpl
  {
    LayoutInflaterCompatImplBase() {}
    
    public void setFactory(LayoutInflater paramLayoutInflater, LayoutInflaterFactory paramLayoutInflaterFactory)
    {
      LayoutInflaterCompatBase.setFactory(paramLayoutInflater, paramLayoutInflaterFactory);
    }
  }
  
  static class LayoutInflaterCompatImplV11
    extends LayoutInflaterCompat.LayoutInflaterCompatImplBase
  {
    LayoutInflaterCompatImplV11() {}
    
    public void setFactory(LayoutInflater paramLayoutInflater, LayoutInflaterFactory paramLayoutInflaterFactory)
    {
      LayoutInflaterCompatHC.setFactory(paramLayoutInflater, paramLayoutInflaterFactory);
    }
  }
  
  static class LayoutInflaterCompatImplV21
    extends LayoutInflaterCompat.LayoutInflaterCompatImplV11
  {
    LayoutInflaterCompatImplV21() {}
    
    public void setFactory(LayoutInflater paramLayoutInflater, LayoutInflaterFactory paramLayoutInflaterFactory)
    {
      LayoutInflaterCompatLollipop.setFactory(paramLayoutInflater, paramLayoutInflaterFactory);
    }
  }
}
