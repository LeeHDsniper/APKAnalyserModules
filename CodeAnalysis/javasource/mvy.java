import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import android.text.TextUtils;
import com.tencent.common.app.AppInterface;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.DeviceProfileManager;
import com.tencent.mobileqq.app.DeviceProfileManager.AccountDpcManager;
import com.tencent.mobileqq.app.DeviceProfileManager.DPCConfigInfo;
import com.tencent.mobileqq.config.struct.splashproto.ConfigurationService.Config;
import com.tencent.mobileqq.config.struct.splashproto.ConfigurationService.RespGetConfig;
import com.tencent.mobileqq.cooperation.ApkUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBInt32Field;
import com.tencent.mobileqq.pb.PBRepeatField;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.utils.ReflectedMethods;
import com.tencent.qphone.base.util.QLog;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class mvy
  implements Runnable
{
  public mvy(DeviceProfileManager paramDeviceProfileManager, ConfigurationService.RespGetConfig paramRespGetConfig, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    ConfigurationService.Config localConfig = (ConfigurationService.Config)jdField_a_of_type_ComTencentMobileqqConfigStructSplashprotoConfigurationService$RespGetConfig.config_list.get(0);
    Object localObject1 = content_list;
    QLog.i(DeviceProfileManager.jdField_a_of_type_JavaLangString, 1, "onDPCResponse is called, version=" + version.get());
    if (localObject1 != null) {}
    boolean bool1;
    int i;
    Iterator localIterator;
    SharedPreferences.Editor localEditor2;
    SharedPreferences localSharedPreferences;
    SharedPreferences.Editor localEditor3;
    HashMap localHashMap;
    label309:
    break label836;
    label310:
    Object localObject8;
    mwa localMwa;
    Object localObject6;
    Object localObject7;
    SharedPreferences.Editor localEditor1;
    label615:
    label727:
    do
    {
      do
      {
        do
        {
          try
          {
            if (((PBRepeatField)localObject1).size() != 0)
            {
              bool1 = TextUtils.isEmpty(jdField_a_of_type_JavaLangString);
              if (!bool1) {}
            }
            else
            {
              return;
            }
            ??? = new HashMap();
            i = 0;
            if (i < ((PBRepeatField)localObject1).size())
            {
              if (jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager.a((String)((PBRepeatField)localObject1).get(i), (HashMap)???)) {
                break label1248;
              }
              QLog.e(DeviceProfileManager.jdField_a_of_type_JavaLangString, 1, "onDPCResponse parseDPCXML error, so return");
              break label1248;
            }
            localIterator = ((HashMap)???).entrySet().iterator();
            localEditor2 = ReflectedMethods.a(BaseApplicationImpl.a(), "dpcConfig").edit();
            localSharedPreferences = ReflectedMethods.a(BaseApplicationImpl.a(), "dpcConfig_account");
            localEditor3 = localSharedPreferences.edit();
            localObject1 = null;
            Intent localIntent1;
            localObject7 = ab;
          }
          catch (Exception localException) {}finally
          {
            jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager.a(4);
            ??? = new Intent("com.tentcent.mobileqq.dpc.broadcast");
            localObject6 = new Bundle();
            ((Bundle)localObject6).putSerializable("featureMapLV2", DeviceProfileManager.a(jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager));
            if (DeviceProfileManager.a() != null) {
              ((Bundle)localObject6).putSerializable("featureAccountMapLV2", ajdField_a_of_type_JavaUtilHashMap);
            }
            ((Intent)???).putExtras((Bundle)localObject6);
            BaseApplicationImpl.a().sendBroadcast((Intent)???, "com.tencent.msg.permission.pushnotify");
          }
          bool1 = true;
          ??? = DeviceProfileManager.AccountDpcManager.a(DeviceProfileManager.a(), (String)localObject8);
          localEditor1 = localEditor3;
          localObject6 = localObject3;
          if (QLog.isColorLevel()) {
            QLog.d(DeviceProfileManager.jdField_a_of_type_JavaLangString, 2, "onDPCResponse DPCXmlHandler.tempMap: key=" + (String)localObject8 + ", value=" + localMwa.toString() + ", isAccountName=" + bool1);
          }
        } while (localObject6 == null);
        DeviceProfileManager.DPCConfigInfo localDPCConfigInfo = (DeviceProfileManager.DPCConfigInfo)((HashMap)localObject6).get(???);
        bool1 = false;
        localObject8 = localDPCConfigInfo;
        if (localDPCConfigInfo != null) {
          break label727;
        }
        bool1 = true;
        localObject7 = (DeviceProfileManager.DPCConfigInfo)((HashMap)localObject7).get(???);
      } while (localObject7 == null);
      localObject8 = (DeviceProfileManager.DPCConfigInfo)((DeviceProfileManager.DPCConfigInfo)localObject7).clone();
    } while (localObject8 == null);
    if (QLog.isDevelopLevel()) {
      QLog.d(DeviceProfileManager.jdField_a_of_type_JavaLangString, 4, "onDPCResponse tempFeatureMap old value: key=" + (String)??? + " " + localObject8 + ", isAddConfig=" + bool1);
    }
    boolean bool2 = DeviceProfileManager.a((DeviceProfileManager.DPCConfigInfo)localObject8, b.toString().trim());
    if (bool1) {
      ((HashMap)localObject6).put(???, localObject8);
    }
    for (;;)
    {
      localEditor1.putString((String)???, b);
      label836:
      if (!QLog.isColorLevel()) {
        break label310;
      }
      QLog.d(DeviceProfileManager.jdField_a_of_type_JavaLangString, 2, "onDPCResponse tempFeatureMap new value: key=" + (String)??? + " " + localObject8 + ", isAddConfig=" + bool1 + ", hasUpdate=" + bool2);
      break label310;
      localObject7 = DeviceProfileManager.b(jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager);
      bool1 = false;
      localObject6 = localHashMap;
      localEditor1 = localEditor2;
      ??? = localObject8;
      break label615;
      synchronized (jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager)
      {
        DeviceProfileManager.a(jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager, localHashMap);
        if ((DeviceProfileManager.a() != null) && (ajdField_a_of_type_ComTencentCommonAppAppInterface != null) && (jdField_a_of_type_JavaLangString != null) && (jdField_a_of_type_JavaLangString.equals(ajdField_a_of_type_ComTencentCommonAppAppInterface.a()))) {
          ajdField_a_of_type_JavaUtilHashMap = localObject3;
        }
        if (DeviceProfileManager.a() != null)
        {
          localEditor3.putLong(DeviceProfileManager.AccountDpcManager.a(ajdField_a_of_type_ComTencentCommonAppAppInterface, "last_update_time"), System.currentTimeMillis());
          localEditor3.putInt(DeviceProfileManager.AccountDpcManager.a(ajdField_a_of_type_ComTencentCommonAppAppInterface, "server_version"), version.get());
        }
        i = localSharedPreferences.getInt("key_versioncode", 0);
        int j = ApkUtils.a(BaseApplicationImpl.a());
        if (i < j) {
          localEditor3.putInt("key_versioncode", j);
        }
        localEditor2.commit();
        localEditor3.commit();
        QLog.i(DeviceProfileManager.jdField_a_of_type_JavaLangString, 1, "onDPCResponse KEY_LAST_UPDATE_TIME=" + System.currentTimeMillis() + ", versioncode=" + j + ", keyVersionCode =" + i);
        jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager.a(4);
        Intent localIntent2 = new Intent("com.tentcent.mobileqq.dpc.broadcast");
        ??? = new Bundle();
        ((Bundle)???).putSerializable("featureMapLV2", DeviceProfileManager.a(jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager));
        if (DeviceProfileManager.a() != null) {
          ((Bundle)???).putSerializable("featureAccountMapLV2", ajdField_a_of_type_JavaUtilHashMap);
        }
        localIntent2.putExtras((Bundle)???);
        BaseApplicationImpl.a().sendBroadcast(localIntent2, "com.tencent.msg.permission.pushnotify");
        return;
      }
      label1248:
      i += 1;
      break;
      if (!bool1) {
        if (!bool2) {
          break label309;
        }
      }
    }
  }
}
