import android.view.View;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.AbsListView;

public class tzo
  implements Runnable
{
  public tzo(AbsListView paramAbsListView, View paramView, tzz paramTzz)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_ComTencentWidgetAbsListView.ag = -1;
    jdField_a_of_type_AndroidViewView.setPressed(false);
    jdField_a_of_type_ComTencentWidgetAbsListView.setPressed(false);
    if (!jdField_a_of_type_ComTencentWidgetAbsListView.r) {
      jdField_a_of_type_Tzz.run();
    }
    AbsListView.a(jdField_a_of_type_ComTencentWidgetAbsListView, null);
  }
}
