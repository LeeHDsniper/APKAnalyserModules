import android.app.Dialog;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

class lhk
  implements View.OnClickListener
{
  lhk(lhj paramLhj, Dialog paramDialog)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if ((jdField_a_of_type_AndroidAppDialog != null) && (jdField_a_of_type_AndroidAppDialog.isShowing())) {
      jdField_a_of_type_AndroidAppDialog.dismiss();
    }
  }
}
