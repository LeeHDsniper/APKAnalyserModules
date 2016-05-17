import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import com.tencent.mobileqq.app.DeviceProfileManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.HashMap;

public class mvx
  extends BroadcastReceiver
{
  public mvx(DeviceProfileManager paramDeviceProfileManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    if (QLog.isDevelopLevel()) {
      QLog.e(DeviceProfileManager.a, 4, "onReceive");
    }
    if (paramIntent == null) {}
    do
    {
      for (;;)
      {
        return;
        try
        {
          paramContext = paramIntent.getExtras();
          if (paramContext != null)
          {
            DeviceProfileManager.a(a, (HashMap)paramContext.getSerializable("featureMapLV2"));
            if (DeviceProfileManager.a() != null)
            {
              aa = ((HashMap)paramContext.getSerializable("featureAccountMapLV2"));
              return;
            }
          }
        }
        catch (Exception paramContext) {}
      }
    } while (!QLog.isDevelopLevel());
    paramContext.printStackTrace();
  }
}
