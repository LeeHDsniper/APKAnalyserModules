import android.os.Bundle;
import android.os.Message;
import com.tencent.mobileqq.activity.contact.troop.BaseTroopView.ITroopContext;
import com.tencent.mobileqq.activity.contact.troop.RecommendTroopView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.util.MqqWeakReferenceHandler;
import mqq.observer.BusinessObserver;
import tencent.im.nearbygroup.ext.NearbyGroupExt.RspBody;

class ltn
  implements BusinessObserver
{
  ltn(ltm paramLtm)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(int paramInt, boolean paramBoolean, Bundle paramBundle)
  {
    Object localObject;
    if (paramBoolean)
    {
      paramBundle = paramBundle.getByteArray("data");
      if (paramBundle != null) {
        localObject = new NearbyGroupExt.RspBody();
      }
    }
    try
    {
      ((NearbyGroupExt.RspBody)localObject).mergeFrom(paramBundle);
      paramBundle = "";
      paramInt = 0;
      if (str_wording.has()) {
        paramBundle = str_wording.get();
      }
      if (uint32_total_num.has()) {
        paramInt = uint32_total_num.get();
      }
      localObject = a.a.a.a().obtainMessage();
      what = 106;
      obj = paramBundle;
      arg1 = paramInt;
      a.a.a.a().sendMessage((Message)localObject);
      return;
    }
    catch (Exception paramBundle) {}
  }
}
