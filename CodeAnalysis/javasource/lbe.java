import android.app.Dialog;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

class lbe
  implements Runnable
{
  lbe(lbd paramLbd, Dialog paramDialog)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (jdField_a_of_type_AndroidAppDialog.isShowing()) {
      jdField_a_of_type_AndroidAppDialog.dismiss();
    }
  }
}
