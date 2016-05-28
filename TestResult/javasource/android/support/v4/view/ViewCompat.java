package android.support.v4.view;

import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import java.lang.reflect.Field;
import java.util.WeakHashMap;

public class ViewCompat
{
  static final ViewCompatImpl IMPL = new BaseViewCompatImpl();
  
  static
  {
    int i = Build.VERSION.SDK_INT;
    if (i >= 21)
    {
      IMPL = new LollipopViewCompatImpl();
      return;
    }
    if (i >= 19)
    {
      IMPL = new KitKatViewCompatImpl();
      return;
    }
    if (i >= 17)
    {
      IMPL = new JbMr1ViewCompatImpl();
      return;
    }
    if (i >= 16)
    {
      IMPL = new JBViewCompatImpl();
      return;
    }
    if (i >= 14)
    {
      IMPL = new ICSViewCompatImpl();
      return;
    }
    if (i >= 11)
    {
      IMPL = new HCViewCompatImpl();
      return;
    }
    if (i >= 9)
    {
      IMPL = new GBViewCompatImpl();
      return;
    }
    if (i >= 7)
    {
      IMPL = new EclairMr1ViewCompatImpl();
      return;
    }
  }
  
  public static ViewPropertyAnimatorCompat animate(View paramView)
  {
    return IMPL.animate(paramView);
  }
  
  public static boolean canScrollHorizontally(View paramView, int paramInt)
  {
    return IMPL.canScrollHorizontally(paramView, paramInt);
  }
  
  public static boolean canScrollVertically(View paramView, int paramInt)
  {
    return IMPL.canScrollVertically(paramView, paramInt);
  }
  
  public static int combineMeasuredStates(int paramInt1, int paramInt2)
  {
    return IMPL.combineMeasuredStates(paramInt1, paramInt2);
  }
  
  public static WindowInsetsCompat dispatchApplyWindowInsets(View paramView, WindowInsetsCompat paramWindowInsetsCompat)
  {
    return IMPL.dispatchApplyWindowInsets(paramView, paramWindowInsetsCompat);
  }
  
  public static float getAlpha(View paramView)
  {
    return IMPL.getAlpha(paramView);
  }
  
  public static boolean getFitsSystemWindows(View paramView)
  {
    return IMPL.getFitsSystemWindows(paramView);
  }
  
  public static int getImportantForAccessibility(View paramView)
  {
    return IMPL.getImportantForAccessibility(paramView);
  }
  
  public static int getLayerType(View paramView)
  {
    return IMPL.getLayerType(paramView);
  }
  
  public static int getLayoutDirection(View paramView)
  {
    return IMPL.getLayoutDirection(paramView);
  }
  
  public static int getMeasuredState(View paramView)
  {
    return IMPL.getMeasuredState(paramView);
  }
  
  public static int getMinimumHeight(View paramView)
  {
    return IMPL.getMinimumHeight(paramView);
  }
  
  public static int getMinimumWidth(View paramView)
  {
    return IMPL.getMinimumWidth(paramView);
  }
  
  public static int getOverScrollMode(View paramView)
  {
    return IMPL.getOverScrollMode(paramView);
  }
  
  public static int getPaddingEnd(View paramView)
  {
    return IMPL.getPaddingEnd(paramView);
  }
  
  public static int getPaddingStart(View paramView)
  {
    return IMPL.getPaddingStart(paramView);
  }
  
  public static ViewParent getParentForAccessibility(View paramView)
  {
    return IMPL.getParentForAccessibility(paramView);
  }
  
  public static float getScaleX(View paramView)
  {
    return IMPL.getScaleX(paramView);
  }
  
  public static float getTranslationX(View paramView)
  {
    return IMPL.getTranslationX(paramView);
  }
  
  public static float getTranslationY(View paramView)
  {
    return IMPL.getTranslationY(paramView);
  }
  
  public static int getWindowSystemUiVisibility(View paramView)
  {
    return IMPL.getWindowSystemUiVisibility(paramView);
  }
  
  public static float getZ(View paramView)
  {
    return IMPL.getZ(paramView);
  }
  
  public static boolean hasAccessibilityDelegate(View paramView)
  {
    return IMPL.hasAccessibilityDelegate(paramView);
  }
  
  public static boolean hasTransientState(View paramView)
  {
    return IMPL.hasTransientState(paramView);
  }
  
