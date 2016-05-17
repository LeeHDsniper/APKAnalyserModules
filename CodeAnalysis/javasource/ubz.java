import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.ListView;

public class ubz
  implements Runnable
{
  private int jdField_a_of_type_Int;
  private int b;
  
  private ubz(ListView paramListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ubz a(int paramInt1, int paramInt2)
  {
    jdField_a_of_type_Int = paramInt1;
    b = paramInt2;
    return this;
  }
  
  public void run()
  {
    jdField_a_of_type_ComTencentWidgetListView.setSelectionFromTop(jdField_a_of_type_Int, b);
  }
}
