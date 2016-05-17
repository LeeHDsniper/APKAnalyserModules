import android.app.Activity;
import android.content.Intent;
import android.view.View;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.GrayTipsItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil.TipsClickedInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import cooperation.smartdevice.SmartDevicePluginLoader;
import cooperation.smartdevice.SmartDevicePluginProxyActivity;

public class kxr
  implements FileManagerUtil.TipsClickedInterface
{
  public kxr(GrayTipsItemBuilder paramGrayTipsItemBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(View paramView)
  {
    paramView = new Intent();
    paramView.putExtra("uin", a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a);
    paramView.putExtra("uinname", a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.d);
    SmartDevicePluginLoader.a().a((Activity)a.jdField_a_of_type_AndroidContentContext, a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), paramView, "com.tencent.device.activities.DeviceGroupChatConfirmActivity", -1, null, SmartDevicePluginProxyActivity.class);
  }
}
