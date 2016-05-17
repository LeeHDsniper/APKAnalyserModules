import android.view.View;
import com.tencent.device.msg.data.DeviceGroupChatMsgProcessor;
import com.tencent.device.msg.data.DeviceMsgHandle;
import com.tencent.mobileqq.activity.aio.item.DevicePicItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageForDeviceFile;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

public class kvi
  implements ActionSheet.OnButtonClickListener
{
  public kvi(DevicePicItemBuilder paramDevicePicItemBuilder, MessageForDeviceFile paramMessageForDeviceFile, ActionSheet paramActionSheet)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    if ("device_groupchat".equals(jdField_a_of_type_ComTencentMobileqqDataMessageForDeviceFile.extStr)) {
      ((DeviceMsgHandle)jdField_a_of_type_ComTencentMobileqqActivityAioItemDevicePicItemBuilder.a.a(49)).a().a(jdField_a_of_type_ComTencentMobileqqDataMessageForDeviceFile);
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioItemDevicePicItemBuilder.a();
      jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
      return;
      jdField_a_of_type_ComTencentMobileqqActivityAioItemDevicePicItemBuilder.b(jdField_a_of_type_ComTencentMobileqqDataMessageForDeviceFile);
    }
  }
}
