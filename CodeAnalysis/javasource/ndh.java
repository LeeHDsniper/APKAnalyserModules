import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.preference.PreferenceManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ndh
  implements Runnable
{
  public ndh(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    SharedPreferences.Editor localEditor = PreferenceManager.getDefaultSharedPreferences(a.a()).edit();
    localEditor.putString("LastScreenShotUri", "");
    localEditor.commit();
    a.p();
  }
}
