import com.tencent.mobileqq.activity.contact.addcontact.PublicView;
import com.tencent.mobileqq.app.soso.SosoInterface.OnLocationListener;
import com.tencent.mobileqq.app.soso.SosoInterface.SosoLbsInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class lqj
  extends SosoInterface.OnLocationListener
{
  public lqj(PublicView paramPublicView, int paramInt, boolean paramBoolean1, boolean paramBoolean2, long paramLong, boolean paramBoolean3, boolean paramBoolean4, String paramString)
  {
    super(paramInt, paramBoolean1, paramBoolean2, paramLong, paramBoolean3, paramBoolean4, paramString);
    paramBoolean1 = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt, SosoInterface.SosoLbsInfo paramSosoLbsInfo)
  {
    if (QLog.isColorLevel()) {
      QLog.d("PublicView", 2, "onLocationFinish() errCode=" + paramInt);
    }
    PublicView.a(a, true);
    PublicView.a(a, paramSosoLbsInfo);
  }
}
