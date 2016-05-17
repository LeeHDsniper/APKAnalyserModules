import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

class lim
  implements DialogInterface.OnClickListener
{
  lim(lik paramLik, SharedPreferences paramSharedPreferences)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    paramDialogInterface = jdField_a_of_type_AndroidContentSharedPreferences.edit();
    paramDialogInterface.putLong("switch_city" + jdField_a_of_type_Lik.a.a.a(), System.currentTimeMillis());
    paramDialogInterface.commit();
  }
}
