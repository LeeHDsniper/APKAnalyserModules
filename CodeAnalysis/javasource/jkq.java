import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.mobileqq.activity.NotificationActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.BaseApplication;

public class jkq
  implements Runnable
{
  public jkq(NotificationActivity paramNotificationActivity, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    SharedPreferences localSharedPreferences = BaseApplication.getContext().getSharedPreferences("SecSig", 0);
    SharedPreferences.Editor localEditor = localSharedPreferences.edit();
    int i = localSharedPreferences.getInt("SecResEntry", -1);
    if ((i == -1) || ((i ^ 0x12) != jdField_a_of_type_Int))
    {
      localEditor.putInt("SecResEntry", jdField_a_of_type_Int ^ 0x12);
      localEditor.putLong("SecStampEntry", System.currentTimeMillis() ^ 0x12);
      localEditor.commit();
    }
  }
}
