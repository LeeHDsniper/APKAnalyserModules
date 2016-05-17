import android.view.View;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

class mld
  implements Runnable
{
  mld(mlc paramMlc, View paramView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_AndroidViewView.sendAccessibilityEvent(8);
  }
}
