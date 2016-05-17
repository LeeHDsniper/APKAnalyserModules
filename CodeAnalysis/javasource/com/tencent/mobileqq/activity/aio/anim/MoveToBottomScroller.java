package com.tencent.mobileqq.activity.aio.anim;

import android.content.res.Resources;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.animation.AnimationUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import com.tencent.util.AnimateUtils;
import com.tencent.widget.ListView;

public class MoveToBottomScroller
  implements Runnable
{
  public static int b = 0;
  private static final int j = 1000;
  private static final int p = 0;
  private static final int q = 1;
  private static final int r = 2;
  private static final int s = 3;
  float jdField_a_of_type_Float = 1.0F;
  public int a;
  private long jdField_a_of_type_Long;
  ListView jdField_a_of_type_ComTencentWidgetListView;
  private boolean jdField_a_of_type_Boolean = false;
  private float jdField_b_of_type_Float;
  private boolean jdField_b_of_type_Boolean = true;
  private float jdField_c_of_type_Float;
  int jdField_c_of_type_Int;
  private float jdField_d_of_type_Float;
  int jdField_d_of_type_Int = 0;
  int e = 0;
  int f = 0;
  int g = 0;
  int h = 0;
  int i = 0;
  private int k = 0;
  private int l;
  private int m;
  private int n;
  private int o;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_b_of_type_Int = 50;
  }
  
  public MoveToBottomScroller(ListView paramListView)
  {
    jdField_a_of_type_Int = 0;
    jdField_a_of_type_ComTencentWidgetListView = paramListView;
    jdField_c_of_type_Int = ViewConfiguration.get(jdField_a_of_type_ComTencentWidgetListView.getContext()).getScaledMinimumFlingVelocity();
    if (DeviceInfoUtil.c() / 1048576L > 512L) {}
    for (;;)
    {
      jdField_b_of_type_Boolean = bool;
      jdField_a_of_type_Float = jdField_a_of_type_ComTencentWidgetListView.getResources().getDisplayMetrics().density;
      return;
      bool = false;
    }
  }
  
  public void a()
  {
    boolean bool = true;
    jdField_a_of_type_Int = 0;
    i = 0;
    if (!jdField_b_of_type_Boolean) {
      jdField_a_of_type_ComTencentWidgetListView.setSelection(jdField_a_of_type_ComTencentWidgetListView.c_() - 1);
    }
    while (jdField_a_of_type_ComTencentWidgetListView == null) {
      return;
    }
    h = jdField_a_of_type_ComTencentWidgetListView.getResources().getDisplayMetrics().heightPixels;
    e = jdField_a_of_type_ComTencentWidgetListView.au;
    f = (e + jdField_a_of_type_ComTencentWidgetListView.getChildCount() - 1);
    jdField_d_of_type_Int = (jdField_a_of_type_ComTencentWidgetListView.c_() - f - 1);
    if (jdField_d_of_type_Int == 0)
    {
      if (jdField_a_of_type_ComTencentWidgetListView.getChildCount() < 1)
      {
        jdField_a_of_type_ComTencentWidgetListView.setSelection(jdField_a_of_type_ComTencentWidgetListView.c_() - 1);
        return;
      }
      o = jdField_a_of_type_ComTencentWidgetListView.getChildAt(jdField_a_of_type_ComTencentWidgetListView.getChildCount() - 1).getBottom();
      if (o == 0)
      {
        b();
        return;
      }
      n = 1000;
      jdField_a_of_type_Long = AnimationUtils.currentAnimationTimeMillis();
      k = 0;
      l = 3;
      jdField_a_of_type_ComTencentWidgetListView.post(this);
      return;
    }
    int i1 = jdField_a_of_type_ComTencentWidgetListView.getChildCount();
    if (jdField_a_of_type_ComTencentWidgetListView.getChildCount() == 0) {
      i1 = 1;
    }
    o = (jdField_d_of_type_Int * jdField_a_of_type_ComTencentWidgetListView.getHeight() / i1);
    jdField_d_of_type_Float = (o / 750.0F);
    jdField_b_of_type_Float = (jdField_d_of_type_Float / 250.0F);
    jdField_c_of_type_Float = 0.0F;
    jdField_a_of_type_Long = AnimationUtils.currentAnimationTimeMillis();
    l = 0;
    k = 0;
    m = (jdField_a_of_type_ComTencentWidgetListView.c_() - 1);
    if (jdField_d_of_type_Int == 1) {}
    for (;;)
    {
      jdField_a_of_type_Boolean = bool;
      jdField_a_of_type_ComTencentWidgetListView.post(this);
      return;
      bool = false;
    }
  }
  
  public void b()
  {
    jdField_a_of_type_ComTencentWidgetListView.removeCallbacks(this);
  }
  
  public void run()
  {
    int i2 = 0;
    for (;;)
    {
      int i3;
      try
      {
        jdField_a_of_type_Int += 1;
        if (jdField_a_of_type_Int >= jdField_b_of_type_Int)
        {
          jdField_a_of_type_ComTencentWidgetListView.setSelectionFromBottom(jdField_a_of_type_ComTencentWidgetListView.c_() - 1, 0);
          return;
        }
        i3 = (int)(AnimationUtils.currentAnimationTimeMillis() - jdField_a_of_type_Long);
        switch (l)
        {
        case 0: 
          i1 -= k;
          if (i1 >= 0) {
            break label625;
          }
          i1 = i2;
          if (jdField_a_of_type_ComTencentWidgetListView.getChildCount() - 1 > 0) {
            g = jdField_a_of_type_ComTencentWidgetListView.getChildAt(jdField_a_of_type_ComTencentWidgetListView.getChildCount() - 1).getHeight();
          }
          i2 = i1;
          if (jdField_d_of_type_Int < 2)
          {
            if (g > h) {
              break label555;
            }
            i2 = i1;
            if (i1 > jdField_a_of_type_Float * 10.0F) {
              i2 = (int)(jdField_a_of_type_Float * 10.0F + 0.5D);
            }
            i1 = i2;
            if (i2 < i) {
              i1 = i;
            }
            i = i1;
            i2 = i1;
          }
          if (jdField_a_of_type_ComTencentWidgetListView.a(-i2, -i2)) {
            break label620;
          }
          i1 = jdField_a_of_type_ComTencentWidgetListView.getChildCount();
          i2 = jdField_a_of_type_ComTencentWidgetListView.au;
          if ((l != 3) && (l != 1) && (i2 + i1 - 1 >= m))
          {
            if (i1 < 2) {
              break label587;
            }
            o = (jdField_a_of_type_ComTencentWidgetListView.getChildAt(i1 - 1).getBottom() - jdField_a_of_type_ComTencentWidgetListView.getChildAt(i1 - 2).getBottom());
            n = (1000 - i3);
            if (n < 100) {
              n = 100;
            }
            jdField_a_of_type_Long = AnimationUtils.currentAnimationTimeMillis();
            k = 0;
            if ((jdField_c_of_type_Float * 1000.0F <= jdField_c_of_type_Int) || (jdField_a_of_type_Boolean)) {
              break label612;
            }
            l = 1;
            jdField_c_of_type_Float = (o * 2.0F / n);
            jdField_b_of_type_Float = (jdField_c_of_type_Float / n);
          }
          jdField_a_of_type_ComTencentWidgetListView.post(this);
          return;
        }
      }
      finally {}
      jdField_c_of_type_Float = (jdField_b_of_type_Float * i3);
      int i1 = (int)(jdField_c_of_type_Float * i3 / 2.0F);
      continue;
      i1 = (int)(jdField_d_of_type_Float * i3 - jdField_d_of_type_Float * 1000.0F / 8.0F);
      continue;
      if (i3 > n)
      {
        i1 = o;
        i1 = k;
        jdField_a_of_type_ComTencentWidgetListView.setSelectionFromBottom(jdField_a_of_type_ComTencentWidgetListView.c_() - 1, 0);
        return;
      }
      jdField_c_of_type_Float -= jdField_b_of_type_Float * i3;
      i1 = (int)(o - jdField_c_of_type_Float * (n - i3) / 2.0F);
      continue;
      i1 = (int)(AnimateUtils.a(i3 / n) * o);
      continue;
      label555:
      i2 = i1;
      if (i1 > jdField_a_of_type_Float * 100.0F)
      {
        i2 = (int)(jdField_a_of_type_Float * 100.0F + 0.5D);
        continue;
        label587:
        if (i1 == 1)
        {
          o = jdField_a_of_type_ComTencentWidgetListView.getChildAt(i1 - 1).getBottom();
          continue;
          label612:
          l = 3;
          continue;
          label620:
          b();
          return;
          label625:
          continue;
          i1 = 0;
        }
      }
    }
  }
}
