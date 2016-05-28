package com.adobe.creativesdk.aviary.internal.os;

import android.annotation.SuppressLint;
import android.app.Service;
import android.content.Intent;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.Looper;
import android.os.Message;

public abstract class AdobeImageIntentService
  extends Service
{
  private final String mName;
  private boolean mRedelivery;
  private volatile ServiceHandler mServiceHandler;
  private volatile Looper mServiceLooper;
  
  public AdobeImageIntentService(String paramString)
  {
    mName = paramString;
  }
  
  public void clearServiceQueue()
  {
    mServiceHandler.removeCallbacksAndMessages(null);
  }
  
  public IBinder onBind(Intent paramIntent)
  {
    return null;
  }
  
  public void onCreate()
  {
    super.onCreate();
    HandlerThread localHandlerThread = new HandlerThread("IntentService[" + mName + "]");
    localHandlerThread.start();
    mServiceLooper = localHandlerThread.getLooper();
    mServiceHandler = new ServiceHandler(mServiceLooper);
  }
  
  public void onDestroy()
  {
    mServiceLooper.quit();
  }
  
  protected abstract void onHandleIntent(Intent paramIntent);
  
  public void onStart(Intent paramIntent, int paramInt)
  {
    Message localMessage = mServiceHandler.obtainMessage();
    arg1 = paramInt;
    obj = paramIntent;
    mServiceHandler.sendMessage(localMessage);
  }
  
  public int onStartCommand(Intent paramIntent, int paramInt1, int paramInt2)
  {
    onStart(paramIntent, paramInt2);
    if (mRedelivery) {
      return 3;
    }
    return 2;
  }
  
  @SuppressLint({"HandlerLeak"})
  private final class ServiceHandler
    extends Handler
  {
    public ServiceHandler(Looper paramLooper)
    {
      super();
    }
    
    public void handleMessage(Message paramMessage)
    {
      onHandleIntent((Intent)obj);
      stopSelf(arg1);
    }
  }
}
