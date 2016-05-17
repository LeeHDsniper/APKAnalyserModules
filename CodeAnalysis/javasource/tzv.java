import android.view.View;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.AbsListView;
import com.tencent.widget.AdapterView;
import com.tencent.widget.EdgeEffect;
import com.tencent.widget.OverScroller;

public class tzv
  implements Runnable
{
  private static final int b = 40;
  private int jdField_a_of_type_Int;
  private final OverScroller jdField_a_of_type_ComTencentWidgetOverScroller;
  private final Runnable jdField_a_of_type_JavaLangRunnable;
  
  public tzv(AbsListView paramAbsListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangRunnable = new tzw(this);
    jdField_a_of_type_ComTencentWidgetOverScroller = new OverScroller(paramAbsListView.getContext());
  }
  
  public void a()
  {
    jdField_a_of_type_ComTencentWidgetAbsListView.ag = -1;
    jdField_a_of_type_ComTencentWidgetAbsListView.removeCallbacks(this);
    jdField_a_of_type_ComTencentWidgetAbsListView.removeCallbacks(jdField_a_of_type_JavaLangRunnable);
    jdField_a_of_type_ComTencentWidgetAbsListView.b(0);
    AbsListView.a(jdField_a_of_type_ComTencentWidgetAbsListView);
    jdField_a_of_type_ComTencentWidgetOverScroller.a();
    if (AbsListView.a(jdField_a_of_type_ComTencentWidgetAbsListView) != null) {
      AbsListView.a(jdField_a_of_type_ComTencentWidgetAbsListView, AbsListView.b(jdField_a_of_type_ComTencentWidgetAbsListView, AbsListView.a(jdField_a_of_type_ComTencentWidgetAbsListView)));
    }
  }
  
  public void a(int paramInt)
  {
    if (paramInt < 0) {}
    for (int i = Integer.MAX_VALUE;; i = 0)
    {
      jdField_a_of_type_Int = i;
      jdField_a_of_type_ComTencentWidgetOverScroller.a(0, i, 0, paramInt, 0, Integer.MAX_VALUE, 0, Integer.MAX_VALUE);
      jdField_a_of_type_ComTencentWidgetAbsListView.ag = 4;
      jdField_a_of_type_ComTencentWidgetAbsListView.post(this);
      if (AbsListView.a(jdField_a_of_type_ComTencentWidgetAbsListView) == null) {
        AbsListView.a(jdField_a_of_type_ComTencentWidgetAbsListView, AbsListView.a(jdField_a_of_type_ComTencentWidgetAbsListView, "AbsListView-fling"));
      }
      return;
    }
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    if (paramInt1 < 0) {}
    for (int i = Integer.MAX_VALUE;; i = 0)
    {
      jdField_a_of_type_Int = i;
      jdField_a_of_type_ComTencentWidgetOverScroller.a(0, i, 0, paramInt1, paramInt2);
      jdField_a_of_type_ComTencentWidgetAbsListView.ag = 4;
      jdField_a_of_type_ComTencentWidgetAbsListView.post(this);
      return;
    }
  }
  
  public void b()
  {
    jdField_a_of_type_ComTencentWidgetAbsListView.postDelayed(jdField_a_of_type_JavaLangRunnable, 40L);
  }
  
  public void b(int paramInt)
  {
    if (jdField_a_of_type_ComTencentWidgetOverScroller.a(0, jdField_a_of_type_ComTencentWidgetAbsListView.getScrollY(), paramInt, paramInt, paramInt, paramInt))
    {
      jdField_a_of_type_ComTencentWidgetAbsListView.ag = 6;
      jdField_a_of_type_ComTencentWidgetAbsListView.invalidate();
      jdField_a_of_type_ComTencentWidgetAbsListView.post(this);
      return;
    }
    jdField_a_of_type_ComTencentWidgetAbsListView.ag = -1;
    jdField_a_of_type_ComTencentWidgetAbsListView.b(0);
  }
  
  void c(int paramInt)
  {
    jdField_a_of_type_ComTencentWidgetOverScroller.a(0, jdField_a_of_type_ComTencentWidgetAbsListView.getScrollY(), 0, paramInt, 0, 0, Integer.MIN_VALUE, Integer.MAX_VALUE, 0, jdField_a_of_type_ComTencentWidgetAbsListView.getHeight());
    jdField_a_of_type_ComTencentWidgetAbsListView.ag = 6;
    jdField_a_of_type_ComTencentWidgetAbsListView.invalidate();
    jdField_a_of_type_ComTencentWidgetAbsListView.post(this);
  }
  
  void d(int paramInt)
  {
    int i = 0;
    if (jdField_a_of_type_ComTencentWidgetAbsListView.l) {
      i = jdField_a_of_type_ComTencentWidgetAbsListView.l();
    }
    OverScroller localOverScroller = jdField_a_of_type_ComTencentWidgetOverScroller;
    int j;
    if (paramInt > 0)
    {
      j = jdField_a_of_type_ComTencentWidgetAbsListView.b_;
      localOverScroller.b(paramInt, i, j);
      i = jdField_a_of_type_ComTencentWidgetAbsListView.getOverScrollMode();
      if ((i != 0) && ((i != 1) || (AbsListView.b(jdField_a_of_type_ComTencentWidgetAbsListView)))) {
        break label158;
      }
      jdField_a_of_type_ComTencentWidgetAbsListView.ag = 6;
      i = (int)jdField_a_of_type_ComTencentWidgetOverScroller.a();
      if (AbsListView.a(jdField_a_of_type_ComTencentWidgetAbsListView) != null)
      {
        if (paramInt <= 0) {
          break label144;
        }
        AbsListView.a(jdField_a_of_type_ComTencentWidgetAbsListView).a(i);
      }
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentWidgetAbsListView.invalidate();
      jdField_a_of_type_ComTencentWidgetAbsListView.post(this);
      return;
      j = jdField_a_of_type_ComTencentWidgetAbsListView.ar;
      break;
      label144:
      AbsListView.b(jdField_a_of_type_ComTencentWidgetAbsListView).a(i);
      continue;
      label158:
      jdField_a_of_type_ComTencentWidgetAbsListView.ag = -1;
      if (jdField_a_of_type_ComTencentWidgetAbsListView.a != null) {
        jdField_a_of_type_ComTencentWidgetAbsListView.a.a();
      }
      if (AbsListView.a(jdField_a_of_type_ComTencentWidgetAbsListView) != null) {
        AbsListView.a(jdField_a_of_type_ComTencentWidgetAbsListView).b();
      }
    }
  }
  
  public void run()
  {
    int k = 1;
    int i;
    int j;
    switch (jdField_a_of_type_ComTencentWidgetAbsListView.ag)
    {
    case 5: 
    default: 
      a();
    case 3: 
      do
      {
        return;
      } while (jdField_a_of_type_ComTencentWidgetOverScroller.a());
    case 4: 
      AdapterView.b("AbsListView.FlingRunable.onfling");
      try
      {
        if (jdField_a_of_type_ComTencentWidgetAbsListView.r) {
          jdField_a_of_type_ComTencentWidgetAbsListView.b();
        }
        if ((jdField_a_of_type_ComTencentWidgetAbsListView.aG == 0) || (jdField_a_of_type_ComTencentWidgetAbsListView.getChildCount() == 0))
        {
          a();
          return;
        }
        Object localObject1 = jdField_a_of_type_ComTencentWidgetOverScroller;
        boolean bool = ((OverScroller)localObject1).b();
        int m = ((OverScroller)localObject1).b();
        i = jdField_a_of_type_Int - m;
        if (i > 0)
        {
          jdField_a_of_type_ComTencentWidgetAbsListView.ab = jdField_a_of_type_ComTencentWidgetAbsListView.au;
          localObject1 = jdField_a_of_type_ComTencentWidgetAbsListView.getChildAt(0);
          jdField_a_of_type_ComTencentWidgetAbsListView.ac = ((View)localObject1).getTop();
        }
        for (i = Math.min(jdField_a_of_type_ComTencentWidgetAbsListView.getHeight() - AbsListView.f(jdField_a_of_type_ComTencentWidgetAbsListView) - AbsListView.g(jdField_a_of_type_ComTencentWidgetAbsListView) - 1, i);; i = Math.max(-(jdField_a_of_type_ComTencentWidgetAbsListView.getHeight() - AbsListView.h(jdField_a_of_type_ComTencentWidgetAbsListView) - AbsListView.i(jdField_a_of_type_ComTencentWidgetAbsListView) - 1), i))
        {
          localObject1 = jdField_a_of_type_ComTencentWidgetAbsListView.getChildAt(jdField_a_of_type_ComTencentWidgetAbsListView.ab - jdField_a_of_type_ComTencentWidgetAbsListView.au);
          if (localObject1 == null) {
            break label611;
          }
          j = ((View)localObject1).getTop();
          if ((!jdField_a_of_type_ComTencentWidgetAbsListView.a(i, i)) || (i == 0)) {
            break label616;
          }
          label254:
          if (k == 0) {
            break;
          }
          if (localObject1 != null)
          {
            j = -(i - (((View)localObject1).getTop() - j));
            if ((!jdField_a_of_type_ComTencentWidgetAbsListView.l) || (j <= 0))
            {
              i = j;
              if (bool)
              {
                d(j);
                i = jdField_a_of_type_ComTencentWidgetOverScroller.b();
              }
              jdField_a_of_type_ComTencentWidgetAbsListView.overScrollBy(0, i, 0, jdField_a_of_type_ComTencentWidgetAbsListView.getScrollY(), 0, 0, 0, jdField_a_of_type_ComTencentWidgetAbsListView.a_, false);
            }
          }
          return;
          j = jdField_a_of_type_ComTencentWidgetAbsListView.getChildCount() - 1;
          jdField_a_of_type_ComTencentWidgetAbsListView.ab = (jdField_a_of_type_ComTencentWidgetAbsListView.au + j);
          localObject1 = jdField_a_of_type_ComTencentWidgetAbsListView.getChildAt(j);
          jdField_a_of_type_ComTencentWidgetAbsListView.ac = ((View)localObject1).getTop();
        }
        if ((bool) && (k == 0))
        {
          jdField_a_of_type_ComTencentWidgetAbsListView.invalidate();
          jdField_a_of_type_Int = m;
          jdField_a_of_type_ComTencentWidgetAbsListView.post(this);
        }
        for (;;)
        {
          return;
          a();
        }
        try
        {
          localOverScroller = jdField_a_of_type_ComTencentWidgetOverScroller;
          if (localOverScroller.b())
          {
            j = jdField_a_of_type_ComTencentWidgetAbsListView.getScrollY();
            k = localOverScroller.b();
            if (jdField_a_of_type_ComTencentWidgetAbsListView.overScrollBy(0, k - j, 0, j, 0, 0, 0, jdField_a_of_type_ComTencentWidgetAbsListView.a_, false)) {
              if ((j <= 0) && (k > 0))
              {
                i = 1;
                break label621;
              }
            }
          }
        }
        finally {}
      }
      finally
      {
        AdapterView.B();
      }
    }
    for (;;)
    {
      OverScroller localOverScroller;
      label541:
      k = (int)localOverScroller.a();
      i = k;
      if (j != 0) {
        i = -k;
      }
      localOverScroller.a();
      a(i);
      return;
      i = 0;
      break label621;
      label578:
      j = 0;
      label611:
      label616:
      label621:
      do
      {
        b(0);
        return;
        jdField_a_of_type_ComTencentWidgetAbsListView.invalidate();
        jdField_a_of_type_ComTencentWidgetAbsListView.post(this);
        return;
        a();
        return;
        j = 0;
        break;
        k = 0;
        break label254;
        if ((j < 0) || (k >= 0)) {
          break label578;
        }
        j = 1;
        if (i != 0) {
          break label541;
        }
      } while (j == 0);
    }
  }
}
