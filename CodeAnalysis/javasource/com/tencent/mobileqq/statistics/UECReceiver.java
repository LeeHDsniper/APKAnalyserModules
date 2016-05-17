package com.tencent.mobileqq.statistics;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class UECReceiver
  extends BroadcastReceiver
{
  public UECReceiver()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    if (paramIntent == null) {}
    for (;;)
    {
      return;
      if ("Success".equals(BaseApplicationImpl.sInjectResult)) {
        try
        {
          paramContext = UEC.a;
          if (paramContext != null)
          {
            paramContext.a(paramIntent.getParcelableArrayListExtra("UECData"));
            return;
          }
        }
        catch (Exception paramContext)
        {
          paramContext.printStackTrace();
        }
      }
    }
  }
}
