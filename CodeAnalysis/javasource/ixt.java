import android.content.res.Resources;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.device.datadef.DeviceInfo;
import com.tencent.mobileqq.activity.ForwardRecentActivity;
import com.tencent.mobileqq.forward.ForwardAbility.ForwardAbilityType;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQToast;

public class ixt
  implements View.OnClickListener
{
  public ixt(ForwardRecentActivity paramForwardRecentActivity, Resources paramResources, DeviceInfo paramDeviceInfo, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (!NetworkUtil.g(jdField_a_of_type_ComTencentMobileqqActivityForwardRecentActivity))
    {
      QQToast.a(jdField_a_of_type_ComTencentMobileqqActivityForwardRecentActivity, "目前没有网络，请稍后再试!", 1000).b(jdField_a_of_type_AndroidContentResResources.getDimensionPixelSize(2131492908));
      return;
    }
    paramView = new Bundle();
    paramView.putString("uin", String.valueOf(jdField_a_of_type_ComTencentDeviceDatadefDeviceInfo.din));
    paramView.putInt("uintype", 9501);
    paramView.putString("uinname", jdField_a_of_type_JavaLangString);
    jdField_a_of_type_ComTencentMobileqqActivityForwardRecentActivity.a.a(ForwardAbility.ForwardAbilityType.k.intValue(), paramView);
  }
}
