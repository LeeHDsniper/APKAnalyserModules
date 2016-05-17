package com.tencent.mobileqq.activity.recent.msg;

import android.content.Context;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import org.json.JSONException;
import org.json.JSONObject;

public class TroopNotificationMsg
  extends AbstructRecentUserMsg
  implements Cloneable
{
  public int c;
  
  public TroopNotificationMsg(Context paramContext)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = paramContext.getString(2131367486);
    jdField_b_of_type_JavaLangString = a;
  }
  
  public void a(byte[] paramArrayOfByte)
  {
    if (QLog.isColorLevel()) {
      QLog.d(TroopNotificationMsg.class.getSimpleName(), 2, "deSerialize");
    }
    paramArrayOfByte = new String(paramArrayOfByte);
    try
    {
      paramArrayOfByte = new JSONObject(paramArrayOfByte);
      a = paramArrayOfByte.getString("remindText");
      jdField_b_of_type_Int = paramArrayOfByte.getInt("color");
      c = paramArrayOfByte.getInt("ctl_flag");
      return;
    }
    catch (JSONException paramArrayOfByte)
    {
      paramArrayOfByte.printStackTrace();
    }
  }
  
  public byte[] a()
  {
    if (QLog.isColorLevel()) {
      QLog.d(TroopNotificationMsg.class.getSimpleName(), 2, "serialize");
    }
    return b();
  }
  
  public byte[] b()
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("remindText", a);
      localJSONObject.put("color", jdField_b_of_type_Int);
      localJSONObject.put("ctl_flag", c);
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
