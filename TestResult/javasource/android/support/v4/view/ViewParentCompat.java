package android.support.v4.view;

import android.os.Build.VERSION;
import android.view.View;
import android.view.ViewParent;

public class ViewParentCompat
{
  static final ViewParentCompatImpl IMPL = new ViewParentCompatStubImpl();
  
  static
  {
    int i = Build.VERSION.SDK_INT;
    if (i >= 21)
    {
      IMPL = new ViewParentCompatLollipopImpl();
      return;
    }
    if (i >= 19)
    {
      IMPL = new ViewParentCompatKitKatImpl();
      return;
    }
    if (i >= 14)
    {
      IMPL = new ViewParentCompatICSImpl();
      return;
    }
  }
  
  public static boolean onNestedFling(ViewParent paramViewParent, View paramView, float paramFloat1, float paramFloat2, boolean paramBoolean)
  {
    return IMPL.onNestedFling(paramViewParent, paramView, paramFloat1, paramFloat2, paramBoolean);
  }
  
  public static boolean onNestedPreFling(ViewParent paramViewParent, View paramView, float paramFloat1, float paramFloat2)
  {
    return IMPL.onNestedPreFling(paramViewParent, paramView, paramFloat1, paramFloat2);
  }
  
  public static void onNestedPreScroll(ViewParent paramViewParent, View paramView, int paramInt1, int paramInt2, int[] paramArrayOfInt)
  {
    IMPL.onNestedPreScroll(paramViewParent, paramView, paramInt1, paramInt2, paramArrayOfInt);
  }
  
  public static void onNestedScroll(ViewParent paramViewParent, View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    IMPL.onNestedScroll(paramViewParent, paramView, paramInt1, paramInt2, paramInt3, paramInt4);
  }
  
  public static void onNestedScrollAccepted(ViewParent paramViewParent, View paramView1, View paramView2, int paramInt)
  {
    IMPL.onNestedScrollAccepted(paramViewParent, paramView1, paramView2, paramInt);
  }
  
  public static boolean onStartNestedScroll(ViewParent paramViewParent, View paramView1, View paramView2, int paramInt)
  {
    return IMPL.onStartNestedScroll(paramViewParent, paramView1, paramView2, paramInt);
  }
  
  public static void onStopNestedScroll(ViewParent paramViewParent, View paramView)
  {
    IMPL.onStopNestedScroll(paramViewParent, paramView);
  }
  
  static class ViewParentCompatICSImpl
    extends ViewParentCompat.ViewParentCompatStubImpl
  {
    ViewParentCompatICSImpl() {}
  }
  
  static abstract interface ViewParentCompatImpl
  {
    public abstract boolean onNestedFling(ViewParent paramViewParent, View paramView, float paramFloat1, float paramFloat2, boolean paramBoolean);
    
    public abstract boolean onNestedPreFling(ViewParent paramViewParent, View paramView, float paramFloat1, float paramFloat2);
    
    public abstract void onNestedPreScroll(ViewParent paramViewParent, View paramView, int paramInt1, int paramInt2, int[] paramArrayOfInt);
    
    public abstract void onNestedScroll(ViewParent paramViewParent, View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4);
    
    public abstract void onNestedScrollAccepted(ViewParent paramViewParent, View paramView1, View paramView2, int paramInt);
    
    public abstract boolean onStartNestedScroll(ViewParent paramViewParent, View paramView1, View paramView2, int paramInt);
    
    public abstract void onStopNestedScroll(ViewParent paramViewParent, View paramView);
  }
  
  static class ViewParentCompatKitKatImpl
    extends ViewParentCompat.ViewParentCompatICSImpl
  {
    ViewParentCompatKitKatImpl() {}
  }
  
