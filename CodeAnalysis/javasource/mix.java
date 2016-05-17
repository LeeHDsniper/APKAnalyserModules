import com.tencent.mobileqq.activity.richmedia.FlowCameraActivity2;
import com.tencent.mobileqq.app.soso.SosoInterface.OnLocationListener;
import com.tencent.mobileqq.app.soso.SosoInterface.SosoLbsInfo;
import com.tencent.mobileqq.app.soso.SosoInterface.SosoLocation;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class mix
  extends SosoInterface.OnLocationListener
{
  public mix(FlowCameraActivity2 paramFlowCameraActivity2, int paramInt, boolean paramBoolean1, boolean paramBoolean2, long paramLong, boolean paramBoolean3, boolean paramBoolean4, String paramString)
  {
    super(paramInt, paramBoolean1, paramBoolean2, paramLong, paramBoolean3, paramBoolean4, paramString);
    paramBoolean1 = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt, SosoInterface.SosoLbsInfo paramSosoLbsInfo)
  {
    if ((paramInt == 0) && (paramSosoLbsInfo != null) && (a != null))
    {
      a.a = a.a;
      a.b = a.b;
      if (QLog.isColorLevel()) {
        QLog.d("FlowCameraActivity", 2, "onLocationUpdate() latitude=" + a.a + " longitude=" + a.b);
      }
      if (FlowCameraActivity2.a(a) != null) {
        FlowCameraActivity2.a(a);
      }
    }
    do
    {
      return;
      a.a = 0.0D;
      a.b = 0.0D;
    } while (!QLog.isColorLevel());
    QLog.d("FlowCameraActivity", 2, "onLocationUpdate() error");
  }
}
