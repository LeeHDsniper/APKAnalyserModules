import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import com.tencent.mobileqq.activity.specialcare.QvipSpecialSoundManager;
import com.tencent.mobileqq.activity.specialcare.VipSpecialSoundWebViewPlugin;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import org.json.JSONException;
import org.json.JSONObject;

public class mrl
  implements MediaPlayer.OnCompletionListener
{
  public mrl(VipSpecialSoundWebViewPlugin paramVipSpecialSoundWebViewPlugin, String paramString1, String paramString2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onCompletion(MediaPlayer paramMediaPlayer)
  {
    int i = VipSpecialSoundWebViewPlugin.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareVipSpecialSoundWebViewPlugin).a(jdField_a_of_type_JavaLangString);
    VipSpecialSoundWebViewPlugin.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareVipSpecialSoundWebViewPlugin, "-->media:" + jdField_a_of_type_JavaLangString + " play completed, soundId:" + i);
    try
    {
      paramMediaPlayer = new JSONObject();
      JSONObject localJSONObject = new JSONObject();
      localJSONObject.put("id", i);
      paramMediaPlayer.put("code", 0);
      paramMediaPlayer.put("data", localJSONObject);
      jdField_a_of_type_ComTencentMobileqqActivitySpecialcareVipSpecialSoundWebViewPlugin.callJs(b, new String[] { paramMediaPlayer.toString() });
      return;
    }
    catch (JSONException paramMediaPlayer)
    {
      VipSpecialSoundWebViewPlugin.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareVipSpecialSoundWebViewPlugin, "-->json exception:" + paramMediaPlayer.toString());
    }
  }
}
