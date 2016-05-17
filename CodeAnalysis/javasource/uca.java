import android.graphics.Point;
import android.graphics.Rect;
import android.util.SparseBooleanArray;
import android.view.View;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.TranslateAnimation;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.FastScroller;
import com.tencent.widget.ListView;
import java.util.HashSet;
import java.util.Iterator;

public class uca
  extends tzr
  implements udj
{
  public uca(ListView paramListView)
  {
    super(paramListView);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private int a(int paramInt1, int paramInt2, int paramInt3)
  {
    int i = Integer.MAX_VALUE;
    int j = 0;
    if (paramInt3 >= paramInt2) {
      if (i >= paramInt1) {}
    }
    for (;;)
    {
      if (paramInt3 >= 0)
      {
        paramInt1 = 0;
        for (;;)
        {
          if (paramInt1 <= paramInt3)
          {
            a.jdField_a_of_type_Uab.a(a.getChildAt(paramInt1), a.au + paramInt1);
            paramInt1 += 1;
            continue;
            localObject = a.getChildAt(paramInt3);
            int k = i;
            if (i == Integer.MAX_VALUE) {
              k = ((View)localObject).getBottom();
            }
            i = ((View)localObject).getHeight();
            int m = ListView.a(a, (View)localObject, a.au + paramInt3, k, false, a.c.left, paramInt3);
            j += m;
            i = k - (m + i + a.aL);
            paramInt3 -= 1;
            break;
          }
        }
        ListView.e(a, 0, paramInt3 + 1);
        Object localObject = a;
        au += paramInt3 + 1;
        return 0;
      }
      return j;
      paramInt3 = -1;
    }
  }
  
  private int a(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    int j = 0;
    int i = Integer.MIN_VALUE;
    if (paramInt3 <= paramInt4) {
      if (i <= paramInt2) {}
    }
    for (paramInt2 = paramInt3;; paramInt2 = -1)
    {
      if (paramInt2 >= 0)
      {
        paramInt3 = paramInt2;
        for (;;)
        {
          if (paramInt3 < paramInt1)
          {
            a.jdField_a_of_type_Uab.a(a.getChildAt(paramInt3), a.au + paramInt3);
            paramInt3 += 1;
            continue;
            View localView = a.getChildAt(paramInt3);
            int k = i;
            if (i == Integer.MIN_VALUE) {
              k = localView.getTop();
            }
            i = localView.getHeight();
            int m = ListView.a(a, localView, a.au + paramInt3, k, true, a.c.left, paramInt3);
            j += m;
            i = k + (m + i + a.aL);
            paramInt3 += 1;
            break;
          }
        }
        ListView.g(a, paramInt2, paramInt1 - paramInt2);
        return 0;
      }
      return j;
    }
  }
  
  private int a(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    if ((paramInt1 > paramInt5) || (paramInt1 < paramInt4)) {
      paramInt4 = -1;
    }
    do
    {
      return paramInt4;
      paramInt4 = paramInt1;
    } while (paramInt1 < paramInt2);
    return paramInt1 + (paramInt3 - paramInt2 + 1);
  }
  
  private void a(int paramInt1, int paramInt2, int paramInt3)
  {
    if (paramInt2 < 0) {}
    do
    {
      int i;
      do
      {
        return;
        if (paramInt3 <= 0) {
          break;
        }
        i = -1;
        if (paramInt2 >= 0)
        {
          localObject = a.getChildAt(paramInt2);
          if (((View)localObject).getBottom() - paramInt3 < paramInt1)
          {
            a.jdField_a_of_type_Uab.a((View)localObject, a.au + paramInt2);
            j = i;
            if (i >= 0) {}
          }
          for (int j = paramInt2;; j = i)
          {
            paramInt2 -= 1;
            i = j;
            break;
            ((View)localObject).offsetTopAndBottom(-paramInt3);
          }
        }
      } while (i < 0);
      ListView.f(a, 0, i + 1);
      Object localObject = a;
      au = (i + 1 + au);
      return;
    } while (paramInt3 >= 0);
    a.c(false);
  }
  
  private void a(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (paramInt4 > 0)
    {
      i = -1;
      if (paramInt3 < paramInt1)
      {
        localView = a.getChildAt(paramInt3);
        if (localView.getTop() + paramInt4 > paramInt2)
        {
          a.jdField_a_of_type_Uab.a(localView, a.au + paramInt3);
          j = i;
          if (i >= 0) {}
        }
        for (j = paramInt3;; j = i)
        {
          paramInt3 += 1;
          i = j;
          break;
          localView.offsetTopAndBottom(paramInt4);
        }
      }
      if (i >= 0) {
        ListView.h(a, i, paramInt1 - i);
      }
    }
    while (paramInt4 >= 0)
    {
      int i;
      View localView;
      int j;
      return;
    }
    while (paramInt3 < paramInt1)
    {
      a.getChildAt(paramInt3).offsetTopAndBottom(paramInt4);
      paramInt3 += 1;
    }
    a.c(true);
  }
  
  private void a(int paramInt1, int paramInt2, int paramInt3, int paramInt4, boolean paramBoolean)
  {
    int i = 0;
    int j = 0;
    View localView;
    Object localObject;
    if (paramBoolean)
    {
      paramInt2 = j;
      while (paramInt2 < paramInt1)
      {
        localView = a.getChildAt(paramInt2);
        localObject = new AlphaAnimation(0.0F, 1.0F);
        ((AlphaAnimation)localObject).setDuration(a.d());
        localView.setAnimation((Animation)localObject);
        paramInt2 += 1;
      }
    }
    while (i <= paramInt2)
    {
      localView = a.getChildAt(i);
      localObject = new TranslateAnimation(0.0F, 0.0F, paramInt3, 0.0F);
      ((TranslateAnimation)localObject).setDuration(a.d());
      localView.setAnimation((Animation)localObject);
      i += 1;
    }
    paramInt2 += 1;
    while (paramInt2 < paramInt1)
    {
      localView = a.getChildAt(paramInt2);
      localObject = new TranslateAnimation(0.0F, 0.0F, paramInt4, 0.0F);
      ((TranslateAnimation)localObject).setDuration(a.d());
      localView.setAnimation((Animation)localObject);
      paramInt2 += 1;
    }
  }
  
  private int b(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    if ((paramInt1 > paramInt5) || (paramInt1 < paramInt4)) {
      paramInt4 = -1;
    }
    do
    {
      return paramInt4;
      paramInt4 = paramInt1;
    } while (paramInt1 < paramInt2);
    if (paramInt1 <= paramInt3) {
      return -1;
    }
    return paramInt1 - (paramInt3 - paramInt2 + 1);
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    int k;
    int n;
    int i3;
    int i;
    label283:
    int j;
    int m;
    label425:
    label463:
    label477:
    Object localObject;
    if ((paramInt1 == 0) && (a.aG > 0))
    {
      System.nanoTime();
      if (paramInt2 < paramInt1) {
        throw new IllegalArgumentException("lastRow must more than firstRow!");
      }
      if ((paramInt1 < 0) || (paramInt1 > a.aG - a.m() - a.n())) {
        throw new IllegalArgumentException("row index out of bound");
      }
      if ((a.p) || (a.r)) {
        onChanged();
      }
      int i1;
      int i2;
      do
      {
        do
        {
          return;
        } while (a.aG == 0);
        k = paramInt1 + a.m();
        paramInt2 += a.m();
        n = paramInt2 - k + 1;
        i3 = a.getChildCount();
        i1 = a.au;
        i2 = a.au + i3 - 1;
        if (k == a.aG)
        {
          paramInt1 = 1;
          if (a.jdField_a_of_type_ComTencentWidgetFastScroller != null) {
            a.jdField_a_of_type_ComTencentWidgetFastScroller.a(a.aG, a.aG - n);
          }
          a.aG += n;
          if (a.aF < 0) {
            break label425;
          }
          i = a(a.aF, k, paramInt2, i1, i2);
          a.h(i);
          a.i(i);
          if (a.ab >= 0) {
            a.ab = a(a.ab, k, paramInt2, i1, i2);
          }
          if (a.jdField_a_of_type_AndroidUtilSparseBooleanArray != null) {
            break label463;
          }
        }
        for (i = 0;; i = a.jdField_a_of_type_AndroidUtilSparseBooleanArray.size())
        {
          if (i <= 0) {
            break label477;
          }
          j = 0;
          while (j < i)
          {
            m = a.jdField_a_of_type_AndroidUtilSparseBooleanArray.keyAt(j);
            boolean bool = a.jdField_a_of_type_AndroidUtilSparseBooleanArray.valueAt(j);
            if (m >= k)
            {
              a.jdField_a_of_type_AndroidUtilSparseBooleanArray.delete(m);
              a.jdField_a_of_type_AndroidUtilSparseBooleanArray.put(m + (paramInt2 - k + 1), bool);
            }
            j += 1;
          }
          paramInt1 = 0;
          break;
          if (a.V < 0) {
            break label283;
          }
          a.aF = a(a.V, k, paramInt2, i1, i2);
          break label283;
        }
        if (ListView.a(a) != null)
        {
          i = 0;
          while (i < ListView.a(a).length)
          {
            j = ListView.a(a)[i];
            if (j >= k) {
              ListView.a(a)[i] = (j + (paramInt2 - k + 1));
            }
            i += 1;
          }
        }
        m = ListView.a(a) - ListView.b(a) - a.c.bottom;
        i3 = a.getChildAt(i3 - 1).getBottom();
        if ((a.p() == 1) && (paramInt1 != 0) && (i3 <= m)) {}
        for (i = 1; (k <= i1) && (i == 0) && (i3 >= m); i = 0)
        {
          localObject = a;
          au += n;
          return;
        }
      } while ((k > i2) && (i == 0) && (i3 >= m));
      n = a.c.top;
      if (a.aF >= 0)
      {
        paramInt1 = a.aF;
        j = k - i1;
        if (i == 0) {
          break label932;
        }
        paramInt1 = 0;
        i = m;
        label719:
        if (paramInt2 < k) {
          break label1644;
        }
        if (i >= n) {
          break label809;
        }
        paramInt2 += 1;
      }
    }
    for (;;)
    {
      if (paramInt2 >= 0)
      {
        paramInt1 = 0;
        for (;;)
        {
          if (paramInt1 <= j - 1)
          {
            a.jdField_a_of_type_Uab.a(a.getChildAt(paramInt1), a.au + paramInt1);
            paramInt1 += 1;
            continue;
            if (a.l())
            {
              paramInt1 = a.V;
              break;
            }
            paramInt1 = -1;
            break;
            label809:
            localObject = a.a(paramInt2, a.jdField_a_of_type_ArrayOfBoolean);
            ListView.a(a, (View)localObject, paramInt2, i, false, a.c.left, false, a.jdField_a_of_type_ArrayOfBoolean[0], j);
            m = ((View)localObject).getHeight() + a.aL;
            i -= m;
            paramInt2 -= 1;
            paramInt1 = m + paramInt1;
            break label719;
          }
        }
        ListView.a(a, 0, j);
        a.au = paramInt2;
      }
      for (;;)
      {
        ListView.a(a);
        return;
        a(n, j - 1, paramInt1);
        continue;
        label932:
        if (((paramInt1 < 0) || (paramInt1 >= k)) && ((paramInt1 >= 0) || (a.i))) {
          break label1216;
        }
        i = 0;
        n = -1;
        if (j <= 0) {
          break;
        }
        paramInt1 = a.getChildAt(j - 1).getBottom() + a.aL;
        j = k;
        k = paramInt1;
        for (;;)
        {
          paramInt1 = n;
          if (j <= paramInt2)
          {
            if (k > m) {
              paramInt1 = j - a.au;
            }
          }
          else
          {
            j = a.getChildCount();
            if (paramInt1 < 0) {
              break label1188;
            }
            paramInt2 = paramInt1;
            while (paramInt2 < j)
            {
              a.jdField_a_of_type_Uab.a(a.getChildAt(paramInt2), a.au + paramInt2);
              paramInt2 += 1;
            }
          }
          localObject = a.a(j, a.jdField_a_of_type_ArrayOfBoolean);
          ListView.a(a, (View)localObject, j, k, true, a.c.left, false, a.jdField_a_of_type_ArrayOfBoolean[0], j - a.au);
          paramInt1 = ((View)localObject).getHeight() + a.aL;
          k += paramInt1;
          i += paramInt1;
          j += 1;
        }
        ListView.b(a, paramInt1, j - paramInt1);
        continue;
        label1188:
        a(a.getChildCount(), m, paramInt2 - a.au + 1, i);
      }
      label1216:
      if (m > i3) {
        a.offsetChildrenTopAndBottom(m - i3);
      }
      i = a.getChildAt(j).getTop() - a.aL;
      paramInt1 = 0;
      if (paramInt2 >= k) {
        if (i < n) {
          paramInt2 += 1;
        }
      }
      for (;;)
      {
        if (paramInt2 >= 0)
        {
          paramInt1 = 0;
          for (;;)
          {
            if (paramInt1 <= j - 1)
            {
              a.jdField_a_of_type_Uab.a(a.getChildAt(paramInt1), a.au + paramInt1);
              paramInt1 += 1;
              continue;
              localObject = a.a(paramInt2, a.jdField_a_of_type_ArrayOfBoolean);
              ListView.a(a, (View)localObject, paramInt2, i, false, a.c.left, false, a.jdField_a_of_type_ArrayOfBoolean[0], j);
              m = ((View)localObject).getHeight() + a.aL;
              i -= m;
              paramInt2 -= 1;
              paramInt1 = m + paramInt1;
              break;
            }
          }
          ListView.c(a, 0, j);
          a.au = paramInt2;
          break;
        }
        a(n, j - 1, paramInt1);
        break;
        if (ListView.a(a) == null)
        {
          localObject = new int[paramInt2 - paramInt1 + 1];
          j = 0;
          i = paramInt1;
          paramInt1 = j;
          while (i <= paramInt2)
          {
            localObject[paramInt1] = i;
            i += 1;
            paramInt1 += 1;
          }
          ListView.a(a, (int[])localObject);
        }
        for (;;)
        {
          onChanged();
          return;
          localObject = new HashSet();
          while (paramInt1 <= paramInt2)
          {
            ((HashSet)localObject).add(Integer.valueOf(paramInt1));
            paramInt1 += 1;
          }
          int[] arrayOfInt = ListView.a(a);
          paramInt2 = arrayOfInt.length;
          paramInt1 = 0;
          while (paramInt1 < paramInt2)
          {
            ((HashSet)localObject).add(Integer.valueOf(arrayOfInt[paramInt1]));
            paramInt1 += 1;
          }
          arrayOfInt = new int[((HashSet)localObject).size()];
          localObject = ((HashSet)localObject).iterator();
          paramInt1 = 0;
          while (((Iterator)localObject).hasNext())
          {
            arrayOfInt[paramInt1] = ((Integer)((Iterator)localObject).next()).intValue();
            paramInt1 += 1;
          }
          ListView.a(a, arrayOfInt);
        }
        paramInt2 = -1;
      }
      label1644:
      paramInt2 = -1;
    }
  }
  
  public void a(int... paramVarArgs)
  {
    onChanged();
  }
  
  public void b(int paramInt1, int paramInt2)
  {
    System.nanoTime();
    if (paramInt2 < paramInt1) {
      throw new IllegalArgumentException("lastRow must more than firstRow!");
    }
    if ((paramInt1 < 0) || (paramInt2 >= a.aG - a.m() - a.n())) {
      throw new IllegalArgumentException("row index out of bound");
    }
    if ((a.p) || (a.r)) {
      onChanged();
    }
    int n;
    int i2;
    int i1;
    int i3;
    boolean bool1;
    int m;
    int k;
    int j;
    int i;
    label469:
    label483:
    label548:
    label636:
    label638:
    Object localObject;
    label702:
    label711:
    label749:
    do
    {
      int i4;
      do
      {
        return;
        n = paramInt1 + a.m();
        i2 = paramInt2 + a.m();
        paramInt1 = i2 - n + 1;
        i4 = a.getChildCount();
        i1 = a.au;
        i3 = a.au + i4 - 1;
        if (a.jdField_a_of_type_ComTencentWidgetFastScroller != null) {
          a.jdField_a_of_type_ComTencentWidgetFastScroller.a(a.aG, a.aG - paramInt1);
        }
        a.aG -= paramInt1;
        if (a.aF >= 0)
        {
          paramInt1 = b(a.aF, n, i2, i1, i3);
          a.h(paramInt1);
          a.i(paramInt1);
          if (a.ab >= 0) {
            a.ab = b(a.ab, n, i2, i1, i3);
          }
          if (a.jdField_a_of_type_AndroidUtilSparseBooleanArray != null) {
            break label469;
          }
        }
        for (paramInt2 = 0;; paramInt2 = a.jdField_a_of_type_AndroidUtilSparseBooleanArray.size())
        {
          if (paramInt2 <= 0) {
            break label483;
          }
          paramInt1 = 0;
          while (paramInt1 < paramInt2)
          {
            int i5 = a.jdField_a_of_type_AndroidUtilSparseBooleanArray.keyAt(paramInt1);
            bool1 = a.jdField_a_of_type_AndroidUtilSparseBooleanArray.valueAt(paramInt1);
            m = paramInt1;
            k = paramInt2;
            if (i5 >= n)
            {
              a.jdField_a_of_type_AndroidUtilSparseBooleanArray.delete(i5);
              j = paramInt1;
              i = paramInt2;
              if (i5 <= i2)
              {
                j = paramInt1 - 1;
                i = paramInt2 - 1;
              }
              m = j;
              k = i;
              if (i5 > i2)
              {
                a.jdField_a_of_type_AndroidUtilSparseBooleanArray.put(i5 - (i2 - n + 1), bool1);
                k = i;
                m = j;
              }
            }
            paramInt1 = m + 1;
            paramInt2 = k;
          }
          if (a.V < 0) {
            break;
          }
          a.aF = b(a.V, n, i2, i1, i3);
          break;
        }
        if (ListView.a(a) != null)
        {
          paramInt1 = 0;
          if (paramInt1 < ListView.a(a).length)
          {
            paramInt2 = ListView.a(a)[paramInt1];
            if (paramInt2 >= n)
            {
              if (paramInt2 > i2) {
                break label548;
              }
              paramInt2 = -1;
            }
            for (;;)
            {
              ListView.a(a)[paramInt1] = paramInt2;
              paramInt1 += 1;
              break;
              paramInt2 -= i2 - n + 1;
            }
          }
        }
      } while ((i2 < i1) || (n > i3));
      m = a.c.top;
      k = ListView.c(a) - ListView.d(a) - a.c.bottom;
      if (n < i1)
      {
        paramInt1 = 0;
        if (i2 <= i3) {
          break label702;
        }
        paramInt2 = i4 - 1;
        i = 0;
        if (i >= i4) {
          break label749;
        }
        localObject = a.getChildAt(i);
        if ((i < paramInt1) || (i > paramInt2)) {
          break label711;
        }
        a.jdField_a_of_type_Uab.a((View)localObject, i);
        ((View)localObject).setTag(2131230829, null);
      }
      for (;;)
      {
        i += 1;
        break label638;
        paramInt1 = n - i1;
        break;
        paramInt2 = i2 - i1;
        break label636;
        if (ListView.a(a)) {
          ((View)localObject).setTag(2131230829, new Point(((View)localObject).getTop(), ((View)localObject).getBottom()));
        }
      }
      ListView.d(a, paramInt1, paramInt2 - paramInt1 + 1);
    } while (a.aG == 0);
    paramInt2 = a.getChildCount();
    boolean bool2 = a.l();
    if (a.aF >= 0)
    {
      j = a.aF;
      if (QLog.isColorLevel()) {
        QLog.d("XListView", 2, "first is:" + n + ",last is:" + i2 + ",firstPosition is:" + i1 + ",lastPosition is:" + i3 + ",newSelectionPosition is:" + j + ",mStackFromBottom is:" + a.i);
      }
      if ((n > i1) || (i2 < i3)) {
        break label1165;
      }
      if (a.i) {
        break label1130;
      }
      paramInt1 = n;
      if (n > a.aG - 1) {
        paramInt1 = a.aG - 1;
      }
      ListView.a(a, paramInt1, m);
      bool1 = true;
      paramInt1 = -1;
      i = 0;
      paramInt2 = 0;
    }
    for (;;)
    {
      k = a.getChildCount();
      if ((j >= 0) && (j < k) && (bool2)) {
        a.a(j, a.getChildAt(j - a.au));
      }
      if (QLog.isColorLevel()) {
        QLog.d("XListView", 2, "upItemsMaxIndex is:" + paramInt1 + ",upItemsMoveDistance is:" + paramInt2 + ",downItemsMoveDistance is:" + i);
      }
      if (ListView.a(a)) {
        a(k, paramInt1, paramInt2, i, bool1);
      }
      a.invalidate();
      return;
      if (bool2)
      {
        j = a.V;
        break;
      }
      j = -1;
      break;
      label1130:
      localObject = a;
      if (n - 1 < 0) {}
      for (paramInt1 = 0;; paramInt1 = n - 1)
      {
        ListView.b((ListView)localObject, paramInt1, k);
        break;
      }
      label1165:
      if (n <= i1)
      {
        if ((a.i) || (j >= 0))
        {
          a.au = n;
          localObject = a.getChildAt(paramInt1);
          paramInt2 = ((View)localObject).getTop();
          a.c(false);
          ListView.a(a);
          paramInt1 = ((View)localObject).getTop();
          i = paramInt2 - paramInt1;
          if (paramInt1 - a.aL > 0) {}
          for (paramInt1 = -paramInt1 + a.aL;; paramInt1 = 0)
          {
            k = a.indexOfChild((View)localObject) - 1;
            paramInt2 = paramInt1;
            bool1 = false;
            paramInt1 = k;
            break;
          }
        }
        localObject = a.getChildAt(0);
        paramInt2 = ((View)localObject).getTop();
        a.offsetChildrenTopAndBottom(m - ((View)localObject).getTop());
        a.au = n;
        a.c(true);
        ListView.a(a);
        if (((View)localObject).getTop() - a.aL > 0) {}
        for (paramInt1 = -((View)localObject).getTop() + a.aL;; paramInt1 = 0)
        {
          i = paramInt2 - ((View)localObject).getTop();
          k = a.indexOfChild((View)localObject);
          paramInt2 = paramInt1;
          bool1 = false;
          paramInt1 = k;
          break;
        }
      }
      if (i2 >= i3)
      {
        if ((!a.i) || (j >= 0))
        {
          localObject = a.getChildAt(paramInt2 - 1);
          paramInt2 = ((View)localObject).getBottom();
          a.c(true);
          ListView.a(a);
          paramInt1 = ((View)localObject).getBottom();
          paramInt2 -= paramInt1;
          if (k - paramInt1 - a.aL > 0) {}
          for (paramInt1 = k - paramInt1 - a.aL;; paramInt1 = 0)
          {
            k = a.indexOfChild((View)localObject);
            i = paramInt1;
            bool1 = false;
            paramInt1 = k;
            break;
          }
        }
        localObject = a.getChildAt(paramInt2 - 1);
        paramInt2 = ((View)localObject).getTop();
        a.offsetChildrenTopAndBottom(k - ((View)localObject).getBottom());
        a.c(false);
        ListView.a(a);
        if (k - ((View)localObject).getBottom() - a.aL > 0) {}
        for (paramInt1 = k - ((View)localObject).getBottom() - a.aL;; paramInt1 = 0)
        {
          paramInt2 -= ((View)localObject).getTop();
          k = a.indexOfChild((View)localObject);
          i = paramInt1;
          bool1 = false;
          paramInt1 = k;
          break;
        }
      }
      View localView;
      if (((j >= 0) && (j < n)) || ((j < 0) && (!a.i)))
      {
        localObject = a.getChildAt(paramInt1 - 1);
        k = ((View)localObject).getTop();
        localView = a.getChildAt(paramInt1);
        i = localView.getTop();
        m = localView.getTop();
        i2 = ((View)localObject).getBottom();
        paramInt1 = n - i1;
        while (paramInt1 < paramInt2)
        {
          a.getChildAt(paramInt1).offsetTopAndBottom(-(m - i2) + a.aL);
          paramInt1 += 1;
        }
        a.c(true);
        ListView.a(a);
        m = localView.getTop();
        paramInt2 = k - ((View)localObject).getTop();
        paramInt1 = a.indexOfChild((View)localObject);
        i -= m;
        bool1 = false;
      }
      else if ((j >= n) || ((j < 0) && (a.i)))
      {
        localObject = a.getChildAt(paramInt1 - 1);
        paramInt2 = ((View)localObject).getTop();
        localView = a.getChildAt(paramInt1);
        i = localView.getTop();
        k = localView.getTop();
        m = a.getChildAt(paramInt1 - 1).getBottom();
        paramInt1 = 0;
        while (paramInt1 < n - i1)
        {
          a.getChildAt(paramInt1).offsetTopAndBottom(k - m - a.aL);
          paramInt1 += 1;
        }
        a.c(false);
        ListView.a(a);
        k = localView.getTop();
        paramInt2 -= ((View)localObject).getTop();
        paramInt1 = a.indexOfChild((View)localObject);
        i -= k;
        bool1 = false;
      }
      else
      {
        paramInt1 = -1;
        i = 0;
        paramInt2 = 0;
        bool1 = false;
      }
    }
  }
  
  public void c(int paramInt1, int paramInt2)
  {
    if (paramInt2 < paramInt1) {
      throw new IllegalArgumentException("lastRow must more than firstRow!");
    }
    if ((paramInt1 < a.m()) || (paramInt2 >= a.aG - a.m() - a.n())) {
      throw new IllegalArgumentException("row index out of bound. insert range: " + paramInt1 + "~" + paramInt2 + ". valid range: " + a.m() + "~" + (a.aG - a.m() - a.n()));
    }
    if ((a.p) || (a.r)) {
      onChanged();
    }
    int n;
    int i1;
    int j;
    int i;
    do
    {
      do
      {
        return;
      } while (a.aG == 0);
      n = paramInt1 + a.m();
      i1 = paramInt2 + a.m();
      j = a.getChildCount();
      paramInt1 = a.au;
      i = a.au + j - 1;
    } while ((i1 < paramInt1) || (n > i));
    int k = a.c.top;
    int m = ListView.e(a) - ListView.f(a) - a.c.bottom;
    if (n < paramInt1)
    {
      paramInt2 = 0;
      if (i1 <= i) {
        break label392;
      }
      i = j - 1;
      label297:
      if (a.aF < 0) {
        break label400;
      }
      paramInt1 = a.aF;
      label315:
      if (((paramInt1 < 0) || (paramInt1 > n)) && ((paramInt1 >= 0) || (a.i))) {
        break label426;
      }
      paramInt1 = a(j, m, paramInt2, i);
      ListView.a(a, a.getChildCount());
      a(j, m, i + 1, paramInt1);
    }
    for (;;)
    {
      ListView.a(a);
      return;
      paramInt2 = n - paramInt1;
      break;
      label392:
      i = i1 - paramInt1;
      break label297;
      label400:
      if (a.l())
      {
        paramInt1 = a.V;
        break label315;
      }
      paramInt1 = -1;
      break label315;
      label426:
      if ((paramInt1 >= i1) || ((paramInt1 < 0) && (a.i)))
      {
        paramInt1 = a(k, paramInt2, i);
        ListView.b(a, a.getChildCount());
        a(k, paramInt2 - 1, paramInt1);
      }
      else
      {
        paramInt1 -= a.au;
        a(j, m, i + 1, a(j, m, paramInt1, i));
        a(k, paramInt2 - 1, a(k, paramInt2, paramInt1 - 1));
      }
    }
  }
}
