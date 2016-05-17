package com.tencent.mobileqq.pluginsdk.ipc;

import android.os.Bundle;
import android.os.RemoteException;

public abstract class AbstractPluginCommunicationChannel
  extends PluginCommunicationChannel.Stub
{
  public AbstractPluginCommunicationChannel() {}
  
  public Bundle transfer(String paramString, Bundle paramBundle)
    throws RemoteException
  {
    return null;
  }
  
  public void transferAsync(String paramString, Bundle paramBundle, RemoteCallback paramRemoteCallback)
    throws RemoteException
  {}
}
