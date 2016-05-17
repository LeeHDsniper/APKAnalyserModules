import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.mobileqq.activity.aio.tips.LightalkBlueTipsBar;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lna
  implements Runnable
{
  public lna(LightalkBlueTipsBar paramLightalkBlueTipsBar)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Object localObject = LightalkBlueTipsBar.a(a).getPreferences();
    if (((SharedPreferences)localObject).getInt("LT_tip_show_times" + LightalkBlueTipsBar.a(a).a(), 5) != 5)
    {
      localObject = ((SharedPreferences)localObject).edit();
      ((SharedPreferences.Editor)localObject).putInt("LT_tip_show_times" + LightalkBlueTipsBar.a(a).a(), 5);
      ((SharedPreferences.Editor)localObject).commit();
    }
  }
}
