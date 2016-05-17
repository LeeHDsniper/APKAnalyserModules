import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.mobileqq.app.readinjoy.ReadInJoyManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.utils.StringUtil;
import cooperation.readinjoy.ReadInJoyHelper;
import java.util.List;

public class nmc
  implements Runnable
{
  public nmc(ReadInJoyManager paramReadInJoyManager, long paramLong, String paramString1, String paramString2, List paramList)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager) == null) {
      return;
    }
    ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager).edit().putInt("readinjoy_push_channel_article_flag", 1);
    ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager).edit().putLong("readinjoy_push_channel_article_updated_time", NetConnInfoCenter.getServerTime());
    ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager).edit().putLong("readinjoy_push_channel_article_content_channel_id", jdField_a_of_type_Long);
    ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager).edit().putString("readinjoy_push_channel_article_content_channel_name", jdField_a_of_type_JavaLangString);
    ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager).edit().putString("readinjoy_push_channel_article_content_wording", b);
    ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager).edit().putString("readinjoy_push_channel_article_content_article_id_list", StringUtil.a(jdField_a_of_type_JavaUtilList, ","));
    ReadInJoyHelper.a(ReadInJoyManager.a(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager), true);
    ReadInJoyManager.b(jdField_a_of_type_ComTencentMobileqqAppReadinjoyReadInJoyManager);
  }
}
