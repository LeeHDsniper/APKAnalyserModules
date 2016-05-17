import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.mobileqq.activity.aio.tips.LightalkBlueTipsBar;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class lmz
  implements Runnable
{
  public lmz(LightalkBlueTipsBar paramLightalkBlueTipsBar)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Object localObject = LightalkBlueTipsBar.a(a).getPreferences();
    int i = ((SharedPreferences)localObject).getInt("LT_tip_show_times" + LightalkBlueTipsBar.a(a).a(), 0);
    localObject = ((SharedPreferences)localObject).edit();
    ((SharedPreferences.Editor)localObject).putInt("LT_tip_show_times" + LightalkBlueTipsBar.a(a).a(), i + 1);
    ((SharedPreferences.Editor)localObject).commit();
    if (QLog.isColorLevel()) {
      QLog.d("LightalkBlueTipsBar", 2, "onAIOEvent() : commit =====> tipsum = " + (i + 1));
    }
  }
}
