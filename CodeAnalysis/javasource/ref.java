import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.preference.PreferenceManager;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.qphone.base.util.QLog;

public final class ref
  implements Runnable
{
  public ref() {}
  
  public void run()
  {
    try
    {
      Object localObject = PreferenceManager.getDefaultSharedPreferences(BaseApplicationImpl.a);
      int i = ((SharedPreferences)localObject).getInt("dynamic_splash_config_show_times", -1);
      if (i <= 0) {
        return;
      }
      i -= 1;
      localObject = ((SharedPreferences)localObject).edit();
      ((SharedPreferences.Editor)localObject).putInt("dynamic_splash_config_show_times", i);
      ((SharedPreferences.Editor)localObject).commit();
      if (QLog.isColorLevel())
      {
        QLog.d("SetSplash", 2, "saveDynamicSplashShowTime() rest totalShowTimes=" + i);
        return;
      }
    }
    catch (Throwable localThrowable)
    {
      QLog.d("SetSplash", 1, "", localThrowable);
    }
  }
}