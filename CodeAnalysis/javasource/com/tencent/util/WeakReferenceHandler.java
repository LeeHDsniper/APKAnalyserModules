package com.tencent.util;

import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.lang.ref.WeakReference;

public class WeakReferenceHandler
  extends Handler
{
  private WeakReference a;
  
  public WeakReferenceHandler(Handler.Callback paramCallback)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = new WeakReference(paramCallback);
  }
  
  public WeakReferenceHandler(Looper paramLooper, Handler.Callback paramCallback)
  {
    super(paramLooper);
    a = new WeakReference(paramCallback);
  }
  
  public void handleMessage(Message paramMessage)
  {
    Handler.Callback localCallback = (Handler.Callback)a.get();
    if (localCallback != null) {
      localCallback.handleMessage(paramMessage);
    }
  }
  
  public String toString()
  {
    Object localObject = (Handler.Callback)a.get();
    StringBuilder localStringBuilder = new StringBuilder().append("WH");
    if (localObject != null) {}
    for (localObject = localObject.toString();; localObject = "None callback") {
      return (String)localObject;
    }
  }
}
