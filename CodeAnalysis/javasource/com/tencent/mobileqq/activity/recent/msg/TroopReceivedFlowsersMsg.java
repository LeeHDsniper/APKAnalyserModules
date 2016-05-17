package com.tencent.mobileqq.activity.recent.msg;

import android.content.Context;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.data.MessageNavInfo;
import org.json.JSONException;
import org.json.JSONObject;

public class TroopReceivedFlowsersMsg
  extends AbstructRecentUserMsg
{
  public TroopReceivedFlowsersMsg(Context paramContext)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = paramContext.getString(2131364491);
    jdField_b_of_type_JavaLangString = jdField_a_of_type_JavaLangString;
  }
  
  public void a(byte[] paramArrayOfByte)
  {
    paramArrayOfByte = new String(paramArrayOfByte);
    try
    {
      paramArrayOfByte = new JSONObject(paramArrayOfByte);
      jdField_b_of_type_Long = paramArrayOfByte.getLong("uniseq");
      c = paramArrayOfByte.getLong("shmsgseq");
      jdField_a_of_type_JavaLangString = paramArrayOfByte.getString("content");
      jdField_b_of_type_Int = paramArrayOfByte.getInt("color");
      if (jdField_a_of_type_ComTencentMobileqqTroopDataMessageNavInfo == null) {
        jdField_a_of_type_ComTencentMobileqqTroopDataMessageNavInfo = new MessageNavInfo();
      }
      jdField_a_of_type_ComTencentMobileqqTroopDataMessageNavInfo.a(paramArrayOfByte.getString("messageNavInfo"));
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
      localJSONObject.put("uniseq", jdField_b_of_type_Long);
      localJSONObject.put("shmsgseq", c);
      localJSONObject.put("content", jdField_a_of_type_JavaLangString);
      localJSONObject.put("color", jdField_b_of_type_Int);
      if (jdField_a_of_type_ComTencentMobileqqTroopDataMessageNavInfo != null) {
        localJSONObject.put("messageNavInfo", jdField_a_of_type_ComTencentMobileqqTroopDataMessageNavInfo.a());
      }
      return localJSONObject.toString().getBytes();
    }
    catch (JSONException localJSONException)
    {
      for (;;)
      {
        localJSONException.printStackTrace();
      }
    }
  }
}
