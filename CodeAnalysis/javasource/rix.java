import android.app.Dialog;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.testassister.activity.ShareDumpMemoryActivity;

public class rix
  implements View.OnClickListener
{
  public rix(ShareDumpMemoryActivity paramShareDumpMemoryActivity, Dialog paramDialog)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    jdField_a_of_type_AndroidAppDialog.dismiss();
    jdField_a_of_type_ComTencentMobileqqTestassisterActivityShareDumpMemoryActivity.finish();
  }
}
