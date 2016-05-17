import android.app.Activity;
import android.app.KeyguardManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lcx
  extends BroadcastReceiver
{
  Activity jdField_a_of_type_AndroidAppActivity;
  boolean jdField_a_of_type_Boolean;
  
  public lcx(Activity paramActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = true;
    jdField_a_of_type_AndroidAppActivity = paramActivity;
  }
  
  public boolean a(Context paramContext)
  {
    return ((KeyguardManager)paramContext.getSystemService("keyguard")).inKeyguardRestrictedInputMode();
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    boolean bool = true;
    paramIntent = paramIntent.getAction();
    if ("android.intent.action.SCREEN_ON".equals(paramIntent)) {
      if (!a(paramContext)) {
        jdField_a_of_type_Boolean = bool;
      }
    }
    for (;;)
    {
      if (!jdField_a_of_type_Boolean)
      {
        jdField_a_of_type_AndroidAppActivity.unregisterReceiver(this);
        jdField_a_of_type_AndroidAppActivity.finish();
      }
      return;
      bool = false;
      break;
      if ("android.intent.action.SCREEN_OFF".equals(paramIntent)) {
        jdField_a_of_type_Boolean = false;
      } else if ("android.intent.action.USER_PRESENT".equals(paramIntent)) {
        jdField_a_of_type_Boolean = true;
      }
    }
  }
}
