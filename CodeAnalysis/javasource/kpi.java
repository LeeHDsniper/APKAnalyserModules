import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.mobileqq.activity.aio.AIOInputTypeHelper;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class kpi
  implements Runnable
{
  public kpi(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    AIOInputTypeHelper.a(a).edit().putBoolean("ptt_guide_have_show", false).commit();
  }
}
