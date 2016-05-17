import android.content.DialogInterface.OnClickListener;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.biz.widgets.ShareResultDialog;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class hca
  implements View.OnClickListener
{
  public hca(ShareResultDialog paramShareResultDialog, DialogInterface.OnClickListener paramOnClickListener)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (jdField_a_of_type_AndroidContentDialogInterface$OnClickListener != null) {
      jdField_a_of_type_AndroidContentDialogInterface$OnClickListener.onClick(jdField_a_of_type_ComTencentBizWidgetsShareResultDialog, -2);
    }
    jdField_a_of_type_ComTencentBizWidgetsShareResultDialog.dismiss();
  }
}
