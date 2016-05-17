import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import org.json.JSONException;
import org.json.JSONObject;

public class mqi
{
  public int a;
  public String a;
  public int b;
  public String b;
  public int c;
  public String c;
  public int d;
  public String d;
  public int e;
  public String e;
  public String f;
  public String g;
  public String h;
  public String i;
  
  mqi()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public static mqi a(JSONObject paramJSONObject)
  {
    if (paramJSONObject == null) {
      return new mqi();
    }
    mqi localMqi = new mqi();
    try
    {
      jdField_a_of_type_Int = paramJSONObject.getInt("id");
      jdField_a_of_type_JavaLangString = paramJSONObject.getString("name");
      jdField_b_of_type_Int = paramJSONObject.getInt("type");
      jdField_b_of_type_JavaLangString = paramJSONObject.optString("soundVersion", "0");
      jdField_c_of_type_JavaLangString = paramJSONObject.getString("soundUrl");
      jdField_d_of_type_JavaLangString = paramJSONObject.getString("whiteList");
      jdField_c_of_type_Int = paramJSONObject.getInt("isShow");
      jdField_e_of_type_Int = paramJSONObject.getInt("classify");
      g = paramJSONObject.getString("classifyName");
      jdField_e_of_type_JavaLangString = paramJSONObject.getString("backgroundUrl");
      f = String.valueOf(paramJSONObject.getInt("vip_type"));
      jdField_d_of_type_Int = paramJSONObject.getInt("useNum");
      h = paramJSONObject.getString("trialstartday");
      i = paramJSONObject.getString("trialendday");
      return localMqi;
    }
    catch (JSONException paramJSONObject)
    {
      paramJSONObject.printStackTrace();
    }
    return localMqi;
  }
}
