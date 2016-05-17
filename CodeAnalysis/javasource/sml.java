import android.content.DialogInterface.OnClickListener;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.QQCustomDialog;

public class sml
  implements CompoundButton.OnCheckedChangeListener
{
  public sml(QQCustomDialog paramQQCustomDialog, DialogInterface.OnClickListener paramOnClickListener)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onCheckedChanged(CompoundButton paramCompoundButton, boolean paramBoolean)
  {
    QQCustomDialog localQQCustomDialog;
    if (jdField_a_of_type_AndroidContentDialogInterface$OnClickListener != null)
    {
      paramCompoundButton = jdField_a_of_type_AndroidContentDialogInterface$OnClickListener;
      localQQCustomDialog = jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog;
      if (!paramBoolean) {
        break label34;
      }
    }
    label34:
    for (int i = 1;; i = 0)
    {
      paramCompoundButton.onClick(localQQCustomDialog, i);
      return;
    }
  }
}
