import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.text.TextUtils;
import com.tencent.mobileqq.app.readinjoy.ReadInJoyManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import cooperation.readinjoy.ReadInJoyHelper;
import java.util.List;

public class nma
  implements Runnable
{
  public nma(ReadInJoyManager paramReadInJoyManager, List paramList)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    String str1 = "";
    int i = 0;
    int j;
    if (i < jdField_a_of_type_JavaUtilList.size())
    {
      j = ((Integer)jdField_a_of_type_JavaUtilList.get(i)).intValue();
      if (i <= 0) {
        break label191;
      }
      str1 = str1 + ",";
    }
    label191:
    for (;;)
    {
      str1 = str1 + j;
      i += 1;
      break;
      if (ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager) == null) {}
      String str2;
      do
      {
        return;
        str2 = ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager).getString("config_new_channel_id_list", "");
      } while ((TextUtils.isEmpty(str1)) || (str2.equals(str1)));
      ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager).edit().putString("config_new_channel_id_list", str1);
      ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager).edit().putInt("config_new_channel_notify_flag", 1);
      ReadInJoyHelper.a(ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager), true);
      ReadInJoyManager.b(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager);
      return;
    }
  }
}
