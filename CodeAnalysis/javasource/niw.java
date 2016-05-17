import com.tencent.biz.TroopMemberLbs.TroopMemberLbsHelper;
import com.tencent.mobileqq.app.BizTroopObserver;
import com.tencent.mobileqq.app.lbs.LbsInfoMgr;
import com.tencent.mobileqq.app.lbs.LbsInfoMgr.LocationInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class niw
  extends BizTroopObserver
{
  public niw(LbsInfoMgr paramLbsInfoMgr)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, long paramLong1, long paramLong2)
  {
    double d;
    if (paramBoolean)
    {
      d = TroopMemberLbsHelper.a(paramLong1, paramLong2, aa).b, aa).a);
      if ((d > 500.0D) || (a.a >= 3600000)) {
        break label182;
      }
      LbsInfoMgr localLbsInfoMgr = a;
      a *= 2;
    }
    for (;;)
    {
      aa).b = paramLong1;
      aa).a = paramLong2;
      TroopMemberLbsHelper.b(LbsInfoMgr.a(a));
      if (QLog.isColorLevel()) {
        QLog.i("LbsInfoMgr", 2, "获得经纬度: latitude: " + aa).b + " longitude: " + aa).a + " next interval = " + a.a);
      }
      return;
      label182:
      if (d > 500.0D) {
        a.a = 900000;
      }
    }
  }
}
