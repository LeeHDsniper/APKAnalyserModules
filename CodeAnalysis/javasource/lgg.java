import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import com.tencent.device.file.DeviceAVFileMsgObserver;
import com.tencent.device.msg.data.DeviceComnFileMsgProcessor;
import com.tencent.device.msg.data.DeviceMsgHandle;
import com.tencent.device.msg.data.MessageForDevLittleVideo;
import com.tencent.device.msg.data.MessageForDevPtt;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.DeviceMsgChatPie;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.data.MessageForDeviceFile;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.qphone.base.util.BaseApplication;
import java.util.concurrent.ConcurrentHashMap;

public class lgg
  extends BroadcastReceiver
{
  public lgg(DeviceMsgChatPie paramDeviceMsgChatPie)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    if (paramIntent != null)
    {
      if (!paramIntent.getAction().equalsIgnoreCase("SmartDevice_DeviceUnBindRst")) {
        break label72;
      }
      paramContext = paramIntent.getExtras();
      if (paramContext != null) {
        break label26;
      }
    }
    label26:
    label72:
    int i;
    int j;
    do
    {
      do
      {
        do
        {
          float f;
          do
          {
            do
            {
              do
              {
                do
                {
                  do
                  {
                    long l;
                    do
                    {
                      return;
                      l = paramContext.getLong("deviceopdin", 0L);
                    } while ((paramContext.getInt("deviceoprstcode", 0) != 0) || (Long.parseLong(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a) != l));
                    a.v();
                    return;
                    if (!paramIntent.getAction().equalsIgnoreCase("SmartDevice_ProductFetchRst")) {
                      break;
                    }
                    paramContext = paramIntent.getExtras();
                  } while ((paramContext == null) || (paramContext.getInt("deviceoprstcode", 0) != 0));
                  a.ar();
                  return;
                  if (!paramIntent.getAction().equalsIgnoreCase("SmartDevice_receiveVasFlagResult")) {
                    break;
                  }
                  paramContext = paramIntent.getExtras();
                } while (paramContext == null);
                i = paramContext.getInt("Flag", 0);
                paramContext = (DeviceMsgHandle)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49);
                if (i == 1)
                {
                  DeviceMsgChatPie.K = true;
                  paramIntent = a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131367999) + a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131371608);
                  paramContext.a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, paramIntent, MessageCache.a(), true, false, 0);
                  return;
                }
                DeviceMsgChatPie.K = false;
                paramIntent = a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131367999) + a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131371609) + a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131371610);
                paramContext.a(a.jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.a, paramIntent, MessageCache.a(), true, false, 2);
                return;
                if (!paramIntent.getAction().equalsIgnoreCase("SmartDevice_OnDataPointFileMsgProgress")) {
                  break;
                }
                paramContext = paramIntent.getExtras();
              } while (paramContext == null);
              i = paramContext.getInt("cookie", 0);
              f = paramContext.getFloat("percent", 0.0F);
            } while ((i == 0) || (!DeviceMsgChatPie.jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(Integer.valueOf(i))));
            paramContext = (MessageRecord)DeviceMsgChatPie.jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(Integer.valueOf(i));
            if ((paramContext instanceof MessageForDeviceFile))
            {
              paramContext = (MessageForDeviceFile)paramContext;
              nFileStatus = 3;
              progress = f;
              paramContext.serial();
              a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, istroop, uniseq, msgData);
              ((DeviceMsgHandle)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49)).a().a(paramContext, f);
              return;
            }
          } while (!(paramContext instanceof MessageForDevLittleVideo));
          paramContext = (MessageForDevLittleVideo)paramContext;
          videoFileStatus = 1002;
          videoFileProgress = ((int)(100.0F * f));
          paramContext.serial();
          a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, istroop, uniseq, msgData);
          ((DeviceMsgHandle)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49)).a().a(paramContext, f);
          return;
        } while (!paramIntent.getAction().equalsIgnoreCase("SmartDevice_OnDataPointFileMsgSendRet"));
        paramContext = paramIntent.getExtras();
      } while (paramContext == null);
      i = paramContext.getInt("cookie", 0);
      j = paramContext.getInt("err_code", 1);
    } while ((i == 0) || (!DeviceMsgChatPie.jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(Integer.valueOf(i))));
    paramContext = (MessageRecord)DeviceMsgChatPie.jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(Integer.valueOf(i));
    if (j == 0) {
      if ((paramContext instanceof MessageForDevPtt))
      {
        paramContext = (MessageForDevPtt)paramContext;
        extraflag = 32770;
        fileSize = FileManagerUtil.a(url);
        extStr = "device_groupchat";
        paramContext.serial();
        a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, istroop, uniseq, msgData);
        ((DeviceMsgHandle)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49)).a().a(paramContext, Boolean.valueOf(true));
      }
    }
    for (;;)
    {
      DeviceMsgChatPie.jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.remove(Integer.valueOf(i));
      return;
      if ((paramContext instanceof MessageForDeviceFile))
      {
        ((DeviceMsgHandle)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49)).a().a(paramContext, Boolean.valueOf(true));
      }
      else if ((paramContext instanceof MessageForDevLittleVideo))
      {
        paramIntent = (MessageForDevLittleVideo)paramContext;
        videoFileStatus = 1003;
        videoFileProgress = 100;
        paramIntent.serial();
        a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, istroop, uniseq, msgData);
        ((DeviceMsgHandle)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49)).a().a(paramContext, Boolean.valueOf(true));
        continue;
        if ((paramContext instanceof MessageForDevPtt))
        {
          paramContext = (MessageForDevPtt)paramContext;
          extraflag = 32768;
          extStr = "device_groupchat";
          paramContext.serial();
          a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, istroop, uniseq, msgData);
          ((DeviceMsgHandle)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49)).a().a(paramContext, Boolean.valueOf(false));
        }
        else if ((paramContext instanceof MessageForDeviceFile))
        {
          paramContext = (MessageForDeviceFile)paramContext;
          ((DeviceMsgHandle)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49)).a().a(paramContext, Boolean.valueOf(false));
        }
        else if ((paramContext instanceof MessageForDevLittleVideo))
        {
          paramIntent = (MessageForDevLittleVideo)paramContext;
          videoFileStatus = 1005;
          videoFileProgress = 0;
          paramIntent.serial();
          a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(frienduin, istroop, uniseq, msgData);
          ((DeviceMsgHandle)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(49)).a().a(paramContext, Boolean.valueOf(false));
        }
      }
    }
  }
}
