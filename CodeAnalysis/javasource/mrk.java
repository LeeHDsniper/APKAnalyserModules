import com.tencent.mobileqq.activity.specialcare.VipSpecialSoundWebViewPlugin;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.vip.DownloadListener;
import com.tencent.mobileqq.vip.DownloadTask;
import java.util.HashMap;
import org.json.JSONException;
import org.json.JSONObject;

public class mrk
  extends DownloadListener
{
  public mrk(VipSpecialSoundWebViewPlugin paramVipSpecialSoundWebViewPlugin, mrm paramMrm, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onDone(DownloadTask paramDownloadTask)
  {
    int i = 0;
    super.onDone(paramDownloadTask);
    for (;;)
    {
      try
      {
        if (jdField_a_of_type_Mrm.b) {
          return;
        }
        jdField_a_of_type_Mrm.b();
        JSONObject localJSONObject1 = new JSONObject();
        JSONObject localJSONObject2 = new JSONObject();
        if ((paramDownloadTask.a() == 3) && (z == 0))
        {
          VipSpecialSoundWebViewPlugin.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareVipSpecialSoundWebViewPlugin, "-->onDone,complete callback:" + jdField_a_of_type_JavaLangString + ",status:" + paramDownloadTask.a() + ",errCode:" + z + ",download result:" + i);
          localJSONObject2.put("status", i);
          localJSONObject1.put("code", 0);
          localJSONObject1.put("data", localJSONObject2);
          jdField_a_of_type_ComTencentMobileqqActivitySpecialcareVipSpecialSoundWebViewPlugin.callJs(jdField_a_of_type_JavaLangString, new String[] { localJSONObject1.toString() });
          return;
        }
      }
      catch (JSONException paramDownloadTask)
      {
        VipSpecialSoundWebViewPlugin.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareVipSpecialSoundWebViewPlugin, "-->json execption:" + paramDownloadTask.toString());
        return;
      }
      i = -1;
    }
  }
  
  public void onProgress(DownloadTask paramDownloadTask)
  {
    VipSpecialSoundWebViewPlugin.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareVipSpecialSoundWebViewPlugin, "-->onProgress");
  }
  
  public boolean onStart(DownloadTask paramDownloadTask)
  {
    VipSpecialSoundWebViewPlugin.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareVipSpecialSoundWebViewPlugin, "-->onStart");
    if (VipSpecialSoundWebViewPlugin.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareVipSpecialSoundWebViewPlugin).get(jdField_a_of_type_JavaLangString) == null) {
      VipSpecialSoundWebViewPlugin.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareVipSpecialSoundWebViewPlugin).put(jdField_a_of_type_JavaLangString, paramDownloadTask);
    }
    return true;
  }
}
