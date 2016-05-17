import android.app.Activity;
import android.content.Intent;
import android.os.Parcelable;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.device.datadef.DeviceInfo;
import com.tencent.device.devicemgr.SmartDeviceProxyMgr;
import com.tencent.device.utils.SmartDeviceReport;
import com.tencent.device.utils.SmartDeviceUtil;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.item.DeviceSingleStructBuilder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageForDeviceSingleStruct;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.filemanager.data.ForwardFileInfo;
import com.tencent.mobileqq.filemanager.fileviewer.FileBrowserActivity;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.filemanager.util.FileUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.JumpAction;
import com.tencent.mobileqq.utils.JumpParser;
import com.tencent.open.base.MD5Utils;
import cooperation.smartdevice.SmartDevicePluginLoader;
import cooperation.smartdevice.SmartDevicePluginProxyActivity;
import java.util.ArrayList;

public class kvj
  implements View.OnClickListener
{
  public kvj(DeviceSingleStructBuilder paramDeviceSingleStructBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    MessageForDeviceSingleStruct localMessageForDeviceSingleStruct = (MessageForDeviceSingleStruct)AIOUtils.a(paramView);
    if (localMessageForDeviceSingleStruct == null) {}
    DeviceInfo localDeviceInfo;
    do
    {
      return;
      if ((strMediaFileName.isEmpty()) && (nMediaChannelType == 2) && (!strMediaKey.isEmpty())) {
        strMediaFileName = (MD5Utils.d(strMediaKey) + strMediaKey.substring(strMediaKey.lastIndexOf(".")));
      }
      localDeviceInfo = ((SmartDeviceProxyMgr)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51)).a(Long.parseLong(senderuin));
    } while (localDeviceInfo == null);
    int i;
    if (isAdmin == 1)
    {
      i = 1;
      if (TextUtils.isEmpty(url)) {
        break label382;
      }
      if ((!url.startsWith("http://")) && (!url.startsWith("https://"))) {
        break label303;
      }
      paramView = new Intent();
      paramView.putExtra("url", url);
      paramView.putExtra("isFromMsg", true);
      paramView.putExtra("device_info", localDeviceInfo);
      SmartDevicePluginLoader.a().a((Activity)a.jdField_a_of_type_AndroidContentContext, a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), paramView, "com.tencent.device.activities.DeviceSquareActivity", -1, null, SmartDevicePluginProxyActivity.class);
    }
    for (;;)
    {
      i = 3;
      if (nDataType == 2) {
        i = 4;
      }
      long l = Long.parseLong(senderuin);
      int j = productId;
      SmartDeviceReport.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, l, "Usr_AIO_ReceiveMsg_Click", i, 0, j);
      return;
      i = 0;
      break;
      label303:
      paramView = JumpParser.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidContentContext, url);
      if ((paramView != null) && ("openLightApp".equals(ec)) && ("url".equals(ed)))
      {
        SmartDeviceUtil.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_AndroidContentContext, localDeviceInfo, paramView.a("url_prefix"));
        continue;
        label382:
        if ((i != 0) && (!TextUtils.isEmpty(faceRect)) && (DeviceSingleStructBuilder.a(a, faceRect)) && (!TextUtils.isEmpty(strCoverPath)))
        {
          localIntent = new Intent();
          localIntent.putExtra("device_id", din + "");
          if (nMediaFileStatus == 5) {}
          for (paramView = strMediaPath;; paramView = strCoverPath)
          {
            localIntent.putExtra("filepath", paramView);
            localIntent.putExtra("rect", faceRect);
            localIntent.putExtra("from", 0);
            SmartDevicePluginLoader.a().a((Activity)a.jdField_a_of_type_AndroidContentContext, a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), localIntent, "com.tencent.device.face.FaceRegisterActivity", -1, null, SmartDevicePluginProxyActivity.class);
            break;
          }
        }
        i = FileManagerUtil.a(FileUtil.a(strMediaFileName));
        paramView = FileManagerUtil.a(localMessageForDeviceSingleStruct);
        Object localObject = new ForwardFileInfo();
        ((ForwardFileInfo)localObject).b(10009);
        ((ForwardFileInfo)localObject).d(8);
        ((ForwardFileInfo)localObject).b(nSessionId);
        ((ForwardFileInfo)localObject).d(fileName);
        ((ForwardFileInfo)localObject).c(uniseq);
        ((ForwardFileInfo)localObject).d(fileSize);
        ((ForwardFileInfo)localObject).f(strThumbPath);
        ((ForwardFileInfo)localObject).a(paramView.getFilePath());
        Intent localIntent = new Intent(a.jdField_a_of_type_AndroidContentContext, FileBrowserActivity.class);
        localIntent.putExtra("fileinfo", (Parcelable)localObject);
        localObject = new ArrayList();
        if ((i == 0) || (i == 1)) {
          ((ArrayList)localObject).add(String.valueOf(nSessionId));
        }
        localIntent.putStringArrayListExtra("Aio_SessionId_ImageList", (ArrayList)localObject);
        ((Activity)a.jdField_a_of_type_AndroidContentContext).startActivityForResult(localIntent, 102);
      }
    }
  }
}