  public static boolean isAttachedToWindow(View paramView)
  {
    return IMPL.isAttachedToWindow(paramView);
  }
  
  public static boolean isLaidOut(View paramView)
  {
    return IMPL.isLaidOut(paramView);
  }
  
  public static boolean isOpaque(View paramView)
  {
    return IMPL.isOpaque(paramView);
  }
  
  public static boolean isPaddingRelative(View paramView)
  {
    return IMPL.isPaddingRelative(paramView);
  }
  
  public static void jumpDrawablesToCurrentState(View paramView)
  {
    IMPL.jumpDrawablesToCurrentState(paramView);
  }
  
  public static void offsetLeftAndRight(View paramView, int paramInt)
  {
    paramView.offsetLeftAndRight(paramInt);
    if ((paramInt != 0) && (Build.VERSION.SDK_INT < 11)) {
      paramView.invalidate();
    }
  }
  
  public static void offsetTopAndBottom(View paramView, int paramInt)
  {
    paramView.offsetTopAndBottom(paramInt);
    if ((paramInt != 0) && (Build.VERSION.SDK_INT < 11)) {
      paramView.invalidate();
    }
  }
  
  public static WindowInsetsCompat onApplyWindowInsets(View paramView, WindowInsetsCompat paramWindowInsetsCompat)
  {
    return IMPL.onApplyWindowInsets(paramView, paramWindowInsetsCompat);
  }
  
  public static void postInvalidateOnAnimation(View paramView)
  {
    IMPL.postInvalidateOnAnimation(paramView);
  }
  
  public static void postInvalidateOnAnimation(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    IMPL.postInvalidateOnAnimation(paramView, paramInt1, paramInt2, paramInt3, paramInt4);
  }
  
  public static void postOnAnimation(View paramView, Runnable paramRunnable)
  {
    IMPL.postOnAnimation(paramView, paramRunnable);
  }
  
  public static void postOnAnimationDelayed(View paramView, Runnable paramRunnable, long paramLong)
  {
    IMPL.postOnAnimationDelayed(paramView, paramRunnable, paramLong);
  }
  
  public static void requestApplyInsets(View paramView)
  {
    IMPL.requestApplyInsets(paramView);
  }
  
  public static int resolveSizeAndState(int paramInt1, int paramInt2, int paramInt3)
  {
    return IMPL.resolveSizeAndState(paramInt1, paramInt2, paramInt3);
  }
  
  public static void setAccessibilityDelegate(View paramView, AccessibilityDelegateCompat paramAccessibilityDelegateCompat)
  {
    IMPL.setAccessibilityDelegate(paramView, paramAccessibilityDelegateCompat);
  }
  
  public static void setActivated(View paramView, boolean paramBoolean)
  {
    IMPL.setActivated(paramView, paramBoolean);
  }
  
  public static void setAlpha(View paramView, float paramFloat)
  {
    IMPL.setAlpha(paramView, paramFloat);
  }
  
  public static void setChildrenDrawingOrderEnabled(ViewGroup paramViewGroup, boolean paramBoolean)
  {
    IMPL.setChildrenDrawingOrderEnabled(paramViewGroup, paramBoolean);
  }
  
  public static void setElevation(View paramView, float paramFloat)
  {
    IMPL.setElevation(paramView, paramFloat);
  }
  
  public static void setImportantForAccessibility(View paramView, int paramInt)
  {
    IMPL.setImportantForAccessibility(paramView, paramInt);
  }
  
  public static void setLayerPaint(View paramView, Paint paramPaint)
  {
    IMPL.setLayerPaint(paramView, paramPaint);
  }
  
  public static void setLayerType(View paramView, int paramInt, Paint paramPaint)
  {
    IMPL.setLayerType(paramView, paramInt, paramPaint);
  }
  
  public static void setOnApplyWindowInsetsListener(View paramView, OnApplyWindowInsetsListener paramOnApplyWindowInsetsListener)
  {
    IMPL.setOnApplyWindowInsetsListener(paramView, paramOnApplyWindowInsetsListener);
  }
  
  public static void setPaddingRelative(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    IMPL.setPaddingRelative(paramView, paramInt1, paramInt2, paramInt3, paramInt4);
  }
  
  public static void setSaveFromParentEnabled(View paramView, boolean paramBoolean)
  {
    IMPL.setSaveFromParentEnabled(paramView, paramBoolean);
  }
  
