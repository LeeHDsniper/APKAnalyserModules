import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.AbsListView;
import com.tencent.widget.FastScroller;

public class ubd
  implements Runnable
{
  public ubd(FastScroller paramFastScroller)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    int k;
    int j;
    int i;
    if (a.jdField_a_of_type_ComTencentWidgetAbsListView.n)
    {
      a.f();
      k = a.jdField_a_of_type_ComTencentWidgetAbsListView.getHeight();
      j = (int)a.jdField_a_of_type_Float - a.jdField_a_of_type_Int + 10;
      if (j >= 0) {
        break label100;
      }
      i = 0;
    }
    for (;;)
    {
      a.c = i;
      a.a(a.c / (k - a.jdField_a_of_type_Int));
      a.b = false;
      return;
      label100:
      i = j;
      if (a.jdField_a_of_type_Int + j > k) {
        i = k - a.jdField_a_of_type_Int;
      }
    }
  }
}
