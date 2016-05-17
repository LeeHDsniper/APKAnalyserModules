package com.tencent.mobileqq.pluginsdk;

import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import com.tencent.mobileqq.pluginsdk.ipc.PluginCommunicationChannel;
import com.tencent.mobileqq.pluginsdk.ipc.PluginCommunicationChannel.Stub;
import com.tencent.mobileqq.pluginsdk.ipc.RemoteResultCallback;
import mqq.app.MobileQQ;

public class PluginInterface
{
  private PluginCommunicationChannel a;
  
  public PluginInterface(IBinder paramIBinder)
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (paramIBinder != null)
    {
      localObject1 = localObject2;
      if (paramIBinder.isBinderAlive())
      {
        localObject1 = localObject2;
        if (paramIBinder.pingBinder()) {
          localObject1 = PluginCommunicationChannel.Stub.asInterface(paramIBinder);
        }
      }
    }
    a = ((PluginCommunicationChannel)localObject1);
  }
  
  public void destory()
  {
    a = null;
  }
  
  public String getNickName()
  {
    if (a == null) {
      return null;
    }
    try
    {
      String str = a.getNickName();
      return str;
    }
    catch (RemoteException localRemoteException) {}
    return null;
  }
  
  public String getSKey()
  {
    if (a == null) {
      return null;
    }
    try
    {
      String str = a.getSKey();
      return str;
    }
    catch (RemoteException localRemoteException) {}
    return null;
  }
  
  public String getSid()
  {
    if (a == null) {
      return null;
    }
    try
    {
      String str = a.getSid();
      return str;
    }
    catch (RemoteException localRemoteException) {}
    return null;
  }
  
  public long getUin()
  {
    if (a == null) {
      return 0L;
    }
    try
    {
      long l = a.getUin();
      return l;
    }
    catch (RemoteException localRemoteException) {}
    return 0L;
  }
  
  public Bundle transfer(String paramString, Bundle paramBundle)
  {
    if (a == null) {
      return null;
    }
    if (paramBundle != null) {
      paramBundle.setClassLoader(MobileQQ.sMobileQQ.getClassLoader());
    }
    try
    {
      paramString = a.transfer(paramString, paramBundle);
      return paramString;
    }
    catch (RemoteException paramString) {}
    return null;
  }
  
  public void transferAsync(String paramString, Bundle paramBundle, RemoteResultCallback paramRemoteResultCallback)
  {
    if (a == null) {
      return;
    }
    if (paramBundle != null) {
      paramBundle.setClassLoader(MobileQQ.sMobileQQ.getClassLoader());
    }
    try
    {
      a.transferAsync(paramString, paramBundle, paramRemoteResultCallback);
      return;
    }
    catch (RemoteException paramString) {}
  }
}