  public static void setScaleX(View paramView, float paramFloat)
  {
    IMPL.setScaleX(paramView, paramFloat);
  }
  
  public static void setScaleY(View paramView, float paramFloat)
  {
    IMPL.setScaleY(paramView, paramFloat);
  }
  
  public static void setTranslationX(View paramView, float paramFloat)
  {
    IMPL.setTranslationX(paramView, paramFloat);
  }
  
  public static void setTranslationY(View paramView, float paramFloat)
  {
    IMPL.setTranslationY(paramView, paramFloat);
  }
  
  public static void stopNestedScroll(View paramView)
  {
    IMPL.stopNestedScroll(paramView);
  }
  
  static class BaseViewCompatImpl
    implements ViewCompat.ViewCompatImpl
  {
    WeakHashMap<View, ViewPropertyAnimatorCompat> mViewPropertyAnimatorCompatMap = null;
    
    BaseViewCompatImpl() {}
    
    private boolean canScrollingViewScrollHorizontally(ScrollingView paramScrollingView, int paramInt)
    {
      boolean bool = true;
      int i = paramScrollingView.computeHorizontalScrollOffset();
      int j = paramScrollingView.computeHorizontalScrollRange() - paramScrollingView.computeHorizontalScrollExtent();
      if (j == 0) {
        bool = false;
      }
      do
      {
        do
        {
          return bool;
          if (paramInt >= 0) {
            break;
          }
        } while (i > 0);
        return false;
      } while (i < j - 1);
      return false;
    }
    
    private boolean canScrollingViewScrollVertically(ScrollingView paramScrollingView, int paramInt)
    {
      boolean bool = true;
      int i = paramScrollingView.computeVerticalScrollOffset();
      int j = paramScrollingView.computeVerticalScrollRange() - paramScrollingView.computeVerticalScrollExtent();
      if (j == 0) {
        bool = false;
      }
      do
      {
        do
        {
          return bool;
          if (paramInt >= 0) {
            break;
          }
        } while (i > 0);
        return false;
      } while (i < j - 1);
      return false;
    }
    
    public ViewPropertyAnimatorCompat animate(View paramView)
    {
      return new ViewPropertyAnimatorCompat(paramView);
    }
    
    public boolean canScrollHorizontally(View paramView, int paramInt)
    {
      return ((paramView instanceof ScrollingView)) && (canScrollingViewScrollHorizontally((ScrollingView)paramView, paramInt));
    }
    
    public boolean canScrollVertically(View paramView, int paramInt)
    {
      return ((paramView instanceof ScrollingView)) && (canScrollingViewScrollVertically((ScrollingView)paramView, paramInt));
    }
    
    public int combineMeasuredStates(int paramInt1, int paramInt2)
    {
      return paramInt1 | paramInt2;
    }
    
    public WindowInsetsCompat dispatchApplyWindowInsets(View paramView, WindowInsetsCompat paramWindowInsetsCompat)
    {
      return paramWindowInsetsCompat;
    }
    
    public float getAlpha(View paramView)
    {
      return 1.0F;
    }
    
    public float getElevation(View paramView)
    {
      return 0.0F;
    }
    
    public boolean getFitsSystemWindows(View paramView)
    {
      return false;
    }
    
    long getFrameTime()
    {
      return 10L;
    }
    
    public int getImportantForAccessibility(View paramView)
    {
      return 0;
    }
    
    public int getLayerType(View paramView)
    {
      return 0;
    }
    
    public int getLayoutDirection(View paramView)
    {
      return 0;
    }
    
    public int getMeasuredState(View paramView)
    {
      return 0;
    }
    
    public int getMinimumHeight(View paramView)
    {
      return ViewCompatBase.getMinimumHeight(paramView);
    }
    
    public int getMinimumWidth(View paramView)
    {
      return ViewCompatBase.getMinimumWidth(paramView);
    }
    
    public int getOverScrollMode(View paramView)
    {
      return 2;
    }
    
    public int getPaddingEnd(View paramView)
    {
      return paramView.getPaddingRight();
    }
    
    public int getPaddingStart(View paramView)
    {
      return paramView.getPaddingLeft();
    }
    
    public ViewParent getParentForAccessibility(View paramView)
    {
      return paramView.getParent();
    }
    
    public float getScaleX(View paramView)
    {
      return 0.0F;
    }
    
    public float getTranslationX(View paramView)
    {
      return 0.0F;
    }
    
    public float getTranslationY(View paramView)
    {
      return 0.0F;
    }
    
    public float getTranslationZ(View paramView)
    {
      return 0.0F;
    }
    
    public int getWindowSystemUiVisibility(View paramView)
    {
      return 0;
    }
    
    public float getZ(View paramView)
    {
      return getTranslationZ(paramView) + getElevation(paramView);
    }
    
    public boolean hasAccessibilityDelegate(View paramView)
    {
      return false;
    }
    
    public boolean hasTransientState(View paramView)
    {
      return false;
    }
    
    public boolean isAttachedToWindow(View paramView)
    {
      return ViewCompatBase.isAttachedToWindow(paramView);
    }
    
    public boolean isLaidOut(View paramView)
    {
      return ViewCompatBase.isLaidOut(paramView);
    }
    
    public boolean isOpaque(View paramView)
    {
      boolean bool2 = false;
      paramView = paramView.getBackground();
      boolean bool1 = bool2;
      if (paramView != null)
      {
        bool1 = bool2;
        if (paramView.getOpacity() == -1) {
          bool1 = true;
        }
      }
      return bool1;
    }
    
    public boolean isPaddingRelative(View paramView)
    {
      return false;
    }
    
    public void jumpDrawablesToCurrentState(View paramView) {}
    
    public WindowInsetsCompat onApplyWindowInsets(View paramView, WindowInsetsCompat paramWindowInsetsCompat)
    {
      return paramWindowInsetsCompat;
    }
    
    public void postInvalidateOnAnimation(View paramView)
    {
      paramView.invalidate();
    }
    
    public void postInvalidateOnAnimation(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      paramView.invalidate(paramInt1, paramInt2, paramInt3, paramInt4);
    }
    
    public void postOnAnimation(View paramView, Runnable paramRunnable)
    {
      paramView.postDelayed(paramRunnable, getFrameTime());
    }
    
    public void postOnAnimationDelayed(View paramView, Runnable paramRunnable, long paramLong)
    {
      paramView.postDelayed(paramRunnable, getFrameTime() + paramLong);
    }
    
    public void requestApplyInsets(View paramView) {}
    
    public int resolveSizeAndState(int paramInt1, int paramInt2, int paramInt3)
    {
      return View.resolveSize(paramInt1, paramInt2);
    }
    
    public void setAccessibilityDelegate(View paramView, AccessibilityDelegateCompat paramAccessibilityDelegateCompat) {}
    
    public void setActivated(View paramView, boolean paramBoolean) {}
    
    public void setAlpha(View paramView, float paramFloat) {}
    
    public void setChildrenDrawingOrderEnabled(ViewGroup paramViewGroup, boolean paramBoolean) {}
    
    public void setElevation(View paramView, float paramFloat) {}
    
    public void setImportantForAccessibility(View paramView, int paramInt) {}
    
    public void setLayerPaint(View paramView, Paint paramPaint) {}
    
    public void setLayerType(View paramView, int paramInt, Paint paramPaint) {}
    
    public void setOnApplyWindowInsetsListener(View paramView, OnApplyWindowInsetsListener paramOnApplyWindowInsetsListener) {}
    
    public void setPaddingRelative(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      paramView.setPadding(paramInt1, paramInt2, paramInt3, paramInt4);
    }
    
    public void setSaveFromParentEnabled(View paramView, boolean paramBoolean) {}
    
    public void setScaleX(View paramView, float paramFloat) {}
    
    public void setScaleY(View paramView, float paramFloat) {}
    
    public void setTranslationX(View paramView, float paramFloat) {}
    
    public void setTranslationY(View paramView, float paramFloat) {}
    
    public void stopNestedScroll(View paramView)
    {
      if ((paramView instanceof NestedScrollingChild)) {
        ((NestedScrollingChild)paramView).stopNestedScroll();
      }
    }
  }
  
