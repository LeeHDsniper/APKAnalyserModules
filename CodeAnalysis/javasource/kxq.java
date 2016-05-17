import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.device.datadef.DeviceInfo;
import com.tencent.device.devicemgr.SmartDeviceProxyMgr;
import com.tencent.device.utils.SmartDeviceReport;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.item.GrayTipsItemBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.open.base.ToastUtil;

class kxq
  implements DialogInterface.OnClickListener
{
  kxq(kxo paramKxo)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    if (!NetworkUtil.g(a.a.jdField_a_of_type_AndroidContentContext)) {
      ToastUtil.a().a(2131362345);
    }
    do
    {
      return;
      paramDialogInterface = (SmartDeviceProxyMgr)a.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51);
      paramDialogInterface.a(Long.parseLong(a.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a), 0, 1, 0);
      paramDialogInterface = paramDialogInterface.a(Long.parseLong(a.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a));
    } while (paramDialogInterface == null);
    SmartDeviceReport.a(a.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, Long.parseLong(a.a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a), "Usr_AIO_Menu", 5, 0, productId);
  }
}
