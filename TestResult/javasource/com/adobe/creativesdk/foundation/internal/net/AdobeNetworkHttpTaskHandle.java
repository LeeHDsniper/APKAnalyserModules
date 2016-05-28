package com.adobe.creativesdk.foundation.internal.net;

import android.os.Handler;
import java.util.ArrayList;
import java.util.concurrent.Future;

public class AdobeNetworkHttpTaskHandle
{
  private String _accessToken = null;
  private boolean _hasFinished = false;
  protected boolean _isCancelled = false;
  private Handler _notifyHandler = null;
  private int _progressPercent = 0;
  private ArrayList<Object> listeners = null;
  private Future<AdobeNetworkHttpResponse> netTaskFuture = null;
  
  AdobeNetworkHttpTaskHandle() {}
  
  public void cancel()
  {
    try
    {
      if (netTaskFuture != null) {
        netTaskFuture.cancel(true);
      }
      _isCancelled = true;
      return;
    }
    finally {}
  }
  
  String getAccessToken()
  {
    return _accessToken;
  }
  
  public boolean isCancelled()
  {
    try
    {
      boolean bool = _isCancelled;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void markFinished()
  {
    try
    {
      _hasFinished = true;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  /* Error */
  public void notifyProgress(final int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: new 6	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle$1
    //   5: dup
    //   6: aload_0
    //   7: iload_1
    //   8: invokespecial 63	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle$1:<init>	(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;I)V
    //   11: astore_2
    //   12: aload_0
    //   13: getfield 39	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle:_notifyHandler	Landroid/os/Handler;
    //   16: ifnull +15 -> 31
    //   19: aload_0
    //   20: getfield 39	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle:_notifyHandler	Landroid/os/Handler;
    //   23: aload_2
    //   24: invokevirtual 69	android/os/Handler:post	(Ljava/lang/Runnable;)Z
    //   27: pop
    //   28: aload_0
    //   29: monitorexit
    //   30: return
    //   31: aload_2
    //   32: invokeinterface 74 1 0
    //   37: goto -9 -> 28
    //   40: astore_2
    //   41: aload_0
    //   42: monitorexit
    //   43: aload_2
    //   44: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	45	0	this	AdobeNetworkHttpTaskHandle
    //   0	45	1	paramInt	int
    //   11	21	2	local1	1
    //   40	4	2	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	28	40	finally
    //   31	37	40	finally
  }
  
  public void registerListener(IAdobeNetworkHttpTaskHandleListener paramIAdobeNetworkHttpTaskHandleListener)
  {
    listeners.add(paramIAdobeNetworkHttpTaskHandleListener);
  }
  
  void setAccessTokenForRequest(String paramString)
  {
    _accessToken = paramString;
  }
  
  public void setFuture(Future<AdobeNetworkHttpResponse> paramFuture)
  {
    try
    {
      netTaskFuture = paramFuture;
      return;
    }
    finally
    {
      paramFuture = finally;
      throw paramFuture;
    }
  }
  
  public void setNotifyHandler(Handler paramHandler)
  {
    try
    {
      _notifyHandler = paramHandler;
      return;
    }
    finally
    {
      paramHandler = finally;
      throw paramHandler;
    }
  }
  
  public void unregisterListener(IAdobeNetworkHttpTaskHandleListener paramIAdobeNetworkHttpTaskHandleListener)
  {
    listeners.remove(paramIAdobeNetworkHttpTaskHandleListener);
  }
}
