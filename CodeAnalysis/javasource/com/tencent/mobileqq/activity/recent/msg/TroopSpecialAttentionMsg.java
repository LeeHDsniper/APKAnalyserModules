package com.tencent.mobileqq.activity.recent.msg;

import android.content.Context;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.data.MessageNavInfo;
import com.tencent.qphone.base.util.QLog;
import org.json.JSONException;
import org.json.JSONObject;

public class TroopSpecialAttentionMsg
  extends AbstructRecentUserMsg
  implements Cloneable
{
  public static final String d = "TroopSpecialAttentionMsg";
  
  public TroopSpecialAttentionMsg(Context paramContext)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = paramContext.getString(2131367137);
    jdField_b_of_type_JavaLangString = jdField_a_of_type_JavaLangString;
  }
  
  public Object a()
  {
    try
    {
      super.clone();
      Object localObject = super.clone();
      return localObject;
    }
    catch (Exception localException) {}
    return null;
  }
  
  public void a(byte[] paramArrayOfByte)
  {
    QLog.d("TroopSpecialAttentionMsg", 2, "deSerialize");
    paramArrayOfByte = new String(paramArrayOfByte);
    try
    {
      paramArrayOfByte = new JSONObject(paramArrayOfByte);
      jdField_a_of_type_JavaLangString = paramArrayOfByte.getString("content");
      jdField_a_of_type_Int = paramArrayOfByte.getInt("time");
      jdField_b_of_type_Int = paramArrayOfByte.getInt("color");
      c = paramArrayOfByte.getString("messageNavInfo");
      if ((c != null) && (c.length() != 0) && (jdField_a_of_type_ComTencentMobileqqTroopDataMessageNavInfo == null))
      {
        jdField_a_of_type_ComTencentMobileqqTroopDataMessageNavInfo = new MessageNavInfo();
        jdField_a_of_type_ComTencentMobileqqTroopDataMessageNavInfo.a(c);
      }
      return;
    }
    catch (JSONException paramArrayOfByte)
    {
      paramArrayOfByte.printStackTrace();
    }
  }
  
  public byte[] a()
  {
    return b();
  }
  
  public byte[] b()
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("content", jdField_a_of_type_JavaLangString);
      localJSONObject.put("time", jdField_a_of_type_Int);
      localJSONObject.put("color", jdField_b_of_type_Int);
      if (jdField_a_of_type_ComTencentMobileqqTroopDataMessageNavInfo != null) {
        c = jdField_a_of_type_ComTencentMobileqqTroopDataMessageNavInfo.a();
      }
      localJSONObject.put("messageNavInfo", c);
    }
    catch (JSONException localJSONException)
    {
      for (;;)
      {
        localJSONException.printStackTrace();
      }
    }
    return localJSONObject.toString().getBytes();
  }
}
