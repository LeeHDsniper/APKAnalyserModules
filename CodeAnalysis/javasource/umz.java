import android.content.Context;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pluginsdk.OnPluginInstallListener;
import com.tencent.mobileqq.pluginsdk.PluginManagerHelper;

public final class umz
  extends Thread
{
  public umz(Context paramContext, OnPluginInstallListener paramOnPluginInstallListener)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    PluginManagerHelper.getPluginInterface(jdField_a_of_type_AndroidContentContext, new una(this));
  }
}
