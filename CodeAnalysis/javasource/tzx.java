import android.graphics.Rect;
import android.view.View;
import android.view.animation.AnimationUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.util.AnimateUtils;
import com.tencent.widget.AbsListView;
import com.tencent.widget.AdapterView;

public class tzx
  implements Runnable
{
  private static final int jdField_a_of_type_Int = 400;
  private static final int g = 0;
  private static final int h = 1;
  private static final int i = 2;
  private static final int j = 3;
  private float jdField_a_of_type_Float;
  private long jdField_a_of_type_Long;
  private boolean jdField_a_of_type_Boolean;
  private float jdField_b_of_type_Float;
  private int jdField_b_of_type_Int;
  private float jdField_c_of_type_Float;
  private int jdField_c_of_type_Int;
  private int d;
  private int e;
  private int f;
  
  public tzx(AbsListView paramAbsListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_b_of_type_Int = 0;
    jdField_a_of_type_Boolean = false;
  }
  
  public void a()
  {
    boolean bool = true;
    int k = jdField_a_of_type_ComTencentWidgetAbsListView.au;
    int m = jdField_a_of_type_ComTencentWidgetAbsListView.getChildCount();
    k = jdField_a_of_type_ComTencentWidgetAbsListView.aG - (k + m - 1) - 1;
    if (k == 0)
    {
      k = AbsListView.j(jdField_a_of_type_ComTencentWidgetAbsListView);
      m = AbsListView.k(jdField_a_of_type_ComTencentWidgetAbsListView);
      int n = jdField_a_of_type_ComTencentWidgetAbsListView.c.bottom;
      f = (jdField_a_of_type_ComTencentWidgetAbsListView.getChildAt(jdField_a_of_type_ComTencentWidgetAbsListView.getChildCount() - 1).getBottom() - (k - m - n));
      if (f == 0)
      {
        b();
        return;
      }
      e = 400;
      jdField_a_of_type_Long = AnimationUtils.currentAnimationTimeMillis();
      jdField_b_of_type_Int = 0;
      jdField_c_of_type_Int = 3;
      jdField_a_of_type_ComTencentWidgetAbsListView.post(this);
      return;
    }
    jdField_c_of_type_Float = (jdField_a_of_type_ComTencentWidgetAbsListView.getHeight() * k / jdField_a_of_type_ComTencentWidgetAbsListView.getChildCount() / 300.0F);
    jdField_a_of_type_Float = (jdField_c_of_type_Float / 100.0F);
    jdField_b_of_type_Float = 0.0F;
    jdField_a_of_type_Long = AnimationUtils.currentAnimationTimeMillis();
    jdField_c_of_type_Int = 0;
    jdField_b_of_type_Int = 0;
    d = (jdField_a_of_type_ComTencentWidgetAbsListView.aG - 1);
    if (k == 1) {}
    for (;;)
    {
      jdField_a_of_type_Boolean = bool;
      jdField_a_of_type_ComTencentWidgetAbsListView.post(this);
      return;
      bool = false;
    }
  }
  
  public void b()
  {
    jdField_a_of_type_ComTencentWidgetAbsListView.removeCallbacks(this);
    jdField_a_of_type_ComTencentWidgetAbsListView.m = false;
  }
  
  public void run()
  {
    int k = 0;
    AdapterView.b("AbsListView.MoveToBottomScroller.run");
    for (;;)
    {
      int m;
      try
      {
        m = (int)(AnimationUtils.currentAnimationTimeMillis() - jdField_a_of_type_Long);
        switch (jdField_c_of_type_Int)
        {
        case 0: 
          k -= jdField_b_of_type_Int;
          if (jdField_a_of_type_ComTencentWidgetAbsListView.a(-k, -k)) {
            break label545;
          }
          k = jdField_a_of_type_ComTencentWidgetAbsListView.getChildCount();
          int n = jdField_a_of_type_ComTencentWidgetAbsListView.au;
          if ((jdField_c_of_type_Int == 3) || (jdField_c_of_type_Int == 1) || (n + k - 1 < d)) {
            break label524;
          }
          n = AbsListView.l(jdField_a_of_type_ComTencentWidgetAbsListView);
          int i1 = AbsListView.m(jdField_a_of_type_ComTencentWidgetAbsListView);
          int i2 = jdField_a_of_type_ComTencentWidgetAbsListView.c.bottom;
          f = (jdField_a_of_type_ComTencentWidgetAbsListView.getChildAt(k - 1).getBottom() - (n - i1 - i2));
          if (f != 0) {
            break label426;
          }
          b();
          return;
        }
      }
      finally
      {
        AdapterView.B();
      }
      if (m > 100)
      {
        jdField_b_of_type_Float = jdField_c_of_type_Float;
        k = (int)(jdField_c_of_type_Float * m - jdField_c_of_type_Float * 400.0F / 8.0F);
        jdField_a_of_type_Float = 0.0F;
        jdField_c_of_type_Int = 2;
      }
      else
      {
        jdField_b_of_type_Float = (jdField_a_of_type_Float * m);
        k = (int)(jdField_b_of_type_Float * m / 2.0F);
        continue;
        k = (int)(jdField_c_of_type_Float * m - jdField_c_of_type_Float * 400.0F / 8.0F);
        continue;
        if (m > e)
        {
          k = f - jdField_b_of_type_Int;
          jdField_a_of_type_ComTencentWidgetAbsListView.a(-k, -k);
          AdapterView.B();
          return;
        }
        jdField_b_of_type_Float -= jdField_a_of_type_Float * m;
        k = (int)(f - jdField_b_of_type_Float * (e - m) / 2.0F);
        continue;
        if (m > e)
        {
          k = f - jdField_b_of_type_Int;
          jdField_a_of_type_ComTencentWidgetAbsListView.a(-k, -k);
          AdapterView.B();
          return;
        }
        float f1 = m;
        k = (int)(AnimateUtils.a(f1 / e) * f);
        continue;
        label426:
        e = (400 - m);
        if (e < 100) {
          e = 100;
        }
        jdField_a_of_type_Long = AnimationUtils.currentAnimationTimeMillis();
        jdField_b_of_type_Int = 0;
        if ((jdField_b_of_type_Float * 1000.0F > AbsListView.e(jdField_a_of_type_ComTencentWidgetAbsListView)) && (!jdField_a_of_type_Boolean))
        {
          jdField_c_of_type_Int = 1;
          jdField_b_of_type_Float = (f * 2.0F / e);
          jdField_a_of_type_Float = (jdField_b_of_type_Float / e);
          label524:
          jdField_a_of_type_ComTencentWidgetAbsListView.post(this);
        }
        for (;;)
        {
          AdapterView.B();
          return;
          jdField_c_of_type_Int = 3;
          break;
          label545:
          b();
        }
      }
    }
  }
}
