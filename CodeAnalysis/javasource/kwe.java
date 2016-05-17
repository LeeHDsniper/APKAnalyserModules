import android.app.Activity;
import android.content.Intent;
import android.view.View;
import com.tencent.device.devicemgr.SmartDeviceProxyMgr;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.GrayTipsItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil.TipsClickedInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import cooperation.smartdevice.SmartDevicePluginLoader;
import cooperation.smartdevice.SmartDevicePluginProxyActivity;

public class kwe
  implements FileManagerUtil.TipsClickedInterface
{
  public kwe(GrayTipsItemBuilder paramGrayTipsItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(View paramView)
  {
    paramView = new Intent();
    paramView.putExtra("device_info", ((SmartDeviceProxyMgr)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51)).a(Long.parseLong(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a)));
    SmartDevicePluginLoader.a().a((Activity)a.jdField_a_of_type_AndroidContentContext, a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), paramView, "com.tencent.device.activities.DeviceUnBindActivity", -1, null, SmartDevicePluginProxyActivity.class);
  }
}
