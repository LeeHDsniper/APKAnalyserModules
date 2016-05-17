import android.content.Context;
import android.view.OrientationEventListener;
import com.tencent.mobileqq.activity.richmedia.FlowCameraActivity2;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mit
  extends OrientationEventListener
{
  public mit(FlowCameraActivity2 paramFlowCameraActivity2, Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onOrientationChanged(int paramInt)
  {
    a.k = paramInt;
  }
}
