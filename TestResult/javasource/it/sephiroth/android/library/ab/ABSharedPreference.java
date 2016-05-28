package it.sephiroth.android.library.ab;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Build.VERSION;
import java.util.UUID;

class ABSharedPreference
  extends ABSettingsFactory.ABSettingsManager
{
  private final String uuid = generate(paramContext);
  
  public ABSharedPreference(Context paramContext) {}
  
  private String generate(Context paramContext)
  {
    paramContext = getSharedPreferences(paramContext);
    if (paramContext.contains("ab-uuid"))
    {
      str = paramContext.getString("ab-uuid", null);
      if (str != null) {
        return str;
      }
    }
    String str = generateNew().toString();
    paramContext = paramContext.edit();
    paramContext.putString("ab-uuid", str);
    paramContext.commit();
    return str;
  }
  
  private SharedPreferences getSharedPreferences(Context paramContext)
  {
    if (Build.VERSION.SDK_INT >= 11) {
      return getSharedPreferencesNewApi(paramContext);
    }
    return getSharedPreferencesOldApi(paramContext);
  }
  
  @TargetApi(11)
  private SharedPreferences getSharedPreferencesNewApi(Context paramContext)
  {
    return paramContext.getSharedPreferences("alphabeta", 4);
  }
  
  private SharedPreferences getSharedPreferencesOldApi(Context paramContext)
  {
    return paramContext.getSharedPreferences("alphabeta", 0);
  }
  
  public String getUUID()
  {
    return uuid;
  }
}
