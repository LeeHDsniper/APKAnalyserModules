import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.view.KeyEvent;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.QQProgressDialog;

public class svs
  implements DialogInterface.OnKeyListener
{
  public svs(QQProgressDialog paramQQProgressDialog, boolean paramBoolean)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean onKey(DialogInterface paramDialogInterface, int paramInt, KeyEvent paramKeyEvent)
  {
    if ((paramInt == 84) || (paramInt == 4)) {
      return jdField_a_of_type_Boolean;
    }
    return false;
  }
}
