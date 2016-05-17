package com.tencent.mobileqq.activity.recent;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build.VERSION;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.Scroller;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.util.AccessibilityUtil;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.WeakReferenceHandler;
import mfz;

public class DrawerFrame
  extends FrameLayout
  implements Handler.Callback
{
  public static final int a = 0;
  public static final String a = "DrawerFrame";
  public static final boolean a;
  public static final int b = 1;
  public static final int c = 0;
  public static final int d = 1;
  public static final int e = 2;
  public static int f = 0;
  public static final int g = 1;
  public static final int h = 2;
  public static final int i = 3;
  public static final int j = 4;
  private static final int k = 300;
  private static final int l = 1;
  private static final int m = 2;
  private static final int n = 3;
  private static final int o = 4;
  private static final int p = 5;
  private static final int q = 0;
  private static final int r = 1;
  private static final int s = 2;
  private int A;
  private int B;
  private int C;
  private int D;
  private int E;
  private int F;
  private int G;
  private int H;
  private int I;
  private int J = 0;
  private int K = -1;
  private int L = 0;
  private final float jdField_a_of_type_Float = 0.8F;
  private VelocityTracker jdField_a_of_type_AndroidViewVelocityTracker;
  private View jdField_a_of_type_AndroidViewView;
  private ViewGroup jdField_a_of_type_AndroidViewViewGroup;
  private Scroller jdField_a_of_type_AndroidWidgetScroller;
  private DrawerFrame.IDrawerCallbacks jdField_a_of_type_ComTencentMobileqqActivityRecentDrawerFrame$IDrawerCallbacks;
  private WeakReferenceHandler jdField_a_of_type_ComTencentUtilWeakReferenceHandler;
  private StringBuilder jdField_a_of_type_JavaLangStringBuilder;
  private final float jdField_b_of_type_Float = 0.7F;
  private View jdField_b_of_type_AndroidViewView;
  private ViewGroup jdField_b_of_type_AndroidViewViewGroup;
  public boolean b;
  private final float jdField_c_of_type_Float = 0.4F;
  private ViewGroup jdField_c_of_type_AndroidViewViewGroup;
  private boolean jdField_c_of_type_Boolean = true;
  private ViewGroup jdField_d_of_type_AndroidViewViewGroup;
  private boolean jdField_d_of_type_Boolean = false;
  private boolean e = false;
  private boolean f;
  private boolean g = true;
  private boolean h = false;
  private int t = 0;
  private int u;
  private int v;
  private int w;
  private int x;
  private int y;
  private int z;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = QLog.isDevelopLevel();
    jdField_f_of_type_Int = 0;
  }
  
  public DrawerFrame(Context paramContext, ViewGroup paramViewGroup1, ViewGroup paramViewGroup2, View paramView, ViewGroup paramViewGroup3)
  {
    super(paramContext);
    jdField_f_of_type_Boolean = false;
    jdField_b_of_type_Boolean = true;
    if (paramContext == null) {
      throw new NullPointerException("context is null");
    }
    Resources localResources = paramContext.getResources();
    DisplayMetrics localDisplayMetrics = localResources.getDisplayMetrics();
    G = 0;
    A = ((int)(density * 100.0F + 0.5D));
    C = localResources.getDimensionPixelSize(2131493289);
    v = localResources.getDimensionPixelSize(2131493349);
    B = 0;
    if (Build.VERSION.SDK_INT >= 11) {
      bool = true;
    }
    g = bool;
    jdField_a_of_type_ComTencentUtilWeakReferenceHandler = new WeakReferenceHandler(Looper.getMainLooper(), this);
    jdField_a_of_type_AndroidWidgetScroller = new Scroller(paramContext, new DrawerFrame.SmoothInterpolator());
    if ((paramContext instanceof Activity)) {}
    for (K = DeviceInfoUtil.a((Activity)paramContext);; K = getResourcesgetConfigurationorientation)
    {
      if (jdField_a_of_type_Boolean) {
        a("DrawerFrame", null);
      }
      a(paramViewGroup1, paramViewGroup2, paramView, paramViewGroup3);
      b(J, 1);
      return;
    }
  }
  
  private void a(int paramInt, boolean paramBoolean)
  {
    G = 2;
    if (!jdField_d_of_type_Boolean)
    {
      b(paramInt, paramBoolean);
      return;
    }
    a(paramBoolean);
  }
  
  private void a(String paramString, Object paramObject)
  {
    if (QLog.isDevelopLevel())
    {
      if (jdField_a_of_type_JavaLangStringBuilder != null) {
        break label142;
      }
      jdField_a_of_type_JavaLangStringBuilder = new StringBuilder(120);
    }
    for (;;)
    {
      jdField_a_of_type_JavaLangStringBuilder.append(paramString).append(", mConfigurationFlag = ").append(L).append(", mCurOrientation = ").append(K).append(", mDecorOffsetX = ").append(t).append(", mLeftDrawerWidth = ").append(u).append(", mConfigurationFlag = ").append(L).append(", mWidth = ").append(H).append(", mHeight =").append(I).append(", param = ").append(paramObject);
      QLog.i("DrawerFrame", 4, jdField_a_of_type_JavaLangStringBuilder.toString());
      return;
      label142:
      jdField_a_of_type_JavaLangStringBuilder.setLength(0);
    }
  }
  
  private void a(boolean paramBoolean)
  {
    if (!d()) {
      return;
    }
    Scroller localScroller;
    int i2;
    int i3;
    if (e)
    {
      jdField_a_of_type_ComTencentUtilWeakReferenceHandler.removeMessages(1);
      jdField_a_of_type_ComTencentUtilWeakReferenceHandler.removeMessages(2);
      jdField_a_of_type_ComTencentUtilWeakReferenceHandler.removeMessages(4);
      jdField_a_of_type_ComTencentUtilWeakReferenceHandler.removeMessages(3);
      e = true;
      if (jdField_a_of_type_ComTencentMobileqqActivityRecentDrawerFrame$IDrawerCallbacks != null) {
        jdField_a_of_type_ComTencentMobileqqActivityRecentDrawerFrame$IDrawerCallbacks.a(J);
      }
      if (jdField_a_of_type_ComTencentMobileqqActivityRecentDrawerFrame$IDrawerCallbacks != null) {
        jdField_a_of_type_ComTencentMobileqqActivityRecentDrawerFrame$IDrawerCallbacks.a(J, false);
      }
      localScroller = jdField_a_of_type_AndroidWidgetScroller;
      i2 = t;
      i3 = -t;
      if (!paramBoolean) {
        break label148;
      }
    }
    label148:
    for (int i1 = 300;; i1 = 0)
    {
      localScroller.startScroll(i2, 0, i3, 0, i1);
      jdField_a_of_type_ComTencentUtilWeakReferenceHandler.sendEmptyMessage(2);
      return;
      if (jdField_d_of_type_Boolean) {
        break;
      }
      return;
    }
  }
  
  private void b(int paramInt1, int paramInt2)
  {
    int i2 = 0;
    int i1;
    if (paramInt2 == 1)
    {
      i1 = 8;
      if ((jdField_d_of_type_AndroidViewViewGroup != null) && (jdField_d_of_type_AndroidViewViewGroup.getVisibility() != i1)) {
        jdField_d_of_type_AndroidViewViewGroup.setVisibility(i1);
      }
      if ((paramInt2 != 1) && (paramInt1 != 1)) {
        break label153;
      }
      i1 = 8;
      label50:
      if ((jdField_c_of_type_AndroidViewViewGroup != null) && (jdField_c_of_type_AndroidViewViewGroup.getVisibility() != i1)) {
        jdField_c_of_type_AndroidViewViewGroup.setVisibility(i1);
      }
      if ((paramInt2 != 1) && (paramInt1 != 0)) {
        break label158;
      }
      paramInt1 = 8;
      label88:
      if ((jdField_a_of_type_AndroidViewView != null) && (jdField_a_of_type_AndroidViewView.getVisibility() != paramInt1)) {
        jdField_a_of_type_AndroidViewView.setVisibility(paramInt1);
      }
      if (paramInt2 != 0) {
        break label163;
      }
    }
    label153:
    label158:
    label163:
    for (paramInt1 = i2;; paramInt1 = 8)
    {
      if ((jdField_b_of_type_AndroidViewView != null) && (jdField_b_of_type_AndroidViewView.getVisibility() != paramInt1)) {
        jdField_b_of_type_AndroidViewView.setVisibility(paramInt1);
      }
      return;
      i1 = 0;
      break;
      i1 = 0;
      break label50;
      paramInt1 = 0;
      break label88;
    }
  }
  
  private void b(int paramInt, boolean paramBoolean)
  {
    int i1 = 300;
    if (!d()) {
      return;
    }
    J = paramInt;
    if (e)
    {
      jdField_a_of_type_ComTencentUtilWeakReferenceHandler.removeMessages(1);
      jdField_a_of_type_ComTencentUtilWeakReferenceHandler.removeMessages(2);
      jdField_a_of_type_ComTencentUtilWeakReferenceHandler.removeMessages(4);
      jdField_a_of_type_ComTencentUtilWeakReferenceHandler.removeMessages(3);
      label56:
      if (J != 0) {
        break label156;
      }
      jdField_c_of_type_AndroidViewViewGroup.setVisibility(0);
    }
    for (;;)
    {
      e = true;
      if (jdField_a_of_type_ComTencentMobileqqActivityRecentDrawerFrame$IDrawerCallbacks != null) {
        jdField_a_of_type_ComTencentMobileqqActivityRecentDrawerFrame$IDrawerCallbacks.a(J);
      }
      switch (paramInt)
      {
      default: 
        if (jdField_a_of_type_ComTencentMobileqqActivityRecentDrawerFrame$IDrawerCallbacks != null) {
          jdField_a_of_type_ComTencentMobileqqActivityRecentDrawerFrame$IDrawerCallbacks.a(paramInt, true);
        }
        jdField_a_of_type_ComTencentUtilWeakReferenceHandler.sendEmptyMessage(1);
        return;
        if (!jdField_d_of_type_Boolean) {
          break label56;
        }
        return;
        label156:
        if (J == 1) {
          jdField_a_of_type_AndroidViewView.setVisibility(0);
        }
        break;
      }
    }
    Scroller localScroller = jdField_a_of_type_AndroidWidgetScroller;
    int i2 = t;
    int i3 = u;
    int i4 = t;
    if (paramBoolean) {}
    for (;;)
    {
      localScroller.startScroll(i2, 0, i3 - i4, 0, i1);
      break;
      i1 = 1;
    }
    localScroller = jdField_a_of_type_AndroidWidgetScroller;
    i2 = t;
    i3 = -v;
    i4 = t;
    if (paramBoolean) {}
    for (;;)
    {
      localScroller.startScroll(i2, 0, i3 - i4, 0, i1);
      break;
      i1 = 1;
    }
  }
  
  private boolean d()
  {
    return (jdField_c_of_type_Boolean) && (jdField_c_of_type_AndroidViewViewGroup != null) && (jdField_a_of_type_AndroidViewViewGroup != null);
  }
  
  private boolean e()
  {
    if ((K == 1) && (H > I)) {}
    while ((K == 0) && (H < I)) {
      return false;
    }
    return true;
  }
  
  public View a()
  {
    return jdField_a_of_type_AndroidViewView;
  }
  
  public DrawerFrame.IDrawerCallbacks a()
  {
    return jdField_a_of_type_ComTencentMobileqqActivityRecentDrawerFrame$IDrawerCallbacks;
  }
  
  public void a()
  {
    a(0, true);
  }
  
  protected void a(int paramInt1, int paramInt2)
  {
    b(paramInt1, 2);
    float f1;
    float f2;
    if (Build.VERSION.SDK_INT >= 11)
    {
      if (paramInt1 != 0) {
        break label86;
      }
      f1 = paramInt2 / u;
      if (paramInt1 != 0) {
        break label99;
      }
      f2 = A * (f1 - 1.0F);
      label42:
      if (paramInt1 != 0) {
        break label114;
      }
    }
    label86:
    label99:
    label114:
    for (Object localObject = jdField_c_of_type_AndroidViewViewGroup;; localObject = jdField_a_of_type_AndroidViewView)
    {
      if (localObject != null) {
        ((View)localObject).setTranslationX(f2);
      }
      if (jdField_a_of_type_ComTencentMobileqqActivityRecentDrawerFrame$IDrawerCallbacks != null) {
        jdField_a_of_type_ComTencentMobileqqActivityRecentDrawerFrame$IDrawerCallbacks.a(J, f1);
      }
      return;
      f1 = -paramInt2 / v;
      break;
      f2 = -A * (f1 - 1.0F);
      break label42;
    }
  }
  
  public void a(ViewGroup paramViewGroup1, ViewGroup paramViewGroup2, View paramView, ViewGroup paramViewGroup3)
  {
    if (paramViewGroup3 != jdField_d_of_type_AndroidViewViewGroup)
    {
      if (jdField_d_of_type_AndroidViewViewGroup != null) {
        removeView(jdField_d_of_type_AndroidViewViewGroup);
      }
      jdField_d_of_type_AndroidViewViewGroup = paramViewGroup3;
      if (jdField_d_of_type_AndroidViewViewGroup != null)
      {
        paramViewGroup3 = new FrameLayout.LayoutParams(-1, -1);
        addView(jdField_d_of_type_AndroidViewViewGroup, paramViewGroup3);
      }
    }
    if (paramViewGroup2 != jdField_c_of_type_AndroidViewViewGroup)
    {
      if (jdField_c_of_type_AndroidViewViewGroup != null) {
        removeView(jdField_c_of_type_AndroidViewViewGroup);
      }
      jdField_c_of_type_AndroidViewViewGroup = paramViewGroup2;
      if (jdField_c_of_type_AndroidViewViewGroup != null)
      {
        paramViewGroup2 = new FrameLayout.LayoutParams(-1, -1, 19);
        addView(jdField_c_of_type_AndroidViewViewGroup, paramViewGroup2);
      }
    }
    if (paramView != jdField_a_of_type_AndroidViewView)
    {
      if (jdField_a_of_type_AndroidViewView != null) {
        removeView(jdField_a_of_type_AndroidViewView);
      }
      jdField_a_of_type_AndroidViewView = paramView;
      if (jdField_a_of_type_AndroidViewView != null)
      {
        paramViewGroup2 = new FrameLayout.LayoutParams(-2, -1, 21);
        addView(jdField_a_of_type_AndroidViewView, paramViewGroup2);
      }
    }
    if (paramViewGroup1 != jdField_a_of_type_AndroidViewViewGroup)
    {
      if (jdField_a_of_type_AndroidViewViewGroup != null)
      {
        removeView(jdField_a_of_type_AndroidViewViewGroup);
        if (jdField_b_of_type_AndroidViewViewGroup != null)
        {
          jdField_b_of_type_AndroidViewViewGroup.removeView(this);
          jdField_b_of_type_AndroidViewViewGroup.addView(jdField_a_of_type_AndroidViewViewGroup);
          jdField_b_of_type_AndroidViewViewGroup.setOnClickListener(null);
          jdField_b_of_type_AndroidViewViewGroup = null;
        }
      }
      jdField_a_of_type_AndroidViewViewGroup = paramViewGroup1;
      AccessibilityUtil.b(jdField_a_of_type_AndroidViewViewGroup, true);
      if (jdField_a_of_type_AndroidViewViewGroup != null)
      {
        paramViewGroup1 = jdField_a_of_type_AndroidViewViewGroup.getParent();
        if (!(paramViewGroup1 instanceof ViewGroup)) {
          break label451;
        }
        jdField_b_of_type_AndroidViewViewGroup = ((ViewGroup)paramViewGroup1);
        jdField_b_of_type_AndroidViewViewGroup.removeView(jdField_a_of_type_AndroidViewViewGroup);
      }
    }
    for (;;)
    {
      paramViewGroup1 = new FrameLayout.LayoutParams(-1, -1);
      addView(jdField_a_of_type_AndroidViewViewGroup, paramViewGroup1);
      if (jdField_b_of_type_AndroidViewViewGroup != null)
      {
        jdField_b_of_type_AndroidViewViewGroup.addView(this);
        jdField_b_of_type_AndroidViewViewGroup.setOnClickListener(new mfz(this));
      }
      if ((jdField_c_of_type_AndroidViewViewGroup != null) && (jdField_b_of_type_AndroidViewView == null))
      {
        jdField_b_of_type_AndroidViewView = new View(getContext());
        jdField_b_of_type_AndroidViewView.setFocusable(true);
        jdField_b_of_type_AndroidViewView.setFocusableInTouchMode(true);
        jdField_b_of_type_AndroidViewView.setClickable(true);
        jdField_b_of_type_AndroidViewView.setVisibility(8);
        jdField_b_of_type_AndroidViewView.setBackgroundResource(17170445);
        jdField_b_of_type_AndroidViewView.setContentDescription("返回 按钮");
        paramViewGroup1 = new FrameLayout.LayoutParams(u, D, 21);
        addView(jdField_b_of_type_AndroidViewView, paramViewGroup1);
      }
      h = false;
      return;
      label451:
      jdField_b_of_type_AndroidViewViewGroup = null;
    }
  }
  
  public boolean a()
  {
    return jdField_c_of_type_Boolean;
  }
  
  public void b()
  {
    a(1, true);
  }
  
  public boolean b()
  {
    return jdField_d_of_type_Boolean;
  }
  
  public void c()
  {
    b(0, true);
  }
  
  public boolean c()
  {
    return e;
  }
  
  public void d()
  {
    b(1, true);
  }
  
  public void e()
  {
    if (QLog.isDevelopLevel()) {
      QLog.i("DrawerFrame", 4, "resetDrawer()");
    }
    jdField_a_of_type_ComTencentUtilWeakReferenceHandler.removeMessages(1);
    jdField_a_of_type_ComTencentUtilWeakReferenceHandler.removeMessages(2);
    jdField_a_of_type_ComTencentUtilWeakReferenceHandler.removeMessages(4);
    jdField_a_of_type_ComTencentUtilWeakReferenceHandler.removeMessages(3);
    e = false;
    J = 0;
    t = 0;
    if (jdField_a_of_type_AndroidViewViewGroup != null) {
      jdField_a_of_type_AndroidViewViewGroup.offsetLeftAndRight(0 - jdField_a_of_type_AndroidViewViewGroup.getLeft());
    }
    a(J, t);
    postInvalidate();
    if (jdField_d_of_type_Boolean)
    {
      jdField_d_of_type_Boolean = false;
      jdField_a_of_type_ComTencentUtilWeakReferenceHandler.sendEmptyMessage(4);
    }
    b(J, 1);
    jdField_f_of_type_Int = 0;
  }
  
  public void f()
  {
    a(true);
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    int i1 = 0;
    switch (what)
    {
    }
    do
    {
      do
      {
        do
        {
          return true;
          boolean bool = jdField_a_of_type_AndroidWidgetScroller.computeScrollOffset();
          i1 = jdField_a_of_type_AndroidWidgetScroller.getCurrX();
          int i2 = t;
          t = jdField_a_of_type_AndroidWidgetScroller.getCurrX();
          if (jdField_a_of_type_AndroidViewViewGroup != null)
          {
            jdField_a_of_type_AndroidViewViewGroup.offsetLeftAndRight(i1 - i2);
            a(J, t);
          }
          postInvalidate();
          if (!bool)
          {
            e = false;
            jdField_d_of_type_Boolean = true;
            jdField_a_of_type_ComTencentUtilWeakReferenceHandler.sendEmptyMessage(3);
            return true;
          }
          jdField_a_of_type_ComTencentUtilWeakReferenceHandler.sendEmptyMessage(1);
          return true;
          bool = jdField_a_of_type_AndroidWidgetScroller.computeScrollOffset();
          i1 = jdField_a_of_type_AndroidWidgetScroller.getCurrX();
          i2 = t;
          t = jdField_a_of_type_AndroidWidgetScroller.getCurrX();
          if (jdField_a_of_type_AndroidViewViewGroup != null)
          {
            jdField_a_of_type_AndroidViewViewGroup.offsetLeftAndRight(i1 - i2);
            a(J, t);
          }
          postInvalidate();
          if (!bool)
          {
            e = false;
            jdField_d_of_type_Boolean = false;
            if (jdField_c_of_type_AndroidViewViewGroup != null) {
              jdField_c_of_type_AndroidViewViewGroup.setVisibility(8);
            }
            if (jdField_a_of_type_AndroidViewView != null) {
              jdField_a_of_type_AndroidViewView.setVisibility(8);
            }
            jdField_a_of_type_ComTencentUtilWeakReferenceHandler.sendEmptyMessage(4);
            return true;
          }
          jdField_a_of_type_ComTencentUtilWeakReferenceHandler.sendEmptyMessage(2);
          return true;
        } while (e);
        AccessibilityUtil.b(jdField_a_of_type_AndroidViewViewGroup, true);
        if (jdField_a_of_type_ComTencentMobileqqActivityRecentDrawerFrame$IDrawerCallbacks != null) {
          jdField_a_of_type_ComTencentMobileqqActivityRecentDrawerFrame$IDrawerCallbacks.b(J, G);
        }
        G = 0;
        J = 0;
        b(J, 1);
        return true;
      } while (e);
      AccessibilityUtil.b(jdField_a_of_type_AndroidViewViewGroup, false);
      b(J, 0);
      if (jdField_a_of_type_ComTencentMobileqqActivityRecentDrawerFrame$IDrawerCallbacks != null) {
        jdField_a_of_type_ComTencentMobileqqActivityRecentDrawerFrame$IDrawerCallbacks.a(J, G);
      }
      G = 0;
      return true;
    } while (!b());
    if (J == 0)
    {
      i1 = u - t;
      t = u;
    }
    for (;;)
    {
      if ((jdField_a_of_type_AndroidViewViewGroup != null) && (i1 != 0))
      {
        jdField_a_of_type_AndroidViewViewGroup.offsetLeftAndRight(i1);
        a(J, t);
        postInvalidate();
      }
      if (!jdField_a_of_type_Boolean) {
        break;
      }
      a("MSG_CONFIGURATION_CHANGED", Integer.valueOf(i1));
      return true;
      if (J == 1)
      {
        i1 = -v - t;
        t = (-v);
      }
    }
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    if (orientation != K)
    {
      K = orientation;
      if ((b()) && (L == 0)) {
        L = 1;
      }
      if (jdField_a_of_type_Boolean) {
        a("onConfigurationChanged", Boolean.valueOf(b()));
      }
    }
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    boolean bool3 = false;
    boolean bool1 = false;
    boolean bool2;
    if (!d()) {
      bool2 = bool1;
    }
    int i1;
    do
    {
      do
      {
        do
        {
          do
          {
            do
            {
              return bool2;
              bool2 = bool1;
            } while (!jdField_b_of_type_Boolean);
            i1 = ViewConfiguration.get(getContext()).getScaledTouchSlop();
            i2 = (int)(paramMotionEvent.getX() + 0.5F);
            i3 = (int)(paramMotionEvent.getY() + 0.5F);
            switch (paramMotionEvent.getAction())
            {
            default: 
              return false;
            case 0: 
              x = i2;
              w = i2;
              z = i3;
              y = i3;
              if ((!jdField_d_of_type_Boolean) || (w > B)) {
                jdField_f_of_type_Boolean = true;
              }
              bool2 = bool1;
            }
          } while (!e);
          if ((J == 0) && (w > t)) {
            break;
          }
          bool2 = bool1;
        } while (J != 1);
        bool2 = bool1;
      } while (w >= H + t);
      jdField_f_of_type_Boolean = true;
      return true;
      bool2 = bool1;
    } while (!jdField_f_of_type_Boolean);
    if ((!jdField_d_of_type_Boolean) && ((i2 < x) || (i2 < w)))
    {
      jdField_f_of_type_Boolean = false;
      return false;
    }
    x = i2;
    z = i3;
    int i2 = Math.abs(x - w);
    int i3 = Math.abs(z - y);
    if (jdField_d_of_type_Boolean)
    {
      bool1 = bool3;
      if (i2 > i1) {
        bool1 = true;
      }
    }
    for (;;)
    {
      bool2 = bool1;
      if (!bool1) {
        break;
      }
      bool2 = bool1;
      if (!e) {
        break;
      }
      jdField_a_of_type_ComTencentUtilWeakReferenceHandler.removeMessages(1);
      jdField_a_of_type_ComTencentUtilWeakReferenceHandler.removeMessages(2);
      jdField_a_of_type_ComTencentUtilWeakReferenceHandler.removeMessages(4);
      jdField_a_of_type_ComTencentUtilWeakReferenceHandler.removeMessages(3);
      return bool1;
      bool1 = bool3;
      if (i2 > i1)
      {
        bool1 = bool3;
        if ((i3 + 0.0F) / i2 < 0.6F) {
          bool1 = true;
        }
      }
    }
    jdField_f_of_type_Boolean = false;
    if (((jdField_d_of_type_Boolean) && (J == 0) && (w > u)) || ((J == 1) && (w < H - v)))
    {
      G = 3;
      if ((y >= E) && (y <= F)) {
        G = 4;
      }
      f();
      x = -1;
      w = -1;
      z = -1;
      y = -1;
      return true;
    }
    x = -1;
    w = -1;
    z = -1;
    y = -1;
    return false;
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if ((jdField_d_of_type_AndroidViewViewGroup != null) && (jdField_d_of_type_AndroidViewViewGroup.getVisibility() != 8)) {
      jdField_d_of_type_AndroidViewViewGroup.layout(paramInt1, paramInt2, paramInt3, paramInt4);
    }
    if ((jdField_c_of_type_AndroidViewViewGroup != null) && (jdField_c_of_type_AndroidViewViewGroup.getVisibility() != 8)) {
      jdField_c_of_type_AndroidViewViewGroup.layout(paramInt1, paramInt2, paramInt3, paramInt4);
    }
    if ((jdField_a_of_type_AndroidViewView != null) && (jdField_a_of_type_AndroidViewView.getVisibility() != 8)) {
      jdField_a_of_type_AndroidViewView.layout(paramInt3 - v, E, paramInt3, F);
    }
    if ((jdField_a_of_type_AndroidViewViewGroup != null) && (jdField_a_of_type_AndroidViewViewGroup.getVisibility() != 8)) {
      jdField_a_of_type_AndroidViewViewGroup.layout(jdField_a_of_type_AndroidViewViewGroup.getLeft(), jdField_a_of_type_AndroidViewViewGroup.getTop(), jdField_a_of_type_AndroidViewViewGroup.getLeft() + paramInt3, paramInt4);
    }
    if ((jdField_b_of_type_AndroidViewView != null) && (jdField_b_of_type_AndroidViewView.getVisibility() != 8))
    {
      if (J != 0) {
        break label270;
      }
      jdField_b_of_type_AndroidViewView.layout(u, E, u + C, F);
    }
    label270:
    do
    {
      while (e())
      {
        if (L == 2)
        {
          L = 0;
          if (!jdField_a_of_type_ComTencentUtilWeakReferenceHandler.hasMessages(5)) {
            jdField_a_of_type_ComTencentUtilWeakReferenceHandler.sendEmptyMessage(5);
          }
          if (jdField_a_of_type_Boolean) {
            a("onLayout", "valid orientation");
          }
        }
        return;
        if (J == 1) {
          jdField_b_of_type_AndroidViewView.layout(0, E, paramInt3 - v, F);
        }
      }
    } while (!jdField_a_of_type_Boolean);
    a("onLayout", "not valid orientation");
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, paramInt2);
    H = getMeasuredWidth();
    I = getMeasuredHeight();
    u = (H - C);
    if (Build.VERSION.SDK_INT >= 11)
    {
      D = ((int)(I * 0.8F + 0.5D));
      E = ((int)(I * 0.19999999F / 2.0F));
      F = (E + D);
      if (jdField_a_of_type_AndroidViewView != null) {
        jdField_a_of_type_AndroidViewView.getLayoutParams().height = D;
      }
      if (!e()) {
        break label177;
      }
      if (L == 1)
      {
        L = 2;
        if (jdField_a_of_type_Boolean) {
          a("onMeasure", "valid orientation");
        }
      }
    }
    label177:
    while (!jdField_a_of_type_Boolean)
    {
      return;
      D = I;
      E = 0;
      F = (E + D);
      break;
    }
    a("onMeasure", "not valid orientation");
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if (!d()) {}
    while (!jdField_b_of_type_Boolean) {
      return false;
    }
    ViewConfiguration localViewConfiguration = ViewConfiguration.get(getContext());
    int i1 = (int)(paramMotionEvent.getX() + 0.5F);
    int i2 = (int)(paramMotionEvent.getY() + 0.5F);
    int i3 = i1 - x;
    int i4 = z;
    if (jdField_a_of_type_AndroidViewVelocityTracker == null) {
      jdField_a_of_type_AndroidViewVelocityTracker = VelocityTracker.obtain();
    }
    jdField_a_of_type_AndroidViewVelocityTracker.addMovement(paramMotionEvent);
    x = i1;
    z = i2;
    switch (paramMotionEvent.getAction())
    {
    default: 
      return false;
    case 0: 
      if (e)
      {
        jdField_a_of_type_ComTencentUtilWeakReferenceHandler.removeMessages(1);
        jdField_a_of_type_ComTencentUtilWeakReferenceHandler.removeMessages(2);
        jdField_a_of_type_ComTencentUtilWeakReferenceHandler.removeMessages(4);
        jdField_a_of_type_ComTencentUtilWeakReferenceHandler.removeMessages(3);
      }
    case 2: 
      e = true;
      if (jdField_a_of_type_ComTencentMobileqqActivityRecentDrawerFrame$IDrawerCallbacks != null) {
        jdField_a_of_type_ComTencentMobileqqActivityRecentDrawerFrame$IDrawerCallbacks.a(J);
      }
      G = 1;
      if ((J == 0) && (t + i3 > u)) {
        if (t != u)
        {
          jdField_d_of_type_Boolean = true;
          jdField_a_of_type_AndroidViewViewGroup.offsetLeftAndRight(u - t);
          t = u;
          a(J, t);
          invalidate();
        }
      }
      for (;;)
      {
        return true;
        if ((J == 0) && (t + i3 < 0))
        {
          if (t != 0)
          {
            jdField_d_of_type_Boolean = false;
            jdField_a_of_type_AndroidViewViewGroup.offsetLeftAndRight(0 - jdField_a_of_type_AndroidViewViewGroup.getLeft());
            t = 0;
            a(J, t);
            invalidate();
          }
        }
        else if ((J == 1) && (t + i3 < -v))
        {
          if (t != -v)
          {
            jdField_d_of_type_Boolean = true;
            jdField_a_of_type_AndroidViewViewGroup.offsetLeftAndRight(-v - t);
            t = (-v);
            a(J, t);
            invalidate();
          }
        }
        else if ((J == 1) && (t + i3 > 0))
        {
          if (t != 0)
          {
            jdField_d_of_type_Boolean = false;
            jdField_a_of_type_AndroidViewViewGroup.offsetLeftAndRight(0 - jdField_a_of_type_AndroidViewViewGroup.getLeft());
            t = 0;
            a(J, t);
            invalidate();
          }
        }
        else
        {
          jdField_a_of_type_AndroidViewViewGroup.offsetLeftAndRight(i3);
          t += i3;
          a(J, t);
          invalidate();
        }
      }
    }
    jdField_f_of_type_Boolean = false;
    e = false;
    jdField_a_of_type_AndroidViewVelocityTracker.computeCurrentVelocity(1000);
    if (Math.abs(jdField_a_of_type_AndroidViewVelocityTracker.getXVelocity()) > localViewConfiguration.getScaledMinimumFlingVelocity()) {
      if (J == 0) {
        if (jdField_a_of_type_AndroidViewVelocityTracker.getXVelocity() > 0.0F)
        {
          jdField_d_of_type_Boolean = false;
          c();
        }
      }
    }
    for (;;)
    {
      return true;
      jdField_d_of_type_Boolean = true;
      f();
      continue;
      if (jdField_a_of_type_AndroidViewVelocityTracker.getXVelocity() < 0.0F)
      {
        jdField_d_of_type_Boolean = false;
        d();
      }
      else
      {
        jdField_d_of_type_Boolean = true;
        f();
        continue;
        if (J == 0)
        {
          if (t > H / 2.0D)
          {
            jdField_d_of_type_Boolean = false;
            c();
          }
          else
          {
            jdField_d_of_type_Boolean = true;
            f();
          }
        }
        else if (t < -(v / 3.0D * 2.0D))
        {
          jdField_d_of_type_Boolean = false;
          d();
        }
        else
        {
          jdField_d_of_type_Boolean = true;
          f();
        }
      }
    }
  }
  
  public void setDrawerCallbacks(DrawerFrame.IDrawerCallbacks paramIDrawerCallbacks)
  {
    jdField_a_of_type_ComTencentMobileqqActivityRecentDrawerFrame$IDrawerCallbacks = paramIDrawerCallbacks;
  }
  
  public void setDrawerEnabled(boolean paramBoolean)
  {
    jdField_c_of_type_Boolean = paramBoolean;
  }
}
