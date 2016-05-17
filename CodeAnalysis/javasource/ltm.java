import android.app.Activity;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.telephony.TelephonyManager;
import com.tencent.biz.ProtoServlet;
import com.tencent.mobileqq.activity.contact.troop.BaseTroopView.ITroopContext;
import com.tencent.mobileqq.activity.contact.troop.RecommendTroopView;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.soso.SosoInterface.OnLocationListener;
import com.tencent.mobileqq.app.soso.SosoInterface.SosoLbsInfo;
import com.tencent.mobileqq.app.soso.SosoInterface.SosoLocation;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.MessageMicro;
import com.tencent.mobileqq.pb.PBEnumField;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import mqq.app.NewIntent;
import tencent.im.nearbygroup.ext.NearbyGroupExt.ReqBody;
import tencent.im.troop_search_userinfo.userinfo.AppInfo;
import tencent.im.troop_search_userinfo.userinfo.DevAttr;
import tencent.im.troop_search_userinfo.userinfo.GPS;
import tencent.im.troop_search_userinfo.userinfo.UserInfo;

public class ltm
  extends SosoInterface.OnLocationListener
{
  public ltm(RecommendTroopView paramRecommendTroopView, int paramInt, boolean paramBoolean1, boolean paramBoolean2, long paramLong, boolean paramBoolean3, boolean paramBoolean4, String paramString)
  {
    super(paramInt, paramBoolean1, paramBoolean2, paramLong, paramBoolean3, paramBoolean4, paramString);
    paramBoolean1 = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt, SosoInterface.SosoLbsInfo paramSosoLbsInfo)
  {
    Object localObject1;
    Object localObject2;
    if ((paramInt == 0) && (paramSosoLbsInfo != null))
    {
      a.c = Double.valueOf(a.a * 1000000.0D).intValue();
      a.d = Double.valueOf(a.b * 1000000.0D).intValue();
      paramSosoLbsInfo = new userinfo.UserInfo();
      localObject1 = new userinfo.GPS();
      if (a.c != 0)
      {
        uint32_lat.set(a.c);
        uint32_lon.set(a.d);
        gps.set((MessageMicro)localObject1);
        localObject1 = (TelephonyManager)a.a().getSystemService("phone");
        if (localObject1 != null)
        {
          localObject2 = new userinfo.DevAttr();
          if (((TelephonyManager)localObject1).getSimSerialNumber() != null) {
            str_imei.set(((TelephonyManager)localObject1).getSimSerialNumber());
          }
          if (((TelephonyManager)localObject1).getSubscriberId() != null) {
            str_imsi.set(((TelephonyManager)localObject1).getSubscriberId());
          }
          if (((TelephonyManager)localObject1).getLine1Number() != null) {
            str_phonenum.set(((TelephonyManager)localObject1).getLine1Number());
          }
          attr.set((MessageMicro)localObject2);
        }
        localObject1 = new userinfo.AppInfo();
        plat_type.set(2);
      }
    }
    try
    {
      localObject2 = a.a().getPackageManager().getPackageInfo(a.a().getPackageName(), 0);
      str_app_version.set(versionName);
      app_info.set((MessageMicro)localObject1);
      localObject1 = new NearbyGroupExt.ReqBody();
      user_info.set(paramSosoLbsInfo);
      uint32_type.set(2);
      paramSosoLbsInfo = new NewIntent(a.jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a().getApplicationContext(), ProtoServlet.class);
      paramSosoLbsInfo.putExtra("cmd", "NearbyGroupExt.GetGroupList");
      paramSosoLbsInfo.putExtra("data", ((NearbyGroupExt.ReqBody)localObject1).toByteArray());
      paramSosoLbsInfo.setObserver(new ltn(this));
      a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.startServlet(paramSosoLbsInfo);
      return;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      for (;;)
      {
        localNameNotFoundException.printStackTrace();
      }
    }
  }
}