  static class EclairMr1ViewCompatImpl
    extends ViewCompat.BaseViewCompatImpl
  {
    EclairMr1ViewCompatImpl() {}
    
    public boolean isOpaque(View paramView)
    {
      return ViewCompatEclairMr1.isOpaque(paramView);
    }
    
    public void setChildrenDrawingOrderEnabled(ViewGroup paramViewGroup, boolean paramBoolean)
    {
      ViewCompatEclairMr1.setChildrenDrawingOrderEnabled(paramViewGroup, paramBoolean);
    }
  }
  
  static class GBViewCompatImpl
    extends ViewCompat.EclairMr1ViewCompatImpl
  {
    GBViewCompatImpl() {}
    
    public int getOverScrollMode(View paramView)
    {
      return ViewCompatGingerbread.getOverScrollMode(paramView);
    }
  }
  
  static class HCViewCompatImpl
    extends ViewCompat.GBViewCompatImpl
  {
    HCViewCompatImpl() {}
    
    public int combineMeasuredStates(int paramInt1, int paramInt2)
    {
      return ViewCompatHC.combineMeasuredStates(paramInt1, paramInt2);
    }
    
    public float getAlpha(View paramView)
    {
      return ViewCompatHC.getAlpha(paramView);
    }
    
    long getFrameTime()
    {
      return ViewCompatHC.getFrameTime();
    }
    
    public int getLayerType(View paramView)
    {
      return ViewCompatHC.getLayerType(paramView);
    }
    
    public int getMeasuredState(View paramView)
    {
      return ViewCompatHC.getMeasuredState(paramView);
    }
    
    public float getScaleX(View paramView)
    {
      return ViewCompatHC.getScaleX(paramView);
    }
    
    public float getTranslationX(View paramView)
    {
      return ViewCompatHC.getTranslationX(paramView);
    }
    
    public float getTranslationY(View paramView)
    {
      return ViewCompatHC.getTranslationY(paramView);
    }
    
    public void jumpDrawablesToCurrentState(View paramView)
    {
      ViewCompatHC.jumpDrawablesToCurrentState(paramView);
    }
    
    public int resolveSizeAndState(int paramInt1, int paramInt2, int paramInt3)
    {
      return ViewCompatHC.resolveSizeAndState(paramInt1, paramInt2, paramInt3);
    }
    
    public void setActivated(View paramView, boolean paramBoolean)
    {
      ViewCompatHC.setActivated(paramView, paramBoolean);
    }
    
    public void setAlpha(View paramView, float paramFloat)
    {
      ViewCompatHC.setAlpha(paramView, paramFloat);
    }
    
    public void setLayerPaint(View paramView, Paint paramPaint)
    {
      setLayerType(paramView, getLayerType(paramView), paramPaint);
      paramView.invalidate();
    }
    
    public void setLayerType(View paramView, int paramInt, Paint paramPaint)
    {
      ViewCompatHC.setLayerType(paramView, paramInt, paramPaint);
    }
    
    public void setSaveFromParentEnabled(View paramView, boolean paramBoolean)
    {
      ViewCompatHC.setSaveFromParentEnabled(paramView, paramBoolean);
    }
    
    public void setScaleX(View paramView, float paramFloat)
    {
      ViewCompatHC.setScaleX(paramView, paramFloat);
    }
    
    public void setScaleY(View paramView, float paramFloat)
    {
      ViewCompatHC.setScaleY(paramView, paramFloat);
    }
    
    public void setTranslationX(View paramView, float paramFloat)
    {
      ViewCompatHC.setTranslationX(paramView, paramFloat);
    }
    
    public void setTranslationY(View paramView, float paramFloat)
    {
      ViewCompatHC.setTranslationY(paramView, paramFloat);
    }
  }
  
