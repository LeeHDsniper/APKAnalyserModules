package com.tencent.mobileqq.activity.specialcare;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;
import java.util.List;
import mqi;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class QvipSpecialSoundConfig
{
  public List a;
  
  public QvipSpecialSoundConfig()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = new ArrayList();
  }
  
  public static QvipSpecialSoundConfig a(JSONObject paramJSONObject)
  {
    if (paramJSONObject == null) {
      paramJSONObject = new QvipSpecialSoundConfig();
    }
    for (;;)
    {
      return paramJSONObject;
      localQvipSpecialSoundConfig = new QvipSpecialSoundConfig();
      try
      {
        JSONArray localJSONArray = new JSONArray(paramJSONObject.getString("items"));
        paramJSONObject = localQvipSpecialSoundConfig;
        if (localJSONArray == null) {
          continue;
        }
        paramJSONObject = localQvipSpecialSoundConfig;
        if (localJSONArray.length() < 0) {
          continue;
        }
        int j = localJSONArray.length();
        int i = 0;
        for (;;)
        {
          paramJSONObject = localQvipSpecialSoundConfig;
          if (i >= j) {
            break;
          }
          paramJSONObject = mqi.a(localJSONArray.getJSONObject(i));
          a.add(paramJSONObject);
          i += 1;
        }
        return localQvipSpecialSoundConfig;
      }
      catch (JSONException paramJSONObject)
      {
        paramJSONObject.printStackTrace();
        return localQvipSpecialSoundConfig;
      }
      catch (OutOfMemoryError paramJSONObject)
      {
        paramJSONObject.printStackTrace();
        return localQvipSpecialSoundConfig;
      }
      catch (Exception paramJSONObject)
      {
        paramJSONObject.printStackTrace();
      }
    }
  }
}
