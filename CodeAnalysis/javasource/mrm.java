import com.tencent.mobileqq.activity.specialcare.VipSpecialSoundWebViewPlugin;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import org.json.JSONException;
import org.json.JSONObject;

public class mrm
  extends Thread
{
  private static final int jdField_a_of_type_Int = 5;
  Object jdField_a_of_type_JavaLangObject;
  public String a;
  boolean jdField_a_of_type_Boolean;
  public String b;
  boolean b;
  
  public mrm(VipSpecialSoundWebViewPlugin paramVipSpecialSoundWebViewPlugin)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangObject = new Object();
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
  }
  
  void a()
  {
    for (;;)
    {
      synchronized (jdField_a_of_type_JavaLangObject)
      {
        boolean bool = jdField_a_of_type_Boolean;
        if (bool) {}
      }
      try
      {
        VipSpecialSoundWebViewPlugin.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareVipSpecialSoundWebViewPlugin, "-->wait 5 seconds");
        jdField_a_of_type_JavaLangObject.wait(5000L);
        if (jdField_a_of_type_Boolean) {
          continue;
        }
        VipSpecialSoundWebViewPlugin.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareVipSpecialSoundWebViewPlugin, "-->download task " + jdField_b_of_type_JavaLangString + " timeout");
        jdField_b_of_type_Boolean = true;
        JSONObject localJSONObject1 = new JSONObject();
        JSONObject localJSONObject2 = new JSONObject();
        localJSONObject2.put("status", -2);
        localJSONObject1.put("code", 0);
        localJSONObject1.put("data", localJSONObject2);
        jdField_a_of_type_ComTencentMobileqqActivitySpecialcareVipSpecialSoundWebViewPlugin.callJs(jdField_a_of_type_JavaLangString, new String[] { localJSONObject1.toString() });
        return;
      }
      catch (InterruptedException localInterruptedException)
      {
        VipSpecialSoundWebViewPlugin.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareVipSpecialSoundWebViewPlugin, "-->wait() is interrupted");
        continue;
        localObject2 = finally;
        throw localObject2;
      }
      catch (JSONException localJSONException)
      {
        for (;;)
        {
          VipSpecialSoundWebViewPlugin.a(jdField_a_of_type_ComTencentMobileqqActivitySpecialcareVipSpecialSoundWebViewPlugin, "-->json exception:" + localJSONException.toString());
        }
      }
    }
  }
  
  void b()
  {
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      jdField_a_of_type_Boolean = true;
      jdField_a_of_type_JavaLangObject.notifyAll();
      return;
    }
  }
  
  public void run()
  {
    a();
  }
}