  static class ICSViewCompatImpl
    extends ViewCompat.HCViewCompatImpl
  {
    static boolean accessibilityDelegateCheckFailed = false;
    static Field mAccessibilityDelegateField;
    
    ICSViewCompatImpl() {}
    
    public ViewPropertyAnimatorCompat animate(View paramView)
    {
      if (mViewPropertyAnimatorCompatMap == null) {
        mViewPropertyAnimatorCompatMap = new WeakHashMap();
      }
      ViewPropertyAnimatorCompat localViewPropertyAnimatorCompat2 = (ViewPropertyAnimatorCompat)mViewPropertyAnimatorCompatMap.get(paramView);
      ViewPropertyAnimatorCompat localViewPropertyAnimatorCompat1 = localViewPropertyAnimatorCompat2;
      if (localViewPropertyAnimatorCompat2 == null)
      {
        localViewPropertyAnimatorCompat1 = new ViewPropertyAnimatorCompat(paramView);
        mViewPropertyAnimatorCompatMap.put(paramView, localViewPropertyAnimatorCompat1);
      }
      return localViewPropertyAnimatorCompat1;
    }
    
    public boolean canScrollHorizontally(View paramView, int paramInt)
    {
      return ViewCompatICS.canScrollHorizontally(paramView, paramInt);
    }
    
    public boolean canScrollVertically(View paramView, int paramInt)
    {
      return ViewCompatICS.canScrollVertically(paramView, paramInt);
    }
    
    /* Error */
    public boolean hasAccessibilityDelegate(View paramView)
    {
      // Byte code:
      //   0: iconst_1
      //   1: istore_2
      //   2: getstatic 15	android/support/v4/view/ViewCompat$ICSViewCompatImpl:accessibilityDelegateCheckFailed	Z
      //   5: ifeq +5 -> 10
      //   8: iconst_0
      //   9: ireturn
      //   10: getstatic 56	android/support/v4/view/ViewCompat$ICSViewCompatImpl:mAccessibilityDelegateField	Ljava/lang/reflect/Field;
      //   13: ifnonnull +20 -> 33
      //   16: ldc 58
      //   18: ldc 60
      //   20: invokevirtual 66	java/lang/Class:getDeclaredField	(Ljava/lang/String;)Ljava/lang/reflect/Field;
      //   23: putstatic 56	android/support/v4/view/ViewCompat$ICSViewCompatImpl:mAccessibilityDelegateField	Ljava/lang/reflect/Field;
      //   26: getstatic 56	android/support/v4/view/ViewCompat$ICSViewCompatImpl:mAccessibilityDelegateField	Ljava/lang/reflect/Field;
      //   29: iconst_1
      //   30: invokevirtual 72	java/lang/reflect/Field:setAccessible	(Z)V
      //   33: getstatic 56	android/support/v4/view/ViewCompat$ICSViewCompatImpl:mAccessibilityDelegateField	Ljava/lang/reflect/Field;
      //   36: aload_1
      //   37: invokevirtual 73	java/lang/reflect/Field:get	(Ljava/lang/Object;)Ljava/lang/Object;
      //   40: astore_1
      //   41: aload_1
      //   42: ifnull +12 -> 54
      //   45: iload_2
      //   46: ireturn
      //   47: astore_1
      //   48: iconst_1
      //   49: putstatic 15	android/support/v4/view/ViewCompat$ICSViewCompatImpl:accessibilityDelegateCheckFailed	Z
      //   52: iconst_0
      //   53: ireturn
      //   54: iconst_0
      //   55: istore_2
      //   56: goto -11 -> 45
      //   59: astore_1
      //   60: iconst_1
      //   61: putstatic 15	android/support/v4/view/ViewCompat$ICSViewCompatImpl:accessibilityDelegateCheckFailed	Z
      //   64: iconst_0
      //   65: ireturn
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	66	0	this	ICSViewCompatImpl
      //   0	66	1	paramView	View
      //   1	55	2	bool	boolean
      // Exception table:
      //   from	to	target	type
      //   16	33	47	java/lang/Throwable
      //   33	41	59	java/lang/Throwable
    }
    
    public void setAccessibilityDelegate(View paramView, AccessibilityDelegateCompat paramAccessibilityDelegateCompat)
    {
      if (paramAccessibilityDelegateCompat == null) {}
      for (paramAccessibilityDelegateCompat = null;; paramAccessibilityDelegateCompat = paramAccessibilityDelegateCompat.getBridge())
      {
        ViewCompatICS.setAccessibilityDelegate(paramView, paramAccessibilityDelegateCompat);
        return;
      }
    }
  }
  
