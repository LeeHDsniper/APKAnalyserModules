import NearbyGroup.LBSInfo;
import Wallet.AdvRequest;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.QWalletAuthHandler;
import com.tencent.mobileqq.app.soso.SosoInterface;
import com.tencent.mobileqq.app.soso.SosoInterface.OnLocationListener;
import com.tencent.mobileqq.app.soso.SosoInterface.SosoLbsInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import com.tencent.qphone.base.util.BaseApplication;
import mqq.util.WeakReference;

class mdd
  extends SosoInterface.OnLocationListener
{
  mdd(mdc paramMdc, int paramInt, boolean paramBoolean1, boolean paramBoolean2, long paramLong, boolean paramBoolean3, boolean paramBoolean4, String paramString)
  {
    super(paramInt, paramBoolean1, paramBoolean2, paramLong, paramBoolean3, paramBoolean4, paramString);
    paramBoolean1 = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt, SosoInterface.SosoLbsInfo paramSosoLbsInfo)
  {
    if (a.a.get() == null) {
      return;
    }
    Object localObject = new LBSInfo();
    if (paramInt != 0) {
      localObject = SosoInterface.a(g, paramSosoLbsInfo);
    }
    paramSosoLbsInfo = (SosoInterface.SosoLbsInfo)localObject;
    if (localObject == null) {
      paramSosoLbsInfo = new LBSInfo();
    }
    localObject = new AdvRequest();
    id = 1L;
    lbsInfo = paramSosoLbsInfo;
    version = DeviceInfoUtil.a(BaseApplication.getContext());
    platform = 1L;
    uin = ((QQAppInterface)a.a.get()).a();
    ((QWalletAuthHandler)((QQAppInterface)a.a.get()).a(42)).a((AdvRequest)localObject);
  }
}
