import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class mol
  implements DialogInterface.OnClickListener
{
  public mol(boolean paramBoolean, Context paramContext)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    if (!jdField_a_of_type_Boolean) {
      ((Activity)jdField_a_of_type_AndroidContentContext).finish();
    }
  }
}
