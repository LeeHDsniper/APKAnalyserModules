import android.content.Intent;
import com.tencent.mobileqq.activity.richmedia.FlowCameraActivity2;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.richmedia.CompoundProcessor;
import com.tencent.mobileqq.richmedia.RichmediaClient;
import com.tencent.mobileqq.richmedia.VideoCompoundController;

public class miw
  implements Runnable
{
  public miw(FlowCameraActivity2 paramFlowCameraActivity2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    Object localObject = RichmediaClient.a().a().a(a.b);
    if (localObject != null) {
      ((CompoundProcessor)localObject).a(103);
    }
    for (;;)
    {
      localObject = a.getIntent();
      ((Intent)localObject).putExtra("flow_back", 0);
      a.setResult(1001, (Intent)localObject);
      a.finish();
      return;
      a.a();
    }
  }
}
