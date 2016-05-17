import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.device.datadef.DeviceInfo;
import com.tencent.device.devicemgr.SmartDeviceProxyMgr;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.DeviceMsgChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lgb
  implements View.OnClickListener
{
  public lgb(DeviceMsgChatPie paramDeviceMsgChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = (SmartDeviceProxyMgr)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
    DeviceInfo localDeviceInfo = paramView.a(Long.parseLong(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a));
    if (a.jdField_a_of_type_JavaLangBoolean.booleanValue())
    {
      if (DeviceMsgChatPie.a(a)) {
        paramView.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, localDeviceInfo, false);
      }
      a.v();
      return;
    }
    paramView.a(a.jdField_a_of_type_AndroidSupportV4AppFragmentActivity, localDeviceInfo, false);
  }
}
