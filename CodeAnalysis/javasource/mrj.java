import com.tencent.common.app.AppInterface;
import com.tencent.mobileqq.activity.specialcare.QvipSpecialSoundManager;
import com.tencent.mobileqq.activity.specialcare.QvipSpecialSoundManager.CallBack;
import com.tencent.mobileqq.activity.specialcare.VipSpecialSoundWebViewPlugin;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.webviewplugin.WebViewPlugin.PluginRuntime;
import java.util.HashMap;
import java.util.List;

public class mrj
  implements QvipSpecialSoundManager.CallBack
{
  public mrj(VipSpecialSoundWebViewPlugin paramVipSpecialSoundWebViewPlugin, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(boolean paramBoolean)
  {
    if (paramBoolean) {}
    try
    {
      Object localObject = "key_special_sound_list" + jdField_a_of_type_ComTencentMobileqqActivitySpecialcareVipSpecialSoundWebViewPlugin.mRuntime.a().a();
      localObject = (List)QvipSpecialSoundManager.a.get(localObject);
      VipSpecialSoundWebViewPlugin.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareVipSpecialSoundWebViewPlugin, jdField_a_of_type_JavaLangString, (List)localObject);
      return;
    }
    catch (Exception localException1)
    {
      localException1.printStackTrace();
      try
      {
        VipSpecialSoundWebViewPlugin.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareVipSpecialSoundWebViewPlugin, jdField_a_of_type_JavaLangString, null);
        return;
      }
      catch (Exception localException2)
      {
        localException2.printStackTrace();
      }
    }
    VipSpecialSoundWebViewPlugin.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareVipSpecialSoundWebViewPlugin, jdField_a_of_type_JavaLangString, null);
    return;
  }
}
