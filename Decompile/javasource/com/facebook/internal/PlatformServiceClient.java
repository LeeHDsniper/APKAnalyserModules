package com.facebook.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;

public abstract class PlatformServiceClient
  implements ServiceConnection
{
  private final String applicationId;
  private final Context context;
  private final Handler handler;
  private CompletedListener listener;
  private final int protocolVersion;
  private int replyMessage;
  private int requestMessage;
  private boolean running;
  private Messenger sender;
  
  public PlatformServiceClient(Context paramContext, int paramInt1, int paramInt2, int paramInt3, String paramString)
  {
    Context localContext = paramContext.getApplicationContext();
    if (localContext != null) {
      paramContext = localContext;
    }
    for (;;)
    {
      context = paramContext;
      requestMessage = paramInt1;
      replyMessage = paramInt2;
      applicationId = paramString;
      protocolVersion = paramInt3;
      handler = new Handler()
      {
        public void handleMessage(Message paramAnonymousMessage)
        {
          PlatformServiceClient.this.handleMessage(paramAnonymousMessage);
        }
      };
      return;
    }
  }
  
  private void callback(Bundle paramBundle)
  {
    if (!running) {}
    CompletedListener localCompletedListener;
    do
    {
      return;
      running = false;
      localCompletedListener = listener;
    } while (localCompletedListener == null);
    localCompletedListener.completed(paramBundle);
  }
  
  private void sendMessage()
  {
    Bundle localBundle = new Bundle();
    localBundle.putString("com.facebook.platform.extra.APPLICATION_ID", applicationId);
    populateRequestBundle(localBundle);
    Message localMessage = Message.obtain(null, requestMessage);
    arg1 = protocolVersion;
    localMessage.setData(localBundle);
    replyTo = new Messenger(handler);
    try
    {
      sender.send(localMessage);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      callback(null);
    }
  }
  
  public void cancel()
  {
    running = false;
  }
  
  protected void handleMessage(Message paramMessage)
  {
    if (what == replyMessage)
    {
      paramMessage = paramMessage.getData();
      if (paramMessage.getString("com.facebook.platform.status.ERROR_TYPE") == null) {
        break label39;
      }
      callback(null);
    }
    for (;;)
    {
      context.unbindService(this);
      return;
      label39:
      callback(paramMessage);
    }
  }
  
  public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
  {
    sender = new Messenger(paramIBinder);
    sendMessage();
  }
  
  public void onServiceDisconnected(ComponentName paramComponentName)
  {
    sender = null;
    context.unbindService(this);
    callback(null);
  }
  
  protected abstract void populateRequestBundle(Bundle paramBundle);
  
  public void setCompletedListener(CompletedListener paramCompletedListener)
  {
    listener = paramCompletedListener;
  }
  
  public boolean start()
  {
    if (running) {}
    Intent localIntent;
    do
    {
      do
      {
        return false;
      } while (NativeProtocol.getLatestAvailableProtocolVersionForService(context, protocolVersion) == -1);
      localIntent = NativeProtocol.createPlatformServiceIntent(context);
    } while (localIntent == null);
    running = true;
    context.bindService(localIntent, this, 1);
    return true;
  }
  
  public static abstract interface CompletedListener
  {
    public abstract void completed(Bundle paramBundle);
  }
}
