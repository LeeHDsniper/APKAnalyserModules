import android.app.Activity;
import com.tencent.mobileqq.activity.pendant.AvatarPendantActivity;
import com.tencent.mobileqq.app.UniPayHandler.UniPayUpdateListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lwy
  extends UniPayHandler.UniPayUpdateListener
{
  public lwy(AvatarPendantActivity paramAvatarPendantActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void update()
  {
    a.runOnUiThread(new lwz(this));
  }
}
