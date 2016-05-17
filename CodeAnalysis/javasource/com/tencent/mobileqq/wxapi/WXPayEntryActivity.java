package com.tencent.mobileqq.wxapi;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.Bundle;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mqq.shared_file_accessor.SharedPreferencesProxyManager;

public class WXPayEntryActivity
  extends Activity
{
  public WXPayEntryActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public SharedPreferences getSharedPreferences(String paramString, int paramInt)
  {
    return SharedPreferencesProxyManager.getInstance().getProxy(paramString, paramInt);
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    requestWindowFeature(1);
    try
    {
      WXPayHelper.getInstance().handleIntent(getIntent());
      finish();
      return;
    }
    catch (Exception paramBundle)
    {
      for (;;)
      {
        paramBundle.printStackTrace();
      }
    }
  }
}