  static class JBViewCompatImpl
    extends ViewCompat.ICSViewCompatImpl
  {
    JBViewCompatImpl() {}
    
    public boolean getFitsSystemWindows(View paramView)
    {
      return ViewCompatJB.getFitsSystemWindows(paramView);
    }
    
    public int getImportantForAccessibility(View paramView)
    {
      return ViewCompatJB.getImportantForAccessibility(paramView);
    }
    
    public int getMinimumHeight(View paramView)
    {
      return ViewCompatJB.getMinimumHeight(paramView);
    }
    
    public int getMinimumWidth(View paramView)
    {
      return ViewCompatJB.getMinimumWidth(paramView);
    }
    
    public ViewParent getParentForAccessibility(View paramView)
    {
      return ViewCompatJB.getParentForAccessibility(paramView);
    }
    
    public boolean hasTransientState(View paramView)
    {
      return ViewCompatJB.hasTransientState(paramView);
    }
    
    public void postInvalidateOnAnimation(View paramView)
    {
      ViewCompatJB.postInvalidateOnAnimation(paramView);
    }
    
    public void postInvalidateOnAnimation(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      ViewCompatJB.postInvalidateOnAnimation(paramView, paramInt1, paramInt2, paramInt3, paramInt4);
    }
    
    public void postOnAnimation(View paramView, Runnable paramRunnable)
    {
      ViewCompatJB.postOnAnimation(paramView, paramRunnable);
    }
    
    public void postOnAnimationDelayed(View paramView, Runnable paramRunnable, long paramLong)
    {
      ViewCompatJB.postOnAnimationDelayed(paramView, paramRunnable, paramLong);
    }
    
    public void requestApplyInsets(View paramView)
    {
      ViewCompatJB.requestApplyInsets(paramView);
    }
    
    public void setImportantForAccessibility(View paramView, int paramInt)
    {
      int i = paramInt;
      if (paramInt == 4) {
        i = 2;
      }
      ViewCompatJB.setImportantForAccessibility(paramView, i);
    }
  }
  
