package com.tencent.mobileqq.pluginsdk.ipc;

import android.os.Bundle;
import mqq.app.MobileQQ;

public abstract class RemoteResultCallback
  extends RemoteCallback.Stub
{
  public RemoteResultCallback() {}
  
  public abstract void onCallback(Bundle paramBundle);
  
  public final void onRemoteCallback(Bundle paramBundle)
  {
    if (paramBundle != null) {
      paramBundle.setClassLoader(MobileQQ.sMobileQQ.getClassLoader());
    }
    onCallback(paramBundle);
  }
}