  static class ViewParentCompatLollipopImpl
    extends ViewParentCompat.ViewParentCompatKitKatImpl
  {
    ViewParentCompatLollipopImpl() {}
    
    public boolean onNestedFling(ViewParent paramViewParent, View paramView, float paramFloat1, float paramFloat2, boolean paramBoolean)
    {
      return ViewParentCompatLollipop.onNestedFling(paramViewParent, paramView, paramFloat1, paramFloat2, paramBoolean);
    }
    
    public boolean onNestedPreFling(ViewParent paramViewParent, View paramView, float paramFloat1, float paramFloat2)
    {
      return ViewParentCompatLollipop.onNestedPreFling(paramViewParent, paramView, paramFloat1, paramFloat2);
    }
    
    public void onNestedPreScroll(ViewParent paramViewParent, View paramView, int paramInt1, int paramInt2, int[] paramArrayOfInt)
    {
      ViewParentCompatLollipop.onNestedPreScroll(paramViewParent, paramView, paramInt1, paramInt2, paramArrayOfInt);
    }
    
    public void onNestedScroll(ViewParent paramViewParent, View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      ViewParentCompatLollipop.onNestedScroll(paramViewParent, paramView, paramInt1, paramInt2, paramInt3, paramInt4);
    }
    
    public void onNestedScrollAccepted(ViewParent paramViewParent, View paramView1, View paramView2, int paramInt)
    {
      ViewParentCompatLollipop.onNestedScrollAccepted(paramViewParent, paramView1, paramView2, paramInt);
    }
    
    public boolean onStartNestedScroll(ViewParent paramViewParent, View paramView1, View paramView2, int paramInt)
    {
      return ViewParentCompatLollipop.onStartNestedScroll(paramViewParent, paramView1, paramView2, paramInt);
    }
    
    public void onStopNestedScroll(ViewParent paramViewParent, View paramView)
    {
      ViewParentCompatLollipop.onStopNestedScroll(paramViewParent, paramView);
    }
  }
  
  static class ViewParentCompatStubImpl
    implements ViewParentCompat.ViewParentCompatImpl
  {
    ViewParentCompatStubImpl() {}
    
    public boolean onNestedFling(ViewParent paramViewParent, View paramView, float paramFloat1, float paramFloat2, boolean paramBoolean)
    {
      if ((paramViewParent instanceof NestedScrollingParent)) {
        return ((NestedScrollingParent)paramViewParent).onNestedFling(paramView, paramFloat1, paramFloat2, paramBoolean);
      }
      return false;
    }
    
    public boolean onNestedPreFling(ViewParent paramViewParent, View paramView, float paramFloat1, float paramFloat2)
    {
      if ((paramViewParent instanceof NestedScrollingParent)) {
        return ((NestedScrollingParent)paramViewParent).onNestedPreFling(paramView, paramFloat1, paramFloat2);
      }
      return false;
    }
    
    public void onNestedPreScroll(ViewParent paramViewParent, View paramView, int paramInt1, int paramInt2, int[] paramArrayOfInt)
    {
      if ((paramViewParent instanceof NestedScrollingParent)) {
        ((NestedScrollingParent)paramViewParent).onNestedPreScroll(paramView, paramInt1, paramInt2, paramArrayOfInt);
      }
    }
    
    public void onNestedScroll(ViewParent paramViewParent, View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      if ((paramViewParent instanceof NestedScrollingParent)) {
        ((NestedScrollingParent)paramViewParent).onNestedScroll(paramView, paramInt1, paramInt2, paramInt3, paramInt4);
      }
    }
    
    public void onNestedScrollAccepted(ViewParent paramViewParent, View paramView1, View paramView2, int paramInt)
    {
      if ((paramViewParent instanceof NestedScrollingParent)) {
        ((NestedScrollingParent)paramViewParent).onNestedScrollAccepted(paramView1, paramView2, paramInt);
      }
    }
    
    public boolean onStartNestedScroll(ViewParent paramViewParent, View paramView1, View paramView2, int paramInt)
    {
      if ((paramViewParent instanceof NestedScrollingParent)) {
        return ((NestedScrollingParent)paramViewParent).onStartNestedScroll(paramView1, paramView2, paramInt);
      }
      return false;
    }
    
    public void onStopNestedScroll(ViewParent paramViewParent, View paramView)
    {
      if ((paramViewParent instanceof NestedScrollingParent)) {
        ((NestedScrollingParent)paramViewParent).onStopNestedScroll(paramView);
      }
    }
  }
}