  static class JbMr1ViewCompatImpl
    extends ViewCompat.JBViewCompatImpl
  {
    JbMr1ViewCompatImpl() {}
    
    public int getLayoutDirection(View paramView)
    {
      return ViewCompatJellybeanMr1.getLayoutDirection(paramView);
    }
    
    public int getPaddingEnd(View paramView)
    {
      return ViewCompatJellybeanMr1.getPaddingEnd(paramView);
    }
    
    public int getPaddingStart(View paramView)
    {
      return ViewCompatJellybeanMr1.getPaddingStart(paramView);
    }
    
    public int getWindowSystemUiVisibility(View paramView)
    {
      return ViewCompatJellybeanMr1.getWindowSystemUiVisibility(paramView);
    }
    
    public boolean isPaddingRelative(View paramView)
    {
      return ViewCompatJellybeanMr1.isPaddingRelative(paramView);
    }
    
    public void setLayerPaint(View paramView, Paint paramPaint)
    {
      ViewCompatJellybeanMr1.setLayerPaint(paramView, paramPaint);
    }
    
    public void setPaddingRelative(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      ViewCompatJellybeanMr1.setPaddingRelative(paramView, paramInt1, paramInt2, paramInt3, paramInt4);
    }
  }
  
  static class KitKatViewCompatImpl
    extends ViewCompat.JbMr1ViewCompatImpl
  {
    KitKatViewCompatImpl() {}
    
    public boolean isAttachedToWindow(View paramView)
    {
      return ViewCompatKitKat.isAttachedToWindow(paramView);
    }
    
    public boolean isLaidOut(View paramView)
    {
      return ViewCompatKitKat.isLaidOut(paramView);
    }
    
    public void setImportantForAccessibility(View paramView, int paramInt)
    {
      ViewCompatJB.setImportantForAccessibility(paramView, paramInt);
    }
  }
  
  static class LollipopViewCompatImpl
    extends ViewCompat.KitKatViewCompatImpl
  {
    LollipopViewCompatImpl() {}
    
    public WindowInsetsCompat dispatchApplyWindowInsets(View paramView, WindowInsetsCompat paramWindowInsetsCompat)
    {
      return ViewCompatLollipop.dispatchApplyWindowInsets(paramView, paramWindowInsetsCompat);
    }
    
    public float getElevation(View paramView)
    {
      return ViewCompatLollipop.getElevation(paramView);
    }
    
    public float getTranslationZ(View paramView)
    {
      return ViewCompatLollipop.getTranslationZ(paramView);
    }
    
    public float getZ(View paramView)
    {
      return ViewCompatLollipop.getZ(paramView);
    }
    
    public WindowInsetsCompat onApplyWindowInsets(View paramView, WindowInsetsCompat paramWindowInsetsCompat)
    {
      return ViewCompatLollipop.onApplyWindowInsets(paramView, paramWindowInsetsCompat);
    }
    
    public void requestApplyInsets(View paramView)
    {
      ViewCompatLollipop.requestApplyInsets(paramView);
    }
    
    public void setElevation(View paramView, float paramFloat)
    {
      ViewCompatLollipop.setElevation(paramView, paramFloat);
    }
    
    public void setOnApplyWindowInsetsListener(View paramView, OnApplyWindowInsetsListener paramOnApplyWindowInsetsListener)
    {
      ViewCompatLollipop.setOnApplyWindowInsetsListener(paramView, paramOnApplyWindowInsetsListener);
    }
    
    public void stopNestedScroll(View paramView)
    {
      ViewCompatLollipop.stopNestedScroll(paramView);
    }
  }
  
