import android.graphics.Rect;
import android.view.View;
import android.view.ViewConfiguration;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.AbsListView;

public class uaa
  implements Runnable
{
  private static final int jdField_a_of_type_Int = 400;
  private static final int b = 1;
  private static final int c = 2;
  private static final int d = 3;
  private static final int e = 4;
  private static final int f = 5;
  private int g;
  private int h;
  private int i;
  private int j;
  private int k;
  private final int l;
  private int m;
  
  public uaa(AbsListView paramAbsListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    l = ViewConfiguration.get(paramAbsListView.getContext()).getScaledFadingEdgeLength();
  }
  
  public void a()
  {
    a.removeCallbacks(this);
    if (AbsListView.a(a) != null) {
      AbsListView.a(a).b();
    }
  }
  
  public void a(int paramInt)
  {
    a();
    int n = a.au;
    int i1 = a.getChildCount() + n - 1;
    if (paramInt <= n)
    {
      n = n - paramInt + 1;
      g = 2;
      if (n <= 0) {
        break label97;
      }
    }
    label97:
    for (k = (400 / n);; k = 400)
    {
      h = paramInt;
      i = -1;
      j = -1;
      a.post(this);
      do
      {
        return;
      } while (paramInt < i1);
      n = paramInt - i1 + 1;
      g = 1;
      break;
    }
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    a();
    if (paramInt2 == -1) {
      a(paramInt1);
    }
    int i1;
    do
    {
      return;
      n = a.au;
      i1 = a.getChildCount() + n - 1;
      if (paramInt1 > n) {
        break;
      }
      i1 -= paramInt2;
    } while (i1 < 1);
    int n = n - paramInt1 + 1;
    i1 -= 1;
    if (i1 < n)
    {
      g = 4;
      n = i1;
      label79:
      if (n <= 0) {
        break label180;
      }
    }
    label178:
    label180:
    for (k = (400 / n);; k = 400)
    {
      h = paramInt1;
      i = paramInt2;
      j = -1;
      a.post(this);
      return;
      for (g = 2;; g = 1)
      {
        break label79;
        if (paramInt1 < i1) {
          break label178;
        }
        int i2 = paramInt2 - n;
        if (i2 < 1) {
          break;
        }
        n = paramInt1 - i1 + 1;
        i1 = i2 - 1;
        if (i1 < n)
        {
          g = 3;
          n = i1;
          break label79;
        }
      }
      break;
    }
  }
  
  public void a(int paramInt1, int paramInt2, int paramInt3)
  {
    a();
    h = paramInt1;
    m = paramInt2;
    i = -1;
    j = -1;
    g = 5;
    int i1 = a.au;
    int n = a.getChildCount();
    int i2 = i1 + n - 1;
    if (paramInt1 < i1) {
      paramInt1 = i1 - paramInt1;
    }
    for (;;)
    {
      float f1 = paramInt1 / n;
      k = ((int)(paramInt3 / f1));
      j = -1;
      a.post(this);
      return;
      if (paramInt1 <= i2) {
        break;
      }
      paramInt1 -= i2;
    }
    paramInt1 = a.getChildAt(paramInt1 - i1).getTop();
    a.f(paramInt1 - paramInt2, paramInt3);
  }
  
  public void b(int paramInt1, int paramInt2)
  {
    a(paramInt1, paramInt2, 400);
  }
  
  public void run()
  {
    int n = 0;
    if ((a.ag != 4) && (j != -1)) {}
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
              do
              {
                return;
                i2 = a.getHeight();
                i1 = a.au;
                switch (g)
                {
                default: 
                  return;
                case 1: 
                  n = a.getChildCount() - 1;
                  i1 += n;
                }
              } while (n < 0);
              if (i1 == j)
              {
                a.post(this);
                return;
              }
              localView = a.getChildAt(n);
              i3 = localView.getHeight();
              i4 = localView.getTop();
              if (i1 < a.aG - 1) {}
              for (n = l;; n = a.c.bottom)
              {
                a.f(n + (i3 - (i2 - i4)), k);
                j = i1;
                if (i1 >= h) {
                  break;
                }
                a.post(this);
                return;
              }
              n = a.getChildCount();
            } while ((i1 == i) || (n <= 1) || (n + i1 >= a.aG));
            n = i1 + 1;
            if (n == j)
            {
              a.post(this);
              return;
            }
            localView = a.getChildAt(1);
            i1 = localView.getHeight();
            i2 = localView.getTop();
            i3 = l;
            if (n < i)
            {
              a.f(Math.max(0, i2 + i1 - i3), k);
              j = n;
              a.post(this);
              return;
            }
          } while (i2 <= i3);
          a.f(i2 - i3, k);
          return;
          if (i1 == j)
          {
            a.post(this);
            return;
          }
          localView = a.getChildAt(0);
        } while (localView == null);
        i2 = localView.getTop();
        if (i1 > 0) {}
        for (n = l;; n = a.c.top)
        {
          a.f(i2 - n, k);
          j = i1;
          if (i1 <= h) {
            break;
          }
          a.post(this);
          return;
        }
        i3 = a.getChildCount() - 2;
      } while (i3 < 0);
      n = i1 + i3;
      if (n == j)
      {
        a.post(this);
        return;
      }
      View localView = a.getChildAt(i3);
      i1 = localView.getHeight();
      i3 = localView.getTop();
      j = n;
      if (n > i)
      {
        a.f(-(i2 - i3 - l), k);
        a.post(this);
        return;
      }
      n = i2 - l;
      i1 = i3 + i1;
    } while (n <= i1);
    a.f(-(n - i1), k);
    return;
    if (j == i1)
    {
      a.post(this);
      return;
    }
    j = i1;
    int i2 = a.getChildCount();
    int i3 = h;
    int i4 = i1 + i2 - 1;
    if (i3 < i1) {
      n = i1 - i3 + 1;
    }
    float f1;
    for (;;)
    {
      f1 = Math.min(Math.abs(n / i2), 1.0F);
      if (i3 >= i1) {
        break;
      }
      a.f((int)(f1 * -a.getHeight()), k);
      a.post(this);
      return;
      if (i3 > i4) {
        n = i3 - i4;
      }
    }
    if (i3 > i4)
    {
      a.f((int)(f1 * a.getHeight()), k);
      a.post(this);
      return;
    }
    n = a.getChildAt(i3 - i1).getTop() - m;
    int i1 = Math.abs((int)(k * (n / a.getHeight())));
    a.f(n, i1);
  }
}