  static abstract interface ViewCompatImpl
  {
    public abstract ViewPropertyAnimatorCompat animate(View paramView);
    
    public abstract boolean canScrollHorizontally(View paramView, int paramInt);
    
    public abstract boolean canScrollVertically(View paramView, int paramInt);
    
    public abstract int combineMeasuredStates(int paramInt1, int paramInt2);
    
    public abstract WindowInsetsCompat dispatchApplyWindowInsets(View paramView, WindowInsetsCompat paramWindowInsetsCompat);
    
    public abstract float getAlpha(View paramView);
    
    public abstract boolean getFitsSystemWindows(View paramView);
    
    public abstract int getImportantForAccessibility(View paramView);
    
    public abstract int getLayerType(View paramView);
    
    public abstract int getLayoutDirection(View paramView);
    
    public abstract int getMeasuredState(View paramView);
    
    public abstract int getMinimumHeight(View paramView);
    
    public abstract int getMinimumWidth(View paramView);
    
    public abstract int getOverScrollMode(View paramView);
    
    public abstract int getPaddingEnd(View paramView);
    
    public abstract int getPaddingStart(View paramView);
    
    public abstract ViewParent getParentForAccessibility(View paramView);
    
    public abstract float getScaleX(View paramView);
    
    public abstract float getTranslationX(View paramView);
    
    public abstract float getTranslationY(View paramView);
    
    public abstract int getWindowSystemUiVisibility(View paramView);
    
    public abstract float getZ(View paramView);
    
    public abstract boolean hasAccessibilityDelegate(View paramView);
    
    public abstract boolean hasTransientState(View paramView);
    
    public abstract boolean isAttachedToWindow(View paramView);
    
    public abstract boolean isLaidOut(View paramView);
    
    public abstract boolean isOpaque(View paramView);
    
    public abstract boolean isPaddingRelative(View paramView);
    
    public abstract void jumpDrawablesToCurrentState(View paramView);
    
    public abstract WindowInsetsCompat onApplyWindowInsets(View paramView, WindowInsetsCompat paramWindowInsetsCompat);
    
    public abstract void postInvalidateOnAnimation(View paramView);
    
    public abstract void postInvalidateOnAnimation(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4);
    
    public abstract void postOnAnimation(View paramView, Runnable paramRunnable);
    
    public abstract void postOnAnimationDelayed(View paramView, Runnable paramRunnable, long paramLong);
    
    public abstract void requestApplyInsets(View paramView);
    
    public abstract int resolveSizeAndState(int paramInt1, int paramInt2, int paramInt3);
    
    public abstract void setAccessibilityDelegate(View paramView, AccessibilityDelegateCompat paramAccessibilityDelegateCompat);
    
    public abstract void setActivated(View paramView, boolean paramBoolean);
    
    public abstract void setAlpha(View paramView, float paramFloat);
    
    public abstract void setChildrenDrawingOrderEnabled(ViewGroup paramViewGroup, boolean paramBoolean);
    
    public abstract void setElevation(View paramView, float paramFloat);
    
    public abstract void setImportantForAccessibility(View paramView, int paramInt);
    
    public abstract void setLayerPaint(View paramView, Paint paramPaint);
    
    public abstract void setLayerType(View paramView, int paramInt, Paint paramPaint);
    
    public abstract void setOnApplyWindowInsetsListener(View paramView, OnApplyWindowInsetsListener paramOnApplyWindowInsetsListener);
    
    public abstract void setPaddingRelative(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4);
    
    public abstract void setSaveFromParentEnabled(View paramView, boolean paramBoolean);
    
    public abstract void setScaleX(View paramView, float paramFloat);
    
    public abstract void setScaleY(View paramView, float paramFloat);
    
    public abstract void setTranslationX(View paramView, float paramFloat);
    
    public abstract void setTranslationY(View paramView, float paramFloat);
    
    public abstract void stopNestedScroll(View paramView);
  }
}
